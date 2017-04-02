// Imports
call compile preprocessFileLineNumbers 'Functions\Client\generic.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\respawn.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\elections.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\buildView.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\supply.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\missions.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\vehicleAcquisition.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\intelligence.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\roadblock.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\equipmentAcquisition.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\provinces.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\base.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\fob.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\hud.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\AIAcquisition.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\influence_renderer.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\territory.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\slingLoading.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\options.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\particle_ring.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\spot.sqf';
call compile preprocessFileLineNumbers 'Functions\Client\objective.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\generic.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\elections.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\supply.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\ai.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\base.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\fob.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\respawn.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\players.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\provinces.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\missions.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\roadblock.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\slingLoading.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\spot.sqf';
call compile preprocessFileLineNumbers 'Functions\Server\objective.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\generic.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\supply.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\territory.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\respawn.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\provinces.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\influence_map.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\missions.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\base.sqf';
call compile preprocessFileLineNumbers 'Functions\Common\loadout.sqf';
call compile preprocessFileLineNumbers 'constants.sqf';

// Serverside
if (isServer or isDedicated)
then
{
	diag_log 'Serverside scripting may be assessed from this point on.';
	augmentedPublicVariables = [];
	["totalBLUFORBasesCount", 0] call functionPublicVariableSetValue;
	["totalOPFORBasesCount", 0] call functionPublicVariableSetValue;
	["playerControlledBases", []] call functionPublicVariableSetValue;
	['knownBasesBLUFOR', []] call functionPublicVariableSetValue;
	['knownBasesOPFOR', []] call functionPublicVariableSetValue;
	["supplyRelayStations", []] call functionPublicVariableSetValue;
	["supplyNodes", []] call functionPublicVariableSetValue;
	["supplyPackages", []] call functionPublicVariableSetValue;
	["primaryBaseBLUFOR", objNull] call functionPublicVariableSetValue;
	["primaryBaseOPFOR", objNull] call functionPublicVariableSetValue;
	//["missions", []] call functionPublicVariableSetValue;
	["totalMissionsCount", 0] call functionPublicVariableSetValue;
	["mobileRespawnPoints", []] call functionPublicVariableSetValue;
	["totalMobileRespawnPointsCount", 0] call functionPublicVariableSetValue;
	["newSupplyRelayStationsPositions", []] call functionPublicVariableSetValue;
	["totalPositionedSupplyRelayStations", 0] call functionPublicVariableSetValue;
	["newRoadblockPositions", []] call functionPublicVariableSetValue;
	["totalPositionedRoadblocks", 0] call functionPublicVariableSetValue;
	["roadblocks", []] call functionPublicVariableSetValue;
	["totalRoadblocks", 0] call functionPublicVariableSetValue;
	["auxiliaryGroups", []] call functionPublicVariableSetValue;
	["totalAuxiliaryGroups", 0] call functionPublicVariableSetValue;
	["auxiliaryGroupPatrols", []] call functionPublicVariableSetValue;
	['vehiclesBLUFOR', []] call functionPublicVariableSetValue;
	['vehiclesOPFOR', []] call functionPublicVariableSetValue;
	['townDefenceCheat', true] call functionPublicVariableSetValue;
	['FOBs', []] call functionPublicVariableSetValue;
	['knownFOBsBLUFOR', []] call functionPublicVariableSetValue;
	['knownFOBsOPFOR', []] call functionPublicVariableSetValue;
	['townDefenceUnits', []] call functionPublicVariableSetValue;
	['commanderBLUFOR', ''] call functionPublicVariableSetValue;
	['commanderOPFOR', ''] call functionPublicVariableSetValue;
	['generalElectionStageBLUFOR', 'none'] call functionPublicVariableSetValue;
	['generalElectionStageOPFOR', 'none'] call functionPublicVariableSetValue;
	['generalElectionStageElapsedSecondsBLUFOR', 0] call functionPublicVariableSetValue;
	['generalElectionStageElapsedSecondsOPFOR', 0] call functionPublicVariableSetValue;
	['playersDataPublic', []] call functionPublicVariableSetValue;
	['influenceIncomeQuotaProportionBLUFOR', regularSupplyIncomeDefaultQuotaProportion] call functionPublicVariableSetValue;
	['influenceIncomeQuotaProportionOPFOR', regularSupplyIncomeDefaultQuotaProportion] call functionPublicVariableSetValue;
	['objectivesBLUFOR', []] call functionPublicVariableSetValue;
	['objectivesOPFOR', []] call functionPublicVariableSetValue;
	['mostRecentRegularSupplyIncomeBLUFOR', 0] call functionPublicVariableSetValue;
	['mostRecentRegularSupplyIncomeOPFOR', 0] call functionPublicVariableSetValue;
	objectiveParticipantsBLUFOR = [];
	objectiveParticipantsOPFOR = [];
	missionsBLUFOR = [];
	missionsOPFOR = [];
	missionsConcludedBLUFOR = [];
	missionsConcludedOPFOR = [];
	uniqueMissionsBLUFOR = 0;
	uniqueMissionsOPFOR = 0;
	firstBaseEstablishedBLUFOR = false;
	firstBaseEstablishedOPFOR = false;
	totalBLUFORFOBsCount = 0;
	totalOPFORFOBsCount = 0;
	playersData = [];
	provincesStatusServer = [];
	provinceActiveBLUFOR = false;
	provinceActiveOPFOR = false;
	provincesActivatedCount = 0;
	totalSupplyRelayStations = 0;
	territoryControlBLUFOR = 0;
	territoryControlOPFOR = 0;
	spotCount = 0;
	staticDefenceGroupBLUFOR = createGroup BLUFOR;
	staticDefenceGroupOPFOR = createGroup OPFOR;
	call functionEstablishStaticDefenceGroups;
	call functionEstablishProvincesStatusServer;
	call functionEstablishStartingPositions;
	call functionEstablishStartingAssets;
	//call functionEstablishPublicVariablesForCommanderElections;
	call functionEstablishServerPlayableUnits;
	//call functionEstablishBasesTestEnvironment;
	call functionEstablishNewSupplySystemTestEnvironment;
	[] spawn functionEstablishDynamicTerritory;
	call functionEstablishTeamsHostility;
	//call functionEstablishAITestEnvironment;
	//call functionEstablishPlayerConnectionListeners;
	[] spawn functionDistributeTerritorialSupplyIncomeByInterval;
	[] spawn functionReplenishStaticDefences;
	call functionEstablishConnectionEvents;
};

// Clientside
if (!isServer or !isDedicated)
then
{
	waitUntil {!(isNull player) and hasInterface and !(isNull (findDisplay screenDisplayID))};
	diag_log 'Clientside scripting may be assessed from this point on.';
	player setVariable ['team', side player, true];
	personalTeamLiteral = [player getVariable 'team'] call functionGetTeamFORName;
	call functionNotifyServerClientReady;
	personalSupplyQuota = 0;
	personalSupplyQuotaIncome = 0;
	personalSupplyQuotaObjectiveBonusAwarded = false;
	firstBaseEstablishedBLUFOR = false;
	firstBaseEstablishedOPFOR = false;
	amountMissionsAvailable = 0;
	activeMission = false;
	provincesStatusClient = [];
	territoryControlBLUFOR = 0;
	territoryControlOPFOR = 0;
	playerLoadout = false;
	cycleInfluenceMapQuality = ['Medium', 25, 10];
	cycleBuildViewBorderQuality = ['Medium', 10];
	manualSpotting = false;
	manualSpotObjects = [];
	call functionEstablishOptions;
	call functionEstablishProvincesStatusClient;
	[player] call functionEstablishDefaultScrollMenuForPlayer;
	call functionEstablishBasicItems;
	call functionEstablishGeneralElectionStageClient;
	call functionEstablishCommanderElectionsEvents;
	call functionEstablishProvinceMapTitles;
	call functionEstablishRespawnSystem;
	call functionEstablishMapGraphics;
	[] spawn functionEstablishDynamicTerritory;
	call functionEstablishPublicObjectVariables;
	call functionEstablishScreenKeyActions;
	call functionEstablishHUD;
	[] spawn functionHandleVirtualArsenalOpenClose;
	[] spawn functionControlFatigueLoss;
	call functionEstablishMapDiary;
	//["mapClickEvent", "onMapSingleClick", {systemChat format ["Clicked Map Position: %1. Province: %2.", _pos, [_pos] call functionGetProvinceAtPosition]; diag_log format ["Clicked Map Position: %1. Province: %2.", _pos, [_pos] call functionGetProvinceAtPosition];}] call BIS_fnc_addStackedEventHandler;
};