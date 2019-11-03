params ["_vehicleClass", "_optionText"];

_grenadeType = "rhs_magazine_rhs_mag_m18_yellow";


this addAction 
[
    _optionText, 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
		_vehicleClass = _arguments select 0;
		_grenadeType = _arguments select 1;
		
		_caller setVariable ["capsuleType", _vehicleClass];
		_dropPosition = _target getRelPos [1, 180];
		_grenade = _grenadeType createVehicle _dropPosition;
		_grenade setPos _dropPosition;

		_caller spawn {
			sleep 30;
			_this setVariable ["capsuleType", nil];
		};
    },
    [_vehicleClass, _grenadeType],
    1.5, 
    true, 
    true, 
    "",
    "true",
    2,
    false,
    "",
    ""
];