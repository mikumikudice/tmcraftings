local def_inv =
    [[
    list[current_player;main;0.25,4.0;8,3;8]
    list[current_player;main;0.25,7.5;8,1;0]
    ]]
    .. default.get_hotbar_bg(0.25, 7.5)

-- Change default inventory --
minetest.register_on_joinplayer(function(player)

    local char = minetest.get_player_by_name(player:get_player_name())

    char:get_inventory():set_size('auxi', 3)
    char:get_inventory():set_size('armo', 1)

    if not minetest.settings:get_bool("creative_mode") then

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

function get_gui(name, item_pc, fuel_pc, pos)

    local arrw = item_pc or 0
    local fire = fuel_pc or 0

    -- Get formspec context by node position --
    local npos
    if pos then
        
        npos = pos.x .. "," .. pos.y .. "," .. pos.z
    end

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

    local cht_gui =
        
        [[
        size[8.5,8.5]
        ]]

        .. "list[nodemeta:" .. (npos or '') .. ";main;0.25,0.25;8,3;]"
        .. def_inv

    local str_gui =

        [[
        size[8.5,8.5]
        list[context;main;0.25,0.25;8,3;]
        ]]
        .. def_inv

    if name == 'dfurnace' then return dfr_gui end
    if name == 'mfurnace' then return mfr_gui end
    if name == 'defchest' then return cht_gui end
    if name == 'dstorage' then return str_gui end
end