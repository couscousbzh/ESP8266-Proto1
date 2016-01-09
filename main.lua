--Proto 
--Created @ 2016-01-08 by Yann Vasseur
--Site:  http://reactor.fr
--For ESP12E Dev kit

-- Config
local modeStation = false;
local SSID = "Livebox-AC8E"
local WIFIKEY = "Enter your key here"
local pinOnboardLed1 = 0;
local pinOnboardLed2 = 4;

-- ****************
-- * MAIN PROGRAM *
-- ****************
print("******** Main - Proto 1 ********")

--Init
w = loadfile("webserver.lua")
w()

start_init = function()  
gpio.mode(pinOnboardLed1, gpio.OUTPUT);  
gpio.mode(pinOnboardLed2, gpio.OUTPUT);
gpio.write(pinOnboardLed1,gpio.LOW);  
gpio.write(pinOnboardLed2,gpio.LOW);  
D1_state=1;
D0_state=1;
end

--**** MODE AP
wifi.setmode(wifi.SOFTAP) 
local cfg={}
cfg.ssid="DoitWiFi";
cfg.pwd="12345678"
wifi.ap.config(cfg)

cfg={}
cfg.ip="192.168.2.111"
cfg.netmask="255.255.255.0"
cfg.gateway="192.168.2.1"
wifi.ap.setip(cfg)

httpserver()	
print('Server On')











