-- Check if is armored --
function is_armored(inv)
    
    return not inv:is_empty('armor') and
    minetest.get_item_group(inv:get_stack('armor', 1):get_name(), 'armor') ~= 0
end

-- Armor rendering --
function update_armorskin(char)

    local inv = char:get_inventory()
    local prp = char:get_properties()
    local skn = prp.textures[1]

    -- Add overlap --
    if is_armored(inv) then

        local a_nm = inv:get_stack('armor', 1):get_name()

        -- Remove other armor --
        if skn:find('%^') then
        
            local idx = skn:find('%^')
            skn = skn:sub(1, idx - 1)
        end

        -- Overlap with armor texture --
        prp.textures[1] =
        skn .. '^' .. a_nm:gsub(':', '_') .. '_skin.png'
        
        -- Update --
        char:set_properties(prp)
    
    -- Remove armor --
    elseif skn:find('%^') then
        
        local idx = skn:find('%^')

        prp.textures[1] = skn:sub(1, idx - 1)
        char:set_properties(prp)
    end
end

minetest.register_on_player_inventory_action(update_armorskin)

-- Armor protection --
minetest.register_on_player_hpchange(function(char, hp_change, reason)
    
    local inv = char:get_inventory()

    if is_armored(inv) then

        local def = inv:get_stack('armor', 1):get_name()
        local crs = reason.type

        def = minetest.get_item_group(def, 'armor') * 10

        -- Valid protection --
        if (crs == 'fall'
        or crs == 'punch'
        or crs == 'node_damage')
        and char:get_hp() > 3 then
            
            char:set_hp((def * math.abs(hp_change)) / 100, 'armor_defense')
        end
    end
end)

-- Hammer durabilty --
minetest.register_on_craft(function(itmstck, char, old_grd)

    local itm = itmstck:get_name()

    if minetest.get_item_group(itm, 'armor') ~= 0 then

        local name = minetest.registered_items[itm].description
        minetest.chat_send_all(char:get_player_name() .. ' forged an ' .. name)

        local inv = char:get_inventory()
        local itm = old_grd[#old_grd]

        itm:add_wear(0.05 * 65535)
        inv:set_stack('craft', 10, itm)
    end
end)