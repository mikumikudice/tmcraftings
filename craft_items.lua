dofile(minetest.get_modpath('tmcraftings') .. '/craft_chest.lua')

--# Tools --------------------------------------------------#--

    --# Replace default items ----------------------------------#--

        -- Wood pickaxe --
        minetest.override_item('default:pick_wood', {

            description = "Wooden Pickaxe",
            inventory_image = "default_tool_woodpick.png",
            
            tool_capabilities = {

                full_punch_interval = 1.2,
                max_drop_level = 0,
                
                groupcaps = {

                    cracky = {

                        times = {[2] = 3.5, [3] = 4.0},
                        uses = 10,
                        maxlevel = 3
                    },
                },
                
                damage_groups = {fleshy = 2},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {pickaxe = 1, flammable = 2}
        })

        -- Wood shovel --
        minetest.override_item('default:shovel_wood', {

            description = "Wooden Shovel",
            inventory_image = "default_tool_woodshovel.png",

            tool_capabilities = {

                full_punch_interval = 1.6,
                
                max_drop_level = 0,
                groupcaps = {

                    crumbly = {

                        times = {[1] = 3.60, [2] = 3.00, [3] = 0.70},
                        uses = 10,
                        maxlevel = 1
                    }
                },
                
                damage_groups = {fleshy = 2},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {shovel = 1}
        })

        -- Stone pickaxe --
        minetest.override_item('default:pick_stone', {

            description = "Stone Pickaxe",
            inventory_image = "default_tool_stonepick.png",
            
            tool_capabilities = {

                full_punch_interval = 1.3,
                max_drop_level = 1,
                
                groupcaps = {

                    cracky = {

                        times = {[2] = 3.0, [3] = 3.5, [4] = 4.0},
                        uses = 20,
                        maxlevel = 4
                    },
                },
                
                damage_groups = {fleshy = 4},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {pickaxe = 2}
        })

        -- Stone shovel --
        minetest.override_item('default:shovel_stone', {

            description = "Stone Shovel",
            inventory_image = "default_tool_stoneshovel.png",

            tool_capabilities = {

                full_punch_interval = 1.5,
                
                max_drop_level = 0,
                groupcaps = {

                    crumbly = {
                        
                        times = {[1] = 3.40, [2] = 2.80, [3] = 0.60},
                        uses = 20,
                        maxlevel = 1
                    }
                },
                
                damage_groups = {fleshy = 2},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {shovel = 2}
        })

    --# Full stone ---------------------------------------------#--

        -- Full stone pickaxe --
        minetest.register_tool('tmcraftings:fullstone_pick', {

            description = "Full Stone Pickaxe",
            inventory_image = "tmcraftings_fullstone_pick.png",
            
            tool_capabilities = {

                full_punch_interval = 1.3,
                max_drop_level = 1,
                
                groupcaps = {

                    cracky = {

                        times = {[2] = 3.0, [3] = 3.5, [4] = 4.0},
                        uses = 25,
                        maxlevel = 4
                    },
                },
                
                damage_groups = {fleshy = 3},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {pickaxe = 2}
        })

        minetest.register_craft({

            output = 'tmcraftings:fullstone_pick',
            recipe = {
                
                {'default:cobble', 'default:cobble', 'default:cobble'},
                {'', 'tmcraftings:stone_stick', ''},
                {'', 'tmcraftings:stone_stick', ''},
            },
        })

        -- Full stone shovel --
        minetest.register_tool("tmcraftings:fullstone_shovel", {

            description = "Full Stone Shovel",
            inventory_image = "tmcraftings_fullstone_shovel.png",

            tool_capabilities = {

                full_punch_interval = 1.5,
                
                max_drop_level = 0,
                groupcaps = {

                    crumbly = {
                        
                        times = {[1] = 3.40, [2] = 2.80, [3] = 0.60},
                        uses = 25,
                        maxlevel = 1
                    }
                },
                
                damage_groups = {fleshy = 2},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {shovel = 2}
        })

        minetest.register_craft({

            output = 'tmcraftings:fullstone_shovel',
            recipe = {
                
                {'default:cobble'},
                {'tmcraftings:stone_stick'},
                {'tmcraftings:stone_stick'},
            },
        })

        -- Full stone axe --
        minetest.register_tool("tmcraftings:fullstone_axe", {

            description = "Full Stone Axe",
            inventory_image = "tmcraftings_fullstone_axe.png",

            tool_capabilities = {

                full_punch_interval = 1.4,
                
                max_drop_level = 0,
                groupcaps = {

                    choppy = {
                        
                        times = {[1] = 3.00, [2] = 2.00, [3] = 1.30},
                        uses = 25,
                        maxlevel = 1
                    },
                },
                
                damage_groups = {fleshy = 3},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {axe = 2}
        })

        minetest.register_craft({

            output = 'tmcraftings:fullstone_axe',
            recipe = {
                
                {'default:cobble', 'default:cobble'},
                {'default:cobble', 'tmcraftings:stone_stick'},
                {'', 'tmcraftings:stone_stick'},
            },
        })

        -- Full stone sword --
        minetest.register_tool("tmcraftings:fullstone_sword", {

            description = "Full Stone Sword",
            inventory_image = "tmcraftings_fullstone_sword.png",

            tool_capabilities = {

                full_punch_interval = 1.4,
                
                max_drop_level = 0,
                groupcaps = {

                    snappy = {
                        
                        times = {[2] = 1.4, [3] = 0.4},
                        uses = 35,
                        maxlevel = 1
                    },
                },
                
                damage_groups = {fleshy = 4},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 2}
        })

        minetest.register_craft({

            output = 'tmcraftings:fullstone_sword',
            recipe = {
                
                {'default:cobble'},
                {'default:cobble'},
                {'tmcraftings:stone_stick'},
            },
        })

    --# Iron ---------------------------------------------------#--

        -- Iron pickaxe --
        minetest.register_tool('tmcraftings:iron_pick', {

            description = "Iron Pickaxe",
            inventory_image = "tmcraftings_iron_pick.png",
            
            tool_capabilities = {

                full_punch_interval = 1.2,
                
                max_drop_level = 0,
                groupcaps = {

                    cracky = {

                        times = {[2] = 2.5, [3] = 3.0, [4] = 3.5, [5] = 4.0},
                        uses = 30,
                        maxlevel = 5
                    },
                },
                
                damage_groups = {fleshy = 4},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {pickaxe = 3}
        })

        minetest.register_craft({

            output = 'tmcraftings:iron_pick',
            recipe = {
                
                {'tmcraftings:iron', 'tmcraftings:iron', 'tmcraftings:iron'},
                {'', 'default:stick', ''},
                {'', 'default:stick', ''},
            },
        })

        -- Iron Shovel --
        minetest.register_tool("tmcraftings:iron_shovel", {

            description = "Iron Shovel",
            inventory_image = "tmcraftings_iron_shovel.png",

            tool_capabilities = {

                full_punch_interval = 1.4,
                
                max_drop_level = 0,
                groupcaps = {

                    crumbly = {
                        
                        times = {[1] = 3.40, [2] = 2.60, [3] = 0.50},
                        uses = 30,
                        maxlevel = 2
                    }
                },
                
                damage_groups = {fleshy = 2},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {shovel = 3}
        })

        minetest.register_craft({

            output = 'tmcraftings:iron_shovel',
            recipe = {
                
                {'tmcraftings:iron'},
                {'default:stick'},
                {'default:stick'},
            },
        })

        -- Iron axe --
        minetest.register_tool("tmcraftings:iron_axe", {

            description = "Iron Axe",
            inventory_image = "tmcraftings_iron_axe.png",

            tool_capabilities = {

                full_punch_interval = 1.0,
                max_drop_level = 1,
                
                groupcaps = {

                    choppy = {
                        
                        times = {[1] = 2.50, [2] = 1.40, [3] = 1.00},
                        uses = 30,
                        maxlevel = 2
                    },
                },
                
                damage_groups = {fleshy = 4},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {axe = 3}
        })

        minetest.register_craft({

            output = 'tmcraftings:iron_axe',
            recipe = {
                
                {'tmcraftings:iron', 'tmcraftings:iron'},
                {'tmcraftings:iron', 'default:stick'},
                {'', 'default:stick'},
            },
        })

        -- Iron sword --
        minetest.register_tool("tmcraftings:iron_sword", {

            description = "Iron Sword",
            inventory_image = "tmcraftings_iron_sword.png",

            tool_capabilities = {

                full_punch_interval = 0.8,
                max_drop_level = 1,

                groupcaps = {

                    snappy = {
                        
                        times = {[1] = 2.5, [2] = 1.20, [3] = 0.35},
                        uses = 30,
                        maxlevel = 2
                    },
                },

                damage_groups = {fleshy = 6},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 3}
        })

        minetest.register_craft({

            output = 'tmcraftings:iron_sword',
            recipe = {
                
                {'tmcraftings:iron'},
                {'tmcraftings:iron'},
                {'default:stick'},
            },
        })

    --# Tungsten -----------------------------------------------#--

        -- Tungsten pickaxe --
        minetest.register_tool('tmcraftings:tungsten_pick', {

            description = "Tungsten Pickaxe",
            inventory_image = "tmcraftings_tungsten_pick.png",
            
            tool_capabilities = {

                full_punch_interval = 1.1,
                
                max_drop_level = 0,
                groupcaps = {

                    cracky = {

                        times = {[2] = 2.0, [3] = 2.5, [4] = 3.0, [5] = 3.5, [6] = 4.0},
                        uses = 40,
                        maxlevel = 6
                    },
                },
                
                damage_groups = {fleshy = 4},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {pickaxe = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:tungsten_pick',
            recipe = {
                
                {'tmcraftings:tungsten', 'tmcraftings:tungsten', 'tmcraftings:tungsten'},
                {'', 'default:stick', ''},
                {'', 'default:stick', ''},
            },
        })

        -- Tungsten Shovel --
        minetest.register_tool("tmcraftings:tungsten_shovel", {

            description = "Tungsten Shovel",
            inventory_image = "tmcraftings_tungsten_shovel.png",

            tool_capabilities = {

                full_punch_interval = 1.4,
                
                max_drop_level = 0,
                groupcaps = {

                    crumbly = {
                        
                        times = {[1] = 3.20, [2] = 2.40, [3] = 0.40},
                        uses = 50,
                        maxlevel = 2
                    }
                },
                
                damage_groups = {fleshy = 3},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {shovel = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:tungsten_shovel',
            recipe = {
                
                {'tmcraftings:tungsten'},
                {'default:stick'},
                {'default:stick'},
            },
        })

        -- Tungsten axe --
        minetest.register_tool("tmcraftings:tungsten_axe", {

            description = "Tungsten Axe",
            inventory_image = "tmcraftings_tungsten_axe.png",

            tool_capabilities = {

                full_punch_interval = 0.9,
                max_drop_level = 1,

                groupcaps = {

                    choppy = {
                        times = {[1] = 2.20, [2] = 1.00, [3] = 0.60},
                        uses = 40,
                        maxlevel = 3
                    },
                },

                damage_groups = {fleshy = 6},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {axe = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:tungsten_axe',
            recipe = {
                
                {'tmcraftings:tungsten', 'tmcraftings:tungsten'},
                {'tmcraftings:tungsten', 'default:stick'},
                {'', 'default:stick'},
            },
        })

        -- Tungsten sword --
        minetest.register_tool("tmcraftings:tungsten_sword", {

            description = "Tungsten Sword",
            inventory_image = "tmcraftings_tungsten_sword.png",

            tool_capabilities = {

                full_punch_interval = 0.7,
                max_drop_level = 1,

                groupcaps = {

                    snappy = {

                        times = {[1] = 2.0, [2] = 1.00, [3] = 0.35},
                        uses = 40,
                        maxlevel = 3
                    },
                },

                damage_groups = {fleshy = 7},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:tungsten_sword',
            recipe = {
                
                {'tmcraftings:tungsten'},
                {'tmcraftings:tungsten'},
                {'default:stick'},
            },
        })

    --# Titanium -----------------------------------------------#--

        -- Titanium pickaxe --
        minetest.register_tool('tmcraftings:titanium_pick', {

            description = "Titanium Pickaxe",
            inventory_image = "tmcraftings_titanium_pick.png",
            
            tool_capabilities = {

                full_punch_interval = 1.0,
                
                max_drop_level = 0,
                groupcaps = {

                    cracky = {

                        times = {[2] = 1.5, [3] = 2.0, [4] = 2.5, [5] = 3.0, [6] = 3.5, [7] = 24.0},
                        uses = 50,
                        maxlevel = 7
                    },
                },
                
                damage_groups = {fleshy = 4},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {pickaxe = 5}
        })

        minetest.register_craft({

            output = 'tmcraftings:titanium_pick',
            recipe = {
                
                {'tmcraftings:titanium', 'tmcraftings:titanium', 'tmcraftings:titanium'},
                {'', 'default:stick', ''},
                {'', 'default:stick', ''},
            },
        })

        -- Titanium Shovel --
        minetest.register_tool('tmcraftings:titanium_shovel', {

            description = "Titanium Shovel",
            inventory_image = "tmcraftings_titanium_shovel.png",

            tool_capabilities = {

                full_punch_interval = 1.4,
                
                max_drop_level = 0,
                groupcaps = {

                    crumbly = {
                        
                        times = {[1] = 3.00, [2] = 2.20, [3] = 0.30},
                        uses = 60,
                        maxlevel = 3
                    }
                },
                
                damage_groups = {fleshy = 3},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {shovel = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:titanium_shovel',
            recipe = {
                
                {'tmcraftings:titanium'},
                {'default:stick'},
                {'default:stick'},
            },
        })

        -- Titanium axe --
        minetest.register_tool('tmcraftings:titanium_axe', {

            description = "Titanium Axe",
            inventory_image = "tmcraftings_titanium_axe.png",

            tool_capabilities = {

                full_punch_interval = 0.9,
                max_drop_level = 1,

                groupcaps = {

                    choppy = {

                        times = {[1] = 2.10, [2] = 0.90, [3] = 0.50},
                        uses = 50,
                        maxlevel = 3
                    },
                },

                damage_groups = {fleshy = 7},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {axe = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:titanium_axe',
            recipe = {
                
                {'tmcraftings:titanium', 'tmcraftings:titanium'},
                {'tmcraftings:titanium', 'default:stick'},
                {'', 'default:stick'},
            },
        })

        -- Titanium sword --
        minetest.register_tool('tmcraftings:titanium_sword', {

            description = "Titanium Sword",
            inventory_image = "tmcraftings_titanium_sword.png",

            tool_capabilities = {

                full_punch_interval = 0.7,
                max_drop_level = 1,

                groupcaps = {

                    snappy = {
                        
                        times={[1] = 1.90, [2] = 0.90, [3] = 0.30},
                        uses = 50,
                        maxlevel = 3
                    },
                },

                damage_groups = {fleshy = 8},
            },
            
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 4}
        })

        minetest.register_craft({

            output = 'tmcraftings:titanium_sword',
            recipe = {
                
                {'tmcraftings:titanium'},
                {'tmcraftings:titanium'},
                {'default:stick'},
            },
        })

-- # Special tools -----------------------------------------#--

    -- Pickaxes --
    minetest.register_tool('tmcraftings:nightmare', {
        
        description = "Nightmare",
        inventory_image = "tmcraftings_loot_nightmare.png",

        tool_capabilities = {

            full_punch_interval = 1.0,
            
            max_drop_level = 0,
            groupcaps = {

                cracky = {

                    times = {[2] = 2.2, [3] = 2.8, [4] = 3.2, [5] = 3.8},
                    uses = 40,
                    maxlevel = 5
                },
            },
            
            damage_groups = {fleshy = 5},
        },
        
        sound = {breaks = "default_tool_breaks"},
        groups = {pickaxe = 3}
    })

    minetest.register_tool('tmcraftings:forestgift', {
        
        description = "Forest Gift",
        inventory_image = "tmcraftings_loot_forestgift.png",

        tool_capabilities = {

            full_punch_interval = 2.0,
            
            max_drop_level = 0,
            groupcaps = {

                cracky = {

                    times = {[2] = 1.1, [3] = 1.9, [4] = 2.1, [5] = 2.9, [6] = 3.1, [7] = 16.0},
                    uses = 10,
                    maxlevel = 7
                },
            },
            
            damage_groups = {fleshy = 6},
        },
        
        sound = {breaks = "default_tool_breaks"},
        groups = {pickaxe = 5}
    })

    -- Swords --
    minetest.register_tool('tmcraftings:theforge', {
        
        description = "The Forge",
        inventory_image = "tmcraftings_loot_theforge.png",

        tool_capabilities = {

            full_punch_interval = 0.7,
            max_drop_level = 1,

            groupcaps = {

                snappy = {

                    times = {[1] = 2.7, [2] = 1.7, [3] = 0.7},
                    uses = 40,
                    maxlevel = 3
                },
            },

            damage_groups = {fleshy = 7},
        },
        
        sound = {breaks = "default_tool_breaks"},
        groups = {sword = 4}
    })

    add_loot('tmcraftings:nightmare' )
    add_loot('tmcraftings:forestgift')
    add_loot('tmcraftings:theforge'  )

--# Iron items ---------------------------------------------#--
    
    -- Bucket --
    minetest.register_craft({

        output = "bucket:bucket_empty",
        recipe = {

            {"tmcraftings:iron", ""                , "tmcraftings:iron"},
            {"tmcraftings:iron", "tmcraftings:iron", "tmcraftings:iron"},
        }
    })

    -- Rails --
    minetest.register_craft({

        output = "carts:rail 16",

        recipe = {

            {"tmcraftings:iron", "group:wood"            , "tmcraftings:iron"},
            {"tmcraftings:iron", ""                      , "tmcraftings:iron"},
            {"tmcraftings:iron", "group:wood"            , "tmcraftings:iron"},
        }
    })

    minetest.register_craft({

        output = "carts:brakerail 16",

        recipe = {

            {"tmcraftings:iron", "group:wood"            , "tmcraftings:iron"},
            {"tmcraftings:iron", "default:coal_lump"     , "tmcraftings:iron"},
            {"tmcraftings:iron", "group:wood"            , "tmcraftings:iron"},
        }
    })

    -- Ledder --
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

--# Armors -------------------------------------------------#--

    -- Hammer --
    minetest.register_tool('tmcraftings:hammer', {

        description = "Forge Hammer",
        inventory_image = "tmcraftings_hammer.png",

        tool_capabilities = {

            full_punch_interval = 2.8,
            max_drop_level = 2,

            groupcaps = {

                snappy = {
                    
                    times = {[1] = 3.5, [2] = 2.50},
                    uses = 30,
                    maxlevel = 2
                },
            },

            damage_groups = {fleshy = 8},
        },
        
        sound = {breaks = "default_tool_breaks"},
        groups = {forge_hammer = 1}
    })

    minetest.register_craft({
        
        output = "tmcraftings:hammer",

        recipe = {

            {"tmcraftings:iron", "tmcraftings:iron", ""},
            {"tmcraftings:iron", "group:wood"      , ""},
            {""                , "group:wood"      , ""},
        }
    })

    -- leather --
    minetest.register_craftitem('tmcraftings:leather', {
        
        description = "Leather",
        inventory_image = "tmcraftings_leather.png",
        stack_max = 99
    })

    local tyers = {

        [1] = 'iron',
        [3] = 'tungsten',
        [5] = 'titanium',
    }

    -- Register Metal Pieces and Armors --
    for tyer, name in pairs(tyers) do

        local show_name =
        name:sub(1, 1):upper() .. name:sub(2)

        -- Armor piece --
        minetest.register_craftitem('tmcraftings:' .. name .. '_piece', {
        
            description = show_name .. " Armor Piece",
            inventory_image = "tmcraftings_" .. name .. "_piece.png",
            stack_max = 18,

            groups = {armor_piece = tyer}
        })

        minetest.register_craft({

            output = "tmcraftings:" .. name .. "_piece",

            recipe = {

                {"tmcraftings:" .. name, "tmcraftings:" .. name, "tmcraftings:" .. name},
                {"tmcraftings:" .. name, ""                    , "tmcraftings:" .. name},
                {""                    , "tmcraftings:" .. name, ""                    },
            }
        })

        -- Armor --
        minetest.register_craftitem('tmcraftings:' .. name .. '_armor', {
        
            description = show_name .. " Armor",
            inventory_image = "tmcraftings_" .. name .. "_armor.png",
            stack_max = 1,

            groups = {armor = tyer}
        })

        minetest.register_craft({

            output = "tmcraftings:" .. name .. "_armor",

            recipe = {

                {"tmcraftings:" .. name .. "_piece", 
                "tmcraftings:" .. name .. "_piece" ,
                "tmcraftings:" .. name .. "_piece"},

                {"tmcraftings:" .. name .. "_piece",
                "tmcraftings:leather"              ,
                "tmcraftings:" .. name .. "_piece"},

                {"tmcraftings:leather"            ,
                "tmcraftings:" .. name .. "_piece",
                "tmcraftings:leather"            },
                {"tmcraftings:hammer", "", ""}
            },
        })

        add_loot('tmcraftings:' .. name .. '_piece')
        add_loot('tmcraftings:' .. name .. '_armor')
    end

--# miscellaneous ------------------------------------------#--

    -- Stone stick --
    minetest.register_craftitem('tmcraftings:stone_stick', {
        
        description = "Stone Stick",
        inventory_image = "tmcraftings_stone_stick.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = 'shapeless',
        output = 'tmcraftings:stone_stick 4',
        recipe = {'default:cobble'}
    })

    -- Vegetable coal --
    minetest.register_craftitem('tmcraftings:vegetable_coal', {
        
        description = "Vegetable Coal",
        inventory_image = "tmcraftings_vegetable_coal.png",
        stack_max = 99
    })

    minetest.register_craft({

        type = "fuel",
        recipe = "tmcraftings:vegetable_coal",
        burntime = 30,
    })

    minetest.register_craft({

        type = "cooking",
        output = "tmcraftings:vegetable_coal",
        recipe = "group:tree",
        cooktime = 10,
    })

    minetest.register_craft({

        type = "shapeless",
        output = "default:torch 4",
        
        recipe = {

            'tmcraftings:vegetable_coal',
            'default:stick'
        },
    })

--# Magic Crystal stuff ------------------------------------#--

    -- Magic Core --
    minetest.register_craftitem('tmcraftings:magic_core', {
        
        description = "Magic Crystal Core",
        inventory_image = "tmcraftings_magic_core.png",
        stack_max = 99
    })

    minetest.register_craft({

        output = 'tmcraftings:magic_core',
        recipe = {
            
            {'', 'tmcraftings:silver', ''},
            {'tmcraftings:silver', 'tmcraftings:magic_crystal', 'tmcraftings:silver'},
            {'', 'tmcraftings:silver', ''},
        },
    })