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
	delete (for o in lights collect o)
)

  
macroScript removeCameras category:"TurboSquid" toolTip:"Remove all cameras" buttontext:"_RM_CAM"
( 
	delete (for o in cameras collect o)
)

macroScript removeBones category:"TurboSquid" toolTip:"Remove all bones" buttontext:"_RM_BONE"
( 
	delete (for o in objects where classOf o == Biped_Object OR classOf o == BoneGeometry OR (try(classOf o.transform.controller == BipSlave_Control)catch(false)) collect o)
	
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

macroScript screenshot category:"TurboSquid" toolTip:"Take screenshots" buttontext:"_SCRSHOT"
(
	if maxfilepath == "" then  
		messageBox "Please save the file first"
	else 
	(
		saveScreenshot ("Screenshot_viewport.png")
		setEdgedFaces(true)
		saveScreenshot ("Screenshot_wireframe.png")
		setEdgedFaces(false)
	)

)

function setEdgedFaces val = 
(
	for i = 1 to viewport.numViews do 
	(
		viewport.activeViewport = i
		viewport.SetShowEdgeFaces (val)
	)
	redrawViews()
)

function saveScreenshot filename =
(
	grab_viewpBMP = gw.getViewportDib()
	tempBMP = bitmap grab_viewpBMP.width grab_viewpBMP.height
	pasteBitmap grab_viewpBMP tempBMP (box2 0 0 grab_viewpBMP.width grab_viewpBMP.height) [0,0] 
	tempBMP.filename = (maxfilepath + filename)
	save tempBMP
	close tempBMP
	close grab_viewpBMP
	tempBMP = undefined
	grab_viewpBMP = undefined
	freeSceneBitmaps()
)