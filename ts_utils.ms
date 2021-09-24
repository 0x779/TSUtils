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
 
      macroScript collapseToFirst category:"TurboSquid" toolTip:"Collapse to first modifier" buttontext:"Collapse to first"
( 
	--GET THE INSTANCED MODIFIER
	iMod = modPanel.getCurrentObject()
	
    for obj in selection do
    (
        for i in obj.modifiers.count to 1 by -1 where
            obj.modifiers[i] == iMod do
            (
                maxops.CollapseNodeTo obj i off
                exit
            )
    )

 )
 
      macroScript vrayMatConv category:"TurboSquid" toolTip:"Convert V-Ray Materials" buttontext:"V-Ray"
( 	
 for i = 1 to scenematerials.count do
	(
		mat_name = scenematerials[i].name
		mat_class = scenematerials[i].class
		mats = for o in objects where o.material == scenematerials[i] collect oo
		format("Material name:\n" + mat_name + "\n\n")
		format("Material type:\n" + mat_class + "\n\n")
		format("Assets with material:\n")
		for each in mats do format(each.name + "\n")
		format "-----------------------------\n"
	)
 )
 