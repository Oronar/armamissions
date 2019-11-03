if(isServer) then {
   [] spawn {
       While {not isNull BoxDudes} do {
			"respawn_west" setMarkerPos getPos BoxDudes;
			sleep 30;
       };
   };
};