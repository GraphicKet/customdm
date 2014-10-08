DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "American General"

PLAYER.StartArmor			= 0			-- How much armour we start with
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 200
PLAYER.RunSpeed				= 400


function PLAYER:Loadout()

	
end

player_manager.RegisterClass( "player_general", PLAYER, "player_default" )