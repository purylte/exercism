package food_chain

import "core:fmt"
import "core:strings"

Animal :: enum {
	FLY,
	SPIDER,
	BIRD,
	CAT,
	DOG,
	GOAT,
	COW,
	HORSE,
}
@(rodata)
animal_order := []Animal{.FLY, .SPIDER, .BIRD, .CAT, .DOG, .GOAT, .COW, .HORSE}

recite :: proc(start, end: int) -> string {
	b := strings.builder_make()
	for i := start - 1; i < end; i += 1 {
		verse(&b, i)

		if i != end - 1 {
			fmt.sbprintln(&b)
		}
	}

	return strings.trim_space(strings.to_string(b))
}

verse :: proc(b: ^strings.Builder, i: int) {
	animal := animal_order[i]
	i_know(b, animal)
	describe(b, animal)

	if i == len(animal_order) - 1 {
		return
	}

	for j := i; j > 0; j -= 1 {
		catch_phrase(b, animal_order[j], animal_order[j - 1])
	}

	fmt.sbprintfln(
		b,
		"I don't know why she swallowed the %v. Perhaps she'll die.",
		animal_name(animal_order[0]),
	)
}


i_know :: proc(b: ^strings.Builder, animal: Animal) {
	FIRST_LINE :: "I know an old lady who swallowed a %s."
	fmt.sbprintfln(b, FIRST_LINE, animal_name(animal))
}

describe :: proc(b: ^strings.Builder, animal: Animal) {
	#partial switch (animal) {
	case .SPIDER:
		fmt.sbprintln(b, "It wriggled and jiggled and tickled inside her.")
	case .BIRD:
		fmt.sbprintln(b, "How absurd to swallow a bird!")
	case .CAT:
		fmt.sbprintln(b, "Imagine that, to swallow a cat!")
	case .DOG:
		fmt.sbprintln(b, "What a hog, to swallow a dog!")
	case .GOAT:
		fmt.sbprintln(b, "Just opened her throat and swallowed a goat!")
	case .COW:
		fmt.sbprintln(b, "I don't know how she swallowed a cow!")
	case .HORSE:
		fmt.sbprintln(b, "She's dead, of course!")
	}
}

catch_phrase :: proc(b: ^strings.Builder, predator, prey: Animal) {
	fmt.sbprintf(
		b,
		"She swallowed the %s to catch the %s",
		animal_name(predator),
		animal_name(prey),
	)

	if prey == .SPIDER {
		fmt.sbprint(b, " that wriggled and jiggled and tickled inside her")
	}

	fmt.sbprintln(b, ".")
}

animal_name :: proc(animal: Animal) -> string {
	switch animal {
	case .FLY:
		return "fly"
	case .SPIDER:
		return "spider"
	case .BIRD:
		return "bird"
	case .CAT:
		return "cat"
	case .DOG:
		return "dog"
	case .GOAT:
		return "goat"
	case .COW:
		return "cow"
	case .HORSE:
		return "horse"
	case:
		return ""
	}
}
