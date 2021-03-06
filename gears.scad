
// all measures in millimeters

// rendering parameters
$fn=100;

/**
 * @brief Draw the inner ring of a gear
 */
module inner_ring(
            inner_radius,
            screw_radius
            )
{
    difference()
    {
        circle(inner_radius);
        circle(screw_radius);
    }
}

/**
 * @brief Draw the outer ring of a gear
 */
module outer_ring(
            outer_radius,
            outer_width
            )
{
    difference()
    {
        circle(outer_radius);
        circle(outer_radius - outer_width);
    }
}

/**
 * @brief Draw one support bar
 */
module support_bar(
            support_width,
            screw_radius,
            outer_radius,
            outer_width
            )
{
    translate([screw_radius, -support_width/2])
    square([outer_radius - screw_radius - outer_width/2, support_width]);
}

/**
 * @brief Draw all the support bars into the gear
 */
module support_structure(
            support_count,
            support_width,
            screw_radius,
            outer_radius,
            outer_width
            )
{
    angle = 360 / support_count;
    for (i = [1:support_count])
    {
        rotate(i * angle)
        support_bar(
            support_width,
            screw_radius,
            outer_radius,
            outer_width
            );
    }
}

/**
 * @brief Draw one gear tooth
 */
module tooth(
    tooth_width,
    tooth_height,
    outer_radius,
    outer_width
    )
{
    translate([outer_radius - outer_width/2, -tooth_height/2])
    {
//        square([tooth_width + outer_width/2, tooth_height]);
        polygon(
                [
                    [0, 0],
                    [tooth_width + outer_width/2, tooth_height * 0.4],
                    [tooth_width + outer_width/2, tooth_height * 0.6],
                    [0, tooth_height]
                ]
            );
    }
}

/**
 * @brief Draw all the teeth onto the gear
 */
module teeth(
    tooth_count,
    tooth_width,
    tooth_height,
    outer_radius,
    outer_width
    )
{
    angle = 360 / tooth_count;
    for (i = [1:tooth_count])
    {
        rotate(i * angle)
        tooth(
            tooth_width,
            tooth_height,
            outer_radius,
            outer_width
            );
    }
}

module gear1()
{
    // gear parameters
    outer_radius = 150;
    outer_width = 20;

    inner_radius = 40;
    screw_radius = 4;

    support_count = 3;
    support_width = 20;

    tooth_count = 35;
    tooth_width = 20;
    tooth_height = 12;

    // draw the outer circle
    outer_ring(
        outer_radius,
        outer_width
        );

    // draw the inner circle
    inner_ring(
        inner_radius,
        screw_radius
        );

    // draw the support bars
    support_structure(
        support_count,
        support_width,
        screw_radius,
        outer_radius,
        outer_width
        );

    // draw the teeth
    teeth(
        tooth_count,
        tooth_width,
        tooth_height,
        outer_radius,
        outer_width
        );
}

module gear2()
{
    // gear parameters
    outer_radius = 100;
    outer_width = 16;

    inner_radius = 25;
    screw_radius = 4;

    support_count = 3;
    support_width = 17;

    tooth_count = 15;
    tooth_width = 20;
    tooth_height = 12;

    // draw the outer circle
    outer_ring(
        outer_radius,
        outer_width
        );

    // draw the inner circle
    inner_ring(
        inner_radius,
        screw_radius
        );

    // draw the support bars
    support_structure(
        support_count,
        support_width,
        screw_radius,
        outer_radius,
        outer_width
        );

    // draw the teeth
    teeth(
        tooth_count,
        tooth_width,
        tooth_height,
        outer_radius,
        outer_width
        );
}

module gear3()
{
    radius = 15;
    screw_radius = 4;

    tooth_count = 6;
    tooth_width = 6;
    tooth_height = 6;

    // draw a ring
    inner_ring(
        radius,
        screw_radius
        );

    // add the teeth
    teeth(
        tooth_count,
        tooth_width,
        tooth_height,
        radius,
        radius - screw_radius
        );
}

gear3();
