-- Own furnaces behaviours --
function default_timer(pos, elapsed)

    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()

    local src = inv:get_list('src')
    local dst = inv:get_list('dst')
    local ful = inv:get_list('fuel')

    local cookitm, outpitm = minetest.get_craft_result({method = "cooking", width = 1, items = src})
    local fuel_tm, outfuel = minetest.get_craft_result({method = "fuel", width = 1, items = ful})

    -- Refuel --
    if meta:get_float('fire') <= 0 and fuel_tm.time ~= 0 then

        meta:set_float('fire', fuel_tm.time)
        meta:set_float('fmax', fuel_tm.time)
        inv:set_stack('fuel', 1, outfuel.items[1])
    end

    -- Turn off --
    if inv:get_stack('src', 1):get_count() == 0 or meta:get_float('fire') <= 0 then
        
        meta:set_string('formspec', get_gui('dfurnace', 0))
        meta:set_float('timer', -1)
    end

    --                                         --
    -- timer == -1 means new cycle or no cycle --
    --                                         --

    -- Successful crafting --
    if cookitm.time ~= 0 then

        local timer = meta:get_float('timer')
        local firet = meta:get_float('fire')

        if timer == -1 and firet > 0 then
            
            meta:set_float('timer', cookitm.time)
            return true
            
        elseif firet > 0 then

            -- Update formspec --
            asize = timer / cookitm.time * 100
            fsize = math.max(firet, 0) / meta:get_float('fmax') * 100

            meta:set_string('formspec', get_gui('dfurnace', 100 - asize, fsize))

            if timer <= 0 then

                inv:set_stack('src', 1, outpitm.items[1])
                inv:add_item('dst', cookitm.item)
                
                meta:set_float('timer', -1)
                meta:set_string('formspec', get_gui('dfurnace', 0, fsize))

                -- Keep burning --
                if inv:get_stack('src', 1):get_count() > 0 then return true end

            else
                
                timer = timer - elapsed
                firet = firet - (elapsed / 5)

                meta:set_float('timer', timer)
                meta:set_float('fire' , firet)

                return true
            end
        
        else return false end
    end
end

function fuelless_timer(pos, elapsed)

    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()

    local src = inv:get_list('src')
    local dst = inv:get_list('dst')

    local cookitm, outpitm = minetest.get_craft_result({method = "cooking", width = 1, items = src})

    -- Reset arrow --
    if inv:get_stack('src', 1):get_count() == 0 then
        
        meta:set_string('formspec', get_gui('mfurnace', 0))
        meta:set_float('timer', -1)
    end

    --                                         --
    -- timer == -1 means new cycle or no cycle --
    --                                         --

    -- Successful crafting --
    if cookitm.time ~= 0 then

        local timer = meta:get_float('timer')

        if timer == -1 then
            
            meta:set_float('timer', cookitm.time)
            return true
            
        else

            -- Update formspec --
            asize = timer / cookitm.time * 100
            meta:set_string('formspec', get_gui('mfurnace', 100 - asize))

            if timer <= 0 then

                inv:set_stack('src', 1, outpitm.items[1])
                inv:add_item('dst', cookitm.item)
                
                meta:set_float('timer', -1)
                meta:set_string('formspec', get_gui('mfurnace', 0))

                -- Keep burning --
                if inv:get_stack('src', 1):get_count() > 0 then return true end

            else
                
                timer = timer - elapsed
                meta:set_float('timer', timer)

                return true
            end
        end
    end
end

-- Boiler behaviour --
function on_load_boiler(pos)

    local meta = minetest.get_meta(pos)

    meta:set_string('formspec', get_gui('mgboiler'))
    meta:set_float('fuel', 0)

    local inv = meta:get_inventory()
    inv:set_size('src' , 4)
end

function boiler_behaviour(pos, elapsed)

    local meta = minetest.get_meta(pos)
    local inv  = meta:get_inventory()
    local slots = inv:get_list('src')

    local clit
    for indx, fuel in pairs(slots) do
    
        if meta:get_float('fuel') <= 0 then

            local time, outf = minetest.get_craft_result({

                method = "fuel",
                width  = 1     ,
                items  = {fuel},
            })

            if time then

                time = time.time

                -- Give output --
                inv:set_stack('src', indx, outf.items[1])

                -- Update fuel time --
                clit = meta:get_float('fuel')
                meta:set_float('fuel', clit + time)
                
                return true
            end
        else return true end
    end
end

-- Turn on --
minetest.register_abm({

    nodenames = {

        'tmcraftings:magic_boiler'   ,
        'tmcraftings:magic_boiler_on',
    },

    interval  = 1,
    chance    = 1,
    
    action =
    function(pos, node)
        
        local meta = minetest.get_meta(pos)
        local clit = meta:get_float('fuel')

        meta:set_float('fuel', clit - 1)
        meta:set_string('infotext', 'fuel time left: ' .. (math.max(clit - 1, 0)))

        if clit > 0 then
            
            if node.name ~= 'tmcraftings:magic_boiler_on' then
            
                s_node(pos, 'tmcraftings:magic_boiler_on')
            end

        else
            
            if node.name ~= 'tmcraftings:magic_boiler' then
            
                s_node(pos, 'tmcraftings:magic_boiler')
            end
        end
    end
})

-- Furnace code from default --
function is_diggable(pos)

    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    
    return inv:is_empty('fuel') and inv:is_empty('dst') and inv:is_empty('src')
end

function can_put_itm(pos, l_nm, indx, stck)

    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    
    if l_nm == "fuel" then
        
        -- Check if item is burnable --
        if minetest.get_craft_result({
            
            method = "fuel",
            width = 1,
            items = {stck}

        }).time ~= 0 then
        
            return stck:get_count()
            
		else return 0 end
        
    elseif l_nm == "src" then return stck:get_count()
    elseif l_nm == "dst" then return 0 end
end

function can_mov_itm(pos, f_lst, f_idx, tolst, toidx, count)

    local meta = minetest.get_meta(pos)
    local inv  = meta:get_inventory()
    local stck = inv:get_stack(f_lst, f_idx)
    
    return can_put_itm(pos, tolst, toidx, stck)
end

function can_tak_itm(pos, l_nm, indx, stck)

    return stck:get_count()
end
