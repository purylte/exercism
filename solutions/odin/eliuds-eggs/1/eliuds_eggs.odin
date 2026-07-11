package eliuds_eggs

egg_count :: proc(number: uint) -> uint {
	n := number
	eggs: uint = 0
	for (n >= 1) {
		if n % 2 == 1 {eggs += 1}
		n /= 2
	}
	return eggs
}
