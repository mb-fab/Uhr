
include <global.scad>;
use <stand.scad>;
use <gears.scad>;

color("grey")
linear_extrude(material_thickness)
stand();

color("grey")
translate([0, 0, material_thickness*10])
linear_extrude(material_thickness)
stand();

color("red")
translate([0, y_axis1, material_thickness*3])
linear_extrude(material_thickness)
rotate($t*360)
gear1();

color("yellow")
translate([0, y_axis2, material_thickness*3])
linear_extrude(material_thickness)
rotate(-$t*360*5)
gear3();

color("lightgreen")
translate([0, y_axis2, material_thickness*5])
linear_extrude(material_thickness)
rotate(-$t*360*5)
gear2();

color("blue")
translate([0, y_axis3, material_thickness*5])
linear_extrude(material_thickness)
rotate($t*360*5*3)
gear3();
