
use <stand.scad>;
use <gear.scad>;

// all measures in mm

material_thickness = 4;

linear_extrude(material_thickness)
stand();

translate([0, 0, material_thickness*10])
linear_extrude(material_thickness)
stand();

translate([0, 10, material_thickness*3])
linear_extrude(material_thickness)
gear1();
