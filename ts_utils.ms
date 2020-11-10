macroScript removeSubdiv category:"TurboSquid" toolTip:"Remove subdivision modifiers" buttontext:"Remove SubD modifiers"
( 
	for o in geometry do if  superClassOf  o == geometryClass do 
	(
	for theModifier in o.modifiers where classOf theModifier == openSubdiv or classOf theModifier == turboSmooth or classOf theModifier == meshSmooth do
		(
			deleteModifier o theModifier
		)
	)
)

macroScript resetXFormFlipNormalsCollapse category:"TurboSquid" toolTip:"Flip normals" buttontext:"Flip normals"
( 
	
for obj in $selection do 
 (
 	resetXform obj
 	addModifier obj (Normalmodifier flip:true)
 	collapseStack obj
 )
 )

 
 macroScript convertToEditPoly category:"TurboSquid" toolTip:"Convert to Editable Poly" buttontext:"Editable Poly"
( 
	for o in objects where canconvertto o Editable_Poly do
	(
	convertToPoly o
	)
 )
 
 macroScript removeLights category:"TurboSquid" toolTip:"Remove all lights" buttontext:"Remove Lights"
( 
	for o in lights do 
	(
		delete o
	)
 )

  
 macroScript removeCameras category:"TurboSquid" toolTip:"Remove all cameras" buttontext:"Remove Cameras"
( 
	for o in cameras do 
	(
		delete o
	)
 )

 
   macroScript convertVRMesh category:"TurboSquid" toolTip:"Convert VRMESH" buttontext:"V-Ray"
( 
	getObjsUsingMod $objects VRayProxy
	
	 
 fn getObjsUsingMod objs mod =
(
	for o in objs where ((findItem (for m in o.modifiers collect classOf m) mod) > 0)collect o
)
 )

 
   macroScript quadrifyObjects category:"TurboSquid" toolTip:"Quadrify Selected" buttontext:"Quadrify"
( 
		for o in $* do (select o; PolyToolsModeling.Quadrify false false)
	---
	cursel = getcurrentselection()
	for o in cursel do (select o; PolyToolsModeling.Quadrify false false)
	select cursel

 )
 
    macroScript selectGeo category:"TurboSquid" toolTip:"Select only geometry" buttontext:"Select Only Geometry"
( 
	select(for o in geometry where classOf o != VRayProxy collect o)
 )
 
     macroScript resetXfrn category:"TurboSquid" toolTip:"Reset Xform (with Undo)" buttontext:"Reset Xform"
( 
	resetxform selection
	collapsestack selection

 )





