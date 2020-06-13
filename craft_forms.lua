local def_inv =
    [[
    list[current_player;main;0.25,4.0;8,3;8]
    list[current_player;main;0.25,7.5;8,1;0]
    ]]
    .. default.get_hotbar_bg(0.25, 7.5)

-- Change default inventory --
minetest.register_on_joinplayer(function(char)
    
    -- By the way, render armor --
    update_armorskin(char)

    local inv = char:get_inventory()
    
    -- Enchanted chest --
    inv:set_size('chest', 8 * 3)

    -- Helpful inventory --
    inv:set_size('auxi' , 3)
    inv:set_size('armor', 1)

    -- Anvil slot --
    inv:set_size('craft', 10)

    if not minetest.settings:get_bool('creative_mode') then

        char:set_inventory_formspec([[
            size[8.5,8.5]

            list[current_player;auxi;0.75,0.5;1,3;0]
            image[1.75,1.5;1,1;sfinv_crafting_arrow.png]

            image[0.75,0.5;1,1;gui_hb_bg.png]
            image[0.75,1.5;1,1;gui_hb_bg.png]
            image[0.75,2.5;1,1;gui_hb_bg.png]


            list[context;craft;2.75,0.5;3,3]
            list[current_player;craftpreview;6.75,1.5;1,1]
            image[5.75,1.5;1,1;sfinv_crafting_arrow.png]
            ]] 
            .. def_inv)
    end
end)

minetest.register_on_dieplayer(function(player, reason)

    if not minetest.settings:get_bool('creative_mode')
    and player:is_player() then

        player:set_inventory_formspec([[
            size[8.5,8.5]

            list[current_player;auxi;0.75,0.5;1,3;0]
            image[1.75,1.5;1,1;sfinv_crafting_arrow.png]

            image[0.75,0.5;1,1;gui_hb_bg.png]
            image[0.75,1.5;1,1;gui_hb_bg.png]
            image[0.75,2.5;1,1;gui_hb_bg.png]


            list[context;craft;2.75,0.5;3,3]
            list[current_player;craftpreview;6.75,1.5;1,1]
            image[5.75,1.5;1,1;sfinv_crafting_arrow.png]
            ]] 
            .. def_inv)
    end
end)

function get_gui(name, item_pc, fuel_pc, data)

    local arrw = item_pc or 0
    local fire = fuel_pc or 0

    local dfr_gui =
        
        [[
        size[8.5,8.5]

        list[current_player;auxi;0.75,0.5;1,3;0]
        image[0.75,0.5;1,1;gui_hb_bg.png]
        image[0.75,1.5;1,1;gui_hb_bg.png]
        image[0.75,2.5;1,1;gui_hb_bg.png]

        list[context;src;2.75,1.0;1,1;]
        list[context;dst;4.75,1.0;2,2;]
        list[context;fuel;2.75,2.0;1,1]
        ]]

        .. "image[3.75,1.0;1,1;gui_furnace_arrow_bg.png^[lowpart:"
        .. (arrw) .. ":gui_furnace_arrow_fg.png^[transformR270]"
        
        .. "image[3.75,2.0;1,1;default_furnace_fire_bg.png^[lowpart:"
        .. (fire) .. ":default_furnace_fire_fg.png]"

        .. def_inv

    local mfr_gui =
        
        [[
        size[8.5,8.5]

        list[current_player;auxi;0.75,0.5;1,3;0]
        image[0.75,0.5;1,1;gui_hb_bg.png]
        image[0.75,1.5;1,1;gui_hb_bg.png]
        image[0.75,2.5;1,1;gui_hb_bg.png]

        list[context;src;2.75,1.5;1,1]
        list[context;dst;4.75,1.5;1,1]
        ]]

        .. "image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"
        .. (arrw) .. ":gui_furnace_arrow_fg.png^[transformR270]"
        .. def_inv

    local blr_gui =
        
        [[
        size[8.5,8.5]

        list[current_player;auxi;0.75,0.5;1,3;0]
        list[context;src;3.25,1.0;2,2]
        ]]
        .. def_inv
        
    local cht_gui =
        
        [[
        size[8.5,8.5]
        ]]

        .. "list[" .. (data or 'context;main') .. ";0.25,0.25;8,3;]"
        .. def_inv

    local anv_gui =

        [[
        size[8.5,9.0]

        list[current_player;craft;2.75,0.25;3,3]
        
        list[current_player;craft;2.5,3.5;1,1;9]
        image[2.5,3.5;1,1;tmcraftings_hammer_icon.png]

        list[current_player;craftpreview;3.75,3.5;1,1]

        list[current_player;armor;5.0,3.5;1,3;0]
        image[5.0,3.5;1,1;tmcraftings_shield_icon.png]

        list[current_player;main;0.25,4.75;8,3;8]
        list[current_player;main;0.25,8.0;8,1;0]
        ]]
        .. default.get_hotbar_bg(0.25, 8.0)

    if name == 'dfurnace' then return dfr_gui end
    if name == 'mfurnace' then return mfr_gui end
    if name == 'mgboiler' then return blr_gui end
    if name == 'defchest' then return cht_gui end
    if name == 'defanvil' then return anv_gui end
end