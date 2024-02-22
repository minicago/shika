shader_type canvas_item;
render_mode world_vertex_coords;
uniform float coolt;
uniform bool available;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	COLOR = texture(TEXTURE, UV);
	if (available){
		float a = acos(- (UV.y - 0.5) / sqrt((UV.x - 0.5) * (UV.x - 0.5) + (UV.y - 0.5) *  (UV.y - 0.5)));
		if (UV.x > 0.5) a = 2.0 * PI - a; 
		if (a / 2.0 / PI < coolt )
			COLOR.r = 1.0;
		
		if (coolt > 0.0) COLOR.a -= 0.3;
		else COLOR.a -= 0.5;
	}

	// COLOR = mix(vec4(1.0,0.0,0.0,1.0),COLOR,);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
