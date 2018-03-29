_object = (_this select 0);

_object addAction ["Forward 1 Hour", {
	skipTime 1;
}];

_object addAction ["Backward 1 Hour", {
	skipTime -1;
}];

_object addAction ["Forward 6 Hours", {
	skipTime 6;
}];

_object addAction ["Backward 6 Hours", {
	skipTime -6;
}];

_object addAction ["Forward 12 Hours", {
	skipTime 12;
}];

_object addAction ["Backward 12 Hours", {
	skipTime -12;
}];
