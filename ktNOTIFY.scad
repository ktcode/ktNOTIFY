//
//    ktNOTIFY
//        Display Board
//




panel_thick = 5;
cpu_height = 3.5 + panel_thick;
lcd_height = 10 + panel_thick;
hole_height = 8;



difference(){
    union(){
        for( y = [0:20:40] ){
            for( x = [0:30:150] ){
                kaku_l( x, y, 0 );
                kaku_r( x+15, y, 0 );
            }
            kaku_l( 180, y, 0 );
            
            for( x = [0:30:150] ){
                kaku_r( x, y+10, 0 );
                kaku_l( x+15, y+10, 0 );
            }
            kaku_r( 180, y+10, 0 );
        }
        cpu_base( 3, 10, 0 );
        lcd_base( 75, 15.5, 0 );
        lcd_base( 135, 15.5, 0 );
    }
    cpu_hole( 3, 10, cpu_height );
    lcd_hole( 75, 15.5, lcd_height );
    lcd_hole( 135, 15.5, lcd_height );
}

module kaku_l( x, y, z ){
    translate( [x, y, z] ){
        linear_extrude( height = panel_thick ){
            difference(){
                polygon(points=[ [-1,0], [10,0], [16,10], [5,10] ]);
                polygon(points=[ [1,1], [9,1], [14,9], [6,9] ]);
                polygon(points=[ [-1,0], [0,0], [0,10], [-1,10] ]);
                polygon(points=[ [15,0], [16,0], [16,10], [15,10] ]);
            }
        }
    }
}
module kaku_r( x, y, z ){
    translate( [x, y, z] ){
        linear_extrude( height = panel_thick ){
            difference(){
                polygon(points=[ [-1,10], [10,10], [16,0], [5,0] ]);
                polygon(points=[ [1,9], [9,9], [14,1], [6,1] ]);
                polygon(points=[ [-1,0], [0,0], [0,10], [-1,10] ]);
                polygon(points=[ [15,0], [16,0], [16,10], [15,10] ]);
            }
        }
    }
}

module cpu_base( x, y, z ){
    translate( [x, y, z] ){
        translate( [0, 0, cpu_height/2] )
        cube( [6, 6, cpu_height], center=true );
        translate( [65, 0, cpu_height/2] )
        cube( [6, 6, cpu_height], center=true );
        translate( [0, 40, cpu_height/2] )
        cube( [6, 6, cpu_height], center=true );
        translate( [65, 40, cpu_height/2] )
        cube( [6, 6, cpu_height], center=true );
    }
}
module cpu_hole( x, y, z ){
    translate( [x, y, z] ){
        cylinder( hole_height, 2, 2, $fn=8 );
        translate( [65, 0, 0] )
        cylinder( hole_height, 2, 2, $fn=8 );
        translate( [0, 40, 0] )
        cylinder( hole_height, 2, 2, $fn=8 );
        translate( [65, 40, 0] )
        cylinder( hole_height, 2, 2, $fn=8 );
    }
}

module lcd_base( x, y, z ){
    translate( [x, y, z] ){
        translate( [0, 0, lcd_height/2] )
        cube( [6, 6, lcd_height], center=true );
        translate( [52, 0, lcd_height/2] )
        cube( [6, 6, lcd_height], center=true );
        translate( [0, 29, lcd_height/2] )
        cube( [6, 6, lcd_height], center=true );
        translate( [52, 29, lcd_height/2] )
        cube( [6, 6, lcd_height], center=true );
    }
}
module lcd_hole( x, y, z ){
    translate( [x, y, z] ){
        cylinder( hole_height, 2, 2, $fn=8 );
        translate( [52, 0, 0] )
        cylinder( hole_height, 2, 2, $fn=8 );
        translate( [0, 29, 0] )
        cylinder( hole_height, 2, 2, $fn=8 );
        translate( [52, 29, 0] )
        cylinder( hole_height, 2, 2, $fn=8 );
    }
}
