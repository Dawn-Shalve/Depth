shader_type sky;
render_mode use_half_res_pass;
uniform vec3 skyColor : source_color;
uniform vec3 day_bottom_color: source_color = vec3(1.0,1.0,1.0);
uniform vec3 horizonColor : source_color = vec3(1.0,1.0,1.0);

void sky() {
	// Called for every visible pixel in the sky background, as well as all pixels
	COLOR = skyColor;
	float col = clamp(EYEDIR.t / 0.05, 0.0, 1.0);
	vec3 finalColor = vec3(col);
	COLOR = finalColor;
}
