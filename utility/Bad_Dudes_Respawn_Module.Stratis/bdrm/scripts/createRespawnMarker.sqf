_respawnMarkerName = getText(getMissionConfig "BDRMConfig" >> "respawnMarkerName");
_sideRespawnMarkerName = getText(getMissionConfig "BDRMConfig" >> "sideRespawnMarkerName");

if(getMarkerType _respawnMarkerName == "") then {
	diag_log format ["BDRM respawn marker/object %1 not found, creating at respawn position.", _respawnMarkerName];

	if(getMarkerType _sideRespawnMarkerName == "") then {
		diag_log format ["Respawn marker %1 not found.", _sideRespawnMarkerName];
	} else {
		createMarker [_respawnMarkerName, getMarkerPos _sideRespawnMarkerName];
		_respawnMarkerName setMarkerType "respawn_inf";
	};
};