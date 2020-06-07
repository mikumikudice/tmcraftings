-- Battery -> Wire -> Disperser -> Node --
eletronics = {}
eletronics.devices = {

    "tmcraftings:mfurnace"       , "tmcraftings:mfurnace_on"       ,
    "tmcraftings:magic_postlight", "tmcraftings:magic_postlight_on",
    "tmcraftings:mrail"          , "tmcraftings:mrail_on"          ,
}

-- Add a new powered node --
function eletronics.add_device(node)

    table.insert(node, node .. '_on')
end

function minetest.facedir_to_pos(facedir)

    if facedir == 12 then                  return {['x'] = 01, ['y'] = 00, ['z'] = 00} end -- x+ 
    if facedir == 18 then                  return {['x'] = -1, ['y'] = 00, ['z'] = 00} end -- x-
    if facedir == 01 or facedir == 00 then return {['x'] = 00, ['y'] = 01, ['z'] = 00} end -- y+
    if facedir == 23 or facedir == 20 then return {['x'] = 00, ['y'] = -1, ['z'] = 00} end -- y-
    if facedir == 07 then                  return {['x'] = 00, ['y'] = 00, ['z'] = 01} end -- z+
    if facedir == 09 then                  return {['x'] = 00, ['y'] = 00, ['z'] = -1} end -- z-
end

function sum_pos(pos1, pos2)

    return {['x'] = pos1.x + pos2.x, ['y'] = pos1.y + pos2.y, ['z'] = pos1.z + pos2.z}
end

function sub_pos(pos1, pos2)

    return {['x'] = pos1.x - pos2.x, ['y'] = pos1.y - pos2.y, ['z'] = pos1.z - pos2.z}
end

--# Powered Nodes ------------------------------------------#--

    -- Turn on --
    minetest.register_abm({

        nodenames = eletronics.devices,
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos, node)
            
            if minetest.find_node_near(pos, 2, "group:deliver") then
            
                if node.name:sub(-3) ~= '_on' then
                
                    s_node(pos, node.name .. '_on')
                end
            
            else s_node(pos, node.name:gsub('_on', '')) end
        end
    })

    --# Pistons --------------------------------------------#--

        -- Push node --
        function eletronics.piston_behaviour(pos, node)
                
            if minetest.find_node_near(pos, 2, "group:deliver") then

                local pdir   = minetest.facedir_to_pos(node.param2)

                if not pdir then
                    
                    minetest.chat_send_all(tostring(node.param2))
                    return nil
                end

                local tp_pos = sum_pos(pos, pdir)
                local ab_pos = sum_pos(tp_pos, pdir)

                local topush = minetest.get_node(tp_pos)
                local nabove = minetest.get_node(ab_pos)

                if topush.name == 'air' or nabove.name == 'air' then

                    if topush.name ~= 'air' then

                        local topush_meta = minetest.get_meta(tp_pos)
                        minetest.set_node(ab_pos, topush)

                        local pushed_meta = minetest.get_meta(ab_pos)
                        pushed_meta:from_table(topush_meta:to_table())
                    end
                    
                    s_node(pos, node.name .. '_bot')

                    local paste_rotation = minetest.get_node(pos)
                    paste_rotation.name = node.name .. '_top'
                    minetest.set_node(tp_pos, paste_rotation)
                end
            end
        end

        -- Turn on --
        minetest.register_abm({

            nodenames = {
                
                'tmcraftings:piston',
                'tmcraftings:glue_piston'
            },
            
            interval  = 1,
            chance    = 1,
            
            action = eletronics.piston_behaviour
        })

        -- Turn off --
        minetest.register_abm({

            nodenames = {'tmcraftings:piston_bot'},
            interval  = 1,
            chance    = 1,
            
            action =
            function(pos, node)
                
                if not minetest.find_node_near(pos, 2, "group:deliver") then

                    local pdir      = minetest.facedir_to_pos(node.param2)
                    local self_part = sub_pos(pos, pdir)
                    
                    s_node(pos, 'tmcraftings:piston')
                    minetest.set_node(self_part, {name = 'air'})
                end
            end
        })

        -- Turn off (Glue) --
        minetest.register_abm({

            nodenames = {'tmcraftings:glue_piston_bot'},
            interval  = 1,
            chance    = 1,
            
            action =
            function(pos, node)
                
                if not minetest.find_node_near(pos, 2, "group:deliver") then

                    local pdir   = minetest.facedir_to_pos(node.param2)
                    local ps_pos = sum_pos(pos, pdir)
                    local ab_pos = sum_pos(tp_pos, pdir)

                    local pushed = minetest.get_node(ab_pos)
                    local pushed_meta = minetest.get_meta(ab_pos)

                    minetest.set_node(ps_pos, pushed)

                    local default_node = minetest.get_meta(ps_pos)
                    default_node:from_table(pushed_meta:to_table())
                    
                    minetest.s_node(pos, 'tmcraftings:glue_piston')
                    minetest.set_node(ab_pos, {name = 'air'})
                end
            end
        })

        -- Break itself --
        function eletronics.break_brother(pos, node)

            local pdir = minetest.facedir_to_pos(node.param2)
            node = node.name

            -- Top --
            if node:sub(-4) == '_top' then

                local npos = sub_pos(pos, pdir)
                if minetest.get_node(npos).name:sub(-4) == '_bot' then
                
                    minetest.remove_node(npos)
                end
            end

            -- Bot --
            if node:sub(-4) == '_bot' then
                
                local npos = sum_pos(pos, pdir)
                if minetest.get_node(npos).name:sub(-4) == '_top' then
                
                    minetest.remove_node(npos)
                end
            end
        end

--# Power Delivery -----------------------------------------#--

    function eletronics.meta_to_pos(str)
        
        -- String mattch format --
        if not str:match('%-*(%d+),%-*(%d+),%-*(%d+)') then return end

        -- Get commas indexes --
        local fdx = str:find(',', 1)
        local ldx = str:find(',', fdx + 1)

        -- Get values --
        local x = str:sub(1, fdx - 1)
        local y = str:sub(fdx + 1, ldx - 1)
        local z = str:sub(ldx + 1)

        return {['x'] = tonumber(x), ['y'] = tonumber(y), ['z'] = tonumber(z)}
    end

    function eletronics.get_near(pos, group)
        
        local la = {['x'] = pos.x + 1, ['y'] = pos.y + 1, ['z'] = pos.z}
        local fa = {['x'] = pos.x, ['y'] = pos.y + 1, ['z'] = pos.z + 1}
        local ra = {['x'] = pos.x - 1, ['y'] = pos.y + 1, ['z'] = pos.z}
        local ba = {['x'] = pos.x, ['y'] = pos.y + 1, ['z'] = pos.z - 1}

        local lm = {['x'] = pos.x + 1, ['y'] = pos.y, ['z'] = pos.z}
        local fm = {['x'] = pos.x, ['y'] = pos.y, ['z'] = pos.z + 1}
        local rm = {['x'] = pos.x - 1, ['y'] = pos.y, ['z'] = pos.z}
        local bm = {['x'] = pos.x, ['y'] = pos.y, ['z'] = pos.z - 1}

        local lb = {['x'] = pos.x + 1, ['y'] = pos.y - 1, ['z'] = pos.z}
        local fb = {['x'] = pos.x, ['y'] = pos.y - 1, ['z'] = pos.z + 1}
        local rb = {['x'] = pos.x - 1, ['y'] = pos.y - 1, ['z'] = pos.z}
        local bb = {['x'] = pos.x, ['y'] = pos.y - 1, ['z'] = pos.z - 1}

        local all_near = {la, fa, ra, ba, lm, fm, rm, bm, lb, fb, rb, bb}

        local match = {}
        
        for _, p in pairs(all_near) do
            
            local node = minetest.get_node(p).name
            if minetest.get_node_group(node, group) ~= 0 then
        
                table.insert(match, p)
            end
        end

        return match
    end

    function eletronics.get_output(pos, other, node)

        if node == 'tmcraftings:thinker_on'    then return pos.x - 1 == other.x end
        if node == 'tmcraftings:inverser'      then return pos.z - 1 == other.z end
        if node == 'tmcraftings:magic_gate_on' then return pos.x - 1 == other.x end
    end

    function eletronics.get_source(pos, node)
        
        local near_nodes = eletronics.get_near(pos, 'source')

        -- If has source nodes near --
        if near_nodes then

            -- Source not found --
            local has_source = false

            for _, n in pairs(near_nodes) do

                -- Skip itself --
                if n.x ~= pos.x or n.y ~= pos.y or n.z ~= pos.z then

                    local near = minetest.get_node(n).name
                    
                    -- Charge by wire --
                    if minetest.get_node_group(near, 'wire') ~= 0 then
                        
                        local othr = minetest.get_meta(n)
                        local spos = eletronics.meta_to_pos(othr:get_string('power'))

                        -- Wire is connected --
                        if spos then

                            local src = minetest.get_node(spos)

                            -- Wire is connected at battery --
                            if minetest.get_node_group(src.name, 'battery') ~= 0
                            or minetest.get_node_group(src.name, 'depends') ~= 0 then
                                
                                -- Lit once --
                                if node.name:sub(-3) ~= '_on' then
                                    
                                    s_node(pos, node.name .. '_on')
                                end
                                
                                has_source = true
                            end
                        end
                    end
                end
            end

            -- Turn off --
            if not has_source then
                
                s_node(pos, node.name:gsub('_on', ''))
            end
        
        else s_node(pos, node.name:gsub('_on', '')) end
    end

    function eletronics.get_time(arg)
        
        local world_time = (tonumber(minetest.get_timeofday()) * 24000) % 24000

        if arg == 'day' then
            
            return 4750 <= world_time and world_time <= 18752
        end

        if arg == 'night' then

            return 18752 < world_time and world_time <= 4500
        end
        
        return world_time
    end

    function eletronics.solar_bahaviour(pos, node)
        
        local meta = minetest.get_meta(pos)
        local time = tostring(eletronics.get_time())
        local indx = time:find('.', 1, true)

        time = time:sub(1, (indx or (#time + 2)) - 2)
        indx = time:find(time:sub(-2))
        
        local hour = time:sub(1, indx - 1)
        local mins = tonumber(time:sub(-2))

        -- Fix nullity --
        mins = mins or 0

        -- Fix midnight bug --
        if hour == '' then hour = '0' end

        -- Make 12h format --
        hour = tonumber(hour)

        local pfix

        if hour <= 12 then pfix = ' pm'
        elseif hour > 12 then
            
            hour = (hour % 12)
            pfix = ' pm'
        
        else

            pfix = ' am'
        end

        -- Fix time scale --
        mins = math.floor((6 * mins) / 10)
        if mins < 10 then mins = '0' .. (mins) end

        -- Show Current time --
        meta:set_string('infotext', 'Current time: ' .. (hour) .. ':' .. (mins) .. pfix)
        
        -- Turn on at day --
        if eletronics.get_time('day') then
            
            if node.name:sub(-3) ~= '_on' then
                
                s_node(pos, node.name .. '_on')
            end
        
        -- Turn off at night --
        else s_node(pos, node.name:gsub('_on', '')) end
    end

    --# Wires behaviour ------------------------------------#--

        function eletronics.wires_behaviour(pos)

            local near_nodes = eletronics.get_near(pos, 'source')
            local meta = minetest.get_meta(pos)

            -- Clear meta to avoid phantom charge --
            meta:set_string('power', '')

            -- If has source nodes near --
            if near_nodes then

                -- Source not found --
                local has_source = false

                for _, n in pairs(near_nodes) do

                    -- Near node name --
                    local near = minetest.get_node(n).name

                    -- Skip itself --
                    if n.x ~= pos.x or n.y ~= pos.y or n.z ~= pos.z then

                        -- Charge by wire --
                        if minetest.get_node_group(near, 'wire') ~= 0 then

                            local othr = minetest.get_meta(n)

                            if meta:get_string('power') == '' then
                            
                                meta:set_string('power', othr:get_string('power'))
                            end
                        
                            has_source = true

                        -- Charge by battery or dependence node --
                        else

                            local can_charge = false

                            -- Isn't a charged node --
                            if minetest.get_node_group(near, 'depends') == 0 then
                                
                                can_charge = true
                            
                            -- Wire is at node output --
                            elseif eletronics.get_output(pos, n, near) then

                                can_charge = true
                            end

                            if can_charge then

                                local power_pos = (n.x) .. ',' .. (n.y) .. ',' .. (n.z)

                                meta:set_string('power', power_pos)
                                has_source = true
                            end
                        end
                    end
                end

                -- Turn off --
                if not has_source then meta:set_string('power', '') end

            else meta:set_string('power', '') end
        end

        function eletronics.on_break_wite(pos)

            -- All near nodes --
            local near_wires = minetest.find_nodes_in_area(
                {['x'] = pos.x - 8, ['y'] = pos.y - 8, ['z'] = pos.z - 8},
                {['x'] = pos.x + 8, ['y'] = pos.y + 8, ['z'] = pos.z + 8},
                'group:wire')

            for _, p in pairs(near_wires) do
                
                local other_meta = minetest.get_meta(p)
                other_meta:set_string('power', '')
            end
        end
    --# Magic Gate behaviour -------------------------------#--

        function eletronics.gate(pos, node)
                
            local back = {['x'] = pos.x - 1, ['y'] = pos.y, ['z'] = pos.z}
            local wire = minetest.get_node(back).name
            
            if minetest.get_node_group(wire, 'source') ~= 0 then
                
                local has_source = false

                local meta = minetest.get_meta(back)
                local npwr = meta:get_string('power')
                local nsrc = eletronics.meta_to_pos(npwr)

                if nsrc then
                    
                    local src = minetest.get_node(nsrc).name

                    if minetest.get_node_group(src, 'battery') ~= 0
                    or minetest.get_node_group(src, 'depends') ~= 0 then
                        
                        has_source = true
                    end
                end

                -- Open the gate --
                if has_source then
                    
                    -- Switch node once --
                    if node.name:sub(-3) ~= '_on' then
                        
                        s_node(pos, node.name .. '_on')
                    end
            
                -- Close the gate --
                else s_node(pos, node.name:gsub('_on', '')) end
            
            -- Close the gate --
            else s_node(pos, node.name:gsub('_on', '')) end
        end

        minetest.register_abm({
            
            nodenames = {
                
                "tmcraftings:magic_gate",
                "tmcraftings:magic_gate_on"
            },

            interval  = 1,
            chance    = 1,

            action = eletronics.gate
        })

    --# Magic Tic behaviour --------------------------------#--

        function eletronics.on_load_tic(pos)
            
            minetest.get_node_timer(pos):start(1)
        end

        function eletronics.tic(pos)
            
            local node = minetest.get_node(pos).name

            if node:sub(-3) == '_on' then
            
                minetest.set_node(pos, {name = node:gsub('_on', '')}) 
            end
        end

        minetest.register_abm({

            nodenames = {'tmcraftings:magic_tic'},
            interval  = 2,
            chance    = 1,
            
            action =
            function(pos, node)

                if node.name:sub(-3) ~= '_on' then
                
                    minetest.set_node(pos, {name = node.name .. '_on'}) 
                end
            end
        })

    --# Thinker behaviour ----------------------------------#--
    
        eletronics.config = {

            [0] = 'AND' ,
            [1] = 'NAND',
            [2] = 'OR'  ,
            [3] = 'XOR' ,
        }

        function eletronics.on_load_thinker(pos)
            
            local meta = minetest.get_meta(pos)

            meta:set_int('config', 0)
            meta:set_string('infotext', 'config: ' .. eletronics.config[0])
        end

        function eletronics.on_click_thinker(pos)
            
            local meta = minetest.get_meta(pos)
            local conf = meta:get_int('config')
            
            meta:set_int('config', (conf + 1) % (#eletronics.config + 1))
            conf = meta:get_int('config')   

            meta:set_string('infotext', 'config: ' .. eletronics.config[conf])
        end

        function eletronics.thinker(pos, node)

            local meta   = minetest.get_meta(pos)
            local config = meta:get_int('config')

        --# Z+ door ----------------------------------------#--

            local zp_npos = {['x'] = pos.x, ['y'] = pos.y, ['z'] = pos.z + 1}
            local zp_node = minetest.get_node(zp_npos)
            
            local zp_door
            local zp_meta

            -- Found wires near --
            if zp_node.name ~= 'ignore' then

                zp_meta = minetest.get_meta(zp_npos):get_string('power')
            end

            if zp_meta and zp_meta ~= '' then

                zp_node = minetest.get_node(eletronics.meta_to_pos(zp_meta)).name
                zp_door = minetest.get_node_group(zp_node, 'battery') ~= 0
            end

        --# Z- door ----------------------------------------#--

            local zm_npos = {['x'] = pos.x, ['y'] = pos.y, ['z'] = pos.z - 1}
            local zm_node = minetest.get_node(zm_npos)
            
            local zm_door
            local zm_meta

            -- Found wires near --
            if zm_node.name ~= 'ignore' then

                zm_meta = minetest.get_meta(zm_npos):get_string('power')
            end

            if zm_meta and zm_meta ~= '' then

                zm_node = minetest.get_node(eletronics.meta_to_pos(zm_meta)).name
                zm_door = minetest.get_node_group(zm_node, 'battery') ~= 0
            end

        --# Think ------------------------------------------#--

            local doors = {

                ['AND']  = {

                    ['on'] = zp_door and zm_door    ,
                    ['io'] = zp_door and not zm_door,
                    ['oi'] = not zp_door and zm_door,
                },

                ['NAND'] = {

                    ['on'] = not zp_door and not zm_door,
                    ['io'] = not zp_door and zm_door    ,
                    ['oi'] = zp_door and not zm_door    ,
                },

                ['OR']   = {

                    ['on'] = zp_door or zm_door     ,
                    ['io'] = zp_door and not zm_door,
                    ['oi'] = not zp_door and zm_door,
                },

                ['XOR']  = {

                    ['on'] = (not zp_door or not zm_door) and not (not zp_door and not zm_door),
                    ['io'] = zp_door and zm_door        ,
                    ['oi'] = not zp_door and not zm_door,
                },
            }

            -- On --
            if doors[eletronics.config[config]].on then
                
                s_node(pos, "tmcraftings:thinker_on")

            -- IO --
            elseif doors[eletronics.config[config]].io then
                    
                s_node(pos, "tmcraftings:thinker_IO")

            -- OI --
            elseif doors[eletronics.config[config]].oi then
                
                s_node(pos, "tmcraftings:thinker_OI")

            -- Off --
            else
                
                s_node(pos, "tmcraftings:thinker")
            end
        end

    --# Other logical nodes --------------------------------#--

        -- Inverser behaviour (NOT) --
        function eletronics.inverser(pos, node)

            -- wire_on -> inverser -> wire_off --

            local stat = false

            local input = {['x'] = pos.x, ['y'] = pos.y, ['z'] = pos.z - 1}
            local imeta = minetest.get_meta(input):get_string('power')

            if imeta and imeta ~= '' then

                local i_src = eletronics.meta_to_pos(imeta)
                local snode = minetest.get_node(i_src)

                stat = minetest.get_node_group(snode.name, 'battery') ~= 0
                    or minetest.get_node_group(snode.name, 'depends') ~= 0
            end

            if stat then
                
                if node.name:sub(-3) ~= '_on' then
                    
                    minetest.set_node(pos, {name = node.name .. '_on'})
                end
            
            else minetest.set_node(pos, {name = node.name:gsub('_on', '')}) end
        end

    -- Wires --
    minetest.register_abm({

        nodenames = {"group:wire"},
        interval  = 1,
        chance    = 1,

        action = eletronics.wires_behaviour
    })

    -- Power delivevers --
    minetest.register_abm({

        nodenames = {

            "tmcraftings:disperser", "tmcraftings:disperser_on",
            "tmcraftings:post"     , "tmcraftings:post_on"     ,
        },

        interval  = 1,
        chance    = 1,

        action = eletronics.get_source
    })

    -- Thinker --
    minetest.register_abm({

        nodenames = {
            
            "tmcraftings:thinker"   , "tmcraftings:thinker_on", 
            "tmcraftings:thinker_OI", "tmcraftings:thinker_IO",
        },

        interval  = 1,
        chance    = 1,

        action = eletronics.thinker
    })

    -- Inverser --
    minetest.register_abm({
        
        nodenames = {
            
            "tmcraftings:inverser", "tmcraftings:inverser_on", 
        },

        interval  = 1,
        chance    = 1,

        action = eletronics.inverser
    })

    -- Solar panel --
    minetest.register_abm({
        
        nodenames = {
            
            "tmcraftings:solar", "tmcraftings:solar_on", 
        },

        interval  = 1,
        chance    = 1,

        action = eletronics.solar_bahaviour
    })