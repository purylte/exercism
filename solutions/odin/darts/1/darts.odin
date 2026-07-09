package darts

score :: proc(x, y: f64) -> int {
	dist_sqr := x * x + y * y
	if dist_sqr <= 1 * 1 do return 10
	if dist_sqr <= 5 * 5 do return 5
	if dist_sqr <= 10 * 10 do return 1
	return 0
}
