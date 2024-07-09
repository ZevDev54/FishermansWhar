shader_type canvas_item;

void fragment(){
	vec2 newuv = UV;
	newuv.x += TIME * 0.2;
	newuv.y = UV.y + (sin(TIME * 1.0) + 0.5) * UV.y * 0.01;
	vec4 c = texture(TEXTURE, newuv);
	COLOR = c;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
