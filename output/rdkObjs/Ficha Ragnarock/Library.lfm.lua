require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLibrary()
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
    obj:setName("frmLibrary");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setField("bgLibrary");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.image1);
    obj.dataLink1:setField("bgLibrary");
    obj.dataLink1:setDefaultValue("");
    obj.dataLink1:setName("dataLink1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.image1);
    obj.button1:setAlign("top");
    obj.button1:setText("Novo");
    obj.button1:setHint("Adicionar");
    obj.button1:setMargins({bottom=10});
    obj.button1:setName("button1");

    obj.rclLibrary = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLibrary:setParent(obj.image1);
    obj.rclLibrary:setAlign("client");
    obj.rclLibrary:setName("rclLibrary");
    obj.rclLibrary:setField("listaLibrary");
    obj.rclLibrary:setTemplateForm("frmNPCForm");
    obj.rclLibrary:setLayout("horizontalTiles");
    obj.rclLibrary:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclLibrary:append();
        end, obj);

    obj._e_event1 = obj.rclLibrary:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            			        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rclLibrary ~= nil then self.rclLibrary:destroy(); self.rclLibrary = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLibrary()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLibrary();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLibrary = {
    newEditor = newfrmLibrary, 
    new = newfrmLibrary, 
    name = "frmLibrary", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLibrary = _frmLibrary;
Firecast.registrarForm(_frmLibrary);

return _frmLibrary;
