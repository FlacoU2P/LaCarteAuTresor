/*
	La Carte Au Tresor
*/
diag_log "Début d'initialisation de la mission.";

EAST setFriend [WEST, 1];
EAST setFriend [RESISTANCE, 1];
EAST setFriend [CIVILIAN, 1];
RESISTANCE setFriend [WEST, 1];
RESISTANCE setFriend [EAST, 1];
RESISTANCE setFriend [CIVILIAN, 1];
CIVILIAN setFriend [WEST, 1];
CIVILIAN setFriend [EAST, 1];
CIVILIAN setFriend [RESISTANCE, 1];
WEST setFriend [EAST, 1];
WEST setFriend [RESISTANCE, 1];
WEST setFriend [CIVILIAN, 1];


	
if (getNumber (missionconfigFile >> "Config_Master" >> "meteo") isequalTo 1) then {[] execVM "addons\real_weather.sqf"};
if (getNumber (missionconfigFile >> "Config_Master" >> "stamina") isequalTo 1) then {player enableFatigue false;};
if (getNumber (missionconfigFile >> "Config_Master" >> "welcome") isequalTo 1) then {[] call LCAT_fnc_welcome};
if (getNumber (missionconfigFile >> "Config_Master" >> "watermark") isequalTo 1) then {[] call LCAT_fnc_logo};

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call LCAT_fnc_spaceInterrupt"];

diag_log "Fin d'initialisation de la mission.";