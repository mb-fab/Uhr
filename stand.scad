
include <global.scad>;

// rendering parameters
$fn=100;

// all measures in millimeters
foot_width = 500;
foot_height = 20;

neck_width = 15;
neck_height = 650;

head_width = 350;
head_height = 20;

corner_radius = 5;

/*
 * @brief Replaces a pointy with a rounded corner
 */
module rounded_corner(target_x, target_y, angle, radius)
{
    translate([target_x, target_y])
    {
        rotate(angle)

        // move it, such that the rounded side points to (0|0)
        translate([-radius, -radius])

        // generate a quarter of a circle
        intersection()
        {
            circle(corner_radius);
            square([radius, radius]);
        }
    }
}

module foot()
{
    // helper variable
    foot_width_2 = foot_width / 2;

    translate([-foot_width_2, corner_radius])
    square([foot_width, foot_height - 2*corner_radius]);

    translate([-foot_width_2 + corner_radius, 0])
    square([foot_width - 2*corner_radius, foot_height]);

    rounded_corner(-foot_width_2, foot_height, 90, corner_radius);
    rounded_corner(+foot_width_2, foot_height, 0, corner_radius);
    rounded_corner(-foot_width_2, 0, 180, corner_radius);
    rounded_corner(+foot_width_2, 0, 270, corner_radius);
}

module neck()
{
    width_half = neck_width / 2;
    translate([-width_half, 0])
    square([neck_width, neck_height]);
}

module head()
{
    width_half = head_width / 2;
    translate([-width_half, 0])
    square([head_width, head_height]);
}

module stand()
{
    foot();

    difference()
    {
        translate([0, foot_height])
        neck();

        // screw holes
        translate([0, y_axis1])
        circle(screw_radius);
        translate([0, y_axis2])
        circle(screw_radius);
        translate([0, y_axis3])
        circle(screw_radius);
    }

    translate([0, foot_height + neck_height])
    head();
}

stand();
