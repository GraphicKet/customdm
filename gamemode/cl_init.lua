include("shared.lua")
include("config.lua")


local displayamericanmodels = {
	"models/player/Group01/Male_01.mdl",
	"models/player/Group01/Male_04.mdl",
	"models/player/Group01/Male_07.mdl",
	"models/player/Group01/Male_09.mdl",
	"models/player/Group01/Female_01.mdl",
	"models/player/Group01/Female_02.mdl",
	"models/player/Group01/Female_03.mdl",
	"models/player/Group01/Female_04.mdl",
}



--[[
function hidehud(name) -- Removing the default HUD
	for k, v in pairs({"CHudHealth", "CHudBattery"})do -- Will use it later.
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud", hidehud)]]

net.Receive("blackout", function()
       local blackout = vgui.Create("DFrame")
	         blackout:SetSize(ScrW(), ScrH())
			 blackout:SetDraggable(true)
			 blackout:ShowCloseButton(false)
			 blackout:SetVisible(true)
			 blackout:MakePopup()
			 blackout.Paint = function()
			    draw.RoundedBox(0, 0, 0,blackout:GetWide(), blackout:GetTall(), Color(0, 0, 0, 0))
			 end
	   timer.Simple(blackout_time, function() blackout:Close() end)		 
end)

local function MyMenu(ply)
  
   local Panel = vgui.Create( "DFrame" )
   Panel:SetPos(330, 135)                         --Panel:Center()
   Panel:SetTitle("Choose team")
   Panel:SetSize( 545, 450 )
   Panel:ShowCloseButton(true)
   Panel:SetVisible(true)
   Panel:SetDraggable(false) 
   Panel:MakePopup() 
   
   Panel.Paint = function()
	draw.RoundedBox( 8, 0, 0, Panel:GetWide(), Panel:GetTall(), Color( 40, 40, 40, 150 ) )
end
	
   local icon = vgui.Create( "DModelPanel", Panel )
     icon:SetSize( 350, 280 )
	 icon:SetPos( 0, 110 )
	 icon:SetModel(table.Random(displayamericanmodels)) -- you can only change colors on playermodels
	 function icon.Entity:GetPlayerColor() return Vector ( 1, 0, 0 ) end 
     function icon:OnMousePressed(ply)
	    if MOUSE_LEFT then
	        RunConsoleCommand("changetorebel")
	        Panel:Close()
	  end 
	 end 
     
	
local vs = vgui.Create("DLabel", Panel)
      vs:SetColor(Color(255,255,255,255)) // Color
      vs:SetFont("default")
      vs:SetText("VS") // Text
      vs:SetSize(90, 90) // make the control the same size as the text.
      vs:Center()
 
	
	 


    local icons = vgui.Create( "DModelPanel", Panel )
     icons:SetSize( 350,280 )
	 icons:SetPos( 200, 110 )
	 icons:SetModel(table.Random(displayamericanmodels)) 
	 function icons.Entity:GetPlayerColor() return Vector ( 0, 0, 1 ) end 	
     function icons:OnMousePressed(ply)
	  if MOUSE_LEFT then
	        RunConsoleCommand("changetorebel")
	        Panel:Close()
	   end 
	 end 
end
net.Receive("TeamMenu", MyMenu) 

function GM:PostDrawViewModel( vm, ply, weapon )

	if ( weapon.UseHands || !weapon:IsScripted() ) then

		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end

	end

end
