params ["_player", "_didJIP"];

_player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	_projectilePos = _unit modelToWorld [0.3, 1.5, 1.4];
	_projectileVel = velocity _projectile;
	deleteVehicle _projectile;
	_wheel = "ACE_Wheel" createVehicle _projectilePos;
	_wheel setPos _projectilePos;
	_wheel setVelocity _projectileVel;
}]