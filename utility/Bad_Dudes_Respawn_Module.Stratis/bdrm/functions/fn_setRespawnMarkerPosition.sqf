params ["_newPos"];

_respawnMarkerName = getText(getMissionConfig "BDRMConfig" >> "respawnMarkerName");

if(getMarkerType _respawnMarkerName != "") then {
	_respawnMarkerName setMarkerPos _newPos;
} else {		
	diag_log format ["BDRM respawn marker/object %1 not found", _respawnMarkerName];
}