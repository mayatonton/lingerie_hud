string product_id = "- AYA - lingerie IRODORI";
integer channel = 0;
string check = "47ae5478-f63e-62e6-4b3f-0a315b4105c9";
string trans = "a644119f-0100-a50c-9b0a-801d8fba08c1";
list prim_list = [];
string title_name;
list btn_list = [];

integer gen_Ch()
{
    integer gen;
    key id = llGetOwner();
    string str = llGetSubString((string)id,0,3);
    gen = -1-(integer)("0x"+str) + (integer)("0x"+product_id);
    return gen;
}

// Prim List 作成
createIndex()
{
    integer i;
    prim_list = [title_name];    // ルート ( 1 : 起算 )
    for(i = 1; i <= llGetNumberOfPrims() ; i++)
    {
        string prim_name = llGetLinkName(i);
        prim_list += [prim_name];
        
        if(llGetSubString(prim_name, 0, 0) == "_")
        {
            btn_list += [prim_name]; // ボタン名
        }
    }
}


// Prim Nmae から インデックス を返す
integer getIndex(string prim_name)
{
    return llListFindList(prim_list, [prim_name]);   
}

default
{
    state_entry()
    {
        title_name = llGetObjectName();
        channel = gen_Ch();
        createIndex();
    }

    touch_start(integer total_number)
    {
        string btn_name = llGetLinkName(llDetectedLinkNumber(0));    
        llWhisper(channel, btn_name);
        
        if(btn_name == "_bra_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_bra_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_bra_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_bra_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_bra_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_bra_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_bra_lace_outside_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_bra_lace_outside_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_bra_lace_outside_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_bra_lace_outside_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_bra_lace_outside_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_bra_lace_outside_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_bra_lace_inside_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_bra_lace_inside_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_bra_lace_inside_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_bra_lace_inside_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_bra_lace_inside_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_bra_lace_inside_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_panty_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_panty_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_panty_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_panty_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_panty_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_panty_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_panty_lace_outside_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_panty_lace_outside_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_panty_lace_outside_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_panty_lace_outside_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_panty_lace_outside_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_panty_lace_outside_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_panty_lace_inside_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_panty_lace_inside_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_panty_lace_inside_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_panty_lace_inside_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_panty_lace_inside_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_panty_lace_inside_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_line_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_line_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_line_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_line_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_line_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_line_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);                
        } else if(btn_name == "_ribbon_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_ribbon_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_ribbon_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_ribbon_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_ribbon_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_ribbon_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if(btn_name == "_strap_on") {
            llSetLinkPrimitiveParamsFast(getIndex("_strap_on"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_strap_off"), PRIM_TEXTURE, 0, trans, <1,1,1>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } else if (btn_name == "_strap_off" ){
            llSetLinkPrimitiveParamsFast(getIndex("_strap_off"),[
                    PRIM_TEXTURE, 0, check, <1,1,0>,<0,0,0>,DEG_TO_RAD*270,
                    PRIM_LINK_TARGET, getIndex("_strap_on"), PRIM_TEXTURE, 0, trans, <1,1,0>,<0,0,0>,DEG_TO_RAD*270
                ]);
        } 
    }
    
    changed(integer change)
    {
        if(change & CHANGED_OWNER)
        {
            channel = gen_Ch();
        }
    }
}
