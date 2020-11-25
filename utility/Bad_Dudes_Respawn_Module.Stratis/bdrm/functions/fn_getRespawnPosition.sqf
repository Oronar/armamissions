private _respawnPosition = nil;

_respawnMarkerName = getText(getMissionConfig "BDRMConfig" >> "respawnMarkerName");
_respawnObject = missionNamespace getVariable [_respawnMarkerName , objNull];

if (not isNull _respawnObject ) then {
   _respawnPosition = getPos _respawnObject;
} else {
	if(getMarkerType _respawnMarkerName != "") then {
		_respawnPosition = getMarkerPos _respawnMarkerName;
	} else {		
		diag_log format ["BDRM respawn marker/object %1 not found", _respawnMarkerName];
	};
};

_respawnPosition