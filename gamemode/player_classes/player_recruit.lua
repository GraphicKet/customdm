DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "Recruit"

PLAYER.StartArmor			= 50			-- How much armour we start with
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 100
PLAYER.RunSpeed				= 130


function PLAYER:Loadout()

	self.Player:Give( "fas2_m1911" )
	self.Player:Give( "fas2_dv2" )
	
end

player_manager.RegisterClass( "player_recruit", PLAYER, "player_default" )
