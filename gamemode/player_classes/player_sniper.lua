DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "Sniper"

PLAYER.StartArmor			= 50		-- How much armour we start with
PLAYER.StartHealth			= 50
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 100
PLAYER.RunSpeed				= 130


function PLAYER:Loadout()

	self.Player:Give( "fas2_m24" ) -- sniper
	self.Player:Give( "fas2_m1911" ) -- default pistol (all classes)
	self.Player:Give( "fas2_dv2" ) -- default knife (all classes)
	
end

player_manager.RegisterClass( "player_sniper", PLAYER, "player_default" )
