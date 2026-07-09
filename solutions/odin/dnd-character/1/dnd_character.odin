package dnd_character

import "core:math/rand"

Character :: struct {
	strength:     int,
	dexterity:    int,
	constitution: int,
	intelligence: int,
	wisdom:       int,
	charisma:     int,
	hitpoints:    int,
}

modifier :: proc(score: int) -> int {
	x := score - 10
	if x < 0 && x % 2 != 0 do return (x / 2) - 1
	return x / 2
}

ability :: proc() -> int {
	min := 999
	total := 0
	for i in 0 ..< 4 {
		n := rand.int_range(1, 7)
		if min > n do min = n
		total += n
	}
	return total - min
}

character :: proc() -> Character {
	cst := ability()
	return Character {
		strength = ability(),
		dexterity = ability(),
		constitution = cst,
		intelligence = ability(),
		wisdom = ability(),
		charisma = ability(),
		hitpoints = 10 + modifier(cst),
	}
}
