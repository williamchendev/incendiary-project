// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // oSolid
global.__objectDepths[1] = 999999999; // oMove
global.__objectDepths[2] = 0; // oTestNPC
global.__objectDepths[3] = 0; // oAnna
global.__objectDepths[4] = -100000; // oAction
global.__objectDepths[5] = 0; // oNPC
global.__objectDepths[6] = 0; // oInspect
global.__objectDepths[7] = -100005; // oText
global.__objectDepths[8] = -500000; // oCircleTrans
global.__objectDepths[9] = 0; // oLog
global.__objectDepths[10] = 0; // oTestAni
global.__objectDepths[11] = -100005; // oTempText
global.__objectDepths[12] = 0; // oGun
global.__objectDepths[13] = 0; // oItem
global.__objectDepths[14] = -100010; // oInventorySlot


global.__objectNames[0] = "oSolid";
global.__objectNames[1] = "oMove";
global.__objectNames[2] = "oTestNPC";
global.__objectNames[3] = "oAnna";
global.__objectNames[4] = "oAction";
global.__objectNames[5] = "oNPC";
global.__objectNames[6] = "oInspect";
global.__objectNames[7] = "oText";
global.__objectNames[8] = "oCircleTrans";
global.__objectNames[9] = "oLog";
global.__objectNames[10] = "oTestAni";
global.__objectNames[11] = "oTempText";
global.__objectNames[12] = "oGun";
global.__objectNames[13] = "oItem";
global.__objectNames[14] = "oInventorySlot";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	global.__objectID2Depth[ objID ] = global.__objectDepths[i];
} // end for