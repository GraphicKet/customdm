AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
include("shared.lua")
include("rounds.lua")
include("config.lua")

ftimer = {}

util.AddNetworkString("blackout")
util.AddNetworkString("changeteam")
util.AddNetworkString("TeamMenu")

function GM:PlayerInitialSpawn(ply)
   ply:SetTeam(TEAM_NONE)  
   ply:PrintMessage(HUD_PRINTTALK, "Press f2 to choose team" )
end

function GM:ShowTeam(caller)
   net.Start("TeamMenu")
   net.Send(caller)
end	

function GM:PlayerLoadout()
  if ply:Team() == TEAM_NONE then
     ply:SetWalkSpeed(0)
	 ply:SetRunSpeed(0)
  end
end

function GM:PlayerSpawn(ply)
    print( "You are on team "..ply:Team().." ("..team.GetName( ply:Team() )..")" )
end

function ftimer.restart(ply)
   timer.Simple(1.5, function() 
   for k, v in pairs(player.GetAll()) do
   net.Start("blackout")
   net.Send(v)
    end
   end)
   ftimer.Rebels = 0
   ftimer.Americans = 0
   ply:Spawn()
   game.CleanUpMap() 
end

net.Receive("changeteam", function(ply) 
local changetoteam = net.ReadString()

if changetoteam == "Americans" then
    ply:SetTeam(TEAM_AMERICAN)
elseif changetoteam == "Rebels" then
    ply:SetTeam(TEAM_REBEL)	 
   end	 
end)

hook.Add("PlayerDeath", "checkifsomeonereached limit", function()
   if ftimer.Rebels >= ftimer.FragLimit then
    for k, v in pairs(player.GetAll()) do
	 v:PrintMessage(HUD_PRINTCENTER, "Rebels won! New round in about 20 Seconds")
	 timer.Simple(5, function() ftimer.restart()  
	 for k, v in pairs(team.GetPlayers(TEAM_REBEL)) do
       	 v:PS_GivePoints(ftimer.winnerreward)
         end		 
	 end)
	 end
   elseif ftimer.Americans >= ftimer.FragLimit then
     for k, v in pairs(player.GetAll()) do
	   americanswon = true
	   v:PrintMessage(HUD_PRINTCENTER, "Americans won! New round in about 20 Seconds")
	   timer.Simple(3, function() ftimer.restart() 
         for k, v in pairs(team.GetPlayers(TEAM_AMERICAN)) do
       	     v:PS_GivePoints(ftimer.winnerreward)
         end	 
      	   end)
        end
   end
end
 

function GM:DoPlayerDeath( ply, attacker, dmginfo )

	ply:CreateRagdoll()
	
	ply:AddDeaths( 1 )
	
	if ( attacker:IsValid() && attacker:IsPlayer() ) then
	
		if ( attacker == ply ) then
			attacker:AddFrags( -1 )
		else
			attacker:AddFrags( 1 )
			attacker:PS_GivePoints(ftimer.givenpoint)
			if attacker:Team() == TEAM_AMERICAN then
			    ftimer.Americans = ftimer.Americans + 1
			elseif attacker:Team() == TEAM_REBEL then
			    ftimer.Rebels = ftimer.Rebels + 1
			end
		end
		
	end
	
end


---------Makes the hands visible--------------------

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end
----------Makes the hands visible end--------------------




