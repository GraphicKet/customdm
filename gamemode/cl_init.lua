include("shared.lua")

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
	 icon:SetModel( "models/player/Group01/Male_01.mdl" ) -- you can only change colors on playermodels
     function icon:OnMousePressed(ply)
	    if MOUSE_LEFT then
	         net.Start("changeteam")
	            net.WriteString("Rebels")
	        net.SendToServer()
	        Panel:Close()
	  end 
	 end 
     
	
	local vs = vgui.Create("DLabel", Panel)
    vs:SetPos(10,1) // Position
    vs:SetColor(Color(255,255,255,255)) // Color
    vs:SetFont("default")
    vs:SetText("VS") // Text
    vs:SetSize(90, 90) // make the control the same size as the text.
 
	
	 
	 --function icon:LayoutEntity( Entity ) return end -- disables default rotation
     function icon.Entity:GetPlayerColor() return Vector ( 0, 0, 1 ) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

    local icon = vgui.Create( "DModelPanel", Panel )
     icon:SetSize( 350,280 )
	 icon:SetPos( 200, 110 )
	 icon:SetModel( "models/player/Group01/Male_01.mdl" ) -- you can only change colors on playermodels
     function icon:OnMousePressed(ply)
	  if MOUSE_LEFT then
	        net.Start("changeteam")
	            net.WriteString("Americans")
	        net.SendToServer()
	        Panel:Close()
	   end 
	 end 
	 
	 
	-- function icon:LayoutEntity( Entity ) return end -- disables default rotation
     function icon.Entity:GetPlayerColor() return Vector ( 1, 0, 0 ) end 

end
net.Receive("TeamMenu", MyMenu) 

function GM:PostDrawViewModel( vm, ply, weapon )

	if ( weapon.UseHands || !weapon:IsScripted() ) then

		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end

	end

end
