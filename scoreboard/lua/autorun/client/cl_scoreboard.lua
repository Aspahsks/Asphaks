
--Scorboard V1--

--------------Pour me contacter et me soutenire-----------------

--/Mon Discord : Aspahsk #5696
--/Ma Chaine Youtube : https://www.youtube.com/channel/UCWV5S5Owd2s3-7wRSrvSs9g

-----------------------------------------------------------------

hook.Add("ScoreboardShow","ScoreboardOpen", function()

--------------Font----------------------------------------------

surface.CreateFont( "font1", {
    font = "Arial", 
    extended = false,
    size = 30,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})
---------------------------------------------------------------

--------------------Scoreboard---------------------------------

scoreboard = vgui.Create("DFrame")

scoreboard:SetSize(1200,900)
scoreboard:Center()
scoreboard:SetTitle("")
scoreboard:SetVisible(true)
scoreboard:SetDraggable(false)
scoreboard:ShowCloseButton(false)
gui.EnableScreenClicker(true)

function scoreboard:Paint(w, h)
draw.RoundedBox(9,0,0,w,h,Color(0,0,0, 200) )
end
----------------------------------------------------------------

----------------------PanelListe--------------------------------
local PanelList = vgui.Create("DScrollPanel",scoreboard)

PanelList:SetTall(900)
PanelList:SetWide(1080)
PanelList:SetPos(55,25)
---------------------------------------------------------------

----------------------Scrollbar--------------------------------
local Scrollbar = PanelList:GetVBar()

function Scrollbar:Paint(w,h)
	draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
end 
function Scrollbar.btnUp:Paint(w,h)
	draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
end 
function Scrollbar.btnDown:Paint(w,h)
	draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
end 
function Scrollbar.btnGrip:Paint(w,h)
	draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
end 
---------------------------------------------------------------
for k, v in pairs(player.GetAll()) do
-----------------------ListPlayer------------------------------
local ListPlayer = vgui.Create("DScrollPanel",scoreboard)
ListPlayer:SetTall(80)
ListPlayer:SetWide(975)
ListPlayer:SetPos(60,25)
ListPlayer:Dock(TOP)

function ListPlayer:Paint()
    draw.RoundedBox(0,0,0, ListPlayer:GetWide(), ListPlayer:GetTall()-7, Color(0,0,0, 210))
end
----------------------------------------------------------------

----------------------Name--------------------------------------
local Name = vgui.Create("DLabel", ListPlayer)

Name:SetPos(100, 20)
Name:SetText(v:Name())
Name:SetFont("font1")
Name:SizeToContents()
----------------------------------------------------------------

---------------------SteamID-------------------------------------
local SteamID = vgui.Create("DLabel", ListPlayer)

SteamID:SetPos(300, 20)
SteamID:SetText(v:SteamID())
SteamID:SetFont("font1")
SteamID:SizeToContents()
-----------------------------------------------------------------

---------------------Ping-----------------------------------------
local Ping = vgui.Create("DLabel", ListPlayer)

Ping:SetPos(750,20)
Ping:SetText( v:Ping())
Ping:SetFont("font1")
Ping:SizeToContents()
------------------------------------------------------------------

--------------------Logo Steam------------------------------------
local Logo = vgui.Create("AvatarImage",ListPlayer)

Logo:SetPos(4,4)
Logo:SetSize(64,64)
Logo:SetPlayer(LocalPlayer(),64)
------------------------------------------------------------------

----------------Button Info---------------------------------------
local BInfo = vgui.Create( "DButton", ListPlayer )

BInfo:SetText( "Info" )
BInfo:SetTextColor( Color(255,255,255))
BInfo:SetFont("font1")				
BInfo:SetPos( 850, 15 )					
BInfo:SetSize( 150, 50 )

function BInfo:Paint()
    draw.RoundedBox(0,0,0, BInfo:GetWide(), BInfo:GetTall()-7, Color(255,0,34, 255))
end

BInfo.DoClick = function()				
    scoreboard:Close()
------------------------------------------------------------------

-----------------FrameInfo----------------------------------------
FrameInfo = vgui.Create ("DFrame")
                                                          
FrameInfo:SetSize(300,600)
FrameInfo:Center()
FrameInfo:SetTitle("")
FrameInfo:SetVisible(true)
FrameInfo:SetDraggable(false)
FrameInfo:ShowCloseButton(false)

function FrameInfo:Paint(w, h)
draw.RoundedBox(9,0,0,w,h,Color(0,0,0, 200) ) --21,67,96, 255
end
-------------------------------------------------------------------

---------------Button Kick-----------------------------------------
local kick = vgui.Create ("DButton", FrameInfo)

kick:SetPos(50, 60)
kick:SetTextColor( Color(0,0,0))
kick:SetSize(200,50)
kick:SetFont("font1")
kick:SetText("Kick")

function kick:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
 end   
    
kick.DoClick = function()
    RunConsoleCommand("ulx", "kick", v:Name())
end
---------------------------------------------------------------------

-------------Button Spectate-----------------------------------------
local Spectate = vgui.Create ("DButton", FrameInfo)

Spectate:SetPos(50, 120)
Spectate:SetTextColor( Color(0,0,0))
Spectate:SetSize(200,50)
Spectate:SetFont("font1")
Spectate:SetText("Spectate")

function Spectate:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
Spectate.DoClick = function()
    RunConsoleCommand("ulx", "Spectate", v:Name())
end
----------------------------------------------------------------------

--------------Button Ban----------------------------------------------
local ban = vgui.Create ("DButton", FrameInfo)

ban:SetPos(50, 180)
ban:SetTextColor( Color(0,0,0))
ban:SetSize(200,50)
ban:SetFont("font1")
ban:SetText("Ban")

function ban:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
ban.DoClick = function()
    RunConsoleCommand("ulx", "ban", v:Name())
end
----------------------------------------------------------------------

-----------Button Teleport--------------------------------------------
local teleport = vgui.Create ("DButton", FrameInfo)

teleport:SetPos(50, 240)
teleport:SetTextColor( Color(0,0,0))
teleport:SetSize(200,50)
teleport:SetFont("font1")
teleport:SetText("Teleport")

function teleport:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
teleport.DoClick = function()
    RunConsoleCommand("ulx", "teleport", v:Name())
end
----------------------------------------------------------------------

--------------Button Return-------------------------------------------
local Return = vgui.Create ("DButton", FrameInfo)

Return:SetPos(50, 300)
Return:SetTextColor( Color(0,0,0))
Return:SetSize(200,50)
Return:SetFont("font1")
Return:SetText("Return")

function Return:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
Return.DoClick = function()
    RunConsoleCommand("ulx", "Return", v:Name())
end
-----------------------------------------------------------------------

-------------------Button Goto-----------------------------------------
local Goto = vgui.Create ("DButton", FrameInfo)

Goto:SetPos(50, 360)
Goto:SetTextColor( Color(0,0,0))
Goto:SetSize(200,50)
Goto:SetFont("font1")
Goto:SetText("Goto")

function Goto:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
Goto.DoClick = function()
    RunConsoleCommand("ulx", "Goto", v:Name())
end
------------------------------------------------------------------------

----------------Button NoClip-------------------------------------------

local NoClip = vgui.Create ("DButton", FrameInfo)

NoClip:SetPos(50, 420)
NoClip:SetTextColor( Color(0,0,0))
NoClip:SetSize(200,50)
NoClip:SetFont("font1")
NoClip:SetText("NoClip")

function NoClip:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
NoClip.DoClick = function()
    RunConsoleCommand("ulx", "NoClip", v:Name())
end
-------------------------------------------------------------------------------

-------------------Button Freeze----------------------------------------------
local Freeze = vgui.Create ("DButton", FrameInfo)

Freeze:SetPos(50, 480)
Freeze:SetTextColor( Color(0,0,0))
Freeze:SetSize(200,50)
Freeze:SetFont("font1")
Freeze:SetText("Freeze")

function Freeze:Paint(w, h)
    draw.RoundedBox(0,0,0,w,h, Color(255,187,0, 255) ) --21,67,96, 255
end   
    
Freeze.DoClick = function()
    RunConsoleCommand("ulx", "Freeze", v:Name())
end
--------------------------------------------------------------------------------
end

PanelList:AddItem( ListPlayer )
end
end)
--------------------Quand le scorboard est fermé--------------------------------
hook.Add("ScoreboardHide","ScoreboardClose", function()
    gui.EnableScreenClicker(false)
   if IsValid(scoreboard) then scoreboard:Remove() end
   if IsValid(FrameInfo) then FrameInfo:Remove() end

end)

hook.Add("ScoreboardShow","defaultscoreboard", function()

return false

end)