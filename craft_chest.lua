chests = {}

-- Dungeon Loot --
local loot = {
                
    'tmcraftings:iron', 'tmcraftings:iron_pick', 'tmcraftings:iron_shovel'  ,
    'default:cobble'  , 'default:coal_lump'    , 'tmcraftings:magic_crystal',
    'default:wood'    , 'default:stick'        , 'tmcraftings:wood_pick'    ,
}

function get_loot()
    
    return loot
end

function add_loot(item)

    table.insert(loot, item)
end

function can_dig(pos)
    
    local meta = minetest.get_meta(pos)
    local inv  = meta:get_inventory()

    local out = inv:is_empty('main')
    
    if out ~= nil then return out
    else return true end
end

-- Code from original chest --
function can_opn(pos)

    local above = {x = pos.x, y = pos.y + 1, z = pos.z}
    local def = minetest.registered_nodes[minetest.get_node(above).name]

    if def and (

        def.drawtype == "airlike" or
        def.drawtype == "signlike" or
        def.drawtype == "torchlike" or

        (def.drawtype == "nodebox" and def.paramtype2 == "wallmounted")

    ) then return true end
    
    return false
end

-- Based on original code --
function close_chest(sound)

    minetest.sound_play(sound or 'default_chest_close', {

        gain = 0.3,
        pos = pos,
        max_hear_distance = 10

    }, true)

    for i, v in pairs(chests) do
        
        if v then
            
            minetest.after(0.2, function()
                
                s_node(i, v)
                chests[i] = nil
            end)
        end
    end
end

-- On close gui --
minetest.register_on_player_receive_fields(
function(player, formname, fields)

    if formname == 'tmcraftings:chestformspec' then

        close_chest()
    
    elseif formname:sub(1, 17) == 'tmcraftings:chest' then
        
        close_chest('doors_steel_door_close')
    end
end)