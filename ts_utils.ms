macroScript removeSubdiv category:"TurboSquid" toolTip:"Remove subdivision modifiers" buttontext:"_RM_SUBD"
( 
	for o in geometry do if superClassOf o == geometryClass do 
	(
	for theModifier in o.modifiers where classOf theModifier == openSubdiv or classOf theModifier == turboSmooth or classOf theModifier == meshSmooth do
		(
			deleteModifier o theModifier
		)
	)
)

macroScript flipNormals category:"TurboSquid" toolTip:"Flip normals" buttontext:"_FLP_NRML"
( 
	
	for obj in $selection do 
	(
		resetXform obj
		addModifier obj (Normalmodifier flip:true)
		collapseStack obj
	)
)

 
macroScript convertToEditPoly category:"TurboSquid" toolTip:"Convert all to Editable Poly" buttontext:"_ED_POLY"
( 
	for o in objects where canconvertto o Editable_Poly do
	(
	convertToPoly o
	)
)
 
macroScript removeLights category:"TurboSquid" toolTip:"Remove all lights" buttontext:"_RM_LGH"
( 
	for o in lights do 
	(
		delete o
	)
)

  
macroScript removeCameras category:"TurboSquid" toolTip:"Remove all cameras" buttontext:"_RM_CAM"
( 
	for o in cameras do 
	(
		delete o
	)
)


 
macroScript quadrifyObjects category:"TurboSquid" toolTip:"Quadrify Selected" buttontext:"_QUAD"
( 
	for o in $* do (select o; PolyToolsModeling.Quadrify false false)
	---
		cursel = getcurrentselection()
		for o in cursel do (select o; PolyToolsModeling.Quadrify false false)
		select cursel
)
 
macroScript selectGeo category:"TurboSquid" toolTip:"Select only geometry" buttontext:"_SEL_GEO"
( 
	select(for o in geometry where classOf o != VRayProxy collect o)
)
 
macroScript resetXfrn category:"TurboSquid" toolTip:"Reset Xform (with Undo)" buttontext:"_RST_XFRM"
( 
	resetxform selection
	collapsestack selection
)
 
macroScript collapseToFirst category:"TurboSquid" toolTip:"Collapse to first modifier" buttontext:"_CLPS_MOD"
( 
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

macroScript remRaytrace category:"TurboSquid" toolTip:"Remove Raytrace maps" buttontext:"_RM_RAYMAP"
( 	
	RaytraceMaps = getClassInstances Raytrace

	nullObject = bitmaptex()

	for raytinst in RaytraceMaps do
		replaceInstances raytinst nullObject
)
