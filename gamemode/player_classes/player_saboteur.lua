DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "Saboteur"

PLAYER.StartArmor			= 30		-- How much armour we start with
PLAYER.StartHealth			= 70
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 100
PLAYER.RunSpeed				= 130


function PLAYER:Loadout()

	self.Player:Give( "fas2_m79" ) -- grenade launcher
	self.Player:Give( "fas2_m1911" ) -- default pistol (all classes)
	self.Player:Give( "fas2_dv2" ) -- default knife (all classes)
	
end

player_manager.RegisterClass( "player_saboteur", PLAYER, "player_default" )
