DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "Scout"

PLAYER.StartArmor			= 0			-- How much armour we start with
PLAYER.StartHealth			= 70
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 200
PLAYER.RunSpeed				= 200


function PLAYER:Loadout()

	self.Player:Give( "fas2_mp5a5" ) -- scouts gun (submachinegun)
	self.Player:Give( "fas2_m1911" ) -- default pistol (all classes)
	self.Player:Give( "fas2_dv2" ) -- default knife (all classes)
	
end

player_manager.RegisterClass( "player_scout", PLAYER, "player_default" )
