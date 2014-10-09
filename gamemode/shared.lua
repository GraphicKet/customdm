TEAM_NONE = 1
TEAM_AMERICAN = 2
TEAM_REBEL = 3


team.SetUp(TEAM_NONE, "None", Color(255, 0, 0, 255))
team.SetUp(TEAM_AMERICAN, "American", Color(0, 255, 0, 255))
team.SetUp(TEAM_REBEL, "Rebel", Color(255, 0, 0, 255))

for k, v in pairs(file.Find("player_classes/*.lua")) do 
include("player_classes/" .. v) 
end


GM.Name = "Modern Combat DEV"
GM.Author = "By GraphicKet/Ubermacht and Thalexs"
GM.Contact = "http://steamcommunity.com/id/MJazz"
GM.Version = "0.1"

local nonedropableweapons = {
 ["weapon_fists"] = true,
}

function GM:PlayerButtonDown(ply, key)
local curweapon = ply:GetActiveWeapon()
 if(key == KEY_Q) then 
      if nonedropableweapons[ply:GetActiveWeapon():GetClass()] then return end 
	  if not IsValid(ply:GetActiveWeapon()) then return end
      if SERVER then
	  timer.Simple(0.01, function() ply:DropWeapon(curweapon) end)
	  end
   end
end
