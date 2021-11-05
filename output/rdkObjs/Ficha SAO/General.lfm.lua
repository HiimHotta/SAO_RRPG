require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGeneral()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

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
    obj:setName("frmGeneral");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setField("bgGeneral");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("bgGeneral");
    obj.dataLink1:setDefaultValue("");
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(1200);
    obj.layout1:setHeight(570);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(50);
    obj.rectangle1:setMargins({bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(300);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("Nome");
    obj.label1:setWidth(300);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTop(20);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setAlign("client");
    obj.image2:setField("classeIcon");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setName("image2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setText("Classe");
    obj.label2:setWidth(100);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTop(20);
    obj.edit2:setField("classe");
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setText("Especialização");
    obj.label3:setWidth(100);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTop(20);
    obj.edit3:setField("especializacao");
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(40);
    obj.layout5:setMargins({right=5});
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setText("Nível");
    obj.label4:setWidth(40);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTop(20);
    obj.edit4:setField("level");
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(100);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setText("Experiência");
    obj.label5:setWidth(100);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTop(20);
    obj.edit5:setField("exp");
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(150);
    obj.layout7:setMargins({right=5});
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setText("Job");
    obj.label6:setWidth(150);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setTop(20);
    obj.edit6:setField("job");
    obj.edit6:setWidth(150);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setHeight(305);
    obj.rectangle3:setMargins({bottom=5});
    obj.rectangle3:setName("rectangle3");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle3);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(220);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setMargins({top=5});
    obj.layout9:setName("layout9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1:setText("Acerto");
    obj.button1:setAlign("left");
    obj.button1:setWidth(100);
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setField("atr_ACEBase");
    obj.edit7:setLeft(105);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(25);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout9);
    obj.label7:setText("+");
    obj.label7:setLeft(135);
    obj.label7:setWidth(10);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setField("atr_ACEExtra");
    obj.edit8:setLeft(145);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setText("=");
    obj.label8:setLeft(175);
    obj.label8:setWidth(10);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout9);
    obj.rectangle4:setLeft(185);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setField("atr_ACETotal");
    obj.label9:setLeft(185);
    obj.label9:setWidth(30);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout8);
    obj.dataLink2:setFields({'atr_ACEBase','atr_ACEExtra'});
    obj.dataLink2:setName("dataLink2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setMargins({top=5});
    obj.layout10:setName("layout10");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout10);
    obj.button2:setText("Agilidade");
    obj.button2:setAlign("left");
    obj.button2:setWidth(100);
    obj.button2:setHorzTextAlign("center");
    obj.button2:setName("button2");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setField("atr_AGIBase");
    obj.edit9:setLeft(105);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout10);
    obj.label10:setText("+");
    obj.label10:setLeft(135);
    obj.label10:setWidth(10);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setField("atr_AGIExtra");
    obj.edit10:setLeft(145);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout10);
    obj.label11:setText("=");
    obj.label11:setLeft(175);
    obj.label11:setWidth(10);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setLeft(185);
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setField("atr_AGITotal");
    obj.label12:setLeft(185);
    obj.label12:setWidth(30);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout8);
    obj.dataLink3:setFields({'atr_AGIBase','atr_AGIExtra'});
    obj.dataLink3:setName("dataLink3");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setMargins({top=5});
    obj.layout11:setName("layout11");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout11);
    obj.button3:setText("Força");
    obj.button3:setAlign("left");
    obj.button3:setWidth(100);
    obj.button3:setHorzTextAlign("center");
    obj.button3:setName("button3");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setField("atr_FORBase");
    obj.edit11:setLeft(105);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setText("+");
    obj.label13:setLeft(135);
    obj.label13:setWidth(10);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout11);
    obj.edit12:setField("atr_FORExtra");
    obj.edit12:setLeft(145);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setText("=");
    obj.label14:setLeft(175);
    obj.label14:setWidth(10);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout11);
    obj.rectangle6:setLeft(185);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout11);
    obj.label15:setField("atr_FORTotal");
    obj.label15:setLeft(185);
    obj.label15:setWidth(30);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout8);
    obj.dataLink4:setFields({'atr_FORBase','atr_FORExtra'});
    obj.dataLink4:setName("dataLink4");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({top=5});
    obj.layout12:setName("layout12");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout12);
    obj.button4:setText("Vitalidade");
    obj.button4:setAlign("left");
    obj.button4:setWidth(100);
    obj.button4:setHorzTextAlign("center");
    obj.button4:setName("button4");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout12);
    obj.edit13:setField("atr_VITBase");
    obj.edit13:setLeft(105);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setText("+");
    obj.label16:setLeft(135);
    obj.label16:setWidth(10);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout12);
    obj.edit14:setField("atr_VITExtra");
    obj.edit14:setLeft(145);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17:setText("=");
    obj.label17:setLeft(175);
    obj.label17:setWidth(10);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout12);
    obj.rectangle7:setLeft(185);
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout12);
    obj.label18:setField("atr_VITTotal");
    obj.label18:setLeft(185);
    obj.label18:setWidth(30);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout8);
    obj.dataLink5:setFields({'atr_VITBase','atr_VITExtra'});
    obj.dataLink5:setName("dataLink5");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle3);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(220);
    obj.layout13:setMargins({right=5});
    obj.layout13:setName("layout13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setMargins({top=5});
    obj.layout14:setName("layout14");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout14);
    obj.button5:setText("Carisma");
    obj.button5:setAlign("left");
    obj.button5:setWidth(100);
    obj.button5:setHorzTextAlign("center");
    obj.button5:setName("button5");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setField("atr_CARBase");
    obj.edit15:setLeft(105);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setText("+");
    obj.label19:setLeft(135);
    obj.label19:setWidth(10);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setField("atr_CARExtra");
    obj.edit16:setLeft(145);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setText("=");
    obj.label20:setLeft(175);
    obj.label20:setWidth(10);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout14);
    obj.rectangle8:setLeft(185);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout14);
    obj.label21:setField("atr_CARTotal");
    obj.label21:setLeft(185);
    obj.label21:setWidth(30);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout13);
    obj.dataLink6:setFields({'atr_CARBase','atr_CARExtra'});
    obj.dataLink6:setName("dataLink6");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setMargins({top=5});
    obj.layout15:setName("layout15");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout15);
    obj.button6:setText("Inteligência");
    obj.button6:setAlign("left");
    obj.button6:setWidth(100);
    obj.button6:setHorzTextAlign("center");
    obj.button6:setName("button6");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setField("atr_INTBase");
    obj.edit17:setLeft(105);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout15);
    obj.label22:setText("+");
    obj.label22:setLeft(135);
    obj.label22:setWidth(10);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setField("atr_INTExtra");
    obj.edit18:setLeft(145);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout15);
    obj.label23:setText("=");
    obj.label23:setLeft(175);
    obj.label23:setWidth(10);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout15);
    obj.rectangle9:setLeft(185);
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout15);
    obj.label24:setField("atr_INTTotal");
    obj.label24:setLeft(185);
    obj.label24:setWidth(30);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout13);
    obj.dataLink7:setFields({'atr_INTBase','atr_INTExtra'});
    obj.dataLink7:setName("dataLink7");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout13);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setMargins({top=5});
    obj.layout16:setName("layout16");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout16);
    obj.button7:setText("Percepção");
    obj.button7:setAlign("left");
    obj.button7:setWidth(100);
    obj.button7:setHorzTextAlign("center");
    obj.button7:setName("button7");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout16);
    obj.edit19:setField("atr_PERBase");
    obj.edit19:setLeft(105);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout16);
    obj.label25:setText("+");
    obj.label25:setLeft(135);
    obj.label25:setWidth(10);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setField("atr_PERExtra");
    obj.edit20:setLeft(145);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout16);
    obj.label26:setText("=");
    obj.label26:setLeft(175);
    obj.label26:setWidth(10);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout16);
    obj.rectangle10:setLeft(185);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout16);
    obj.label27:setField("atr_PERTotal");
    obj.label27:setLeft(185);
    obj.label27:setWidth(30);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout13);
    obj.dataLink8:setFields({'atr_PERBase','atr_PERExtra'});
    obj.dataLink8:setName("dataLink8");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout13);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setMargins({top=5});
    obj.layout17:setName("layout17");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout17);
    obj.button8:setText("Precisão");
    obj.button8:setAlign("left");
    obj.button8:setWidth(100);
    obj.button8:setHorzTextAlign("center");
    obj.button8:setName("button8");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout17);
    obj.edit21:setField("atr_PREBase");
    obj.edit21:setLeft(105);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout17);
    obj.label28:setText("+");
    obj.label28:setLeft(135);
    obj.label28:setWidth(10);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setField("atr_PREExtra");
    obj.edit22:setLeft(145);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout17);
    obj.label29:setText("=");
    obj.label29:setLeft(175);
    obj.label29:setWidth(10);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setLeft(185);
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout17);
    obj.label30:setField("atr_PRETotal");
    obj.label30:setLeft(185);
    obj.label30:setWidth(30);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout13);
    obj.dataLink9:setFields({'atr_PREBase','atr_PREExtra'});
    obj.dataLink9:setName("dataLink9");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle3);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(270);
    obj.layout18:setMargins({right=5});
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setMargins({bottom=5, top=5});
    obj.layout19:setName("layout19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(75);
    obj.layout20:setMargins({right=5});
    obj.layout20:setName("layout20");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout20);
    obj.label31:setText("HP");
    obj.label31:setWidth(20);
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setName("label31");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout20);
    obj.edit23:setLeft(25);
    obj.edit23:setField("hp");
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setName("edit23");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(75);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout21);
    obj.label32:setText("SP");
    obj.label32:setWidth(20);
    obj.label32:setHorzTextAlign("leading");
    obj.label32:setName("label32");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout21);
    obj.edit24:setLeft(25);
    obj.edit24:setField("sp");
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setName("edit24");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout18);
    obj.label33:setText("BÔNUS");
    obj.label33:setAlign("top");
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout18);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(50);
    obj.layout22:setMargins({bottom=5});
    obj.layout22:setName("layout22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(50);
    obj.layout23:setMargins({right=5});
    obj.layout23:setName("layout23");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout23);
    obj.button9:setText("Esquiva");
    obj.button9:setWidth(50);
    obj.button9:setHorzTextAlign("center");
    obj.button9:setHeight(20);
    obj.button9:setFontSize(12);
    obj.button9:setName("button9");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout23);
    obj.edit25:setTop(20);
    obj.edit25:setField("bonus_esquiva");
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setName("edit25");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout22);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(45);
    obj.layout24:setMargins({right=5});
    obj.layout24:setName("layout24");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout24);
    obj.label34:setText("TESTE");
    obj.label34:setWidth(45);
    obj.label34:setHorzTextAlign("leading");
    obj.label34:setFontSize(12);
    obj.label34:setName("label34");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout24);
    obj.edit26:setTop(20);
    obj.edit26:setField("bonus_forca");
    obj.edit26:setWidth(45);
    obj.edit26:setHeight(25);
    obj.edit26:setName("edit26");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout18);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(175);
    obj.layout25:setMargins({bottom=5, top=5});
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setMargins({bottom=5});
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(220);
    obj.layout27:setMargins({right=5});
    obj.layout27:setName("layout27");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout27);
    obj.label35:setText("Def. Equipamento");
    obj.label35:setWidth(100);
    obj.label35:setHorzTextAlign("leading");
    obj.label35:setFontSize(11);
    obj.label35:setName("label35");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setLeft(105);
    obj.edit27:setField("def_equipamento");
    obj.edit27:setWidth(100);
    obj.edit27:setHeight(25);
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setMargins({bottom=5});
    obj.layout28:setName("layout28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(220);
    obj.layout29:setMargins({right=5});
    obj.layout29:setName("layout29");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout29);
    obj.label36:setText("Tenacidade");
    obj.label36:setWidth(100);
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setFontSize(13);
    obj.label36:setName("label36");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout29);
    obj.edit28:setLeft(105);
    obj.edit28:setField("R_intensidade");
    obj.edit28:setWidth(100);
    obj.edit28:setHeight(25);
    obj.edit28:setName("edit28");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout25);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({bottom=5});
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(220);
    obj.layout31:setMargins({right=5});
    obj.layout31:setName("layout31");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout31);
    obj.label37:setText("Proteção Física");
    obj.label37:setWidth(100);
    obj.label37:setHorzTextAlign("leading");
    obj.label37:setFontSize(13);
    obj.label37:setName("label37");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout31);
    obj.edit29:setLeft(105);
    obj.edit29:setField("def_total");
    obj.edit29:setWidth(100);
    obj.edit29:setHeight(25);
    obj.edit29:setName("edit29");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout25);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setMargins({bottom=0});
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(220);
    obj.layout33:setMargins({right=5});
    obj.layout33:setName("layout33");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout33);
    obj.label38:setText("Resistências");
    obj.label38:setWidth(100);
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout33);
    obj.edit30:setLeft(105);
    obj.edit30:setField("def_resistencias");
    obj.edit30:setWidth(100);
    obj.edit30:setHeight(25);
    obj.edit30:setName("edit30");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout25);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setMargins({top=0});
    obj.layout34:setName("layout34");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout34);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(190);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setField("doubleRoll");
    obj.checkBox1:setText("Usar dois atributos na rolagem.");
    obj.checkBox1:setFontSize(12);
    obj.checkBox1:setHint("Clique no primeiro e depois no segundo. ");
    obj.checkBox1:setName("checkBox1");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle3);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(220);
    obj.layout35:setMargins({right=5, top=5});
    obj.layout35:setName("layout35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(50);
    obj.layout36:setMargins({bottom=5});
    obj.layout36:setName("layout36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout35);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(50);
    obj.layout37:setMargins({bottom=5});
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout35);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(150);
    obj.layout38:setMargins({bottom=5, top=5});
    obj.layout38:setName("layout38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setMargins({bottom=5});
    obj.layout39:setName("layout39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout39);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(220);
    obj.layout40:setMargins({right=5});
    obj.layout40:setName("layout40");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout40);
    obj.label39:setText("Critico");
    obj.label39:setWidth(100);
    obj.label39:setHorzTextAlign("leading");
    obj.label39:setFontSize(13);
    obj.label39:setName("label39");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout40);
    obj.edit31:setLeft(105);
    obj.edit31:setField("critico");
    obj.edit31:setWidth(100);
    obj.edit31:setHeight(25);
    obj.edit31:setName("edit31");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout38);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setMargins({bottom=5});
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(220);
    obj.layout42:setMargins({right=5});
    obj.layout42:setName("layout42");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout42);
    obj.label40:setText("Esquiva Perfeita");
    obj.label40:setWidth(100);
    obj.label40:setHorzTextAlign("leading");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout42);
    obj.edit32:setLeft(105);
    obj.edit32:setField("esquiva_perfeita");
    obj.edit32:setWidth(100);
    obj.edit32:setHeight(25);
    obj.edit32:setName("edit32");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout38);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setMargins({bottom=5});
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(220);
    obj.layout44:setMargins({right=5});
    obj.layout44:setName("layout44");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout44);
    obj.label41:setText("Resiliência");
    obj.label41:setWidth(100);
    obj.label41:setHorzTextAlign("leading");
    obj.label41:setFontSize(13);
    obj.label41:setName("label41");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout44);
    obj.edit33:setLeft(105);
    obj.edit33:setField("dma");
    obj.edit33:setWidth(100);
    obj.edit33:setHeight(25);
    obj.edit33:setName("edit33");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout38);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setMargins({bottom=5});
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(220);
    obj.layout46:setMargins({right=5});
    obj.layout46:setName("layout46");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout46);
    obj.label42:setText("Pontos de Ação (AP)");
    obj.label42:setWidth(100);
    obj.label42:setHorzTextAlign("leading");
    obj.label42:setFontSize(11);
    obj.label42:setName("label42");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout46);
    obj.edit34:setLeft(105);
    obj.edit34:setField("ap");
    obj.edit34:setWidth(100);
    obj.edit34:setHeight(25);
    obj.edit34:setName("edit34");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle3);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(220);
    obj.layout47:setMargins({right=5});
    obj.layout47:setName("layout47");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout47);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(50);
    obj.rectangle12:setWidth(200);
    obj.rectangle12:setHeight(200);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle12);
    obj.label43:setLeft(0);
    obj.label43:setTop(40);
    obj.label43:setWidth(200);
    obj.label43:setHeight(20);
    obj.label43:setText("Avatar");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle12);
    obj.image3:setAlign("client");
    obj.image3:setField("avatar");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image3:setName("image3");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout1);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(200);
    obj.rectangle13:setMargins({bottom=5});
    obj.rectangle13:setName("rectangle13");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle13);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(500);
    obj.layout48:setMargins({right=5});
    obj.layout48:setName("layout48");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout48);
    obj.label44:setText("DESCRIÇÃO FÍSICA");
    obj.label44:setAlign("top");
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout48);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setField("vantagens");
    obj.textEditor1:setName("textEditor1");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle13);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(500);
    obj.layout49:setMargins({right=5});
    obj.layout49:setName("layout49");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout49);
    obj.label45:setText("DESCRIÇÃO MENTAL/PERSONALIDADE");
    obj.label45:setAlign("top");
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout49);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setField("desvantagens");
    obj.textEditor2:setName("textEditor2");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle13);
    obj.image4:setLeft(1010);
    obj.image4:setTop(25);
    obj.image4:setWidth(190);
    obj.image4:setHeight(116);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/Ficha SAO/images/sao_b.jpg");
    obj.image4:setName("image4");

    obj._e_event0 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.classeIcon);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_ACETotal) or 0;
            						sheet.firstValueName = "Acerto";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_ACETotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_ACETotal = 	(tonumber(sheet.atr_ACEBase) or 0) + 
            											(tonumber(sheet.atr_ACEExtra) or 0);
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_AGITotal) or 0;
            						sheet.firstValueName = "Agilidade";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_AGITotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_AGITotal = 	(tonumber(sheet.atr_AGIBase) or 0) + 
            											(tonumber(sheet.atr_AGIExtra) or 0);
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_FORTotal) or 0;
            						sheet.firstValueName = "Força";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_FORTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_FORTotal = 	(tonumber(sheet.atr_FORBase) or 0) + 
            											(tonumber(sheet.atr_FORExtra) or 0);
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_VITTotal) or 0;
            						sheet.firstValueName = "Vitalidade";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_VITTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_VITTotal = 	(tonumber(sheet.atr_VITBase) or 0) + 
            											(tonumber(sheet.atr_VITExtra) or 0);
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_CARTotal) or 0;
            						sheet.firstValueName = "Carisma";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_CARTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event10 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_CARTotal = 	(tonumber(sheet.atr_CARBase) or 0) + 
            											(tonumber(sheet.atr_CARExtra) or 0);
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_INTTotal) or 0;
            						sheet.firstValueName = "Inteligência";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_INTTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event12 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_INTTotal = 	(tonumber(sheet.atr_INTBase) or 0) + 
            											(tonumber(sheet.atr_INTExtra) or 0);
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_PERTotal) or 0;
            						sheet.firstValueName = "Percepção";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_PERTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event14 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_PERTotal = 	(tonumber(sheet.atr_PERBase) or 0) + 
            											(tonumber(sheet.atr_PERExtra) or 0);
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or 0;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_PRETotal) or 0;
            						sheet.firstValueName = "Precisão";
            						return;
            					end;
            
            					local atr = tonumber(sheet.atr_PRETotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = 0;
            					end;
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            					
            							dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            
            				        					local rolagem = rrpg.interpretarRolagem(dados .. "d20 + " .. extra .. " + " .. atr); 
            
            				        					mesa.activeChat:rolarDados(rolagem, msg);
            
                                        end);
            
                                      
            				    end);
        end, obj);

    obj._e_event16 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_PRETotal = 	(tonumber(sheet.atr_PREBase) or 0) + 
            											(tonumber(sheet.atr_PREExtra) or 0);
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (_)
            local firstValue = tonumber(sheet.firstValue) or -1;
            									if (sheet.doubleRoll and firstValue < 0) then
            										sheet.firstValue = tonumber(sheet.bonus_esquiva) or 0;
            										sheet.firstValueName = "Esquiva";
            										return;
            									end;
            									local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            									local atr = tonumber(sheet.bonus_esquiva) or 0;
            									if (sheet.doubleRoll) then
            										 atr = atr + firstValue;
            										 sheet.firstValue = -1;
            									end;
            
            									atr = math.min(80, atr);
            									atr = math.max(1, atr);
            
            									local faces = faceTable[atr];
            
            									local mesa = rrpg.getMesaDe(sheet);
            
            									local sucessos = 0;
            									local falhas = 0;
            									local decisivo = 0;
            									local falhaCritica = 0;
            
            									dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            								        function (valorPreenchido)
            								        	local dados = tonumber(valorPreenchido) or 1;
            								        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            											
            											dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            								        		function (valorPreenchido)
            								        			local margem = tonumber(valorPreenchido) or 1;
            								        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            								        				function (valorPreenchido)
            								        					local extra = (tonumber(valorPreenchido) or 0);
            								        					local msg = "Teste de Esquiva" .. ", margem de critico " .. margem;
            								        					if (firstValue > -1) then
            								        						msg = "Teste de Esquiva + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            								        					end;
            								        					if extra > 0 then
            								        						msg = msg .. ", +" .. extra .. " penalidade.";
            								        					elseif extra < 0 then
            								        						msg = msg .. ", " .. extra .. " bônus.";
            								        					end;
            								                        	mesa.activeChat:rolarDados(rolagem, msg,
            								                                function (rolado)
            								                                	local op = rolado.ops[2];
            						 
            																	for j=1, #op.resultados, 1 do
            																	    local result = op.resultados[j] + extra;
            
            																	    if result <= atr then
            																	        sucessos = sucessos +1;
            																	    else
            																	        falhas = falhas +1;
            																	    end;
            																	    if result <= margem then
            																	        decisivo = decisivo +1;
            																	    end;
            																	    if result == faces then
            																	        falhaCritica = falhaCritica +1;
            																	    end;
            																	end;
            
            																	local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            						 
            																	if decisivo > 0 then
            																	    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            																	end;
            																	if falhaCritica > 0 then
            																	    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            																	end;
            
            																	mesa.activeChat:enviarMensagem(txt);
            								                                end);
            							                    end);
            				                            end);
            								        end);
        end, obj);

    obj._e_event18 = obj.checkBox1:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            									sheet.firstValue = -1;
            									sheet.firstValueName = nil;
        end, obj);

    obj._e_event19 = obj.image3:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGeneral()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGeneral();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGeneral = {
    newEditor = newfrmGeneral, 
    new = newfrmGeneral, 
    name = "frmGeneral", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneral = _frmGeneral;
Firecast.registrarForm(_frmGeneral);

return _frmGeneral;
