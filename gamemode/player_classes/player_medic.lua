DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "Medic"

PLAYER.StartArmor			= 10			-- How much armour we start with
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 120
PLAYER.RunSpeed				= 160


function PLAYER:Loadout()

	self.Player:Give( "fas2_ifak" ) -- Fas2 medikit
	self.Player:Give( "fas2_m1911" ) -- default pistol (all classes)
	self.Player:Give( "fas2_dv2" ) -- default knife (all classes)
	
end

player_manager.RegisterClass( "player_medic", PLAYER, "player_default" )
