
// all measures in millimeters

// rendering parameters
$fn=50;

outer_radius = 100;
outer_width = 10;

inner_radius = 20;
screw_radius = 4;

support_count = 6;
support_width = 10;

tooth_count = 20;
tooth_width = 6;
tooth_height = 4;

module support()
{
    translate([screw_radius, -support_width/2])
    square([outer_radius-screw_radius, support_width]);
}

module support_structure()
{
    angle = 360 / support_count;
    for (i = [1:support_count])
    {
        rotate(i * angle)
        support();
    }
}

module tooth()
{
    translate([outer_radius - outer_width/2, -tooth_height/2])
    square([tooth_width + outer_width/2, tooth_height]);
}

module teeth()
{
    angle = 360 / tooth_count;
    for (i = [1:tooth_count])
    {
        rotate(i * angle)
        tooth();
    }
}

module gear()
{
    // outer circle
    difference()
    {
        circle(outer_radius);
        circle(outer_radius - outer_width);
    }

    // inner circle
    difference()
    {
        circle(inner_radius);
        circle(screw_radius);
    }

    // support bars
    support_structure();

    teeth();
}

gear();
