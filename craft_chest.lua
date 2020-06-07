--# Dungeon loot -------------------------------------------#--

    -- Dungeon Loot --
    local loot = {
                    
        'tmcraftings:iron', 'tmcraftings:iron_pick', 'tmcraftings:iron_shovel'  ,
        'default:cobble'  , 'default:coal_lump'    , 'tmcraftings:magic_crystal',
        'default:wood'    , 'default:stick'        , 'default:pick_wood'        ,
        'farming:string'  , 'farming:wheat'        ,
    }

    local found_chest = {}

    -- Replace default function to add an callback --
    core.add_node =
    function(pos, node)
        
        -- Store chests' data --
        if node.name == 'default:chest' then

            -- Active trigger --
            table.insert(found_chest, {

                ['found'] = true,
                ['pos']   = {
                
                    ['x'] = pos.x,
                    ['y'] = pos.y,
                    ['z'] = pos.z,
                }
            })
        end

        minetest.set_node(pos, node)
    end

    function add_loot(item)

        table.insert(loot, item)
    end

    function gen_loot()

        for i, v in pairs(found_chest) do

            if v.found then

                local meta = minetest.get_meta(v.pos)
                local inv = meta:get_inventory()

                meta:set_string('infotext', 'loot')

                -- Disable trigger --
                found_chest[i] = nil
                
                -- Get max slot index --
                local size = inv:get_size('main')

                -- Clear inventory --
                inv:set_list('main', {})

                local val1, val2, val3 = math.abs(v.pos.x), math.abs(v.pos.y), math.abs(v.pos.z)
                math.randomseed(val1 + val2 + val3)

                local itms = {

                    [math.random(0, size)] = loot[val3 % (#loot + 1)],
                    [math.random(0, size)] = loot[val2 % (#loot + 1)],
                    [math.random(0, size)] = loot[val1 % (#loot + 1)],

                    [math.random(0, size)] = loot[(val1 + 1) % (#loot + 1)],
                    [math.random(0, size)] = loot[(val2 + 2) % (#loot + 1)],
                    [math.random(0, size)] = loot[(val3 + 3) % (#loot + 1)],
                }

                for i, v in pairs(itms) do

                    local d_itm = ItemStack({name = v})

                    -- Add more items --
                    if (

                        minetest.get_item_group(v, 'pickaxe') ~= 0 and
                        minetest.get_item_group(v, 'shovel' ) ~= 0 and
                        minetest.get_item_group(v, 'axe'    ) ~= 0 and
                        minetest.get_item_group(v, 'sword'  ) ~= 0

                    ) then d_itm:set_count(math.random(1, 5))
                    
                    -- Fix duplicated tools bug --
                    else
                        
                        d_itm:set_count(1)
                        
                        -- Add random wearing --
                        d_itm:add_wear(math.random(0.20 * 65535, 0.75 * 65535))
                    end

                    inv:set_stack('main', i, d_itm)
                end
            end
        end
    end

    -- Replace loot --
    minetest.register_on_generated(gen_loot)

--#---------------------------------------------------------#--

chests = {}

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