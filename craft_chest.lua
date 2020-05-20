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

function can_dig(pos, player)
    
    return minetest.get_meta(pos):get_inventory():is_empty('main')
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
function close_chest()

    minetest.sound_play('default_chest_close', {

        gain = 0.3,
        pos = pos,
        max_hear_distance = 10

    }, true)

    for i, v in pairs(chests) do
        
        if v then
            
            minetest.after(0.2, function()
                
                s_node(i, 'tmcraftings:woodchest')
                chests[i] = false
            end)
        end
    end
end

-- On close gui --
minetest.register_on_player_receive_fields(
function(player, formname, fields)

    if formname == 'tmcraftings:chestformspec' then

        close_chest()
    end
end)