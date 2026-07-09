package custom_set

import "core:fmt"
import "core:slice"

Set :: distinct map[int]struct{}

new_set :: proc(elements: ..int) -> Set {
	set: Set = make(Set)
	for e in elements {
		map_insert(&set, e, struct{}{})
	}
	return set
}

destroy_set :: proc(s: ^Set) {
	delete(s^)
}

to_string :: proc(s: Set) -> string {
	keys := make([dynamic]int, 0, len(s))
	defer delete(keys)
	for key in s {
		append(&keys, key)
	}
	slice.sort(keys[:])
	return fmt.aprint(keys)
}

is_empty :: proc(s: Set) -> bool {
	return len(s) <= 0
}

contains :: proc(s: Set, element: int) -> bool {
	_, exist := s[element]
	return exist
}

is_subset :: proc(s: Set, other: Set) -> bool {
	if len(s) > len(other) {return false}
	for e in s {
		_, exist := other[e]
		if (!exist) {return false}
	}
	return true
}

is_disjoint :: proc(s: Set, other: Set) -> bool {
	for e in s {
		_, exist := other[e]
		if (exist) {return false}
	}
	return true
}

equal :: proc(s: Set, other: Set) -> bool {
	if len(s) != len(other) {return false}
	for e in s {
		_, exist := other[e]
		if (!exist) {return false}
	}
	return true
}

add :: proc(s: ^Set, elements: ..int) {
	for e in elements {
		_, _, _, _ = map_entry(s, e)
	}
}

intersection :: proc(s: Set, other: Set) -> Set {
	res: Set = make(Set)
	for e in s {
		_, exist := other[e]
		if (exist) {res[e] = struct{}{}}
	}
	return res
}

difference :: proc(s: Set, other: Set) -> Set {
	res: Set = make(Set)
	for e in s {
		_, exist := other[e]
		if (!exist) {res[e] = struct{}{}}
	}
	return res
}

// union is a reserved word in Odin, using join instead.
join :: proc(s: Set, other: Set) -> Set {
	res: Set = make(Set)
	for e in s {
		_, _, _, _ = map_entry(&res, e)
	}
	for e in other {
		_, _, _, _ = map_entry(&res, e)
	}
	return res
}
