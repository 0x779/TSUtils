# One-click scripts for 3ds Max

This is a little MaxScript that adds one-click solutions for commonly used features.

&nbsp;

## Quadrify mesh

Converts a triangulated mesh to quads, however YMMV as complex objects (n-gons) are notoriously difficult to calculate.

![Quadrify mesh](https://i.imgur.com/27CP9zM.gif)

## Convert all geometry objects to editable poly

Selects all geometry objects and converts them to editable poly. This is an easier alternative to manually selecting the geometry, right clicking and selecting `Convert to Editable Poly`.

![Convert all geometry objects to editable poly](https://i.imgur.com/SR7i5mp.gif)

## Collapse to first modifier

Collapses some stubborn modifiers (usually WSM), as they cannot be collapsed by the usual `Convert to` method.

![Collapse to first modifier](https://i.imgur.com/EHdiKQf.gif)

## Flip normals

Automagically flips all of the normals of a mesh's faces. Note: also resets XForm.

![Flip normals](https://i.imgur.com/LKdqyGy.gif)

## Select only geometry

Only selects geometry objects, regardless of groups or hierarchy.

![Select only geometry](https://i.imgur.com/GHRrhoD.gif)

## Reset XForm (with undo)

Resets XForm for the selected object(s). The difference between this and 3ds Max's own `Reset XForm` is that this one supports undo.

![Reset XForm (with undo)](https://i.imgur.com/IuVcNs4.gif)

## Remove subdivision modifiers

Runs through all of the geometry objects and removes _only_ the TurboSmooth, MeshSmooth or OpenSubdiv modifiers.

![Remove subdivision modifiers](https://i.imgur.com/7dEOcF0.gif)

## Remove raytrace maps

Removes (replaces with empty bitmap) all of the raytrace maps from all materials, as they cannot be exported reliably.

![Remove raytrace maps](https://i.imgur.com/27CP9zM.gif)

## Remove all lights

Removes all light objects, regardless of groups, hierarchies or renderers.

![Remove all lights](https://i.imgur.com/RGsD6B1.gif)

## Remove all cameras

Removes all camera objects, regardless of groups, hierarchies or renderers.

![Remove all cameras](https://i.imgur.com/UWYTquv.gif)

## Screenshots

Takes screenshots (viewport and wireframe) and saves them to the directory in which the currenly opened Max file resides.


**NOTE: The script was extensively tested with 3ds Max 2018. Older/newer versions might have missing features or bugs.**

---

### Please report any bugs and don't hesitate to request new features.