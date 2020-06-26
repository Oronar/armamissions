[] spawn {
	_cacheName = "cache";
	_centerMarkerName = "center";
	_radius = 250;
	_minimumBuildingSize = 5;

	_cache =  missionNameSpace getVariable(_cacheName);
	_civilianPlayers = [civilian] call getSidePlayers;
	_bluForPlayers = [west] call getSidePlayers;
	_idealTerroristCount = selectMax [1, count _bluForPlayers];
	_terroristPlayers = [_civilianPlayers, selectMin [_idealTerroristCount, count _civilianPlayers]] call selectTerrorists;

	_cacheBuilding = [getMarkerPos _centerMarkerName, _radius, selectMax [count _terroristPlayers + 1, _minimumBuildingSize]] call getRandomBuilding; 
	[_cacheBuilding, _cache, _terroristPlayers] call setupTerroristStart;
};


selectTerrorists = {
	params ["_civilians", "_amount"];

	_civilians = _civilians call BIS_fnc_arrayShuffle;
	_terrorists = [];
	for "_i" from 0 to _amount - 1 step 1 do
	{
		_terrorists pushBack (_civilians select _i);
	};

	_terrorists;
};

setupTerroristStart = {
	params ["_building", "_cache", "_terrorists"];

	_buildingPositions = [_building] call BIS_fnc_buildingPositions;
	_buildingPositions = _buildingPositions call BIS_fnc_arrayShuffle;
	_terrorists join (group (_terrorists select 0));

	{
		_terroristPosition = _buildingPositions select _forEachIndex;
		_x setPosATL _terroristPosition;
		
		[_x] spawn {
			params ["_player"];
			"You are a terrorist! Find the nearby cache!" remoteExec ["hint", _player];
			sleep 15;
			"" remoteExec ["hint", _player];		
		};
		
	} forEach _terrorists;

	_cache setPosATL (_buildingPositions select (count _terrorists));
};

getRandomBuilding = {
	params ["_center", "_radius", "_size"];

	_buildings = _center nearObjects ["House", _radius];
	_potentialBuildings = [];
	{
		_buildingPositions = [_x] call BIS_fnc_buildingPositions;
		if(count _buildingPositions >= _size) then
		{
			_potentialBuildings pushBack _x;
		}
	} forEach _buildings;

	_potentialBuildings call BIS_fnc_selectRandom;
};

getSidePlayers = {
	params ["_side"];

	_players = [];
	{
		if(side _x == _side) then
		{
			_players pushBack _x;
		}
	} forEach allPlayers;
	_players;
};