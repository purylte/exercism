package bottle_song

import "core:fmt"
recite :: proc(start_bottles, take_down: int) -> []string {
	lyrics := make([dynamic]string)

	for i := start_bottles; i > start_bottles - take_down; i -= 1 {
		append(&lyrics, fmt.aprintf("%v hanging on the wall,", translate(i, true)))
		append(&lyrics, fmt.aprintf("%v hanging on the wall,", translate(i, true)))
		append(&lyrics, fmt.aprintf("And if %v should accidentally fall,", translate(1)))
		append(&lyrics, fmt.aprintf("There'll be %v hanging on the wall.", translate(i - 1)))
		if (i - 1 > start_bottles - take_down) {
			append(&lyrics, "")
		}
	}

	return lyrics[:]
}

@(private = "file")
translate :: proc(n: int, capitalize := false) -> string {
	switch n {
	case 0:
		return "no green bottles"
	case 1:
		return capitalize ? "One green bottle" : "one green bottle"
	case 2:
		return capitalize ? "Two green bottles" : "two green bottles"
	case 3:
		return capitalize ? "Three green bottles" : "three green bottles"
	case 4:
		return capitalize ? "Four green bottles" : "four green bottles"
	case 5:
		return capitalize ? "Five green bottles" : "five green bottles"
	case 6:
		return capitalize ? "Six green bottles" : "six green bottles"
	case 7:
		return capitalize ? "Seven green bottles" : "seven green bottles"
	case 8:
		return capitalize ? "Eight green bottles" : "eight green bottles"
	case 9:
		return capitalize ? "Nine green bottles" : "nine green bottles"
	case 10:
		return "Ten green bottles"
	case:
		return ""
	}
}
