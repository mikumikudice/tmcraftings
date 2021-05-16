dofile(minetest.get_modpath("tmcraftings") .. '/craft_furns.lua')

--# Fix default ores' generation ---------------------------#--

    -- Coal --
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

    -- Iron --
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

    -- Less iron --
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
        stack_max = 99,

        groups = {tech_material = 3}
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
        stack_max = 99,

        groups = {tech_material = 2}
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
        stack_max = 99,

        groups = {tech_material = 1}
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

    -- Silver block --
    minetest.register_node('tmcraftings:silver_block', {
        
        description = "Silver block",

        tiles = {'tmcraftings_silver_block.png'},

        is_ground_content = false,
        groups = {cracky = 5},

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

--# Gold ---------------------------------------------------#--

    minetest.register_craftitem('tmcraftings:gold', {

        description = "Gold Ingot",
        inventory_image = "tmcraftings_gold_ingot.png",
        stack_max = 99
    })

    minetest.register_craftitem('tmcraftings:aurumite', {

        description = "Aurumite",
        inventory_image = "tmcraftings_aurumite.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = "cooking",
        output = "tmcraftings:gold",
        recipe = "tmcraftings:aurumite",
        cooktime = 20,
    })

    minetest.register_node('tmcraftings:stone_with_gold', {

        description = "Gold Ore",
        drop = "tmcraftings:aurumite",

        tiles = {"default_stone.png^tmcraftings_gold_ore.png"},

        groups = {cracky = 5},
        sounds = default.node_sound_stone_defaults(),
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "tmcraftings:stone_with_gold",
        wherein        = "default:stone",
        clust_scarcity = 16 * 16 * 16,
        clust_num_ores = 4,
        clust_size     = 4,
        y_max          = -400,
        y_min          = -24000,
    })

    -- Gold block --
    minetest.register_node('tmcraftings:gold_block', {
        
        description = "Gold block",

        tiles = {'tmcraftings_gold_block.png'},

        is_ground_content = false,
        groups = {cracky = 5},

        sounds = default.node_sound_metal_defaults(),
    })

    minetest.register_craft({

        output = 'tmcraftings:gold_block',
        recipe = {
            
            {'tmcraftings:gold', 'tmcraftings:gold', 'tmcraftings:gold'},
            {'tmcraftings:gold', 'tmcraftings:gold', 'tmcraftings:gold'},
            {'tmcraftings:gold', 'tmcraftings:gold', 'tmcraftings:gold'},
        },
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

--# Cursed Ruby --------------------------------------------#--

    minetest.register_craftitem('tmcraftings:ruby', {

        description = "Cursed Ruby",
        inventory_image = "tmcraftings_cursed_ruby.png",
        stack_max = 99
    })

    minetest.register_node('tmcraftings:stone_with_ruby', {

        description = "Ruby Ore",
        drop = "tmcraftings:ruby",

        tiles = {"default_stone.png^tmcraftings_ruby_ore.png"},

        groups = {cracky = 6},
        sounds = default.node_sound_stone_defaults()
    })

    minetest.register_ore({

        ore_type       = "scatter",
        ore            = "tmcraftings:stone_with_ruby",
        wherein        = "default:stone",
        clust_scarcity = 24 * 24 * 24,
        clust_num_ores = 4,
        clust_size     = 6,
        y_max          = -200,
        y_min          = -24000,
    })

--# Ingot to block -----------------------------------------#--

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
            }
        })
    end

--# Rusty iron block ---------------------------------------#--

    minetest.register_node('tmcraftings:rusty_block', {

        description = "Rusty Iron Block",

        tiles = {'tmcraftings_rusty_block.png'},

        drop = {

            max_items = 9,
            items = {

                -- Scrap --
                {rarity = 9, items = {'tmcraftings:scrap 1'}},
                {rarity = 8, items = {'tmcraftings:scrap 2'}},
                {rarity = 7, items = {'tmcraftings:scrap 3'}},
                {rarity = 6, items = {'tmcraftings:scrap 4'}},
                {rarity = 5, items = {'tmcraftings:scrap 5'}},

                -- Iron --
                {rarity = 9, items = {'tmcraftings:iron  2'}},
                {rarity = 8, items = {'tmcraftings:iron  3'}},
                {rarity = 7, items = {'tmcraftings:iron  4'}},
                {rarity = 6, items = {'tmcraftings:iron  5'}},
                {rarity = 5, items = {'tmcraftings:iron  6'}},
            }
        },

        is_ground_content = false,
        groups = {cracky = 4},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_craft({

        output = 'tmcraftings:rusty_block',
        recipe = {
            
            {'tmcraftings:scrap', 'tmcraftings:scrap', 'tmcraftings:scrap'},
            {'tmcraftings:scrap', 'tmcraftings:scrap', 'tmcraftings:scrap'},
            {'tmcraftings:scrap', 'tmcraftings:scrap', 'tmcraftings:scrap'},
        },
    })

    minetest.register_abm({
        
        nodenames = {"tmcraftings:iron_block"},
        interval  = 5,
        chance    = 5,
        neighbors = "water_source",

        action =
        function(pos)
            
            minetest.set_node(pos, {name = 'tmcraftings:rusty_block'})
        end
    })

--# Replace Obsidian ---------------------------------------#--

    -- For every obsidian variant -- 
    for _, node in pairs(minetest.registered_nodes) do

        local name = node.name

        if name:find('obsidian') then

            -- Replace blocks --
            minetest.override_item(name, {
        
                groups = {cracky = 7},
                on_blast = function() return nil end
            })
        end
    end

--# Replace bones ------------------------------------------#--

    minetest.register_node('tmcraftings:grave', {

        description = "Grave",
        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Base --
                {0.5, 0.5 - 12/16, 0.5, -0.5, -0.5, -0.5},

                -- Cross X --
                {0.5 - 2/16, 0.5 - 3/16, 0.5 - 1/16, -0.5 + 2/16, 0.5 - 5/16, 0.5 - 3/16},

                -- Cross Y --
                {0.5 - 7/16, 0.5, 0.5 - 1/16, -0.5 + 7/16, 0.5 - 12/16, 0.5 - 3/16},
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

        can_dig  = is_diggable,
        on_timer = function() return end,
        
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

                meta:set_float('timer', -1)

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

                meta:set_float('timer', -1)

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

        can_dig  = is_diggable,
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
            -- trigger loot --
            minetest.get_meta(pos):set_string('open', 'true')

            if can_opn(pos) then

                minetest.sound_play('default_chest_open', {

                    gain = 0.3,
                    pos  = pos,
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
            inv:set_size('main', 8 * 2)
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
            drops[#drops+1] = "default:bookshelf"

            minetest.remove_node(pos)
            return drops
        end
    })

--# Replace Vessels shelf ----------------------------------#--

    minetest.override_item('vessels:shelf', {

        description = "Vessels Shelf",

        tiles = {
            
            "default_wood.png", "default_wood.png", 
            "default_wood.png", "default_wood.png",
            "default_wood.png", "vessels_shelf.png"
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
            inv:set_size('main', 8 * 2)
        end,

        allow_metadata_inventory_put =
        function(pos, l_nm, indx, stck)

            if minetest.get_item_group(stck:get_name(), 'vessel') ~= 0 then

                return stck:get_count()
            end

            return 0
        end,

        on_blast =
        function(pos)

            local drops = {}

            default.get_inventory_drops(pos, 'main', drops)
            drops[#drops+1] = "vessels:shelf"

            minetest.remove_node(pos)
            return drops
        end,

        on_metadata_inventory_put  = function() return end,
        on_metadata_inventory_move = function() return end,
        on_metadata_inventory_take = function() return end
    })

--# Ledder -------------------------------------------------#--
    
    minetest.register_node('tmcraftings:iron_ladder', {

        description = "Iron Ladder",

        drawtype = "signlike",
        tiles = {"tmcraftings_iron_ladder.png"},
        inventory_image = "tmcraftings_iron_ladder.png",
        wield_image = "tmcraftings_iron_ladder.png",

        paramtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = true,
        is_ground_content = false,

        walkable = false,
        climbable = true,

        selection_box = {type = "wallmounted"},

        groups = {cracky = 4},
        sounds = default.node_sound_metal_defaults(),
    })

    minetest.register_craft({

        output = "tmcraftings:iron_ladder",

        recipe = {

            {"tmcraftings:iron", ""                , "tmcraftings:iron"},
            {"tmcraftings:iron", "tmcraftings:iron", "tmcraftings:iron"},
            {"tmcraftings:iron", ""                , "tmcraftings:iron"},
        }
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

--# Anvil --------------------------------------------------#--

    minetest.register_node('tmcraftings:anvil', {

        description = "Anvil",
        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Head --
                {0.5, 0.5, 0.5, -0.5, 0.125, -0.5},

                -- Boddy --
                {0.2, 0.125, 0.3, -0.2, -0.31445, -0.125},

                -- Decor --
                {0.05555, 0.125, -0.125, -0.05555, 0.004, -0.25},
                {0.05555, 0.125, -0.25, -0.05555, 0.065, -0.314},

                -- Base --
                {0.425, -0.31445, 0.5, -0.425, -0.5, -0.425},
            },
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_anvil_top.png" , "tmcraftings_anvil_bot.png" ,
            "tmcraftings_anvil_side.png^[transformFX", "tmcraftings_anvil_side.png",
            "tmcraftings_anvil_back.png", "tmcraftings_anvil_frnt.png",
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {cracky = 4},
        sounds = default.node_sound_metal_defaults(),

    --# Behaviour scope ------------------------------------#--

        on_construct =
        function(pos)
            
            local meta = minetest.get_meta(pos)
            meta:set_string('formspec', get_gui('defanvil'))
        end,

        on_rightclick =
        function(pos)
            
            local meta = minetest.get_meta(pos)
            meta:set_string('formspec', get_gui('defanvil'))
        end
    })

    minetest.register_craft({

        output = 'tmcraftings:tmcraftings:anvil',
        recipe = {
            
            {'tmcraftings:iron_block', 'tmcraftings:iron_block', 'tmcraftings:iron_block'},
            {'tmcraftings:iron'      , 'tmcraftings:iron'      , 'tmcraftings:iron'      },
            {'tmcraftings:iron'      , 'tmcraftings:iron'      , 'tmcraftings:iron'      },
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

    -- Slab to block --
    minetest.register_craft({

        type   = "shapeless"  ,
        output = "group:stone",
        recipe = {"group:slab", "group:slab"}
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
                    pos  = pos,
                    max_hear_distance = 10

                }, true)

                chests[pos] = 'tmcraftings:echest'
                s_node(pos, 'tmcraftings:echest_open')

                minetest.after(0.2,

                    minetest.show_formspec,
                    clicker:get_player_name(),
                    'tmcraftings:chestformspec_enchanted',

                    get_gui('defchest', _, _, 'current_player;chest')
                )
            end
        end
    })

    minetest.register_node('tmcraftings:echest_open', {
        
        drawtype = "mesh",
        mesh = "chest_open.obj",

        selection_box = {

            type = "fixed",
            fixed = {-1/2, -1/2, -1/2, 1/2, 3/16, 1/2},
        },

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

-- Eletronics --
--# Magic Battery ------------------------------------------#--

    minetest.register_node('tmcraftings:magic_battery', {

        description = "Magic Battery",

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png'    ,
            'tmcraftings_silver_block.png^tmcraftings_component.png'    ,
            'tmcraftings_silver_block.png^tmcraftings_magic_battery.png',
        },
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, source = 1, battery = 1},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_craft({

        output = 'tmcraftings:magic_battery',
        recipe = {
            
            {'group:tech_material', 'group:tech_material'   , 'group:tech_material'},
            {'group:tech_material', 'tmcraftings:magic_core', 'group:tech_material'},
            {'group:tech_material', 'group:tech_material'   , 'group:tech_material'},
        },
    })

--# Switch -------------------------------------------------#--

    minetest.register_node('tmcraftings:switch', {

        description = "Swich",
        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Base --
                {0.5, 0.5, 0.5, -0.5, -0.5, -0.25},

                -- Switch lever --
                {-0.05, 0.5, -0.255, 0.05, 0.25, -0.35},

                -- Lever base --
                {-0.31, 0.25, -0.255, 0.31, 0.13, -0.35},

                -- Left base edge --
                {-0.31, 0.13, -0.255, -0.19, -0.06, -0.35},

                -- Right base edge --
                {0.31, 0.13, -0.255, 0.19, -0.06, -0.35},
            },
        },

        tiles = {

            'tmcraftings_switch_side.png^[transformR270]^[transformFY',
            'tmcraftings_switch_side.png^[transformR270]',
            'tmcraftings_switch_side.png' ,
            'tmcraftings_switch_side.png^[transformFX'   ,
            'tmcraftings_silver_block.png^tmcraftings_thinker.png'    ,
            'tmcraftings_switch_frnt.png' ,
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        is_ground_content = false,
        groups = {cracky = 5},

        sounds = default.node_sound_metal_defaults(),

        on_construct  = eletronics.on_load_device,
        on_rightclick =
        function(pos)
            
            minetest.sound_play('doors_steel_door_close', {

                gain = 0.3,
                pos  = pos,
                max_hear_distance = 10
        
            }, true)

            s_node(pos, 'tmcraftings:switch_on')
        end
    })

    minetest.register_node('tmcraftings:switch_on', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Base --
                {0.5, 0.5, 0.5, -0.5, -0.5, -0.25},

                -- Switch lever --
                {-0.05, -0.5, -0.255, 0.05, -0.25, -0.35},

                -- Lever base --
                {-0.31, -0.25, -0.255, 0.31, -0.13, -0.35},

                -- Left base edge --
                {-0.31, -0.13, -0.255, -0.19, 0.06, -0.35},

                -- Right base edge --
                {0.31, -0.13, -0.255, 0.19, 0.06, -0.35},
            },
        },

        tiles = {

            'tmcraftings_switch_side.png^[transformR270]^[transformFY',
            'tmcraftings_switch_side.png^[transformR270]',
            'tmcraftings_switch_side.png'   ,
            'tmcraftings_switch_side.png^[transformFX'   ,
            'tmcraftings_silver_block.png^tmcraftings_thinker_on.png' ,
            'tmcraftings_switch_frnt_on.png',
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = "tmcraftings:switch",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, source = 1, battery = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

        on_rightclick =
        function(pos)
            
            minetest.sound_play('doors_steel_door_close', {

                gain = 0.3,
                pos  = pos,
                max_hear_distance = 10
        
            }, true)

            s_node(pos, 'tmcraftings:switch')
        end
    })

    minetest.register_craft({

        output = "tmcraftings:switch",
        recipe = {
            
            {"group:tech_material", "tmcraftings:magic_crystal", "group:tech_material"},
            {"group:tech_material", "group:engine"             , "group:tech_material"},
            {"group:tech_material", "tmcraftings:ruby"         , "group:tech_material"},
        },
    })

--# Magic Boiler -------------------------------------------#--

    minetest.register_node('tmcraftings:magic_boiler', {

        description = "Magic Boiler",

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Base --
                {0.375, 0.375, 0.375, -0.375, -0.5, -0.375},

                -- Chimney --
                {0.12, 0.38, 0.12, -0.12, 0.5, -0.12},
            },
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_magic_boiler_top.png" , "tmcraftings_mfurnace_bot.png"     ,
            "tmcraftings_magic_boiler_side.png", "tmcraftings_magic_boiler_side.png",
            "tmcraftings_magic_boiler_side.png", "tmcraftings_magic_boiler.png"     ,
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        groups = {cracky = 5},
        is_ground_content = false,

        sounds = default.node_sound_metal_defaults(),
    
    --# Behaviour Scope ------------------------------------#--
    
        can_dig      = is_diggable,
        on_construct = on_load_boiler,

        on_timer = boiler_behaviour,

        on_metadata_inventory_put  =
        function(pos)
            
            minetest.get_node_timer(pos):start(1)
        end,

        on_metadata_inventory_move =
        function(pos)
            
            minetest.get_node_timer(pos):start(1)
        end,

        on_blast =
        function(pos)

            local drops = {}

            -- Get items inside of the furnace --
            default.get_inventory_drops(pos, 'fuel', drops)

            -- Drop itself --
            drops[#drops + 1] = "tmcraftings:magic_boiler"

            minetest.remove_node(pos)
            return drops
        end,

        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm
    })

    minetest.register_node('tmcraftings:magic_boiler_on', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Base --
                {0.375, 0.375, 0.375, -0.375, -0.5, -0.375},

                -- Chimney --
                {0.12, 0.38, 0.12, -0.12, 0.5, -0.12},
            },
        },

        tiles = {

            "tmcraftings_magic_boiler_top_lit.png", "tmcraftings_mfurnace_bot.png"     ,
            "tmcraftings_magic_boiler_side.png"   , "tmcraftings_magic_boiler_side.png",
            "tmcraftings_magic_boiler_side.png"   , "tmcraftings_magic_boiler_lit.png" ,
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = 'tmcraftings:magic_boiler',

        light_source = default.LIGHT_MAX / 2,

        groups = {cracky = 5, source = 1, battery = 1, not_in_creative_inventory = 1},
        is_ground_content = false,

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour Scope ------------------------------------#--
    
        can_dig = is_diggable,
        on_timer = boiler_behaviour,

        on_metadata_inventory_put  =
        function(pos)
            
            minetest.get_node_timer(pos):start(1)
        end,

        on_metadata_inventory_move =
        function(pos)
            
            minetest.get_node_timer(pos):start(1)
        end,

        on_blast =
        function(pos)

            local drops = {}

            -- Get items inside of the furnace --
            default.get_inventory_drops(pos, 'fuel', drops)

            -- Drop itself --
            drops[#drops + 1] = "tmcraftings:magic_boiler"

            minetest.remove_node(pos)
            return drops
        end,

        allow_metadata_inventory_put  = can_put_itm,
        allow_metadata_inventory_move = can_mov_itm
    })

    minetest.register_craft({

        output = "tmcraftings:magic_boiler",
        recipe = {
            
            {"group:tech_material" , "tmcraftings:magic_dust"  , "group:tech_material" },
            {"group:tech_material" , "tmcraftings:magic_dust"  , "group:tech_material" },
            {"tmcraftings:titanium", "tmcraftings:titanium"    , "tmcraftings:titanium"},
        },
    })

--# Disperser ----------------------------------------------#--

    minetest.register_node('tmcraftings:disperser', {

        description = "Disperser",

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_silver_block.png^tmcraftings_disperser.png',
            'tmcraftings_silver_block.png^tmcraftings_disperser.png',
        },

        is_ground_content = false,
        groups = {cracky = 5, pwr_deliver = 1},

        sounds = default.node_sound_metal_defaults(),
        on_construct = eletronics.on_load_device
    })

    minetest.register_node('tmcraftings:disperser_on', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png'   ,
            'tmcraftings_silver_block.png^tmcraftings_component.png'   ,
            'tmcraftings_silver_block.png^tmcraftings_disperser_on.png',
            'tmcraftings_silver_block.png^tmcraftings_disperser_on.png',
        },

        drop = "tmcraftings:disperser",

        paramtype2 = "facedir",
        legacy_facedir_simple = true,
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, deliver = 1, pwr_deliver = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_craft({

        output = "tmcraftings:disperser",
        recipe = {
            
            {"group:tech_material", "group:tech_material"     , "tmcraftings:silver"},
            {"group:tech_material", "tmcraftings:magic_cystal", "tmcraftings:silver"},
            {"group:tech_material", "group:tech_material"     , "tmcraftings:silver"},
        },
    })

--# Post ---------------------------------------------------#--

    minetest.register_node('tmcraftings:post', {

        description = "Magic Post",

        drawtype = "nodebox",
        node_box = {

            type = "fixed",

            fixed = {

                {-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
            }
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_post_top.png",
            "tmcraftings_post_top.png",
            "tmcraftings_post.png"    ,
        },

        paramtype = "light",
        sunlight_propagates = true,

        is_ground_content = false,
        groups = {cracky = 5, source = 2, wire = 2, pwr_deliver = 1},

        sounds = default.node_sound_metal_defaults(),

        on_construct = eletronics.on_load_device,

        -- Clear meta to avoid phantom charge --
        on_destruct = eletronics.on_break_wite
    })

    minetest.register_node('tmcraftings:post_on', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",

            fixed = {

                {-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
            }
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_post_top_on.png",
            "tmcraftings_post_top_on.png",
            "tmcraftings_post_on.png"    ,
        },

        drop = "mcraftings:post",

        paramtype = "light",
        sunlight_propagates = true,
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, deliver = 1, source = 2, wire = 2, pwr_deliver = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

        -- Clear meta to avoid phantom charge --
        on_destruct = eletronics.on_break_wite
    })

    minetest.register_craft({

        output = "tmcraftings:post 3",
        recipe = {
            
            {"group:tech_material", "tmcraftings:magic_dust", "group:tech_material"},
            {"group:tech_material", "tmcraftings:magic_dust", "group:tech_material"},
            {"group:tech_material", "tmcraftings:magic_dust", "group:tech_material"},
        },
    })

--# Wires --------------------------------------------------#--

    minetest.register_node('tmcraftings:wires', {

        description = 'Wires',

        inventory_image = "tmcraftings_wires.png",

        drawtype = "raillike",
        tiles = {

            "tmcraftings_wires_str.png", "tmcraftings_wires_cur.png",
            "tmcraftings_wires_tjn.png", "tmcraftings_wires_crs.png"
        },

        drop = "tmcraftings:wires",
        
        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,

        walkable = false,

        selection_box = {

            type = "fixed",
            fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
        },

        groups = {choppy = 1, wire = 1, source = 2},
        sounds = default.node_sound_stone_defaults(),

        on_construct = eletronics.on_load_device,

        -- Clear meta to avoid phantom charge --
        on_destruct = eletronics.on_break_wite
    })

    minetest.register_craft({

        type   = "shapeless",
        output = "tmcraftings:wires 3",

        recipe = {

            "group:tech_material",
            "group:tech_material",
            "group:tech_material",
        }
    })

--# Thinker ------------------------------------------------#--

    minetest.register_node('tmcraftings:thinker', {

        description = "Thinker",

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png',

            'tmcraftings_silver_block.png^tmcraftings_thinker.png'  ,
            'tmcraftings_silver_block.png',

            'tmcraftings_silver_block.png^tmcraftings_thinker.png'  ,
            'tmcraftings_silver_block.png^tmcraftings_thinker.png'  ,
        },

        is_ground_content = false,
        groups = {cracky = 5, thinker = 1},

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour Scope ------------------------------------#--
    
        on_construct  = eletronics.on_load_thinker,
        on_rightclick = eletronics.on_click_thinker
    })

    minetest.register_node('tmcraftings:thinker_IO', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png' ,
            'tmcraftings_silver_block.png^tmcraftings_component.png' ,

            'tmcraftings_silver_block.png^tmcraftings_thinker.png'   ,
            'tmcraftings_silver_block.png',

            'tmcraftings_silver_block.png^tmcraftings_thinker_on.png',
            'tmcraftings_silver_block.png^tmcraftings_thinker.png'   ,
        },

        drop = "tmcraftings:thinker",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, thinker = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour Scope ------------------------------------#--
    
        on_construct  = eletronics.on_load_thinker,
        on_rightclick = eletronics.on_click_thinker
    })

    minetest.register_node('tmcraftings:thinker_OI', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png' ,
            'tmcraftings_silver_block.png^tmcraftings_component.png' ,

            'tmcraftings_silver_block.png^tmcraftings_thinker.png'   ,
            'tmcraftings_silver_block.png',

            'tmcraftings_silver_block.png^tmcraftings_thinker.png'   ,
            'tmcraftings_silver_block.png^tmcraftings_thinker_on.png',
        },

        drop = "tmcraftings:thinker",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, thinker = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour Scope ------------------------------------#--
    
        on_construct  = eletronics.on_load_thinker,
        on_rightclick = eletronics.on_click_thinker
    })

    minetest.register_node('tmcraftings:thinker_on', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png' ,
            'tmcraftings_silver_block.png^tmcraftings_component.png' ,

            'tmcraftings_silver_block.png^tmcraftings_thinker_on.png',
            'tmcraftings_silver_block.png',

            'tmcraftings_silver_block.png^tmcraftings_thinker_on.png',
            'tmcraftings_silver_block.png^tmcraftings_thinker_on.png',
        },

        drop = "tmcraftings:thinker",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, source = 2, depends = 1, thinker = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour Scope ------------------------------------#--
    
            on_construct  = eletronics.on_load_thinker,
            on_rightclick = eletronics.on_click_thinker
    })

    minetest.register_craft({

        output = "tmcraftings:thinker",
        recipe = {
            
            {'group:tech_material', 'group:tech_material', 'group:tech_material'},
            {'group:tech_material', 'tmcraftings:wcu'    , 'group:tech_material'},
            {'group:tech_material', 'group:tech_material', 'group:tech_material'},
        },
    })

--# Inverser -----------------------------------------------#--

    minetest.register_node('tmcraftings:inverser', {

        description = "Inverser",

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_inverser_top.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png'   ,

            'tmcraftings_silver_block.png',
            'tmcraftings_silver_block.png',
            'tmcraftings_silver_block.png^tmcraftings_inverser.png',
        },

        is_ground_content = false,
        groups = {cracky = 5, source = 2, depends = 1, inverser = 1},

        sounds = default.node_sound_metal_defaults(),
        on_construct = eletronics.on_load_device
    })

    minetest.register_node('tmcraftings:inverser_on', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_inverser_top.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png'   ,

            'tmcraftings_silver_block.png',
            'tmcraftings_silver_block.png',
            'tmcraftings_silver_block.png^tmcraftings_inverser_on.png' ,
        },

        drop = "tmcraftings:inverser",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, inverser = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_craft({

        output = "tmcraftings:inverser",
        recipe = {
            
            {'group:tech_material', 'group:tech_material'   , 'group:tech_material'},
            {'tmcraftings:ruby'   , 'tmcraftings:magic_core', 'tmcraftings:ruby'   },
            {'group:tech_material', 'group:tech_material'   , 'group:tech_material'},
        },
    })

--# Magic Gate ---------------------------------------------#--

    minetest.register_node('tmcraftings:magic_gate', {

        description = "Magic Gate",

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png' ,
            'tmcraftings_silver_block.png^tmcraftings_component.png' ,
            'tmcraftings_silver_block.png^tmcraftings_magic_gate.png',
            'tmcraftings_silver_block.png^tmcraftings_thinker.png'   ,
            'tmcraftings_silver_block.png',
        },

        is_ground_content = false,
        groups = {cracky = 5, mgate = 1},

        sounds = default.node_sound_metal_defaults(),
        on_construct = eletronics.on_load_device
    })

    minetest.register_node('tmcraftings:magic_gate_on', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png'    ,
            'tmcraftings_silver_block.png^tmcraftings_component.png'    ,
            'tmcraftings_silver_block.png^tmcraftings_magic_gate_on.png',
            'tmcraftings_silver_block.png^tmcraftings_thinker.png'      ,
            'tmcraftings_silver_block.png',
        },

        drop = "tmcraftings:magic_gate",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, source = 2, depends = 1, mgate = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_craft({

        output = "tmcraftings:magic_gate",
        recipe = {
            
            {'group:tech_material', 'group:tech_material'   , 'group:tech_material'   },
            {'tmcraftings:ruby'   , 'tmcraftings:magic_dust', 'tmcraftings:magic_dust'},
            {'group:tech_material', 'group:tech_material'   , 'group:tech_material'   },
        },
    })

--# Magic Tic ----------------------------------------------#--

    minetest.register_node('tmcraftings:magic_tic', {

        description = "Magic Tic-Tac",

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_silver_block.png^tmcraftings_magic_tic.png',
        },

        is_ground_content = false,
        groups = {cracky = 5},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_node('tmcraftings:magic_tic_on', {

        tiles = {

            'tmcraftings_silver_block.png^tmcraftings_component.png'   ,
            'tmcraftings_silver_block.png^tmcraftings_component.png'   ,
            'tmcraftings_silver_block.png^tmcraftings_magic_tic_on.png',
        },

        drop = "tmcraftings:magic_tic",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, source = 1, battery = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

    --# Behaviour scope ------------------------------------#--

        on_timer = eletronics.tic,
        on_construct = eletronics.on_load_tic
    })

    minetest.register_craft({

        output = "tmcraftings:magic_tic",
        recipe = {
            
            {'group:tech_material', 'group:tech_material'     , 'group:tech_material'},
            {'group:tech_material', 'tmcraftings:clock_engine', 'group:tech_material'},
            {'group:tech_material', 'group:tech_material'     , 'group:tech_material'},
        },
    })

--# Solar Panel --------------------------------------------#--

    minetest.register_node('tmcraftings:solar', {

        description = "Solar Panel",

        drawtype = "nodebox",
        node_box = {

            type = "fixed",

            fixed = {

                {-0.5, -0.5, -0.5, 0.5, ((1 / 16) * 11) - 0.5, 0.5},
            }
        },

        use_texture_alpha = "clip",
        tiles = {
            'tmcraftings_solar.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_solar_side.png',
        },

        is_ground_content = false,
        groups = {cracky = 5, solar_panel = 1},

        sounds = default.node_sound_metal_defaults(),
        on_construct = eletronics.on_load_device
    })

    minetest.register_node('tmcraftings:solar_on', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",

            fixed = {

                {-0.5, -0.5, -0.5, 0.5, ((1 / 16) * 11) - 0.5, 0.5},
            }
        },

        use_texture_alpha = "clip",
        tiles = {
            'tmcraftings_solar.png',
            'tmcraftings_silver_block.png^tmcraftings_component.png',
            'tmcraftings_solar_side.png',
        },

        drop = "tmcraftings:solar",
        
        light_source = default.LIGHT_MAX / 2,

        is_ground_content = false,
        groups = {cracky = 5, source = 1, battery = 1, solar_panel = 1, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults()
    })

    minetest.register_craft({

        output = "tmcraftings:solar",
        recipe = {
            
            {'tmcraftings:gold'  , 'tmcraftings:gold'        , 'tmcraftings:gold'  },
            {'tmcraftings:silver', 'tmcraftings:clock_engine', 'tmcraftings:silver'},
            {'tmcraftings:silver', 'tmcraftings:silver'      , 'tmcraftings:silver'},
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

            "tmcraftings_mfurnace_top_lit.png" , "tmcraftings_mfurnace_bot.png"     ,
            "tmcraftings_mfurnace_side_lit.png", "tmcraftings_mfurnace_side_lit.png",
            "tmcraftings_mfurnace_side_lit.png", "tmcraftings_mfurnace_frnt_lit.png",
        },

        paramtype2 = "facedir",
        legacy_facedir_simple = true,

        drop = 'tmcraftings:mfurnace',

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

            local meta = minetest.get_meta(pos)
            meta:set_float('timer', -1)

            minetest.get_node_timer(pos):start(0.1)
        end,
        
        on_metadata_inventory_put =
        function(pos)

            local meta = minetest.get_meta(pos)
            meta:set_float('timer', -1)

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

    minetest.register_craft({

        output = 'tmcraftings:mfurnace',
        recipe = {
            
            {'group:tech_material' , 'group:tech_material'   , 'group:tech_material' },
            {'group:tech_material' , 'tmcraftings:magic_core', 'group:tech_material' },
            {'tmcraftings:titanium', 'tmcraftings:titanium'  , 'tmcraftings:titanium'},
        },
    })

--# Magic Post light ---------------------------------------#--

    minetest.register_node("tmcraftings:magic_postlight", {

        description = "Magic Post Light",

        drawtype = "nodebox",
        node_box = {

            type = "fixed",

            fixed = {

                {-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
            }
        },

        tiles = {

            "tmcraftings_magic_postlight_top.png" , "tmcraftings_magic_postlight_bot.png" ,
            "tmcraftings_magic_postlight_side.png", "tmcraftings_magic_postlight_side.png",
            "tmcraftings_magic_postlight_side.png", "tmcraftings_magic_postlight_side.png",
        },

        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,

        groups = {cracky = 2},
        sounds = default.node_sound_metal_defaults(),
    })

    minetest.register_node("tmcraftings:magic_postlight_on", {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",

            fixed = {

                {-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
            }
        },

        tiles = {

            "tmcraftings_magic_postlight_top.png"    , "tmcraftings_magic_postlight_bot.png"    ,
            "tmcraftings_magic_postlight_side_on.png", "tmcraftings_magic_postlight_side_on.png",
            "tmcraftings_magic_postlight_side_on.png", "tmcraftings_magic_postlight_side_on.png",
        },

        paramtype = "light",
        sunlight_propagates = true,
        light_source = default.LIGHT_MAX,

        is_ground_content = false,

        drop = 'tmcraftings:magic_postlight',

        groups = {cracky = 4, not_in_creative_inventory = 1},
        sounds = default.node_sound_metal_defaults(),
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

        description = 'Magic Rail',
        inventory_image = "tmcraftings_mrail_str_on.png",

        tiles = {

            "tmcraftings_mrail_str.png", "tmcraftings_mrail_cur.png",
            "tmcraftings_mrail_tjn.png", "tmcraftings_mrail_crs.png"
        },

        groups = carts:get_rail_groups()
    })

    carts:register_rail('tmcraftings:mrail_on', {

        drop = 'tmcraftings:mrail',

        tiles = {

            "tmcraftings_mrail_str_on.png", "tmcraftings_mrail_cur_on.png",
            "tmcraftings_mrail_tjn_on.png", "tmcraftings_mrail_crs_on.png"
        },
        
        groups = carts:get_rail_groups()

    }, {acceleration = 6})

    minetest.register_craft({

        output = "tmcraftings:mrail 16",

        recipe = {

            {"group:tech_material", "group:wood"            , "group:tech_material"},
            {"group:tech_material", "tmcraftings:magic_core", "group:tech_material"},
            {"group:tech_material", "group:wood"            , "group:tech_material"},
        }
    })

--# Pistons ------------------------------------------------#--

    -- Piston --
    minetest.register_node('tmcraftings:piston', {
        
        description = "Piston",

        tiles = {

            'tmcraftings_piston_frnt.png' ,
            'tmcraftings_silver_block.png',
            'tmcraftings_piston_side.png' ,
        },

        paramtype2 = 'facedir',

        is_ground_content = false,
        groups = {cracky = 5},

        sounds = default.node_sound_metal_defaults(),

        on_place = minetest.rotate_node,
        
        on_construct   = eletronics.on_load_device,
        after_destruct = eletronics.break_brother
    })

    minetest.register_node('tmcraftings:piston_bot', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Stick --
                {0.5 - 5/16, 0.5, 0.5 - 5/16, -0.5 + 5/16, 0.5 - 5/16, -0.5 + 5/16},

                -- Bottom --
                {0.5, 0.5 - 5/16, 0.5, -0.5, -0.5, -0.5},
            },
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_silver_block.png^tmcraftings_component.png",
            "tmcraftings_silver_block.png" ,
            "tmcraftings_piston_on_bot.png",
        },

        drop = "tmcraftings:piston",
        paramtype2 = 'facedir',

        paramtype = "light",
        sunlight_propagates = true,

        is_ground_content = false,
        groups = {cracky = 5, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

        after_destruct = eletronics.break_brother
    })

    minetest.register_node('tmcraftings:piston_top', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Head --
                {0.5, 0.5, 0.5, -0.5, 0.5 - 4/16, -0.5},

                -- Stick top --
                {0.5 - 6/16, 0.5 - 4/16, 0.5 - 6/16, -0.5 + 6/16, -0.5 + 4/16, -0.5 + 6/16},

                -- Stick bot --
                {0.5 - 5/16, -0.5 + 4/16, 0.5 - 5/16, -0.5 + 5/16, -0.5, -0.5 + 5/16},
            },
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_piston_frnt.png"  ,
            "tmcraftings_piston_frnt.png"  ,
            "tmcraftings_piston_on_top.png",
        },

        drop = "tmcraftings:piston",
        paramtype2 = 'facedir',

        paramtype = "light",
        sunlight_propagates = true,
        
        is_ground_content = false,
        groups = {cracky = 5, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

        after_destruct = eletronics.break_brother
    })

    minetest.register_craft({

        output = "tmcraftings:piston",

        recipe = {

            {"tmcraftings:titanium", "tmcraftings:titanium"  , "tmcraftings:titanium"},
            {"tmcraftings:silver"  , "group:engine"          , "tmcraftings:silver"  },
            {"tmcraftings:silver"  , "tmcraftings:silver"    , "tmcraftings:silver"  },
        }
    })

    -- Glue piston --
    minetest.register_node('tmcraftings:glue_piston', {
        
        description = "Glue Piston",

        tiles = {
            'tmcraftings_piston_frnt_glue.png',
            'tmcraftings_silver_block.png'    ,
            'tmcraftings_piston_side.png'     ,
        },

        paramtype2 = 'facedir',

        is_ground_content = false,
        groups = {cracky = 5},

        sounds = default.node_sound_metal_defaults(),

        on_place = minetest.rotate_node,

        on_construct   = eletronics.on_load_device,
        after_destruct = eletronics.break_brother
    })

    minetest.register_node('tmcraftings:glue_piston_bot', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Stick --
                {0.5 - 5/16, 0.5, 0.5 - 5/16, -0.5 + 5/16, 0.5 - 5/16, -0.5 + 5/16},

                -- Bottom --
                {0.5, 0.5 - 5/16, 0.5, -0.5, -0.5, -0.5},
            },
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_silver_block.png^tmcraftings_component.png",
            "tmcraftings_silver_block.png" ,
            "tmcraftings_piston_on_bot.png",
        },

        drop = "tmcraftings:piston",
        paramtype2 = 'facedir',

        paramtype = "light",
        sunlight_propagates = true,

        is_ground_content = false,
        groups = {cracky = 5, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

        after_destruct = eletronics.break_brother
    })

    minetest.register_node('tmcraftings:glue_piston_top', {

        drawtype = "nodebox",
        node_box = {

            type = "fixed",
            fixed = {

                -- Head --
                {0.5, 0.5, 0.5, -0.5, 0.5 - 4/16, -0.5},

                -- Stick top --
                {0.5 - 6/16, 0.5 - 4/16, 0.5 - 6/16, -0.5 + 6/16, -0.5 + 4/16, -0.5 + 6/16},

                -- Stick bot --
                {0.5 - 5/16, -0.5 + 4/16, 0.5 - 5/16, -0.5 + 5/16, -0.5, -0.5 + 5/16},
            },
        },

        use_texture_alpha = "clip",
        tiles = {
            "tmcraftings_piston_frnt_glue.png",
            "tmcraftings_piston_frnt.png"     ,
            "tmcraftings_piston_on_top.png"   ,
        },

        drop = "tmcraftings:piston",
        paramtype2 = 'facedir',

        paramtype = "light",
        sunlight_propagates = true,
        
        is_ground_content = false,
        groups = {cracky = 5, not_in_creative_inventory = 1},

        sounds = default.node_sound_metal_defaults(),

        after_destruct = eletronics.break_brother
    })

    minetest.register_craft({

        output = "tmcraftings:glue_piston",

        recipe = {

            {"tmcraftings:titanium", "tmcraftings:magic_dust", "tmcraftings:titanium"},
            {"tmcraftings:silver"  , "tmcraftings:iron"      , "tmcraftings:silver"  },
            {"tmcraftings:silver"  , "tmcraftings:silver"    , "tmcraftings:silver"  },
        }
    })

-- Miscellaneous --
function s_node(pos, name)

    local node = minetest.get_node(pos)

    -- Swap to yourself --
    if node.name == name then return end
    
    node.name = name
    minetest.swap_node(pos, node)
end
