DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--

PLAYER.DisplayName = "Heavy Gunner"

PLAYER.StartArmor			= 50			-- How much armour we start with
PLAYER.StartHealth			= 100
PLAYER.DropWeaponOnDie		= true	-- Do we drop our weapon when we die
PLAYER.WalkSpeed 			= 80
PLAYER.RunSpeed				= 80


function PLAYER:Loadout()

	self.Player:Give( "fas2_rpk" ) -- Fas2 RPK for heavy gunners
	self.Player:Give( "fas2_m1911" ) -- default pistol (all classes)
	self.Player:Give( "fas2_dv2" ) -- default knife (all classes)
	
end

player_manager.RegisterClass( "player_heavygunner", PLAYER, "player_default" )
