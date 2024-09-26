require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_candela_investigator()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("firecast.candela.obscura.investigator");
    obj:setTitle("Ficha de Investigador");
    obj:setName("candela_investigator");
    obj:setTheme("dark");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setAlign("client");
    obj.image1:setOptimize(true);
    obj.image1:setSRC("img/bg-image.png");
    obj.image1:setStyle("stretch");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.image1);
    obj.layout1.grid.role = "row";
    obj.layout1.grid["min-height"] = 190;
    obj.layout1:setMargins({top=30, bottom=10});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2.grid.role = "col";
    obj.layout2.grid.width = 2;
    obj.layout2.grid["min-height"] = 190;
    obj.layout2:setName("layout2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout2);
    obj.image2.grid.role = "row";
    obj.image2:setEditable(true);
    obj.image2:setField("pg_pfp");
    obj.image2:setStyle("autoFit");
    obj.image2.grid["min-height"] = 160;
    obj.image2:setName("image2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1.grid.role = "row";
    obj.edit1.grid["min-height"] = 30;
    obj.edit1:setTextPrompt("NAME ✏️");
    obj.edit1:setField("char.name");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Sans-serif");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 10;
    obj.layout3.grid["min-height"] = 130;
    obj.layout3.grid["vert-align"] = "bottom";
    obj.layout3:setName("layout3");

    obj.Circle_popup = GUI.fromHandle(_obj_newObject("popup"));
    obj.Circle_popup:setParent(obj.layout3);
    obj.Circle_popup:setName("Circle_popup");
    obj.Circle_popup:setHeight(500);
    obj.Circle_popup:setWidth(500);
    obj.Circle_popup:setBackOpacity(0.5);

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.Circle_popup);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("char.Circle");
    obj.richEdit1.backgroundColor = "#191a1e";
    obj.richEdit1.defaultFontColor = "#ede9da";
    obj.richEdit1:setMargins({top=5,left=5,right=5,bottom=5});
    obj.richEdit1:setName("richEdit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 3;
    obj.layout4.grid["min-height"] = 130;
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5.grid.role = "row";
    obj.layout5.grid["min-height"] = 30;
    obj.layout5:setName("layout5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout5);
    obj.button1.grid.role = "col";
    obj.button1:setText("Circle");
    obj.button1.grid.width = 12;
    obj.button1:setName("button1");
    obj.button1:setFontFamily("Sans-serif");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6.grid.role = "row";
    obj.layout6.grid["min-height"] = 100;
    obj.layout6:setName("layout6");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout6);
    obj.richEdit2.grid.role = "col";
    obj.richEdit2.grid.width = 12;
    obj.richEdit2.grid["min-height"] = 100;
    obj.richEdit2:setField("char.Circle");
    obj.richEdit2.showToolbar = false;
    obj.richEdit2.defaultFontSize = 13;
    obj.richEdit2.defaultFontColor = "#ede9da";
    obj.richEdit2.backgroundColor = "#191a1e";
    obj.richEdit2:setName("richEdit2");

    obj.Style_popup = GUI.fromHandle(_obj_newObject("popup"));
    obj.Style_popup:setParent(obj.layout3);
    obj.Style_popup:setName("Style_popup");
    obj.Style_popup:setHeight(500);
    obj.Style_popup:setWidth(500);
    obj.Style_popup:setBackOpacity(0.5);

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.Style_popup);
    obj.richEdit3:setAlign("client");
    obj.richEdit3:setField("char.Style");
    obj.richEdit3.backgroundColor = "#191a1e";
    obj.richEdit3.defaultFontColor = "#ede9da";
    obj.richEdit3:setMargins({top=5,left=5,right=5,bottom=5});
    obj.richEdit3:setName("richEdit3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout3);
    obj.layout7.grid.role = "col";
    obj.layout7.grid.width = 3;
    obj.layout7.grid["min-height"] = 130;
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8.grid.role = "row";
    obj.layout8.grid["min-height"] = 30;
    obj.layout8:setName("layout8");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout8);
    obj.button2.grid.role = "col";
    obj.button2:setText("Style");
    obj.button2.grid.width = 12;
    obj.button2:setName("button2");
    obj.button2:setFontFamily("Sans-serif");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9.grid.role = "row";
    obj.layout9.grid["min-height"] = 100;
    obj.layout9:setName("layout9");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.layout9);
    obj.richEdit4.grid.role = "col";
    obj.richEdit4.grid.width = 12;
    obj.richEdit4.grid["min-height"] = 100;
    obj.richEdit4:setField("char.Style");
    obj.richEdit4.showToolbar = false;
    obj.richEdit4.defaultFontSize = 13;
    obj.richEdit4.defaultFontColor = "#ede9da";
    obj.richEdit4.backgroundColor = "#191a1e";
    obj.richEdit4:setName("richEdit4");

    obj.Catalyst_popup = GUI.fromHandle(_obj_newObject("popup"));
    obj.Catalyst_popup:setParent(obj.layout3);
    obj.Catalyst_popup:setName("Catalyst_popup");
    obj.Catalyst_popup:setHeight(500);
    obj.Catalyst_popup:setWidth(500);
    obj.Catalyst_popup:setBackOpacity(0.5);

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.Catalyst_popup);
    obj.richEdit5:setAlign("client");
    obj.richEdit5:setField("char.Catalyst");
    obj.richEdit5.backgroundColor = "#191a1e";
    obj.richEdit5.defaultFontColor = "#ede9da";
    obj.richEdit5:setMargins({top=5,left=5,right=5,bottom=5});
    obj.richEdit5:setName("richEdit5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout3);
    obj.layout10.grid.role = "col";
    obj.layout10.grid.width = 3;
    obj.layout10.grid["min-height"] = 130;
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11.grid.role = "row";
    obj.layout11.grid["min-height"] = 30;
    obj.layout11:setName("layout11");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout11);
    obj.button3.grid.role = "col";
    obj.button3:setText("Catalyst");
    obj.button3.grid.width = 12;
    obj.button3:setName("button3");
    obj.button3:setFontFamily("Sans-serif");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12.grid.role = "row";
    obj.layout12.grid["min-height"] = 100;
    obj.layout12:setName("layout12");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.layout12);
    obj.richEdit6.grid.role = "col";
    obj.richEdit6.grid.width = 12;
    obj.richEdit6.grid["min-height"] = 100;
    obj.richEdit6:setField("char.Catalyst");
    obj.richEdit6.showToolbar = false;
    obj.richEdit6.defaultFontSize = 13;
    obj.richEdit6.defaultFontColor = "#ede9da";
    obj.richEdit6.backgroundColor = "#191a1e";
    obj.richEdit6:setName("richEdit6");

    obj.Question_popup = GUI.fromHandle(_obj_newObject("popup"));
    obj.Question_popup:setParent(obj.layout3);
    obj.Question_popup:setName("Question_popup");
    obj.Question_popup:setHeight(500);
    obj.Question_popup:setWidth(500);
    obj.Question_popup:setBackOpacity(0.5);

    obj.richEdit7 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.Question_popup);
    obj.richEdit7:setAlign("client");
    obj.richEdit7:setField("char.Question");
    obj.richEdit7.backgroundColor = "#191a1e";
    obj.richEdit7.defaultFontColor = "#ede9da";
    obj.richEdit7:setMargins({top=5,left=5,right=5,bottom=5});
    obj.richEdit7:setName("richEdit7");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout3);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 3;
    obj.layout13.grid["min-height"] = 130;
    obj.layout13:setName("layout13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14.grid.role = "row";
    obj.layout14.grid["min-height"] = 30;
    obj.layout14:setName("layout14");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout14);
    obj.button4.grid.role = "col";
    obj.button4:setText("Question");
    obj.button4.grid.width = 12;
    obj.button4:setName("button4");
    obj.button4:setFontFamily("Sans-serif");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15.grid.role = "row";
    obj.layout15.grid["min-height"] = 100;
    obj.layout15:setName("layout15");

    obj.richEdit8 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit8:setParent(obj.layout15);
    obj.richEdit8.grid.role = "col";
    obj.richEdit8.grid.width = 12;
    obj.richEdit8.grid["min-height"] = 100;
    obj.richEdit8:setField("char.Question");
    obj.richEdit8.showToolbar = false;
    obj.richEdit8.defaultFontSize = 13;
    obj.richEdit8.defaultFontColor = "#ede9da";
    obj.richEdit8.backgroundColor = "#191a1e";
    obj.richEdit8:setName("richEdit8");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.image1);
    obj.layout16.grid.role = "row";
    obj.layout16.grid["min-height"] = 400;
    obj.layout16:setName("layout16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17.grid.role = "col";
    obj.layout17.grid.width = 4;
    obj.layout17.grid["min-height"] = 300;
    obj.layout17.grid["padding-left"] = 10;
    obj.layout17.grid["padding-top"] = 5;
    obj.layout17.grid["padding-right"] = 10;
    obj.layout17.grid["padding-bottom"] = 5;
    obj.layout17:setName("layout17");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout17);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#101114");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setName("rectangle1");


            local Nerve;
            if Nerve == nil or '' then
                Nerve=0
            end
            local function mudar_drive(tipo)
                if tipo=="aumento" then 
                    Nerve = Nerve+1;
                elseif tipo=="diminuir" then
                Nerve = Nerve-1
                elseif tipo=="passou" then
                    Nerve = 9
                    showMessage("Você não pode ter mais quantidade de drive que isso")
                end
                atualizar_drive()
            end

            local function atualizar_drive()
                if Nerve < field.Nerve or Nerve > field.Nerve then
                    field.Nerve = Nerve
                end
                if Nerve == 0 then
                    field.Nerve= "No"
                elseif field.Nerve > 9 then
                    mudar_drive('passou')
                else
                    field.Nerve=""..Nerve
                end
            end
        


    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18.grid.role = "row";
    obj.layout18.grid["min-height"] = 40;
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19.grid.role = "col";
    obj.layout19.grid.width = 5;
    obj.layout19.grid["cnt-vert-align"] = "center";
    obj.layout19:setName("layout19");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout19);
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 12;
    obj.label1:setText("Nerve");
    obj.label1:setFontColor("#ede9da");
    obj.label1:setName("label1");
    obj.label1:setFontFamily("Sans-serif");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20.grid.role = "col";
    obj.layout20.grid.width = 7;
    obj.layout20.grid["cnt-vert-align"] = "center";
    obj.layout20:setName("layout20");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout20);
    obj.button5.grid.role = "col";
    obj.button5.grid.width = 2;
    obj.button5:setText("-");
    obj.button5:setHorzTextAlign("center");
    obj.button5:setName("button5");
    obj.button5:setFontFamily("Sans-serif");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout20);
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 8;
    obj.label2.format = "%s Drives";
    obj.label2:setText("No");
    obj.label2:setField("Nerve");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontColor("#3d3d3c");
    obj.label2:setName("label2");
    obj.label2:setFontFamily("Sans-serif");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout20);
    obj.button6.grid.role = "col";
    obj.button6.grid.width = 2;
    obj.button6:setText("+");
    obj.button6:setHorzTextAlign("center");
    obj.button6:setName("button6");
    obj.button6:setFontFamily("Sans-serif");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout17);
    obj.rectangle2.grid.role = "row";
    obj.rectangle2:setColor("#322b23");
    obj.rectangle2.grid["min-height"] = 2;
    obj.rectangle2:setName("rectangle2");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout17);
    obj.layout21.grid.role = "row";
    obj.layout21.grid["min-height"] = 50;
    obj.layout21:setName("layout21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22.grid.role = "col";
    obj.layout22.grid.width = 6;
    obj.layout22:setName("layout22");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout22);
    obj.label3:setAlign("client");
    obj.label3:setText("RESISTANCE");
    obj.label3:setFontColor("#ede9da");
    obj.label3:setName("label3");
    obj.label3:setFontFamily("Sans-serif");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23.grid.role = "col";
    obj.layout23.grid.width = 6;
    obj.layout23.grid["cnt-vert-align"] = "center";
    obj.layout23:setName("layout23");

    obj.Nerve_resistance_combobox_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Nerve_resistance_combobox_1:setParent(obj.layout23);
    obj.Nerve_resistance_combobox_1.grid.role = "col";
    obj.Nerve_resistance_combobox_1.grid.width = 4;
    obj.Nerve_resistance_combobox_1:setName("Nerve_resistance_combobox_1");
    obj.Nerve_resistance_combobox_1:setField("Nerve_resistance_combobox_1");

    obj.Nerve_resistance_combobox_2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Nerve_resistance_combobox_2:setParent(obj.layout23);
    obj.Nerve_resistance_combobox_2.grid.role = "col";
    obj.Nerve_resistance_combobox_2.grid.width = 4;
    obj.Nerve_resistance_combobox_2:setName("Nerve_resistance_combobox_2");
    obj.Nerve_resistance_combobox_2:setField("Nerve_resistance_combobox_2");

    obj.Nerve_resistance_combobox_3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Nerve_resistance_combobox_3:setParent(obj.layout23);
    obj.Nerve_resistance_combobox_3.grid.role = "col";
    obj.Nerve_resistance_combobox_3.grid.width = 4;
    obj.Nerve_resistance_combobox_3:setName("Nerve_resistance_combobox_3");
    obj.Nerve_resistance_combobox_3:setField("Nerve_resistance_combobox_3");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24.grid.role = "col";
    obj.layout24.grid.width = 2;
    obj.layout24.grid["cnt-vert-align"] = "center";
    obj.layout24:setName("layout24");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout24);
    obj.checkBox1.grid.role = "col";
    obj.checkBox1.grid.width = 12;
    obj.checkBox1:setText("");
    obj.checkBox1:setName("checkBox1");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25.grid.role = "col";
    obj.layout25.grid.width = 4;
    obj.layout25.grid["horz-align"] = "left";
    obj.layout25:setName("layout25");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout25);
    obj.label4.grid.role = "row";
    obj.label4:setText("Move");
    obj.label4:setFontColor("#21a3a3");
    obj.label4.grid["min-height"] = 50;
    obj.label4.grid["vert-align"] = "center";
    obj.label4:setName("label4");
    obj.label4:setFontFamily("Sans-serif");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26.grid.role = "col";
    obj.layout26.grid.width = 6;
    obj.layout26.grid["cnt-vert-align"] = "center";
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27.grid.role = "row";
    obj.layout27.grid["min-height"] = 25;
    obj.layout27.grid["cnt-vert-align"] = "center";
    obj.layout27.grid["cnt-horz-align"] = "between";
    obj.layout27:setName("layout27");

    obj.Move_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Move_1_1:setParent(obj.layout27);
    obj.Move_1_1.grid.role = "col";
    obj.Move_1_1.grid.width = 4;
    obj.Move_1_1:setName("Move_1_1");
    obj.Move_1_1:setField("Move_1_1");

    obj.Move_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Move_2_1:setParent(obj.layout27);
    obj.Move_2_1.grid.role = "col";
    obj.Move_2_1.grid.width = 4;
    obj.Move_2_1:setName("Move_2_1");
    obj.Move_2_1:setField("Move_2_1");

    obj.Move_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Move_3_1:setParent(obj.layout27);
    obj.Move_3_1.grid.role = "col";
    obj.Move_3_1.grid.width = 4;
    obj.Move_3_1:setName("Move_3_1");
    obj.Move_3_1:setField("Move_3_1");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout21);
    obj.layout28.grid.role = "col";
    obj.layout28.grid.width = 2;
    obj.layout28.grid["cnt-vert-align"] = "center";
    obj.layout28:setName("layout28");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout28);
    obj.checkBox2.grid.role = "col";
    obj.checkBox2.grid.width = 12;
    obj.checkBox2:setText("");
    obj.checkBox2:setName("checkBox2");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout21);
    obj.layout29.grid.role = "col";
    obj.layout29.grid.width = 4;
    obj.layout29.grid["horz-align"] = "left";
    obj.layout29:setName("layout29");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout29);
    obj.label5.grid.role = "row";
    obj.label5:setText("Strike");
    obj.label5:setFontColor("#21a3a3");
    obj.label5.grid["min-height"] = 50;
    obj.label5.grid["vert-align"] = "center";
    obj.label5:setName("label5");
    obj.label5:setFontFamily("Sans-serif");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout21);
    obj.layout30.grid.role = "col";
    obj.layout30.grid.width = 6;
    obj.layout30.grid["cnt-vert-align"] = "center";
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31.grid.role = "row";
    obj.layout31.grid["min-height"] = 25;
    obj.layout31.grid["cnt-vert-align"] = "center";
    obj.layout31.grid["cnt-horz-align"] = "between";
    obj.layout31:setName("layout31");

    obj.Strike_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Strike_1_1:setParent(obj.layout31);
    obj.Strike_1_1.grid.role = "col";
    obj.Strike_1_1.grid.width = 4;
    obj.Strike_1_1:setName("Strike_1_1");
    obj.Strike_1_1:setField("Strike_1_1");

    obj.Strike_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Strike_2_1:setParent(obj.layout31);
    obj.Strike_2_1.grid.role = "col";
    obj.Strike_2_1.grid.width = 4;
    obj.Strike_2_1:setName("Strike_2_1");
    obj.Strike_2_1:setField("Strike_2_1");

    obj.Strike_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Strike_3_1:setParent(obj.layout31);
    obj.Strike_3_1.grid.role = "col";
    obj.Strike_3_1.grid.width = 4;
    obj.Strike_3_1:setName("Strike_3_1");
    obj.Strike_3_1:setField("Strike_3_1");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout21);
    obj.layout32.grid.role = "col";
    obj.layout32.grid.width = 2;
    obj.layout32.grid["cnt-vert-align"] = "center";
    obj.layout32:setName("layout32");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout32);
    obj.checkBox3.grid.role = "col";
    obj.checkBox3.grid.width = 12;
    obj.checkBox3:setText("");
    obj.checkBox3:setName("checkBox3");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout21);
    obj.layout33.grid.role = "col";
    obj.layout33.grid.width = 4;
    obj.layout33.grid["horz-align"] = "left";
    obj.layout33:setName("layout33");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout33);
    obj.label6.grid.role = "row";
    obj.label6:setText("Control");
    obj.label6:setFontColor("#21a3a3");
    obj.label6.grid["min-height"] = 50;
    obj.label6.grid["vert-align"] = "center";
    obj.label6:setName("label6");
    obj.label6:setFontFamily("Sans-serif");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout21);
    obj.layout34.grid.role = "col";
    obj.layout34.grid.width = 6;
    obj.layout34.grid["cnt-vert-align"] = "center";
    obj.layout34:setName("layout34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35.grid.role = "row";
    obj.layout35.grid["min-height"] = 25;
    obj.layout35.grid["cnt-vert-align"] = "center";
    obj.layout35.grid["cnt-horz-align"] = "between";
    obj.layout35:setName("layout35");

    obj.Control_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Control_1_1:setParent(obj.layout35);
    obj.Control_1_1.grid.role = "col";
    obj.Control_1_1.grid.width = 4;
    obj.Control_1_1:setName("Control_1_1");
    obj.Control_1_1:setField("Control_1_1");

    obj.Control_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Control_2_1:setParent(obj.layout35);
    obj.Control_2_1.grid.role = "col";
    obj.Control_2_1.grid.width = 4;
    obj.Control_2_1:setName("Control_2_1");
    obj.Control_2_1:setField("Control_2_1");

    obj.Control_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Control_3_1:setParent(obj.layout35);
    obj.Control_3_1.grid.role = "col";
    obj.Control_3_1.grid.width = 4;
    obj.Control_3_1:setName("Control_3_1");
    obj.Control_3_1:setField("Control_3_1");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout16);
    obj.layout36.grid.role = "col";
    obj.layout36.grid.width = 4;
    obj.layout36.grid["min-height"] = 300;
    obj.layout36.grid["padding-left"] = 10;
    obj.layout36:setName("layout36");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout36);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#101114");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setName("rectangle3");


            local Cunning;
            if Cunning == nil or '' then
                Cunning=0
            end
            local function mudar_drive(tipo)
                if tipo=="aumento" then 
                    Cunning = Cunning+1;
                elseif tipo=="diminuir" then
                Cunning = Cunning-1
                elseif tipo=="passou" then
                    Cunning = 9
                    showMessage("Você não pode ter mais quantidade de drive que isso")
                end
                atualizar_drive()
            end

            local function atualizar_drive()
                if Cunning < field.Cunning or Cunning > field.Cunning then
                    field.Cunning = Cunning
                end
                if Cunning == 0 then
                    field.Cunning= "No"
                elseif field.Cunning > 9 then
                    mudar_drive('passou')
                else
                    field.Cunning=""..Cunning
                end
            end
        


    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37.grid.role = "row";
    obj.layout37.grid["min-height"] = 40;
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38.grid.role = "col";
    obj.layout38.grid.width = 5;
    obj.layout38.grid["cnt-vert-align"] = "center";
    obj.layout38:setName("layout38");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout38);
    obj.label7.grid.role = "col";
    obj.label7.grid.width = 12;
    obj.label7:setText("Cunning");
    obj.label7:setFontColor("#ede9da");
    obj.label7:setName("label7");
    obj.label7:setFontFamily("Sans-serif");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout37);
    obj.layout39.grid.role = "col";
    obj.layout39.grid.width = 7;
    obj.layout39.grid["cnt-vert-align"] = "center";
    obj.layout39:setName("layout39");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout39);
    obj.button7.grid.role = "col";
    obj.button7.grid.width = 2;
    obj.button7:setText("-");
    obj.button7:setHorzTextAlign("center");
    obj.button7:setName("button7");
    obj.button7:setFontFamily("Sans-serif");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout39);
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 8;
    obj.label8.format = "%s Drives";
    obj.label8:setText("No");
    obj.label8:setField("Cunning");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontColor("#3d3d3c");
    obj.label8:setName("label8");
    obj.label8:setFontFamily("Sans-serif");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout39);
    obj.button8.grid.role = "col";
    obj.button8.grid.width = 2;
    obj.button8:setText("+");
    obj.button8:setHorzTextAlign("center");
    obj.button8:setName("button8");
    obj.button8:setFontFamily("Sans-serif");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout36);
    obj.rectangle4.grid.role = "row";
    obj.rectangle4:setColor("#322b23");
    obj.rectangle4.grid["min-height"] = 2;
    obj.rectangle4:setName("rectangle4");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout36);
    obj.layout40.grid.role = "row";
    obj.layout40.grid["min-height"] = 50;
    obj.layout40:setName("layout40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41.grid.role = "col";
    obj.layout41.grid.width = 6;
    obj.layout41:setName("layout41");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout41);
    obj.label9:setAlign("client");
    obj.label9:setText("RESISTANCE");
    obj.label9:setFontColor("#ede9da");
    obj.label9:setName("label9");
    obj.label9:setFontFamily("Sans-serif");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42.grid.role = "col";
    obj.layout42.grid.width = 6;
    obj.layout42.grid["cnt-vert-align"] = "center";
    obj.layout42:setName("layout42");

    obj.Cunning_resistance_combobox_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Cunning_resistance_combobox_1:setParent(obj.layout42);
    obj.Cunning_resistance_combobox_1.grid.role = "col";
    obj.Cunning_resistance_combobox_1.grid.width = 4;
    obj.Cunning_resistance_combobox_1:setName("Cunning_resistance_combobox_1");
    obj.Cunning_resistance_combobox_1:setField("Cunning_resistance_combobox_1");

    obj.Cunning_resistance_combobox_2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Cunning_resistance_combobox_2:setParent(obj.layout42);
    obj.Cunning_resistance_combobox_2.grid.role = "col";
    obj.Cunning_resistance_combobox_2.grid.width = 4;
    obj.Cunning_resistance_combobox_2:setName("Cunning_resistance_combobox_2");
    obj.Cunning_resistance_combobox_2:setField("Cunning_resistance_combobox_2");

    obj.Cunning_resistance_combobox_3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Cunning_resistance_combobox_3:setParent(obj.layout42);
    obj.Cunning_resistance_combobox_3.grid.role = "col";
    obj.Cunning_resistance_combobox_3.grid.width = 4;
    obj.Cunning_resistance_combobox_3:setName("Cunning_resistance_combobox_3");
    obj.Cunning_resistance_combobox_3:setField("Cunning_resistance_combobox_3");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43.grid.role = "col";
    obj.layout43.grid.width = 2;
    obj.layout43.grid["cnt-vert-align"] = "center";
    obj.layout43:setName("layout43");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout43);
    obj.checkBox4.grid.role = "col";
    obj.checkBox4.grid.width = 12;
    obj.checkBox4:setText("");
    obj.checkBox4:setName("checkBox4");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44.grid.role = "col";
    obj.layout44.grid.width = 4;
    obj.layout44.grid["horz-align"] = "left";
    obj.layout44:setName("layout44");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout44);
    obj.label10.grid.role = "row";
    obj.label10:setText("Sway");
    obj.label10:setFontColor("#21a3a3");
    obj.label10.grid["min-height"] = 50;
    obj.label10.grid["vert-align"] = "center";
    obj.label10:setName("label10");
    obj.label10:setFontFamily("Sans-serif");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45.grid.role = "col";
    obj.layout45.grid.width = 6;
    obj.layout45.grid["cnt-vert-align"] = "center";
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46.grid.role = "row";
    obj.layout46.grid["min-height"] = 25;
    obj.layout46.grid["cnt-vert-align"] = "center";
    obj.layout46.grid["cnt-horz-align"] = "between";
    obj.layout46:setName("layout46");

    obj.Sway_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Sway_1_1:setParent(obj.layout46);
    obj.Sway_1_1.grid.role = "col";
    obj.Sway_1_1.grid.width = 4;
    obj.Sway_1_1:setName("Sway_1_1");
    obj.Sway_1_1:setField("Sway_1_1");

    obj.Sway_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Sway_2_1:setParent(obj.layout46);
    obj.Sway_2_1.grid.role = "col";
    obj.Sway_2_1.grid.width = 4;
    obj.Sway_2_1:setName("Sway_2_1");
    obj.Sway_2_1:setField("Sway_2_1");

    obj.Sway_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Sway_3_1:setParent(obj.layout46);
    obj.Sway_3_1.grid.role = "col";
    obj.Sway_3_1.grid.width = 4;
    obj.Sway_3_1:setName("Sway_3_1");
    obj.Sway_3_1:setField("Sway_3_1");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout40);
    obj.layout47.grid.role = "col";
    obj.layout47.grid.width = 2;
    obj.layout47.grid["cnt-vert-align"] = "center";
    obj.layout47:setName("layout47");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout47);
    obj.checkBox5.grid.role = "col";
    obj.checkBox5.grid.width = 12;
    obj.checkBox5:setText("");
    obj.checkBox5:setName("checkBox5");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout40);
    obj.layout48.grid.role = "col";
    obj.layout48.grid.width = 4;
    obj.layout48.grid["horz-align"] = "left";
    obj.layout48:setName("layout48");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout48);
    obj.label11.grid.role = "row";
    obj.label11:setText("Read");
    obj.label11:setFontColor("#21a3a3");
    obj.label11.grid["min-height"] = 50;
    obj.label11.grid["vert-align"] = "center";
    obj.label11:setName("label11");
    obj.label11:setFontFamily("Sans-serif");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout40);
    obj.layout49.grid.role = "col";
    obj.layout49.grid.width = 6;
    obj.layout49.grid["cnt-vert-align"] = "center";
    obj.layout49:setName("layout49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50.grid.role = "row";
    obj.layout50.grid["min-height"] = 25;
    obj.layout50.grid["cnt-vert-align"] = "center";
    obj.layout50.grid["cnt-horz-align"] = "between";
    obj.layout50:setName("layout50");

    obj.Read_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Read_1_1:setParent(obj.layout50);
    obj.Read_1_1.grid.role = "col";
    obj.Read_1_1.grid.width = 4;
    obj.Read_1_1:setName("Read_1_1");
    obj.Read_1_1:setField("Read_1_1");

    obj.Read_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Read_2_1:setParent(obj.layout50);
    obj.Read_2_1.grid.role = "col";
    obj.Read_2_1.grid.width = 4;
    obj.Read_2_1:setName("Read_2_1");
    obj.Read_2_1:setField("Read_2_1");

    obj.Read_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Read_3_1:setParent(obj.layout50);
    obj.Read_3_1.grid.role = "col";
    obj.Read_3_1.grid.width = 4;
    obj.Read_3_1:setName("Read_3_1");
    obj.Read_3_1:setField("Read_3_1");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout40);
    obj.layout51.grid.role = "col";
    obj.layout51.grid.width = 2;
    obj.layout51.grid["cnt-vert-align"] = "center";
    obj.layout51:setName("layout51");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout51);
    obj.checkBox6.grid.role = "col";
    obj.checkBox6.grid.width = 12;
    obj.checkBox6:setText("");
    obj.checkBox6:setName("checkBox6");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout40);
    obj.layout52.grid.role = "col";
    obj.layout52.grid.width = 4;
    obj.layout52.grid["horz-align"] = "left";
    obj.layout52:setName("layout52");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout52);
    obj.label12.grid.role = "row";
    obj.label12:setText("Hide");
    obj.label12:setFontColor("#21a3a3");
    obj.label12.grid["min-height"] = 50;
    obj.label12.grid["vert-align"] = "center";
    obj.label12:setName("label12");
    obj.label12:setFontFamily("Sans-serif");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout40);
    obj.layout53.grid.role = "col";
    obj.layout53.grid.width = 6;
    obj.layout53.grid["cnt-vert-align"] = "center";
    obj.layout53:setName("layout53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout53);
    obj.layout54.grid.role = "row";
    obj.layout54.grid["min-height"] = 25;
    obj.layout54.grid["cnt-vert-align"] = "center";
    obj.layout54.grid["cnt-horz-align"] = "between";
    obj.layout54:setName("layout54");

    obj.Hide_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Hide_1_1:setParent(obj.layout54);
    obj.Hide_1_1.grid.role = "col";
    obj.Hide_1_1.grid.width = 4;
    obj.Hide_1_1:setName("Hide_1_1");
    obj.Hide_1_1:setField("Hide_1_1");

    obj.Hide_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Hide_2_1:setParent(obj.layout54);
    obj.Hide_2_1.grid.role = "col";
    obj.Hide_2_1.grid.width = 4;
    obj.Hide_2_1:setName("Hide_2_1");
    obj.Hide_2_1:setField("Hide_2_1");

    obj.Hide_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Hide_3_1:setParent(obj.layout54);
    obj.Hide_3_1.grid.role = "col";
    obj.Hide_3_1.grid.width = 4;
    obj.Hide_3_1:setName("Hide_3_1");
    obj.Hide_3_1:setField("Hide_3_1");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout16);
    obj.layout55.grid.role = "col";
    obj.layout55.grid.width = 4;
    obj.layout55.grid["min-height"] = 300;
    obj.layout55.grid["padding-left"] = 10;
    obj.layout55:setName("layout55");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout55);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#101114");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setName("rectangle5");


            local Intuition;
            if Intuition == nil or '' then
                Intuition=0
            end
            local function mudar_drive(tipo)
                if tipo=="aumento" then 
                    Intuition = Intuition+1;
                elseif tipo=="diminuir" then
                Intuition = Intuition-1
                elseif tipo=="passou" then
                    Intuition = 9
                    showMessage("Você não pode ter mais quantidade de drive que isso")
                end
                atualizar_drive()
            end

            local function atualizar_drive()
                if Intuition < field.Intuition or Intuition > field.Intuition then
                    field.Intuition = Intuition
                end
                if Intuition == 0 then
                    field.Intuition= "No"
                elseif field.Intuition > 9 then
                    mudar_drive('passou')
                else
                    field.Intuition=""..Intuition
                end
            end
        


    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56.grid.role = "row";
    obj.layout56.grid["min-height"] = 40;
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57.grid.role = "col";
    obj.layout57.grid.width = 5;
    obj.layout57.grid["cnt-vert-align"] = "center";
    obj.layout57:setName("layout57");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout57);
    obj.label13.grid.role = "col";
    obj.label13.grid.width = 12;
    obj.label13:setText("Intuition");
    obj.label13:setFontColor("#ede9da");
    obj.label13:setName("label13");
    obj.label13:setFontFamily("Sans-serif");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58.grid.role = "col";
    obj.layout58.grid.width = 7;
    obj.layout58.grid["cnt-vert-align"] = "center";
    obj.layout58:setName("layout58");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout58);
    obj.button9.grid.role = "col";
    obj.button9.grid.width = 2;
    obj.button9:setText("-");
    obj.button9:setHorzTextAlign("center");
    obj.button9:setName("button9");
    obj.button9:setFontFamily("Sans-serif");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout58);
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 8;
    obj.label14.format = "%s Drives";
    obj.label14:setText("No");
    obj.label14:setField("Intuition");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontColor("#3d3d3c");
    obj.label14:setName("label14");
    obj.label14:setFontFamily("Sans-serif");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout58);
    obj.button10.grid.role = "col";
    obj.button10.grid.width = 2;
    obj.button10:setText("+");
    obj.button10:setHorzTextAlign("center");
    obj.button10:setName("button10");
    obj.button10:setFontFamily("Sans-serif");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout55);
    obj.rectangle6.grid.role = "row";
    obj.rectangle6:setColor("#322b23");
    obj.rectangle6.grid["min-height"] = 2;
    obj.rectangle6:setName("rectangle6");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout55);
    obj.layout59.grid.role = "row";
    obj.layout59.grid["min-height"] = 50;
    obj.layout59:setName("layout59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60.grid.role = "col";
    obj.layout60.grid.width = 6;
    obj.layout60:setName("layout60");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout60);
    obj.label15:setAlign("client");
    obj.label15:setText("RESISTANCE");
    obj.label15:setFontColor("#ede9da");
    obj.label15:setName("label15");
    obj.label15:setFontFamily("Sans-serif");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout59);
    obj.layout61.grid.role = "col";
    obj.layout61.grid.width = 6;
    obj.layout61.grid["cnt-vert-align"] = "center";
    obj.layout61:setName("layout61");

    obj.Intuition_resistance_combobox_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Intuition_resistance_combobox_1:setParent(obj.layout61);
    obj.Intuition_resistance_combobox_1.grid.role = "col";
    obj.Intuition_resistance_combobox_1.grid.width = 4;
    obj.Intuition_resistance_combobox_1:setName("Intuition_resistance_combobox_1");
    obj.Intuition_resistance_combobox_1:setField("Intuition_resistance_combobox_1");

    obj.Intuition_resistance_combobox_2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Intuition_resistance_combobox_2:setParent(obj.layout61);
    obj.Intuition_resistance_combobox_2.grid.role = "col";
    obj.Intuition_resistance_combobox_2.grid.width = 4;
    obj.Intuition_resistance_combobox_2:setName("Intuition_resistance_combobox_2");
    obj.Intuition_resistance_combobox_2:setField("Intuition_resistance_combobox_2");

    obj.Intuition_resistance_combobox_3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Intuition_resistance_combobox_3:setParent(obj.layout61);
    obj.Intuition_resistance_combobox_3.grid.role = "col";
    obj.Intuition_resistance_combobox_3.grid.width = 4;
    obj.Intuition_resistance_combobox_3:setName("Intuition_resistance_combobox_3");
    obj.Intuition_resistance_combobox_3:setField("Intuition_resistance_combobox_3");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout59);
    obj.layout62.grid.role = "col";
    obj.layout62.grid.width = 2;
    obj.layout62.grid["cnt-vert-align"] = "center";
    obj.layout62:setName("layout62");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout62);
    obj.checkBox7.grid.role = "col";
    obj.checkBox7.grid.width = 12;
    obj.checkBox7:setText("");
    obj.checkBox7:setName("checkBox7");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout59);
    obj.layout63.grid.role = "col";
    obj.layout63.grid.width = 4;
    obj.layout63.grid["horz-align"] = "left";
    obj.layout63:setName("layout63");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout63);
    obj.label16.grid.role = "row";
    obj.label16:setText("Survey");
    obj.label16:setFontColor("#21a3a3");
    obj.label16.grid["min-height"] = 50;
    obj.label16.grid["vert-align"] = "center";
    obj.label16:setName("label16");
    obj.label16:setFontFamily("Sans-serif");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout59);
    obj.layout64.grid.role = "col";
    obj.layout64.grid.width = 6;
    obj.layout64.grid["cnt-vert-align"] = "center";
    obj.layout64:setName("layout64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65.grid.role = "row";
    obj.layout65.grid["min-height"] = 25;
    obj.layout65.grid["cnt-vert-align"] = "center";
    obj.layout65.grid["cnt-horz-align"] = "between";
    obj.layout65:setName("layout65");

    obj.Survey_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Survey_1_1:setParent(obj.layout65);
    obj.Survey_1_1.grid.role = "col";
    obj.Survey_1_1.grid.width = 4;
    obj.Survey_1_1:setName("Survey_1_1");
    obj.Survey_1_1:setField("Survey_1_1");

    obj.Survey_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Survey_2_1:setParent(obj.layout65);
    obj.Survey_2_1.grid.role = "col";
    obj.Survey_2_1.grid.width = 4;
    obj.Survey_2_1:setName("Survey_2_1");
    obj.Survey_2_1:setField("Survey_2_1");

    obj.Survey_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Survey_3_1:setParent(obj.layout65);
    obj.Survey_3_1.grid.role = "col";
    obj.Survey_3_1.grid.width = 4;
    obj.Survey_3_1:setName("Survey_3_1");
    obj.Survey_3_1:setField("Survey_3_1");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout59);
    obj.layout66.grid.role = "col";
    obj.layout66.grid.width = 2;
    obj.layout66.grid["cnt-vert-align"] = "center";
    obj.layout66:setName("layout66");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout66);
    obj.checkBox8.grid.role = "col";
    obj.checkBox8.grid.width = 12;
    obj.checkBox8:setText("");
    obj.checkBox8:setName("checkBox8");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout59);
    obj.layout67.grid.role = "col";
    obj.layout67.grid.width = 4;
    obj.layout67.grid["horz-align"] = "left";
    obj.layout67:setName("layout67");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout67);
    obj.label17.grid.role = "row";
    obj.label17:setText("Focus");
    obj.label17:setFontColor("#21a3a3");
    obj.label17.grid["min-height"] = 50;
    obj.label17.grid["vert-align"] = "center";
    obj.label17:setName("label17");
    obj.label17:setFontFamily("Sans-serif");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout59);
    obj.layout68.grid.role = "col";
    obj.layout68.grid.width = 6;
    obj.layout68.grid["cnt-vert-align"] = "center";
    obj.layout68:setName("layout68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69.grid.role = "row";
    obj.layout69.grid["min-height"] = 25;
    obj.layout69.grid["cnt-vert-align"] = "center";
    obj.layout69.grid["cnt-horz-align"] = "between";
    obj.layout69:setName("layout69");

    obj.Focus_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Focus_1_1:setParent(obj.layout69);
    obj.Focus_1_1.grid.role = "col";
    obj.Focus_1_1.grid.width = 4;
    obj.Focus_1_1:setName("Focus_1_1");
    obj.Focus_1_1:setField("Focus_1_1");

    obj.Focus_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Focus_2_1:setParent(obj.layout69);
    obj.Focus_2_1.grid.role = "col";
    obj.Focus_2_1.grid.width = 4;
    obj.Focus_2_1:setName("Focus_2_1");
    obj.Focus_2_1:setField("Focus_2_1");

    obj.Focus_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Focus_3_1:setParent(obj.layout69);
    obj.Focus_3_1.grid.role = "col";
    obj.Focus_3_1.grid.width = 4;
    obj.Focus_3_1:setName("Focus_3_1");
    obj.Focus_3_1:setField("Focus_3_1");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout59);
    obj.layout70.grid.role = "col";
    obj.layout70.grid.width = 2;
    obj.layout70.grid["cnt-vert-align"] = "center";
    obj.layout70:setName("layout70");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout70);
    obj.checkBox9.grid.role = "col";
    obj.checkBox9.grid.width = 12;
    obj.checkBox9:setText("");
    obj.checkBox9:setName("checkBox9");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout59);
    obj.layout71.grid.role = "col";
    obj.layout71.grid.width = 4;
    obj.layout71.grid["horz-align"] = "left";
    obj.layout71:setName("layout71");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout71);
    obj.label18.grid.role = "row";
    obj.label18:setText("Sense");
    obj.label18:setFontColor("#21a3a3");
    obj.label18.grid["min-height"] = 50;
    obj.label18.grid["vert-align"] = "center";
    obj.label18:setName("label18");
    obj.label18:setFontFamily("Sans-serif");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout59);
    obj.layout72.grid.role = "col";
    obj.layout72.grid.width = 6;
    obj.layout72.grid["cnt-vert-align"] = "center";
    obj.layout72:setName("layout72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout72);
    obj.layout73.grid.role = "row";
    obj.layout73.grid["min-height"] = 25;
    obj.layout73.grid["cnt-vert-align"] = "center";
    obj.layout73.grid["cnt-horz-align"] = "between";
    obj.layout73:setName("layout73");

    obj.Sense_1_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Sense_1_1:setParent(obj.layout73);
    obj.Sense_1_1.grid.role = "col";
    obj.Sense_1_1.grid.width = 4;
    obj.Sense_1_1:setName("Sense_1_1");
    obj.Sense_1_1:setField("Sense_1_1");

    obj.Sense_2_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Sense_2_1:setParent(obj.layout73);
    obj.Sense_2_1.grid.role = "col";
    obj.Sense_2_1.grid.width = 4;
    obj.Sense_2_1:setName("Sense_2_1");
    obj.Sense_2_1:setField("Sense_2_1");

    obj.Sense_3_1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.Sense_3_1:setParent(obj.layout73);
    obj.Sense_3_1.grid.role = "col";
    obj.Sense_3_1.grid.width = 4;
    obj.Sense_3_1:setName("Sense_3_1");
    obj.Sense_3_1:setField("Sense_3_1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            self.Circle_popup:show();
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            self.Style_popup:show();
        end);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (event)
            self.Catalyst_popup:show();
        end);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (event)
            self.Question_popup:show();
        end);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (event)
            mudar_drive('diminuir')
        end);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (event)
            mudar_drive('aumento')
        end);

    obj._e_event6 = obj.Nerve_resistance_combobox_1:addEventListener("onChange",
        function ()
            if self.Nerve_resistance_combobox_1_3.checked then
                                self.Nerve_resistance_combobox_1_2.checked = true;
                                self.Nerve_resistance_combobox_1_1.checked = true;
                            elseif self.Nerve_resistance_combobox_1_2.checked then
                                self.Nerve_resistance_combobox_1_1.checked = true;
                            end
        end);

    obj._e_event7 = obj.Nerve_resistance_combobox_2:addEventListener("onChange",
        function ()
            if self.Nerve_resistance_combobox_2_3.checked then
                                self.Nerve_resistance_combobox_2_2.checked = true;
                                self.Nerve_resistance_combobox_2_1.checked = true;
                            elseif self.Nerve_resistance_combobox_2_2.checked then
                                self.Nerve_resistance_combobox_2_1.checked = true;
                            end
        end);

    obj._e_event8 = obj.Nerve_resistance_combobox_3:addEventListener("onChange",
        function ()
            if self.Nerve_resistance_combobox_3_3.checked then
                                self.Nerve_resistance_combobox_3_2.checked = true;
                                self.Nerve_resistance_combobox_3_1.checked = true;
                            elseif self.Nerve_resistance_combobox_3_2.checked then
                                self.Nerve_resistance_combobox_3_1.checked = true;
                            end
        end);

    obj._e_event9 = obj.Move_1_1:addEventListener("onChange",
        function ()
            if self.Move_3_1.checked then
                                self.Move_2_1.checked = true;
                                self.Move_1_1.checked = true;
                            elseif self.Move_2_1.checked then
                                self.Move_1_1.checked = true;
                            end
        end);

    obj._e_event10 = obj.Move_2_1:addEventListener("onChange",
        function ()
            if self.Move_3_1.checked then
                                self.Move_2_1.checked = true;
                                self.Move_1_1.checked = true;
                            elseif self.Move_2_1.checked then
                                self.Move_1_1.checked = true;
                            end
        end);

    obj._e_event11 = obj.Move_3_1:addEventListener("onChange",
        function ()
            if self.Move_3_1.checked then
                                self.Move_2_1.checked = true;
                                self.Move_1_1.checked = true;
                            elseif self.Move_2_1.checked then
                                self.Move_1_1.checked = true;
                            end
        end);

    obj._e_event12 = obj.Strike_1_1:addEventListener("onChange",
        function ()
            if self.Strike_3_1.checked then
                                self.Strike_2_1.checked = true;
                                self.Strike_1_1.checked = true;
                            elseif self.Strike_2_1.checked then
                                self.Strike_1_1.checked = true;
                            end
        end);

    obj._e_event13 = obj.Strike_2_1:addEventListener("onChange",
        function ()
            if self.Strike_3_1.checked then
                                self.Strike_2_1.checked = true;
                                self.Strike_1_1.checked = true;
                            elseif self.Strike_2_1.checked then
                                self.Strike_1_1.checked = true;
                            end
        end);

    obj._e_event14 = obj.Strike_3_1:addEventListener("onChange",
        function ()
            if self.Strike_3_1.checked then
                                self.Strike_2_1.checked = true;
                                self.Strike_1_1.checked = true;
                            elseif self.Strike_2_1.checked then
                                self.Strike_1_1.checked = true;
                            end
        end);

    obj._e_event15 = obj.Control_1_1:addEventListener("onChange",
        function ()
            if self.Control_3_1.checked then
                                self.Control_2_1.checked = true;
                                self.Control_1_1.checked = true;
                            elseif self.Control_2_1.checked then
                                self.Control_1_1.checked = true;
                            end
        end);

    obj._e_event16 = obj.Control_2_1:addEventListener("onChange",
        function ()
            if self.Control_3_1.checked then
                                self.Control_2_1.checked = true;
                                self.Control_1_1.checked = true;
                            elseif self.Control_2_1.checked then
                                self.Control_1_1.checked = true;
                            end
        end);

    obj._e_event17 = obj.Control_3_1:addEventListener("onChange",
        function ()
            if self.Control_3_1.checked then
                                self.Control_2_1.checked = true;
                                self.Control_1_1.checked = true;
                            elseif self.Control_2_1.checked then
                                self.Control_1_1.checked = true;
                            end
        end);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (event)
            mudar_drive('diminuir')
        end);

    obj._e_event19 = obj.button8:addEventListener("onClick",
        function (event)
            mudar_drive('aumento')
        end);

    obj._e_event20 = obj.Cunning_resistance_combobox_1:addEventListener("onChange",
        function ()
            if self.Cunning_resistance_combobox_1_3.checked then
                                self.Cunning_resistance_combobox_1_2.checked = true;
                                self.Cunning_resistance_combobox_1_1.checked = true;
                            elseif self.Cunning_resistance_combobox_1_2.checked then
                                self.Cunning_resistance_combobox_1_1.checked = true;
                            end
        end);

    obj._e_event21 = obj.Cunning_resistance_combobox_2:addEventListener("onChange",
        function ()
            if self.Cunning_resistance_combobox_2_3.checked then
                                self.Cunning_resistance_combobox_2_2.checked = true;
                                self.Cunning_resistance_combobox_2_1.checked = true;
                            elseif self.Cunning_resistance_combobox_2_2.checked then
                                self.Cunning_resistance_combobox_2_1.checked = true;
                            end
        end);

    obj._e_event22 = obj.Cunning_resistance_combobox_3:addEventListener("onChange",
        function ()
            if self.Cunning_resistance_combobox_3_3.checked then
                                self.Cunning_resistance_combobox_3_2.checked = true;
                                self.Cunning_resistance_combobox_3_1.checked = true;
                            elseif self.Cunning_resistance_combobox_3_2.checked then
                                self.Cunning_resistance_combobox_3_1.checked = true;
                            end
        end);

    obj._e_event23 = obj.Sway_1_1:addEventListener("onChange",
        function ()
            if self.Sway_3_1.checked then
                                self.Sway_2_1.checked = true;
                                self.Sway_1_1.checked = true;
                            elseif self.Sway_2_1.checked then
                                self.Sway_1_1.checked = true;
                            end
        end);

    obj._e_event24 = obj.Sway_2_1:addEventListener("onChange",
        function ()
            if self.Sway_3_1.checked then
                                self.Sway_2_1.checked = true;
                                self.Sway_1_1.checked = true;
                            elseif self.Sway_2_1.checked then
                                self.Sway_1_1.checked = true;
                            end
        end);

    obj._e_event25 = obj.Sway_3_1:addEventListener("onChange",
        function ()
            if self.Sway_3_1.checked then
                                self.Sway_2_1.checked = true;
                                self.Sway_1_1.checked = true;
                            elseif self.Sway_2_1.checked then
                                self.Sway_1_1.checked = true;
                            end
        end);

    obj._e_event26 = obj.Read_1_1:addEventListener("onChange",
        function ()
            if self.Read_3_1.checked then
                                self.Read_2_1.checked = true;
                                self.Read_1_1.checked = true;
                            elseif self.Read_2_1.checked then
                                self.Read_1_1.checked = true;
                            end
        end);

    obj._e_event27 = obj.Read_2_1:addEventListener("onChange",
        function ()
            if self.Read_3_1.checked then
                                self.Read_2_1.checked = true;
                                self.Read_1_1.checked = true;
                            elseif self.Read_2_1.checked then
                                self.Read_1_1.checked = true;
                            end
        end);

    obj._e_event28 = obj.Read_3_1:addEventListener("onChange",
        function ()
            if self.Read_3_1.checked then
                                self.Read_2_1.checked = true;
                                self.Read_1_1.checked = true;
                            elseif self.Read_2_1.checked then
                                self.Read_1_1.checked = true;
                            end
        end);

    obj._e_event29 = obj.Hide_1_1:addEventListener("onChange",
        function ()
            if self.Hide_3_1.checked then
                                self.Hide_2_1.checked = true;
                                self.Hide_1_1.checked = true;
                            elseif self.Hide_2_1.checked then
                                self.Hide_1_1.checked = true;
                            end
        end);

    obj._e_event30 = obj.Hide_2_1:addEventListener("onChange",
        function ()
            if self.Hide_3_1.checked then
                                self.Hide_2_1.checked = true;
                                self.Hide_1_1.checked = true;
                            elseif self.Hide_2_1.checked then
                                self.Hide_1_1.checked = true;
                            end
        end);

    obj._e_event31 = obj.Hide_3_1:addEventListener("onChange",
        function ()
            if self.Hide_3_1.checked then
                                self.Hide_2_1.checked = true;
                                self.Hide_1_1.checked = true;
                            elseif self.Hide_2_1.checked then
                                self.Hide_1_1.checked = true;
                            end
        end);

    obj._e_event32 = obj.button9:addEventListener("onClick",
        function (event)
            mudar_drive('diminuir')
        end);

    obj._e_event33 = obj.button10:addEventListener("onClick",
        function (event)
            mudar_drive('aumento')
        end);

    obj._e_event34 = obj.Intuition_resistance_combobox_1:addEventListener("onChange",
        function ()
            if self.Intuition_resistance_combobox_1_3.checked then
                                self.Intuition_resistance_combobox_1_2.checked = true;
                                self.Intuition_resistance_combobox_1_1.checked = true;
                            elseif self.Intuition_resistance_combobox_1_2.checked then
                                self.Intuition_resistance_combobox_1_1.checked = true;
                            end
        end);

    obj._e_event35 = obj.Intuition_resistance_combobox_2:addEventListener("onChange",
        function ()
            if self.Intuition_resistance_combobox_2_3.checked then
                                self.Intuition_resistance_combobox_2_2.checked = true;
                                self.Intuition_resistance_combobox_2_1.checked = true;
                            elseif self.Intuition_resistance_combobox_2_2.checked then
                                self.Intuition_resistance_combobox_2_1.checked = true;
                            end
        end);

    obj._e_event36 = obj.Intuition_resistance_combobox_3:addEventListener("onChange",
        function ()
            if self.Intuition_resistance_combobox_3_3.checked then
                                self.Intuition_resistance_combobox_3_2.checked = true;
                                self.Intuition_resistance_combobox_3_1.checked = true;
                            elseif self.Intuition_resistance_combobox_3_2.checked then
                                self.Intuition_resistance_combobox_3_1.checked = true;
                            end
        end);

    obj._e_event37 = obj.Survey_1_1:addEventListener("onChange",
        function ()
            if self.Survey_3_1.checked then
                                self.Survey_2_1.checked = true;
                                self.Survey_1_1.checked = true;
                            elseif self.Survey_2_1.checked then
                                self.Survey_1_1.checked = true;
                            end
        end);

    obj._e_event38 = obj.Survey_2_1:addEventListener("onChange",
        function ()
            if self.Survey_3_1.checked then
                                self.Survey_2_1.checked = true;
                                self.Survey_1_1.checked = true;
                            elseif self.Survey_2_1.checked then
                                self.Survey_1_1.checked = true;
                            end
        end);

    obj._e_event39 = obj.Survey_3_1:addEventListener("onChange",
        function ()
            if self.Survey_3_1.checked then
                                self.Survey_2_1.checked = true;
                                self.Survey_1_1.checked = true;
                            elseif self.Survey_2_1.checked then
                                self.Survey_1_1.checked = true;
                            end
        end);

    obj._e_event40 = obj.Focus_1_1:addEventListener("onChange",
        function ()
            if self.Focus_3_1.checked then
                                self.Focus_2_1.checked = true;
                                self.Focus_1_1.checked = true;
                            elseif self.Focus_2_1.checked then
                                self.Focus_1_1.checked = true;
                            end
        end);

    obj._e_event41 = obj.Focus_2_1:addEventListener("onChange",
        function ()
            if self.Focus_3_1.checked then
                                self.Focus_2_1.checked = true;
                                self.Focus_1_1.checked = true;
                            elseif self.Focus_2_1.checked then
                                self.Focus_1_1.checked = true;
                            end
        end);

    obj._e_event42 = obj.Focus_3_1:addEventListener("onChange",
        function ()
            if self.Focus_3_1.checked then
                                self.Focus_2_1.checked = true;
                                self.Focus_1_1.checked = true;
                            elseif self.Focus_2_1.checked then
                                self.Focus_1_1.checked = true;
                            end
        end);

    obj._e_event43 = obj.Sense_1_1:addEventListener("onChange",
        function ()
            if self.Sense_3_1.checked then
                                self.Sense_2_1.checked = true;
                                self.Sense_1_1.checked = true;
                            elseif self.Sense_2_1.checked then
                                self.Sense_1_1.checked = true;
                            end
        end);

    obj._e_event44 = obj.Sense_2_1:addEventListener("onChange",
        function ()
            if self.Sense_3_1.checked then
                                self.Sense_2_1.checked = true;
                                self.Sense_1_1.checked = true;
                            elseif self.Sense_2_1.checked then
                                self.Sense_1_1.checked = true;
                            end
        end);

    obj._e_event45 = obj.Sense_3_1:addEventListener("onChange",
        function ()
            if self.Sense_3_1.checked then
                                self.Sense_2_1.checked = true;
                                self.Sense_1_1.checked = true;
                            elseif self.Sense_2_1.checked then
                                self.Sense_1_1.checked = true;
                            end
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.Move_2_1 ~= nil then self.Move_2_1:destroy(); self.Move_2_1 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.Catalyst_popup ~= nil then self.Catalyst_popup:destroy(); self.Catalyst_popup = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.Nerve_resistance_combobox_3 ~= nil then self.Nerve_resistance_combobox_3:destroy(); self.Nerve_resistance_combobox_3 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.Strike_1_1 ~= nil then self.Strike_1_1:destroy(); self.Strike_1_1 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.Focus_1_1 ~= nil then self.Focus_1_1:destroy(); self.Focus_1_1 = nil; end;
        if self.Control_1_1 ~= nil then self.Control_1_1:destroy(); self.Control_1_1 = nil; end;
        if self.Sway_2_1 ~= nil then self.Sway_2_1:destroy(); self.Sway_2_1 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.Strike_2_1 ~= nil then self.Strike_2_1:destroy(); self.Strike_2_1 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.Intuition_resistance_combobox_1 ~= nil then self.Intuition_resistance_combobox_1:destroy(); self.Intuition_resistance_combobox_1 = nil; end;
        if self.Control_3_1 ~= nil then self.Control_3_1:destroy(); self.Control_3_1 = nil; end;
        if self.richEdit8 ~= nil then self.richEdit8:destroy(); self.richEdit8 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.Hide_1_1 ~= nil then self.Hide_1_1:destroy(); self.Hide_1_1 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.Sense_2_1 ~= nil then self.Sense_2_1:destroy(); self.Sense_2_1 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.Move_1_1 ~= nil then self.Move_1_1:destroy(); self.Move_1_1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.Intuition_resistance_combobox_3 ~= nil then self.Intuition_resistance_combobox_3:destroy(); self.Intuition_resistance_combobox_3 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.Read_1_1 ~= nil then self.Read_1_1:destroy(); self.Read_1_1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.Survey_1_1 ~= nil then self.Survey_1_1:destroy(); self.Survey_1_1 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.Sense_3_1 ~= nil then self.Sense_3_1:destroy(); self.Sense_3_1 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.Cunning_resistance_combobox_2 ~= nil then self.Cunning_resistance_combobox_2:destroy(); self.Cunning_resistance_combobox_2 = nil; end;
        if self.Read_2_1 ~= nil then self.Read_2_1:destroy(); self.Read_2_1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.Survey_3_1 ~= nil then self.Survey_3_1:destroy(); self.Survey_3_1 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.Question_popup ~= nil then self.Question_popup:destroy(); self.Question_popup = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.Nerve_resistance_combobox_2 ~= nil then self.Nerve_resistance_combobox_2:destroy(); self.Nerve_resistance_combobox_2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.Sense_1_1 ~= nil then self.Sense_1_1:destroy(); self.Sense_1_1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.Style_popup ~= nil then self.Style_popup:destroy(); self.Style_popup = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.Circle_popup ~= nil then self.Circle_popup:destroy(); self.Circle_popup = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.Read_3_1 ~= nil then self.Read_3_1:destroy(); self.Read_3_1 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.Cunning_resistance_combobox_1 ~= nil then self.Cunning_resistance_combobox_1:destroy(); self.Cunning_resistance_combobox_1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.Intuition_resistance_combobox_2 ~= nil then self.Intuition_resistance_combobox_2:destroy(); self.Intuition_resistance_combobox_2 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.Move_3_1 ~= nil then self.Move_3_1:destroy(); self.Move_3_1 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.Survey_2_1 ~= nil then self.Survey_2_1:destroy(); self.Survey_2_1 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.Focus_3_1 ~= nil then self.Focus_3_1:destroy(); self.Focus_3_1 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.Focus_2_1 ~= nil then self.Focus_2_1:destroy(); self.Focus_2_1 = nil; end;
        if self.Sway_3_1 ~= nil then self.Sway_3_1:destroy(); self.Sway_3_1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.Nerve_resistance_combobox_1 ~= nil then self.Nerve_resistance_combobox_1:destroy(); self.Nerve_resistance_combobox_1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.Strike_3_1 ~= nil then self.Strike_3_1:destroy(); self.Strike_3_1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.Control_2_1 ~= nil then self.Control_2_1:destroy(); self.Control_2_1 = nil; end;
        if self.Sway_1_1 ~= nil then self.Sway_1_1:destroy(); self.Sway_1_1 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.Cunning_resistance_combobox_3 ~= nil then self.Cunning_resistance_combobox_3:destroy(); self.Cunning_resistance_combobox_3 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.Hide_3_1 ~= nil then self.Hide_3_1:destroy(); self.Hide_3_1 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.Hide_2_1 ~= nil then self.Hide_2_1:destroy(); self.Hide_2_1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newcandela_investigator()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_candela_investigator();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _candela_investigator = {
    newEditor = newcandela_investigator, 
    new = newcandela_investigator, 
    name = "candela_investigator", 
    dataType = "firecast.candela.obscura.investigator", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Ficha de Investigador", 
    description=""};

candela_investigator = _candela_investigator;
Firecast.registrarForm(_candela_investigator);
Firecast.registrarDataType(_candela_investigator);

return _candela_investigator;
