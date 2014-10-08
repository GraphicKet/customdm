team.SetUp(TEAM_NONE, "None", Color(255, 0, 0, 255))

team.SetUp(TEAM_AMERICAN, "American", Color(0, 255, 0, 255))
team.SetUp(TEAM_REBEL, "Rebel", Color(255, 0, 0, 255))

for k, v in pairs(file.Find("player.clases/*.lua") do 
include("player_classes/" .. v) 
end


GM.Name         = "Custom dm"
GM.Author       = "Ubermacht"
GM.Contact      = "http://steamcommunity.com/id/MJazz"
GM.Website      = ""

