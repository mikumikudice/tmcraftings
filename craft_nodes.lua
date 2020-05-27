dofile(minetest.get_modpath("tmcraftings") .. '/craft_furns.lua')

--# Fix default ores' generation ---------------------------#--

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "default:stone_with_coal",
        wherein        = "default:stone",
        clust_scarcity = 4 * 4 * 4,
        clust_num_ores = 1,
        clust_size     = 2,
        y_max          = 0,
        y_min          = -30000,
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "default:stone_with_iron",
        wherein        = "default:stone",
        clust_scarcity = 5 * 5 * 5,
        clust_num_ores = 1,
        clust_size     = 2,
        y_max          = 5,
        y_min          = -200,
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "default:stone",
        wherein        = "tmcraftings:stone_with_iron",
        clust_scarcity = 5,
        clust_num_ores = 2,
        clust_size     = 2,
        y_max          = -200,
        y_min          = -31000,
    })

-- New ores --
--# Iron ---------------------------------------------------#--

    minetest.register_craftitem('tmcraftings:iron', {

        description = "Iron Ingot",
        inventory_image = "tmcraftings_iron_ingot.png",
        stack_max = 99
    })

    minetest.register_craftitem('tmcraftings:hematite', {

        description = "Hematite",
        inventory_image = "tmcraftings_hematite.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = "cooking",
        output = "tmcraftings:iron",
        recipe = "tmcraftings:hematite",
        cooktime = 10,
    })

    minetest.register_node('tmcraftings:stone_with_iron', {

        description = "Iron Ore",
        drop = "tmcraftings:hematite",

        tiles = {"default_stone.png^tmcraftings_iron_ore.png"},

        groups = {cracky = 4},
        sounds = default.node_sound_stone_defaults(),
    })

    minetest.register_abm({

        nodenames = {"default:stone_with_iron"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "tmcraftings:stone_with_iron"})
        end
    })

--# Tungsten -----------------------------------------------#--

    minetest.register_craftitem('tmcraftings:tungsten', {

        description = "Tungsten Ingot",
        inventory_image = "tmcraftings_tungsten_ingot.png",
        stack_max = 99
    })

    minetest.register_craftitem('tmcraftings:wolframite', {

        description = "Wolframite",
        inventory_image = "tmcraftings_wolframite.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = "cooking",
        output = "tmcraftings:tungsten",
        recipe = "tmcraftings:wolframite",
        cooktime = 15,
    })

    minetest.register_node('tmcraftings:stone_with_tungsten', {

        description = "Tungsten Ore",
        drop = "tmcraftings:wolframite",

        tiles = {"default_stone.png^tmcraftings_tungsten_ore.png"},

        groups = {cracky = 5},
        sounds = default.node_sound_stone_defaults(),
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "tmcraftings:stone_with_tungsten",
        wherein        = "default:stone",
        clust_scarcity = 6 * 6 * 6,
        clust_num_ores = 1,
        clust_size     = 3,
        y_max          = -200,
        y_min          = -24000,
    })

    minetest.register_abm({

        nodenames = {"default:stone_with_copper"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "tmcraftings:stone_with_tungsten"})
        end
    })

--# Titanium -----------------------------------------------#--

    minetest.register_craftitem('tmcraftings:titanium', {

        description = "Titaninium Ingot",
        inventory_image = "tmcraftings_titanium_ingot.png",
        stack_max = 99
    })

    minetest.register_craftitem('tmcraftings:titanite', {

        description = "Titaninite",
        inventory_image = "tmcraftings_titanite.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = "cooking",
        output = "tmcraftings:titanium",
        recipe = "tmcraftings:titanite",
        cooktime = 20,
    })

    minetest.register_node('tmcraftings:stone_with_titanium', {

        description = "Titanium Ore",
        drop = "tmcraftings:titanite",

        tiles = {"default_stone.png^tmcraftings_titanium_ore.png"},

        groups = {cracky = 6},
        sounds = default.node_sound_stone_defaults(),
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "tmcraftings:stone_with_titanium",
        wherein        = "default:stone",
        clust_scarcity = 7 * 7 * 7,
        clust_num_ores = 1,
        clust_size     = 4,
        y_max          = -400,
        y_min          = -24000,
    })

    minetest.register_abm({

        nodenames = {"default:stone_with_tin"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "tmcraftings:stone_with_titanium"})
        end
    })

-- Other ores and crystals --
--# Silver -------------------------------------------------#--

    minetest.register_craftitem('tmcraftings:silver', {

        description = "Silver Ingot",
        inventory_image = "tmcraftings_silver_ingot.png",
        stack_max = 99
    })

    minetest.register_craftitem('tmcraftings:arguenite', {

        description = "Arguenite",
        inventory_image = "tmcraftings_arguenite.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = "cooking",
        output = "tmcraftings:silver",
        recipe = "tmcraftings:arguenite",
        cooktime = 15,
    })

    minetest.register_node('tmcraftings:stone_with_silver', {

        description = "Silver Ore",
        drop = "tmcraftings:arguenite",

        tiles = {"default_stone.png^tmcraftings_silver_ore.png"},

        groups = {cracky = 5},
        sounds = default.node_sound_stone_defaults(),
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "tmcraftings:stone_with_silver",
        wherein        = "default:stone",
        clust_scarcity = 8 * 8 * 8,
        clust_num_ores = 1,
        clust_size     = 3,
        y_max          = -200,
        y_min          = -16000,
    })

    minetest.register_abm({

        nodenames = {"default:stone_with_gold"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "tmcraftings:stone_with_silver"})
        end
    })

    minetest.register_abm({

        nodenames = {"default:stone_with_mese"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "tmcraftings:stone_with_silver"})
        end
    })

    minetest.register_abm({

        nodenames = {"default:mese"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "default:stone"})
        end
    })

--# Magic Crystal ------------------------------------------#--

    minetest.register_craftitem('tmcraftings:magic_crystal', {

        description = "Magic Crystal",
        inventory_image = "tmcraftings_magic_crystal.png",
        stack_max = 99
    })

    minetest.register_node('tmcraftings:stone_with_magic_crystal', {

        description = "Magic Crystal Ore",
        drop = "tmcraftings:magic_crystal",

        tiles = {"default_stone.png^tmcraftings_magic_crystal_ore.png"},

        groups = {cracky = 6},
        sounds = default.node_sound_stone_defaults()
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "tmcraftings:stone_with_magic_crystal",
        wherein        = "default:stone",
        clust_scarcity = 16 * 16 * 16,
        clust_num_ores = 3,
        clust_size     = 6,
        y_max          = -100,
        y_min          = -24000,
    })

    minetest.register_abm({

        nodenames = {"default:stone_with_diamond"},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            minetest.set_node(pos, {name = "tmcraftings:stone_with_magic_crystal"})
        end
    })

--# Ingot to block -----------------------------------------#--

    -- Silver block --
    minetest.register_node('tmcraftings:silver_block', {
            
        description = "Silver block",

        tiles = {'tmcraftings_silver_block.png'},

        is_ground_content = false,
        groups = {cracky = 4},

        sounds = default.node_sound_metal_defaults(),
    })

    minetest.register_craft({

        output = 'tmcraftings:silver_block',
        recipe = {
            
            {'tmcraftings:silver', 'tmcraftings:silver', 'tmcraftings:silver'},
            {'tmcraftings:silver', 'tmcraftings:silver', 'tmcraftings:silver'},
            {'tmcraftings:silver', 'tmcraftings:silver', 'tmcraftings:silver'},
        },
    })

    -- Other ingots --
    ingots = {[4] = 'iron', [5] = 'tungsten', [6] = 'titanium'}

    for t, n in pairs(ingots) do

        des_name = n:sub(1, 1):upper() .. n:sub(2) .. " block"

        minetest.register_node('tmcraftings:' .. n .. '_block', {
            
            description = des_name,

            tiles = {'tmcraftings_' .. n .. '_block.png' ,},

            is_ground_content = false,
            groups = {cracky = t},

            sounds = default.node_sound_metal_defaults(),
        })

        minetest.register_craft({

            output = 'tmcraftings:' .. n .. '_block',
            recipe = {
                
                {'tmcraftings:'..n, 'tmcraftings:'..n, 'tmcraftings:'..n},
                {'tmcraftings:'..n, 'tmcraftings:'..n, 'tmcraftings:'..n},
                {'tmcraftings:'..n, 'tmcraftings:'..n, 'tmcraftings:'..n},
            },
        })
    end

--# Replace Obsidian ---------------------------------------#--

    minetest.override_item('default:obsidian', {

        description = "Obsidian",

        tiles = {'default_obsidian.png'},

        groups = {cracky = 7},
        sounds = default.node_sound_stone_defaults(),
    })

--# Replace bones ------------------------------------------#--

    minetest.register_node('tmcraftings:grave', {

        description = "Grave",
        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Base --
                {0.5, -0.5, -0.5, -0.5, -0.2, 0.5},

                -- Cross X --
                {0.3, 0.2, 0.45, -0.3, 0.3, 0.35},

                -- Cross Y --
                {0.05, -0.2, 0.45, -0.05, 0.5, 0.35},
            },
        },

        tiles = {"default_stone.png"},

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {cracky = 3},
        sounds = default.node_sound_stone_defaults(),

        -- Code from bones --
        on_punch =
        function(pos, node, player)
    
            local meta = minetest.get_meta(pos)

            if meta:get_string('infotext') == "" then

                return
            end
    
            local inv = meta:get_inventory()
            local player_inv = player:get_inventory()
            local has_space = true
    
            for i = 1, inv:get_size('main') do

                local stk = inv:get_stack('main', i)

                if player_inv:room_for_item('main', stk) then

                    inv:set_stack('main', i, nil)
                    player_inv:add_item('main', stk)

                else

                    has_space = false
                    break
                end
            end

            if has_space then

                if player_inv:room_for_item("main", {name = "tmcraftings:grave"}) then

                    player_inv:add_item('main', {name = "tmcraftings:grave"})

                else minetest.add_item(pos,"tmcraftings:grave") end

                minetest.remove_node(pos)
            end
        end
    })

    minetest.register_abm({

        nodenames = {'bones:bones'},
        interval  = 0.1,
        chance    = 1,
        
        action =
        function(pos)
            
            s_node(pos, 'tmcraftings:grave')

            -- Replace infotext --
            local meta = minetest.get_meta(pos)
            meta:set_string('infotext', meta:get_string('owner') .. "'s grave")
        end
    })

-- Craftable nodes --
--# Replace Furnace ----------------------------------------#--

    minetest.override_item('default:furnace', {
        
        description = "Furnace",

        tiles = {

            "default_furnace_top.png" , "default_furnace_bottom.png",
            "default_furnace_side.png", "default_furnace_side.png" ,
            "default_furnace_side.png", "default_furnace_front.png",
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {cracky = 3},
        is_ground_content = false,

        sounds = default.node_sound_stone_defaults(),

    --# Behaviour scope ------------------------------------#--

        can_dig = is_diggable,
        
        on_construct =
        function(pos)

            local meta = minetest.get_meta(pos)

            meta:set_string('formspec', get_gui('dfurnace'))
            meta:set_float('timer', -1)
            meta:set_float('fire' , 00)

            local inv = meta:get_inventory()

            inv:set_size('src' , 1)
            inv:set_size('dst' , 1)
            inv:set_size('fuel', 1)
        end,

        -- Start working on inventory event --
        on_metadata_inventory_move =
        function(pos)

            local meta = minetest.get_meta(pos)
            local inv  = meta:get_inventory()
            
            if not inv:get_stack('fuel', 1):is_empty()
            or meta:get_float('fire') > 0 then

                s_node(pos, 'default:furnace_active')
                minetest.get_node_timer(pos):start(0.5)
            end
        end,
        
        on_metadata_inventory_put =
        function(pos)

            local meta = minetest.get_meta(pos)
            local inv  = meta:get_inventory()
            
            if not inv:get_stack('fuel', 1):is_empty()
            or meta:get_float('fire') > 0 then

                s_node(pos, 'default:furnace_active')
                minetest.get_node_timer(pos):start(0.5)
            end
        end,

        -- What happens if furnace explodes --
        on_blast =
        function(pos)

            local drops = {}

            -- Get items inside of the furnace --
            default.get_inventory_drops(pos, 'src' , drops)
            default.get_inventory_drops(pos, 'dst' , drops)
            default.get_inventory_drops(pos, 'fuel', drops)

            -- Drop itself --
            drops[#drops + 1] = "tmcraftings:furnace"

            minetest.remove_node(pos)
            return drops
        end,
    
        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm,
        allow_metadata_inventory_take = can_tak_itm,
    })

    minetest.override_item('default:furnace_active', {

        tiles = {

            "default_furnace_top.png", "default_furnace_bottom.png",
            "default_furnace_side.png", "default_furnace_side.png",
            "default_furnace_side.png",
            
            {
                image = "default_furnace_front_active.png",

                backface_culling = false,
                animation = {

                    type = "vertical_frames",
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.5
                }
            }
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = 'default:furnace',

        paramtype = "light",
        sunlight_propagates = false,
        light_source = default.LIGHT_MAX / 3,

        groups = {cracky = 3, not_in_creative_inventory = 1},
        is_ground_content = false,

        sounds = default.node_sound_stone_defaults(),

    --# Behaviour scope ------------------------------------#--

        can_dig = is_diggable,
        on_timer = default_timer,

        -- Start working on inventory event --
        on_metadata_inventory_move =
        function(pos)

            minetest.get_node_timer(pos):start(0.5)
        end,
        
        on_metadata_inventory_put =
        function(pos)

            minetest.get_node_timer(pos):start(0.5)
        end,

        -- What happens if furnace explodes --
        on_blast =
        function(pos)

            local drops = {}

            -- Get items inside of the furnace --
            default.get_inventory_drops(pos, 'src' , drops)
            default.get_inventory_drops(pos, 'dst' , drops)
            default.get_inventory_drops(pos, 'fuel', drops)

            -- Drop itself --
            drops[#drops + 1] = "default:furnace"

            minetest.remove_node(pos)
            return drops
        end,
    
        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm,
        allow_metadata_inventory_take = can_tak_itm,
    })

    -- Turn off --
    minetest.register_abm({
        
        nodenames = {'default:furnace_active'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)
            
            local meta = minetest.get_meta(pos)

            if meta:get_float('fire') <= 0 then

                s_node(pos, 'default:furnace')
                meta:set_string('formspec', get_gui('dfurnace'))
            end
        end
    })

--# Replace Chest ------------------------------------------#--

    minetest.override_item('default:chest', {
        
        description = "Chest",
        
        tiles = {

            "default_chest_top.png" , "default_chest_top.png" ,
            "default_chest_side.png^[transformFX", "default_chest_side.png",
            "default_chest_side.png", "default_chest_front.png"
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {choppy = 2, oddly_breakable_by_hand = 2, chest = 1},
        sounds = default.node_sound_wood_defaults(),

    --# Behaviour scope ------------------------------------#--

        can_dig = can_dig,

        on_construct = 
        function(pos)
            
            local meta = minetest.get_meta(pos)
            local inv  = meta:get_inventory()
            
            inv:set_size('main', 8 * 3)
        end,

        on_rightclick =
        function(pos, node, clicker)
            
            -- Trigger loot --
            minetest.get_meta(pos):set_string('open', 'true')

            if can_opn(pos) then

                minetest.sound_play('default_chest_open', {

                    gain = 0.3,
                    pos = pos,
                    max_hear_distance = 10

                }, true)
                
                chests[pos] = 'default:chest'
                s_node(pos, 'default:chest_open')

                minetest.after(0.2,

                    minetest.show_formspec,
					clicker:get_player_name(),
                    'tmcraftings:chestformspec',
                    
                    get_gui('defchest', _, _,
                        'nodemeta:' .. pos.x .. "," .. pos.y .. "," .. pos.z .. ';main')
                )
            end
        end
    })

    minetest.override_item('default:chest_open', {
        
        drawtype = "mesh",
        mesh = "chest_open.obj",

        tiles = {

            "default_chest_top.png"  , "default_chest_top.png" ,
            "default_chest_side.png" , "default_chest_side.png",
            "default_chest_front.png", "default_chest_inside.png"
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = "tmcraftings:woodchest",

        groups = {choppy = 2, oddly_breakable_by_hand = 2, not_in_creative_inventory = 1, chest = 1},
        sounds = default.node_sound_wood_defaults(),

        can_dig = can_dig
    })

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

    -- Replace loot --
    minetest.register_on_generated(function()

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

                local loot = get_loot()
                local itms = {

                    [math.random(0, size)] = loot[val3%#loot],
                    [math.random(0, size)] = loot[val2%#loot],
                    [math.random(0, size)] = loot[val1%#loot],

                    [math.random(0, size)] = loot[(val1 + 1)%#loot],
                    [math.random(0, size)] = loot[(val2 + 2)%#loot],
                    [math.random(0, size)] = loot[(val3 + 3)%#loot],
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
                    else d_itm:set_count(1) end

                    inv:set_stack('main', i, d_itm)
                end
            end
        end
    end)

--# Replace Bookshelf --------------------------------------#--

    minetest.override_item('default:bookshelf', {

        description = "Bookshelf",

        tiles = {
            
            "default_wood.png", "default_wood.png", 
            "default_wood.png", "default_wood.png",
            "default_wood.png", "default_bookshelf.png"
        },

        paramtype2 = "facedir",

        is_ground_content = false,

        groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
        sounds = default.node_sound_wood_defaults(),

    --# Behaviour scope ------------------------------------#--

        can_dig = can_dig,

        on_construct =
        function(pos)
            
            local meta = minetest.get_meta(pos)
            meta:set_string('formspec', get_gui('defchest'))

            local inv = meta:get_inventory()
            inv:set_size('main', 8 * 3)
        end,

        allow_metadata_inventory_put =
        function(pos, l_nm, indx, stck)

            if minetest.get_item_group(stck:get_name(), 'book') ~= 0 then

                return stck:get_count()
            end

            return 0
        end,

        on_blast =
        function(pos)

            local drops = {}

            default.get_inventory_drops(pos, 'main', drops)
            drops[#drops+1] = "tmcraftings::bookshelf"

            minetest.remove_node(pos)
            return drops
        end
    })

--# Metal Crate --------------------------------------------#--

    minetest.register_node('tmcraftings:metal_crate', {

        description = "Metal Crate",

        tiles = {

            'tmcraftings_metal_crate_top.png' ,
            'tmcraftings_metal_crate_bot.png' ,
            'tmcraftings_metal_crate_side.png',
            'tmcraftings_metal_crate_side.png',
        },

        is_ground_content = false,

        groups = {cracky = 4},
        sounds = default.node_sound_metal_defaults(),

        on_construct =
        function(pos)
            
            local meta = minetest.get_meta(pos)
            meta:set_string('formspec', get_gui('defchest'))

            local inv = meta:get_inventory()
            inv:set_size('main', 8 * 3)
        end
    })

    minetest.register_craft({

        output = 'tmcraftings:metal_crate',
        recipe = {
            
            {'tmcraftings:iron', 'tmcraftings:iron', 'tmcraftings:iron'},
            {'tmcraftings:iron', ''                , 'tmcraftings:iron'},
            {'tmcraftings:iron', 'tmcraftings:iron', 'tmcraftings:iron'},
        },
    })

--# Compact resources --------------------------------------#--

    -- Compressor behaviour --
    comp_timer =
    function(pos, elapsed)

        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()

        local src = inv:get_stack('src', 1)

        local itm, out
        if src then

            itm, out = minetest.get_craft_result({

                method = "normal",
                width  = 4,
                items  = {

                    src, src, src, src,
                    src, src, src, src,
                    src, src, src, src,
                    src, src, src, src,
                }
            })
        end

        if itm then

            inv:set_stack('src', 1, out.items[1])
            inv:add_item('dst', itm.item)

            return true
        
        else return false end
    end

    -- Compression Machine --
    minetest.register_node('tmcraftings:compressor', {

        description = "Compression Machine",

        tiles = {

            "tmcraftings_tungsten_block.png" , "tmcraftings_tungsten_block.png" ,
            "tmcraftings_compressor_side.png", "tmcraftings_compressor_side.png",
            "tmcraftings_compressor_side.png", "tmcraftings_compressor_side.png",
        },
        
        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {cracky = 5},
        is_ground_content = false,
        
        sounds = default.node_sound_metal_defaults(),

    --# Behaviour scope ------------------------------------#--

        on_timer = comp_timer,

        on_construct = 
        function(pos)
            
            local meta = minetest.get_meta(pos)
            
            meta:set_string('formspec', get_gui('mfurnace'))
            
            local inv = meta:get_inventory()

            inv:set_size('src', 1)
            inv:set_size('dst', 1)
        end,

        on_metadata_inventory_put  =
        function(pos)
            
            minetest.get_node_timer(pos):start(1)
        end,

        on_metadata_inventory_move =
        function(pos)
            
            minetest.get_node_timer(pos):start(1)
        end,

        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm,
        allow_metadata_inventory_take = can_tak_itm,
    })

    minetest.register_craft({

        output = "tmcraftings:compressor",
        recipe = {
            
            {'tmcraftings:tungsten', 'tmcraftings:tungsten', 'tmcraftings:tungsten'},
            {'tmcraftings:iron'    , 'tmcraftings:tungsten', 'tmcraftings:iron'    },
            {'tmcraftings:tungsten', 'tmcraftings:tungsten', 'tmcraftings:tungsten'},
        },
    })

    -- Compressed Stone --
    minetest.register_craft({

        output = "default:stone",
        recipe = {
            
            {'default:cobble', 'default:cobble', 'default:cobble', 'default:cobble'},
            {'default:cobble', 'default:cobble', 'default:cobble', 'default:cobble'},
            {'default:cobble', 'default:cobble', 'default:cobble', 'default:cobble'},
            {'default:cobble', 'default:cobble', 'default:cobble', 'default:cobble'},
        },
    })

--# Magic Battery ------------------------------------------#--

    minetest.register_node('tmcraftings:magic_battery', {

        description = "Magic Battery",

        tiles = {

            'tmcraftings_silver_block.png' ,
            'tmcraftings_silver_block.png' ,
            'tmcraftings_silver_block.png^tmcraftings_magic_battery.png',
            'tmcraftings_silver_block.png^tmcraftings_magic_battery.png',
        },
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 4},

        sounds = default.node_sound_metal_defaults(),
    })

    minetest.register_craft({

        output = 'tmcraftings:magic_battery',
        recipe = {
            
            {'tmcraftings:silver', 'tmcraftings:silver', 'tmcraftings:silver'},
            {'tmcraftings:iron', 'tmcraftings:magic_core', 'tmcraftings:iron'},
            {'tmcraftings:silver', 'tmcraftings:silver', 'tmcraftings:silver'},
        },
    })

--# Magic Furnace ------------------------------------------#--

    minetest.register_node('tmcraftings:mfurnace', {

        description = "Magic Furnace",

        tiles = {

            "tmcraftings_mfurnace_top.png" , "tmcraftings_mfurnace_bot.png" ,
            "tmcraftings_mfurnace_side.png", "tmcraftings_mfurnace_side.png",
            "tmcraftings_mfurnace_side.png", "tmcraftings_mfurnace_frnt.png",
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {cracky = 5},
        is_ground_content = false,

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour scope ------------------------------------#--

        can_dig = is_diggable,
        
        on_construct =
        function(pos)

            local meta = minetest.get_meta(pos)

            meta:set_string('formspec', get_gui('mfurnace'))
            meta:set_float('timer', -1)

            local inv = meta:get_inventory()

            inv:set_size('src', 1)
            inv:set_size('dst', 1)
        end,

        -- What happens if furnace explodes --
        on_blast =
        function(pos)

            local drops = {}

            -- Get items inside of the furnace --
            default.get_inventory_drops(pos, 'src', drops)
            default.get_inventory_drops(pos, 'dst', drops)

            -- Drop itself --
            drops[#drops + 1] = "tmcraftings:mfurnace"

            minetest.remove_node(pos)
            return drops
        end,
    
        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm,
        allow_metadata_inventory_take = can_tak_itm,
    })

    minetest.register_node('tmcraftings:mfurnace_on', {

        tiles = {

            "tmcraftings_mfurnace_top_lit.png" , "tmcraftings_mfurnace_bot.png" ,
            "tmcraftings_mfurnace_side.png", "tmcraftings_mfurnace_side.png",
            "tmcraftings_mfurnace_side.png", "tmcraftings_mfurnace_frnt_lit.png",
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = 'tmcraftings:mfurnace',

        paramtype = "light",
        sunlight_propagates = false,
        light_source = default.LIGHT_MAX / 2,

        groups = {cracky = 5, not_in_creative_inventory = 1},
        is_ground_content = false,

        sounds = default.node_sound_metal_defaults(),
        
    --# Behaviour scope ------------------------------------#--

        can_dig = is_diggable,
        on_timer = fuelless_timer,

        -- Start working on inventory event --
        on_metadata_inventory_move =
        function(pos)

            minetest.get_node_timer(pos):start(0.1)
        end,
        
        on_metadata_inventory_put =
        function(pos)

            minetest.get_node_timer(pos):start(0.1)
        end,

        -- What happens if furnace explodes --
        on_blast =
        function(pos)

            local drops = {}

            -- Get items inside of the furnace --
            default.get_inventory_drops(pos, 'src', drops)
            default.get_inventory_drops(pos, 'dst', drops)

            -- Drop itself --
            drops[#drops + 1] = "tmcraftings:mfurnace"

            minetest.remove_node(pos)
            return drops
        end,
    
        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm,
        allow_metadata_inventory_take = can_tak_itm,
    })

    -- Turn on --
    minetest.register_abm({

        nodenames = {'tmcraftings:mfurnace'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)

            if minetest.find_node_near(pos, 1, 'tmcraftings:magic_battery') then

                s_node(pos, 'tmcraftings:mfurnace_on')
            end
        end
    })

    -- Turn off --
    minetest.register_abm({

        nodenames = {'tmcraftings:mfurnace_on'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)

            if not minetest.find_node_near(pos, 1, 'tmcraftings:magic_battery') then
                
                s_node(pos, 'tmcraftings:mfurnace')
            end
        end,
    })

    minetest.register_craft({

        output = 'tmcraftings:mfurnace',
        recipe = {
            
            {'tmcraftings:iron', 'tmcraftings:iron', 'tmcraftings:iron'},
            {'tmcraftings:iron', 'tmcraftings:magic_core', 'tmcraftings:iron'},
            {'tmcraftings:titanium', 'tmcraftings:titanium', 'tmcraftings:titanium'},
        },
    })

--# Magic Post light ---------------------------------------#--

    minetest.register_node("tmcraftings:magic_postlight", {

        drawtype = "nodebox",

        tiles = {

            "tmcraftings_magic_postlight_top.png" , "tmcraftings_magic_postlight_off_top.png" ,
            "tmcraftings_magic_postlight_side.png", "tmcraftings_magic_postlight_side.png",
            "tmcraftings_magic_postlight_side.png", "tmcraftings_magic_postlight_side.png",
        },

        node_box = {

            type = "fixed",

            fixed = {

                {-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
            }
        },

        paramtype = "light",
        sunlight_propagates = true,
        light_source = default.LIGHT_MAX,

        is_ground_content = false,

        drop = 'tmcraftings:magic_postlight_off',

        groups = {cracky = 4, not_in_creative_inventory = 1},
        sounds = default.node_sound_metal_defaults(),
    })

    minetest.register_node("tmcraftings:magic_postlight_off", {

        description = "Magic Post Light",

        drawtype = "nodebox",

        tiles = {

            "tmcraftings_magic_postlight_off_top.png" , "tmcraftings_magic_postlight_off_top.png" ,
            "tmcraftings_magic_postlight_off_side.png", "tmcraftings_magic_postlight_off_side.png",
            "tmcraftings_magic_postlight_off_side.png", "tmcraftings_magic_postlight_off_side.png",
        },

        node_box = {

            type = "fixed",

            fixed = {

                {-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
            }
        },

        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,

        groups = {cracky = 2},
        sounds = default.node_sound_metal_defaults(),
    })

    -- Turn on --
    minetest.register_abm({

        nodenames = {'tmcraftings:magic_postlight_off'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)

            if minetest.find_node_near(pos, 1, 'tmcraftings:magic_battery') then

                minetest.set_node(pos, {name = 'tmcraftings:magic_postlight'})
            end
        end
    })

    -- Turn off --
    minetest.register_abm({

        nodenames = {'tmcraftings:magic_postlight'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)

            if not minetest.find_node_near(pos, 1, 'tmcraftings:magic_battery') then
                
                minetest.set_node(pos, {name = 'tmcraftings:magic_postlight_off'})
            end
        end,
    })

    minetest.register_craft({

        output = 'tmcraftings:magic_postlight_off',
        recipe = {
            
            {'', 'tmcraftings:silver', ''},
            {'default:glass', 'tmcraftings:magic_crystal', 'default:glass'},
            {'', 'tmcraftings:silver', ''},
        },
    })

--# Magic rail ---------------------------------------------#--

    -- Use default rail API --
    carts:register_rail('tmcraftings:mrail', {

        drop = 'tmcraftings:mrail_off',

        tiles = {

            "tmcraftings_mrail_str.png", "tmcraftings_mrail_cur.png",
            "tmcraftings_mrail_tjn.png", "tmcraftings_mrail_crs.png"
        },
        
        groups = carts:get_rail_groups(),

    }, {acceleration = 6})

    carts:register_rail('tmcraftings:mrail_off', {

        description = 'Magic Rail',
        inventory_image = "tmcraftings_mrail_str.png",

        tiles = {

            "tmcraftings_mrail_str_off.png", "tmcraftings_mrail_cur_off.png",
            "tmcraftings_mrail_tjn_off.png", "tmcraftings_mrail_crs_off.png"
        },

        groups = carts:get_rail_groups(),

    })

    -- Turn on --
    minetest.register_abm({

        nodenames = {'tmcraftings:mrail_off'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)

            if minetest.find_node_near(pos, 1, 'tmcraftings:magic_battery') then

                minetest.set_node(pos, {name = 'tmcraftings:mrail'})
            end
        end
    })

    -- Turn off --
    minetest.register_abm({

        nodenames = {'tmcraftings:mrail'},
        interval  = 1,
        chance    = 1,
        
        action =
        function(pos)

            if not minetest.find_node_near(pos, 1, 'tmcraftings:magic_battery') then

                minetest.set_node(pos, {name = 'tmcraftings:mrail_off'})
            end
        end
    })

    minetest.register_craft({

        output = "tmcraftings:mrail_off 16",

        recipe = {

            {"tmcraftings:iron", "group:wood"            , "tmcraftings:iron"},
            {"tmcraftings:iron", "tmcraftings:magic_core", "tmcraftings:iron"},
            {"tmcraftings:iron", "group:wood"            , "tmcraftings:iron"},
        }
    })

--# Enchanted Chest ----------------------------------------#--

    minetest.register_node('tmcraftings:echest', {
            
        description = "Enchanted Chest",
        
        tiles = {

            "tmcraftings_echest_top.png" , "tmcraftings_echest_bot.png" ,
            "tmcraftings_echest_side.png^[transformFX", "tmcraftings_echest_side.png",
            "tmcraftings_echest_back.png", "tmcraftings_echest_front.png"
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        paramtype = "light",
        sunlight_propagates = false,
        light_source = default.LIGHT_MAX / 5,

        groups = {cracky = 6, chest = 2},
        sounds = default.node_sound_stone_defaults(),

    --# Behaviour scope ------------------------------------#--

        on_construct = 
        function(pos)

            chests[pos] = false
        end,

        on_rightclick =
        function(pos, node, clicker)
            
            if can_opn(pos) then

                minetest.sound_play('doors_steel_door_open', {

                    gain = 0.3,
                    pos = pos,
                    max_hear_distance = 10

                }, true)
                
                chests[pos] = 'tmcraftings:echest'
                s_node(pos, 'tmcraftings:echest_open')

                minetest.after(0.2,

                    minetest.show_formspec,
                    clicker:get_player_name(),
                    'tmcraftings:chestformspec_enchanted',
                    
                    get_gui('defchest', _, _, 'current_player;chst')
                )
            end
        end
    })

    minetest.register_node('tmcraftings:echest_open', {
        
        drawtype = "mesh",
        mesh = "chest_open.obj",

        tiles = {

            "tmcraftings_echest_top.png"  , "tmcraftings_echest_bot.png" ,
            "tmcraftings_echest_side.png" , "tmcraftings_echest_back.png",
            "tmcraftings_echest_front.png", "tmcraftings_echest_inside.png"
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = "tmcraftings:echest",

        paramtype = "light",
        sunlight_propagates = false,
        light_source = default.LIGHT_MAX / 3,

        groups = {cracky = 6, chest = 2},
        sounds = default.node_sound_stone_defaults()
    })

    minetest.register_craft({

        output = 'tmcraftings:echest',
        recipe = {
            
            {'tmcraftings:titanium', 'group:wood', 'tmcraftings:titanium'},
            {'group:wood', 'tmcraftings:magic_core', 'group:wood'},
            {'tmcraftings:titanium', 'group:wood', 'tmcraftings:titanium'},
        },
    })

function s_node(pos, name)

    local node = minetest.get_node(pos)

    -- Swap to yourself --
    if node.name == name then return end
    
    node.name = name
    minetest.swap_node(pos, node)
end