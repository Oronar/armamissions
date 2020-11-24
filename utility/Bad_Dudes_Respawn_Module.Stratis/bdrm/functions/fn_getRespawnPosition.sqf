private _respawnPosition = nil;

_respawnMarkerName = getText(getMissionConfig "BDRMConfig" >> "respawnMarkerName");
_respawnObject = missionNamespace getVariable [_respawnMarkerName , objNull];

if (not isNull _respawnObject ) then {
   _respawnPosition = getPos _respawnObject;
} else {
	if(getMarkerType _respawnMarkerName != "") then {
		_respawnPosition = getMarkerPos _respawnMarkerName;
	} else {		
		hint getMarkerType _respawnMarkerName;
		diag_log format ["BDRM respawn marker/object %1 not found", _respawnMarkerName];
	}
};

_respawnPosition = [_respawnPosition, 1, 10] call BIS_fnc_findSafePos;

_respawnPosition