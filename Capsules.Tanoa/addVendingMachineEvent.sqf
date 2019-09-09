spawnCapsuleVehicle = {
	_this spawn {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		_grenadeType = "rhs_mag_m18_yellow";
		
		_capsuleType = _unit getVariable "capsuleType";
		
		if(!isNil { _capsuleType }) then {
			if (_magazine == _grenadeType) then {
				_unit setVariable ["capsuleType", nil];
				sleep 3;
				_capsuleType createVehicle(getPos _projectile);	
			}
		}	
	};
};

["ace_firedPlayer", spawnCapsuleVehicle] call CBA_fnc_addEventHandler