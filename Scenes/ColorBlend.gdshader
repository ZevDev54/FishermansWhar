shader_type canvas_item;

uniform vec3 color1 : source_color = vec3(1.0);
uniform vec3 color2 : source_color = vec3(1.0, 0.0, 0.0);
uniform float blend : hint_range(0.0,1.0) = 0.0;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color1, color2, blend);
	COLOR = color;
}
