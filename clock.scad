
include <global.scad>;
use <stand.scad>;
use <gears.scad>;

linear_extrude(material_thickness)
stand();

translate([0, 0, material_thickness*10])
linear_extrude(material_thickness)
stand();

translate([0, y_axis1, material_thickness*3])
linear_extrude(material_thickness)
gear1();

translate([0, y_axis2, material_thickness*3])
linear_extrude(material_thickness)
gear3();

translate([0, y_axis2, material_thickness*5])
linear_extrude(material_thickness)
gear2();

translate([0, y_axis3, material_thickness*5])
linear_extrude(material_thickness)
gear3();
