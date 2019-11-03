player setVariable ["Saved_Loadout",getUnitLoadout player];

["ace_spectatorSet", {
	params ["_isSpectator", "_player"];
	_pos = [getMarkerPos "respawn_west", 1, 10] call BIS_fnc_findSafePos;
	_player setPos _pos;
	}] call CBA_fnc_addEventHandler;