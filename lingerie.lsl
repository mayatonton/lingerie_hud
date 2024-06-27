string product_id = "- AYA - lingerie IRODORI";
integer listen_handle;
key owner;
string trans = "7472bcba-5923-cf0b-4b9f-c6d8d397ceef";
string uuid_lace_outside = "d58ce4ca-36aa-e85f-f4af-bb902cd4a904";
string uuid_lace_inside = "70dc27bb-1a78-826d-692e-c69f09d072b1";

list bra_material_list;
list panty_material_list;
list ribbon_material_list;
string strap_material;
integer strap_material_num = 4;
integer bra_line_material_num = 3;
integer bra_lace_outside_material_num = 5;
integer bra_lace_inside_material_num = 6;
integer panty_line_material_num = 3;
integer panty_lace_outside_material_num = 5;
integer panty_lace_inside_material_num = 6;

integer bra_idx = 1;
integer panty_idx = 3;
integer ribbon_idx = 2;

integer gen_Ch()
{
    integer gen;
    key id = llGetOwner();
    string str = llGetSubString((string)id,0,3);
    gen = -1-(integer)("0x"+str) + (integer)("0x"+product_id);
    return gen;
}
make_bra_material_list()
{
    integer i;
    integer num = llGetLinkNumberOfSides(bra_idx);
    bra_material_list = [];
    for(i=0;i<num;i++){
        if(i == strap_material_num) {
            bra_material_list += "";
        } else if(i == bra_lace_outside_material_num) {
            bra_material_list += uuid_lace_outside;
        } else if(i == bra_lace_inside_material_num) {
            bra_material_list += uuid_lace_inside;
        } else {
            bra_material_list += llGetLinkPrimitiveParams(bra_idx, [PRIM_RENDER_MATERIAL, i]);
        }
    }
}
make_panty_material_list()
{
    integer i;
    integer num = llGetLinkNumberOfSides(panty_idx);
    panty_material_list = [];
    for(i=0;i<num;i++){
        if(i == panty_lace_outside_material_num) {
            panty_material_list += uuid_lace_outside;
        } else if(i == panty_lace_inside_material_num) {
            panty_material_list += uuid_lace_inside;
        } else {
            panty_material_list += llGetLinkPrimitiveParams(panty_idx, [PRIM_RENDER_MATERIAL, i]);
        }
    }
}



bra_enable(integer flg)
{
    integer i;
    integer num = llGetLinkNumberOfSides(bra_idx);
    if(flg == FALSE) {
        make_bra_material_list();
        for(i=0;i<num;i++){
            if(i != bra_line_material_num && i != strap_material_num && i != bra_lace_outside_material_num && i != bra_lace_inside_material_num) {
                llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, i, trans]);
            }
        }        
    } else if(flg == TRUE) {
        for(i=0;i<num;i++){
            string uuid = llList2String(bra_material_list,i);
            if(uuid != "") { llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, i, uuid]); }
        }
    }
}
bra_line_enable(integer flg)
{
    if(flg == FALSE) {
        list material = llGetLinkPrimitiveParams(bra_idx, [PRIM_RENDER_MATERIAL, bra_line_material_num]);
        bra_material_list = llDeleteSubList( bra_material_list, bra_line_material_num, bra_line_material_num );
        bra_material_list = llListInsertList(bra_material_list, material, bra_line_material_num);
        llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, bra_line_material_num, trans]);
    } else if(flg == TRUE) {
        string uuid = llList2String(bra_material_list,bra_line_material_num);
        if(uuid != "") { llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, bra_line_material_num, uuid]); }
    }
}
bra_lace_outside_enable(integer flg)
{
    if(flg == FALSE) {
        list material = [uuid_lace_outside];
        bra_material_list = llDeleteSubList( bra_material_list, bra_lace_outside_material_num, bra_lace_outside_material_num );
        bra_material_list = llListInsertList(bra_material_list, material, bra_lace_outside_material_num);
        llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, bra_lace_outside_material_num, trans]);
    } else if(flg == TRUE) {
        string uuid = llList2String(bra_material_list,bra_lace_outside_material_num);
        if(uuid != "") { llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, bra_lace_outside_material_num, uuid]); }
    }
}
bra_lace_inside_enable(integer flg)
{
    if(flg == FALSE) {
        list material = [uuid_lace_inside];
        bra_material_list = llDeleteSubList( bra_material_list, bra_lace_inside_material_num, bra_lace_inside_material_num );
        bra_material_list = llListInsertList(bra_material_list, material, bra_lace_inside_material_num);
        llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, bra_lace_inside_material_num, trans]);
    } else if(flg == TRUE) {
        string uuid = llList2String(bra_material_list,bra_lace_inside_material_num);
        if(uuid != "") { llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, bra_lace_inside_material_num, uuid]); }
    }
}

panty_enable(integer flg)
{
    integer i;
    integer num = llGetLinkNumberOfSides(panty_idx);
    if(flg == FALSE) {
        make_panty_material_list();
        for(i=0;i<num;i++){
            if(i != panty_line_material_num && i != panty_lace_outside_material_num && i != panty_lace_inside_material_num) {
                llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, i, trans]);
            }
        }        
    } else if(flg == TRUE) {
        for(i=0;i<num;i++){
            string uuid = llList2String(panty_material_list,i);
            if(uuid != "") { llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, i, uuid]); }
        }
    }
}
panty_line_enable(integer flg)
{
    if(flg == FALSE) {
        list material = llGetLinkPrimitiveParams(panty_idx, [PRIM_RENDER_MATERIAL, panty_line_material_num]);
        panty_material_list = llDeleteSubList( panty_material_list, panty_line_material_num, panty_line_material_num );
        panty_material_list = llListInsertList(panty_material_list, material, panty_line_material_num);
        llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, panty_line_material_num, trans]);
    } else if(flg == TRUE) {
        string uuid = llList2String(panty_material_list,panty_line_material_num);
        if(uuid != "") { llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, panty_line_material_num, uuid]); }
    }
}
panty_lace_outside_enable(integer flg)
{
    if(flg == FALSE) {
        list material = [uuid_lace_outside];
        panty_material_list = llDeleteSubList( panty_material_list, panty_lace_outside_material_num, panty_lace_outside_material_num );
        panty_material_list = llListInsertList(panty_material_list, material, panty_lace_outside_material_num);
        llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, panty_lace_outside_material_num, trans]);
    } else if(flg == TRUE) {
        string uuid = llList2String(panty_material_list,panty_lace_outside_material_num);
        if(uuid != "") { llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, panty_lace_outside_material_num, uuid]); }
    }
}
panty_lace_inside_enable(integer flg)
{
    if(flg == FALSE) {
        list material = [uuid_lace_inside];
        panty_material_list = llDeleteSubList( panty_material_list, panty_lace_inside_material_num, panty_lace_inside_material_num );
        panty_material_list = llListInsertList(panty_material_list, material, panty_lace_inside_material_num);
        llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, panty_lace_inside_material_num, trans]);
    } else if(flg == TRUE) {
        string uuid = llList2String(panty_material_list,panty_lace_inside_material_num);
        if(uuid != "") { llSetLinkPrimitiveParamsFast(panty_idx, [ PRIM_RENDER_MATERIAL, panty_lace_inside_material_num, uuid]); }
    }
}

ribbon_enable(integer flg)
{
    integer i;
    integer num = llGetLinkNumberOfSides(ribbon_idx);
    if(flg == FALSE) {
        ribbon_material_list = [];
        for(i=0;i<num;i++){
            ribbon_material_list += llGetLinkPrimitiveParams(ribbon_idx, [PRIM_RENDER_MATERIAL, i]);
            llSetLinkPrimitiveParamsFast(ribbon_idx, [ PRIM_RENDER_MATERIAL, i, trans]);
        }
    } else if(flg == TRUE) {
        for(i=0;i<num;i++){
            string uuid = llList2String(ribbon_material_list,i);
            if(uuid != "") { llSetLinkPrimitiveParamsFast(ribbon_idx, [ PRIM_RENDER_MATERIAL, i, uuid]); }
        }
    }
}
strap_enable(integer flg)
{
    if(flg == FALSE) {
        strap_material = llList2String(llGetLinkPrimitiveParams(bra_idx, [PRIM_RENDER_MATERIAL, strap_material_num]),0);
        llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, strap_material_num, trans]);
    } else if (flg == TRUE) {
        llSetLinkPrimitiveParamsFast(bra_idx, [ PRIM_RENDER_MATERIAL, strap_material_num, strap_material]);
    }
}

change_bra_texs(string cmd)
{
    string cup; string edge; string belt;
    
    if(cmd == "_bra_blue") {
        cup = "c6fe0367-8135-dd1f-60c5-6adf1eb6c8b2";
        edge = "f4696a11-4e02-7e88-4c8c-b3aa986385c1";
        belt = "6925d789-333e-189a-d045-bdcc32759e62";
    } else if (cmd == "_bra_pink" ) {
        cup = "9a94b46c-104f-bebb-1ab5-201857e7dd1b";
        edge = "f709bbd2-95a8-23d8-7f41-25dd64c706a6";
        belt = "f3b0147e-4885-1579-9299-35d09fc94690";
    } else if (cmd == "_bra_green" ) {
        cup = "06f44551-f997-21f3-8b92-a10349b01a01";
        edge = "d2313eca-7132-b8b8-28c2-3176be4ac743";
        belt = "9bae7e44-4446-dafc-5c56-769925bdc7f2";
    } else if (cmd == "_bra_black" ) {
        cup = "4ea3e239-7538-e901-643e-eb7b68eb11ac";
        edge = "6ad0e7b4-ca65-7670-16d8-b89cb6f04e40";
        belt = "29746bde-1680-4e6d-d9b6-d7c6e3645fe9";
    } else if (cmd == "_bra_white" ) {
        cup = "53bfc9d6-57c2-4698-6cbe-c3f0e4983642";
        edge = "f17498e0-bd54-b471-2db1-1f60f18bfa7e";
        belt = "9552ee15-cca5-8425-bfc1-9e2418414dbe";
    } else if (cmd == "_bonus1") {
        cup = "";
        edge = "";
        belt = "";
    } else if (cmd == "_bonus2") {
        cup = "";
        edge = "";
        belt = "";
    } else if (cmd == "_bonus3") {
        cup = "";
        edge = "";
        belt = "";
    }
    
    llSetLinkPrimitiveParamsFast(bra_idx, [PRIM_RENDER_MATERIAL, 0, cup,PRIM_RENDER_MATERIAL, 1, edge,PRIM_RENDER_MATERIAL, 2, belt]);
}

change_panty_texs(string cmd)
{
    string front; string back; string middle;
    
    if(cmd == "_panty_blue") {
        front = "e24a486a-6675-2880-74a4-a81210a45bba";
        back = "1c8e134d-398b-02d9-74be-eca4285b434f";
        middle = "594080b6-aa2c-9c8f-6f00-6277774c5de6";
    } else if (cmd == "_panty_pink" ) {
        front = "6e4dc918-a405-c887-03a8-0aee93af33c7";
        back = "717080b4-71a3-81c1-ee92-84c3a36d1476";
        middle = "b943e6f9-f533-557a-9b1f-1981184d2170";
    } else if (cmd == "_panty_green" ) {
        front = "149af3fe-7b02-f538-b07e-327ccafcc72e";
        back = "4942d612-caab-4453-2af7-6eebe035df10";
        middle = "8dfc4ac5-88fc-cc61-cb00-d7f584cc89ac";
    } else if (cmd == "_panty_black" ) {
        front = "a03baf38-7eb1-1109-8ffa-8bee87250347";
        back = "0bf2a40e-00d8-fae8-df0f-f35e22485b2a";
        middle = "e318f76a-d80a-7552-22d7-fb84c4225911";
    } else if (cmd == "_panty_white" ) {
        front = "3449d158-bd24-b525-8080-66fcde75e56c";
        back = "6c92828e-decd-1b36-7a1e-9a123957d9b6";
        middle = "a430f481-2286-8a54-c963-60e8e4f7998d";
    } else if (cmd == "_bonus1") {
        front = "";
        back = "";
        middle = "";
    } else if (cmd == "_bonus2") {
        front = "";
        back = "";
        middle = "";
    } else if (cmd == "_bonus3") {
        front = "";
        back = "";
        middle = "";
    }
    
    llSetLinkPrimitiveParamsFast(panty_idx, [PRIM_RENDER_MATERIAL, 0, front,PRIM_RENDER_MATERIAL, 1, back,PRIM_RENDER_MATERIAL, 2, middle]);
}

change_line_texs(string cmd)
{
    string line;
    
    if(cmd == "_line_blue") {
        line = "49935ed4-7b58-4099-5227-8521f3615c19";
    } else if (cmd == "_line_pink" ) {
        line = "220cf822-4c6f-b834-38d2-a29b73fc61ad";
    } else if (cmd == "_line_green" ) {
        line = "7e85d887-5364-99ad-0651-b471fb68d0fe";
    } else if (cmd == "_line_black" ) {
        line = "8c896458-1f22-d9db-c46a-fd667b2c7edd";
    } else if (cmd == "_line_white" ) {
        line = "65a4380c-5a40-3a2a-192e-9368f5427cf3";
    } else if (cmd == "_bonus1") {
        line = "";
    } else if (cmd == "_bonus2") {
        line = "";
    } else if (cmd == "_bonus3") {
        line = "";
    }
    
    llSetLinkPrimitiveParamsFast(bra_idx, [PRIM_RENDER_MATERIAL, 3, line, PRIM_LINK_TARGET, panty_idx, PRIM_RENDER_MATERIAL, 3, line]);
}

change_strap_texs(string cmd)
{
    string strap;
    
    if(cmd == "_strap_blue") {
        strap = "49935ed4-7b58-4099-5227-8521f3615c19";
    } else if (cmd == "_strap_pink" ) {
        strap = "220cf822-4c6f-b834-38d2-a29b73fc61ad";
    } else if (cmd == "_strap_green" ) {
        strap = "7e85d887-5364-99ad-0651-b471fb68d0fe";
    } else if (cmd == "_strap_black" ) {
        strap = "8c896458-1f22-d9db-c46a-fd667b2c7edd";
    } else if (cmd == "_strap_white" ) {
        strap = "65a4380c-5a40-3a2a-192e-9368f5427cf3";
    } else if (cmd == "_bonus1") {
        strap = "";
    } else if (cmd == "_bonus2") {
        strap = "";
    } else if (cmd == "_bonus3") {
        strap = "";
    }
    
    llSetLinkPrimitiveParamsFast(bra_idx, [PRIM_RENDER_MATERIAL, 4, strap, PRIM_LINK_TARGET, panty_idx, PRIM_RENDER_MATERIAL, 4, strap]);
}

change_ribbon_texs(string cmd)
{
    string ribbon;
    
    if(cmd == "_ribbon_blue") {
        ribbon = "77e052d2-9ee2-8640-3c03-9b30eb019390";
    } else if (cmd == "_ribbon_pink" ) {
        ribbon = "862de069-ed34-83dc-0ec3-0675fdf5d2b9";
    } else if (cmd == "_sribbon_green" ) {
        ribbon = "cb36e62e-3392-30bc-1d8f-b84f30aa8bdc";
    } else if (cmd == "_ribbon_black" ) {
        ribbon = "4e619b03-6e96-4823-2919-b5bc545f20e9";
    } else if (cmd == "_ribbon_white" ) {
        ribbon = "c1be7b3f-f740-93e0-8d38-4684dbeed2be";
    } else if (cmd == "_bonus1") {
        ribbon = "";
    } else if (cmd == "_bonus2") {
        ribbon = "";
    } else if (cmd == "_bonus3") {
        ribbon = "";
    }
    
    llSetLinkPrimitiveParamsFast(ribbon_idx, [PRIM_RENDER_MATERIAL, ALL_SIDES, ribbon]);
}

default
{
    state_entry()
    {
        // ID
        listen_handle = llListen(gen_Ch(), "", NULL_KEY, "");
        owner = llGetOwner();
        make_bra_material_list();
        make_panty_material_list();
    }
    
    changed(integer change)
    {
        if(change & CHANGED_OWNER)
        {
            llResetScript();
        }
    }
    
    listen( integer channel, string name, key id, string message )
    {
        if (llGetOwner() == llGetOwnerKey(id))
        //llOwnerSay(message);
        if(message == "_bra_on") { bra_enable(TRUE); }
        else if(message == "_bra_off") { bra_enable(FALSE); }
        else if(message == "_panty_on") { panty_enable(TRUE); }
        else if(message == "_panty_off") { panty_enable(FALSE); }
        else if(message == "_ribbon_on") { ribbon_enable(TRUE); }
        else if(message == "_ribbon_off") { ribbon_enable(FALSE); }
        else if(message == "_strap_on") { strap_enable(TRUE); }
        else if(message == "_strap_off") { strap_enable(FALSE); }
        else if(message == "_line_on") { bra_line_enable(TRUE); panty_line_enable(TRUE); }
        else if(message == "_line_off") { bra_line_enable(FALSE); panty_line_enable(FALSE); }
        
        else if(message == "_bra_lace_outside_on") { bra_lace_outside_enable(TRUE); }
        else if(message == "_bra_lace_outside_off") { bra_lace_outside_enable(FALSE); }
        else if(message == "_bra_lace_inside_on") { bra_lace_inside_enable(TRUE); }
        else if(message == "_bra_lace_inside_off") { bra_lace_inside_enable(FALSE); }
        else if(message == "_panty_lace_outside_on") { panty_lace_outside_enable(TRUE); }
        else if(message == "_panty_lace_outside_off") { panty_lace_outside_enable(FALSE); }
        else if(message == "_panty_lace_inside_on") { panty_lace_inside_enable(TRUE); }
        else if(message == "_panty_lace_inside_off") { panty_lace_inside_enable(FALSE); }
        
        else if(message == "_bra_blue" || message == "_bra_pink" || message == "_bra_green" ||
                message == "_bra_black" || message == "_bra_white") {
            change_bra_texs(message);
        }
        else if(message == "_panty_blue" || message == "_panty_pink" || message == "_panty_green" ||
                message == "_panty_black" || message == "_panty_white") {
            change_panty_texs(message);
        }
        else if(message == "_line_blue" || message == "_line_pink" || message == "_line_green" ||
                message == "_line_black" || message == "_line_white") {
            change_line_texs(message);
        }
        else if(message == "_strap_blue" || message == "_strap_pink" || message == "_strap_green" ||
                message == "_strap_black" || message == "_strap_white") {
            change_strap_texs(message);
        }
        else if(message == "_ribbon_blue" || message == "_ribbon_pink" || message == "_ribbon_green" ||
                message == "_ribbon_black" || message == "_ribbon_white") {
            change_ribbon_texs(message);
        }
    }

    attach(key agent)
    {
        if ( agent != NULL_KEY )
        {
            owner = agent;
        }
    }
}
