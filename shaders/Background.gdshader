shader_type canvas_item;
render_mode world_vertex_coords;
uniform vec2 pos;
uniform vec2 size;

void vertex() {
	//VERTEX += pos;
	// Called for every vertex the material is visible on.
}

float logistic(float a){
	if(a < 0.0) a = -a;
	a = a / 2333.0 - floor(a / 2333.0);
	for(int i=1;i<=25;i++)
		if(a < 0.72) a = a / 0.72;
		else a = (1.0-a)*(1.0 - 0.72);
	return a;
}

void fragment() {
	vec2 tmp =  (size * UV  + pos) / 500.0;
	
	/*
	if(int(abs(tmp.x)) % 500 < 10 || int(abs(tmp.y)) % 500 < 10 )
		COLOR = vec4(0.0,0.0,0.0,1.0);
	else 
		COLOR = vec4(sin(tmp.x/500.0)/2.0 + 0.5,cos(tmp.y/500.0)/2.0 + 0.5,0.5,1.0);
	*/
	
	COLOR = texture(TEXTURE, tmp - floor(tmp));
	vec2 tmp2 = floor(tmp * 100.0);
	//tmp3.y *= 2.2; 
	float seed0 = logistic(logistic(tmp2.y) + logistic(tmp2.x) * tmp2.y +tmp2.x - tmp2.y);
	float seed1 = sin(tmp.x * tmp.y) * 0.5 +0.5;
	
	if(seed0 < 0.001) 
		COLOR = mix(vec4(1.0,1.0,0.0,1.0),COLOR,0.3);	
	else if(seed0 < 0.002) 
		COLOR = mix(vec4(1.0,1.0,1.0,seed1),COLOR,0.3);
	COLOR = mix(COLOR , vec4(1.0,1.0,0.0,1.0), -tmp.y / 10000.0);
	COLOR = mix(COLOR , vec4(1.0,0.0,0.0,1.0), -tmp.y / 20000.0);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
