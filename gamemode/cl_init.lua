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