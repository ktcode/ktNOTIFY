//
//    ktNOTIFY
//
//

gap = 0.4;
panel_thick = 2.5;
cpu_g = 3.5;

lcd_w = 35.04;
lcd_h = 28.03;
lcd_slope = 0.79;
lcd_gap = 3.3;



rotate( [ 0, 0, 0] )
cover( -15, 45, 0 );

difference(){
    union(){
        cube( [70, 43, panel_thick] );
        
        translate( [3, 25, panel_thick+10/2] )
        cylinder( 10, 3, 3, $fn=10, center=true );
        translate( [70, 17, panel_thick+10/2] )
        cylinder( 10, 3, 3, $fn=12, center=true );
        translate( [3, 36, panel_thick+10/2] )
        cylinder( 10, 3, 3, $fn=10, center=true );
        translate( [70, 6, panel_thick+10/2] )
        cylinder( 10, 3, 3, $fn=12, center=true );
    }
    lcd_window( 70/2 - lcd_w/2, 43/2 - lcd_h/2 );
    lcd_slope( 70/2 - lcd_w/2, 43/2 - lcd_h/2 );
    
    translate( [3, 25, 5.5] )
    cylinder( 7, 1.5, 1.8, $fn=8 );
    translate( [70, 17, 5.5] )
    cylinder( 7, 1.5, 1.8, $fn=8 );
}

difference(){
    lcd_base( 70/2 - lcd_w/2, 43/2 - lcd_h/2, panel_thick );
    lcd_hole( 70/2 - lcd_w/2, 43/2 - lcd_h/2, panel_thick );
}

difference(){
    translate( [0, 0, panel_thick] ){
        union(){
            cube( [2.5, 21, 12.5] );
            cube( [70, 2.5, 12.5] );
            translate( [70-2.5, 24.5-2.5, 0] )
            cube( [2.5, 18.5, 12.5] );
            translate( [0, 43-2.5, 0] )
            cube( [70, 2.5, 12.5] );
        }
    }
    translate( [0, 11.5, 7] )
    rotate( [0, 45, 90] )
    cube( [6, 10, 6], center=true ); 
    translate( [70, 33, 7] )
    rotate( [0, 45, 90] )
    cube( [6, 10, 6], center=true ); 
}

translate( [-15, 0, 0] ){
    difference(){
        union(){
            difference(){
                union(){
                    difference(){
                        linear_extrude( height=panel_thick+12.5 )
                        polygon( points=[ [0,43],[15,43],[15,18.5],[0,24.5] ]);
                        translate( [0, 0, panel_thick] )
                        linear_extrude( height=panel_thick+12.5 )
                        polygon( points=[ [0+2.5,43-2.5],[15,43-2.5],
                            [15,18.5+2.5],[0+2.5,24.5+1.7] ]);
                    }
                    translate( [6, 21.5, 7.5] )
                    cube( [6, 6, 10], center=true );
                    translate( [12, 19, 7.5] )
                    cube( [6, 6, 10], center=true );
                }
                
                translate( [6, 43, 6] )
                rotate( [0, 45, 0] )
                cube( [4.2, 10, 4.2], center=true );
                translate( [12, 43, 9] )
                rotate( [0, 45, 0] )
                cube( [4.2, 10, 4.2], center=true );                
                
                translate( [6, 21.5+6, 7.5] )
                cube( [6, 6, 10], center=true );
                translate( [6, 21.5, 6] )
                rotate( [-90, 0, 0] )
                cylinder( 7, 1.5, 1.8, $fn=8, center=true );

                translate( [12, 19+6, 7.5] )
                cube( [6, 6, 10], center=true );
                translate( [12, 19, 9] )
                rotate( [-90, 0, 0] )
                cylinder( 7, 1.5, 1.8, $fn=8, center=true );
            }
        }
        linear_extrude( height=panel_thick+12.5 )
        polygon( points=[ [0,0],[15,0],[15,18.5],[0,24.5] ]);

        translate( [0, 33, 7] )
        rotate( [0, 45, 90] )
        cube( [6, 10, 6], center=true );
    }
}
translate( [70, 0, 0] ){
    difference(){
        union(){
            difference(){
                union(){
                    difference(){
                        linear_extrude( height=panel_thick+12.5 )
                        polygon( points=[ [0,0],[15,0],[15,18.5],[0,24.5] ]);
                        translate( [0, 0, panel_thick] )
                        linear_extrude( height=panel_thick+12.5 )
                        polygon( points=[ [0,0+2.5],[15-2.5,0+2.5],
                            [15-2.5,18.5-1.7],[0,24.5-2.5] ]);
                    }
                    translate( [6, 21.5, 7.5] )
                    cube( [6, 6, 10], center=true );
                    translate( [12, 19, 7.5] )
                    cube( [6, 6, 10], center=true );
                }
                translate( [6, 21.5, 6] )
                rotate( [-90, 0, 0] )
                cylinder( 7, 1.5, 1.8, $fn=8, center=true );
                translate( [12, 19, 9] )
                rotate( [-90, 0, 0] )
                cylinder( 7, 1.5, 1.8, $fn=8, center=true );
            }
        }
        linear_extrude( height=panel_thick+12.5 )
        polygon( points=[ [0,43],[15,43],[15,18.5],[0,24.5] ]);

        translate( [15, 11.5, 7] )
        rotate( [0, 45, 90] )
        cube( [6, 10, 6], center=true );
    }       
}





module cover( x, y, z, a ){
    translate( [x, y, z] ){
        difference(){
            linear_extrude( height=panel_thick )
            polygon( points=[ [0+2.5+gap,43-2.5-gap],[0+2.5+gap,24.5+1.7+gap],[15+gap,18.5+2.5+gap],
                [15+2.5+gap,18.5+2.5+gap],[15+2.5+gap,0+2.5+gap],[15+70+15-2.5-gap,0+2.5+gap],
                [15+70+15-2.5-gap,18.5-1.7-gap],[15+70+0-gap,24.5-2.5-gap],
                [15+70+0-2.5-gap,24.5-2.5-gap],[15+70+0-2.5-gap,43-2.5-gap]]);
            
            screw_hole( 18, 25, -1.5 );
            screw_hole( 85, 17, -1.5 );
        }
    }
}



module screw_hole( x, y, z ){
    translate( [x+1.6/2, y, panel_thick-2/2] ){
        cylinder( 2, 3, 3, $fn=12, center=true );
        translate( [0, 0, 1.6/2-6/2] )
        cylinder( 6, 1.8, 1.8, $fn=12, center=true );
    }
}


module lcd_window( x, y, z ){
    translate( [x, y, z] )
    cube( [lcd_w, lcd_h, panel_thick] );
}
module lcd_slope( x, y, z ){
    translate( [x + lcd_w/2, y + lcd_h/2, z] ){
        scale( [lcd_w*lcd_slope, lcd_h*lcd_slope, lcd_h*lcd_slope] )
        rotate( [0, 0, 45] )
        cylinder( 1, 1, 0, $fn=4 );
    }
}


module lcd_base( x, y, z ){
    translate( [x-6, y-0.5, z] ){
        translate( [0, 0, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
        translate( [52, 0, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
        translate( [0, 29, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
        translate( [52, 29, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
    }
}
module lcd_hole( x, y, z ){
    translate( [x-6, y-0.5, z-1.2] ){
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
        translate( [52, 0, 0] )
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
        translate( [0, 29, 0] )
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
        translate( [52, 29, 0] )
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
    }
}
