(*
	Deadline: 10.27.17
	Course: CSCI 4230 Assignment 5
*)

(*
	1. Write a function called quadratic that takes three arguments representing the
	three coeffcients a, b, and c of a quadratic equation and uses the quadratic
	formula to calculate the two roots of the equation. If the discriminant b2 −4ac
	is negative, raise an exception called No_Real_Roots. Otherwise return a tuple
	containing the two roots, even if the roots are identical.
*)

(*type findRoots is a record that allows me to name the created elements and help
clean up the main quadratic funtion *)
type findRoots =
	| RealRoots of float * float
	| ComplexRoots of Complex.t * Complex.t;;

let quadratic a b c =
	let d = (b *. b) -. (4.0 *. a *. c) in
	if d < 0.0 then
		let e = -. b /. (2.0 *. a)
		and i = sqrt(-. d) /. (2.0 *. a) in
		ComplexRoots ({Complex.re = e; Complex.im = i},
			{Complex.re = e; Complex.im = (-.i)})
	else
		let e =
			if b < 0.0 then
				(((sqrt d) -. b) /. (2.0 *. a))
			else
				(((sqrt d) +. b) /. (-2.0 *. a))
		in RealRoots (e, c /. (e *. a));;

(*
	2. Write a function called third that returns the third element of a tuple
	containing three items.
*)

(*wild card for first and second place since the third one is the one we are after*)
let third (_, _, c) = c;;

(*
	3. Write a recursive function called reverse that takes a list as an argument
	and returns a list containing the items in the original list in reverse order.
	You may not use any built-in list functions to do this, but you may use the @
	operator to append two lists.
*)

let reverse list1 =
    let rec helper acc = function
      | [] -> acc
      | h::t -> helper (h::acc) t
  		in helper [] list1;;

(*
	4. Write a recursive function called member that takes an item and a list as
	arguments and returns true if the item is in the list and false otherwise. Use
	pattern matching to determine if the list is empty or not. You may not use any
	built-in list functions.
*)

(*if the list is empty then false else if h cons t and if h equals the item then
return true else if the helper item t binds with helper item list1 *)
let member item list1 =
	let rec helper item list1 =
		match list1 with
		| [] -> false
		| h::t ->
			if h = item then
				true
			else
				helper item t in
				helper item list1;;

(*
	5. Write a recursive function called union that takes two lists as arguments and
	returns a list containing all items that appear in either list with no duplicates.
	You may assume that each or the arguments contains no duplicates, but there may
	be items that appear in both lists. You may use the member function deﬁned in the
	previous problem, but you may not use any built-in list functions.
*)

(*is the list is empty with the second list being a wild card then list2 else if the
first list is a wild card and the second is empty then list 1 else if x cons xs and y
cons ys and if the member x list2 then chain with helper xs list2 else if x is cons
helper xs list2 bind with helper list1 list2*)
let union list1 list2 =
	let rec helper list1 list2 =
		match list1, list2 with
		| [],_ -> list2
		| _,[] -> list1
		| x::xs, y::ys ->
			if member x list2 then
				helper xs list2
			else x :: helper xs list2
				in helper list1 list2;;

(*
	6. Write a recursive function called intersect that takes two lists as arguments
	and returns a list containing all items that appear in both lists with no
	duplicates. The same assumptions and restrictions apply as the previous problem.
*)

(*if x cons xs and if member x list2 then cons x with helepr xs list2 else if helper
xs list2 chain with helper list1 list2 *)
let intersect list1 list2 =
	let rec helper list1 list2 =
		match list1 with
		| [] -> list1
		| x::xs ->
			if member x list2 then
				x :: helper xs list2
			else helper xs list2
				in helper list1 list2;;

(*
	7. Write a recursive function called partition that takes a pivot item and a list
	as arguments, and returns a tuple containing a list of items from the list that
	are less than the pivot and a list of items from the list that are greater than
	or equal to the pivot. If the original list contains duplicate items then the
	partitions should also contain duplicate items. If the original list is empty,
	both of the partitions should be empty. You may not use any built-in list functions.
*)

(*lesser is the function for the items in a list that are less than the pivot*)

(*if h cons t and if h is less than pivot then cons h with the helper
pivot t else if h is greater than pivot then helper pivot t will be chained with helper
pivot list1*)
let lesser pivot list1 =
	let rec helper pivot list1 =
		match list1 with
		| [] -> list1
		| h::t ->
			if (h < pivot) then
				h :: helper pivot t
			else helper pivot t
				in helper pivot list1;;

(*greater is the function for the items in a list that are greater than the pivot*)

(*if h cons t and if h greater than or equal to pivot then cons h with the helper
pivot t else if h is less than pivot then helper pivot t will be chained with helper
pivot list1*)
let greater pivot list1 =
	let rec helper pivot list1 =
		match list1 with
		| [] -> list1
		| h::t ->
			if (h >= pivot) then
				h :: helper pivot t
			else helper pivot t
				in helper pivot list1;;

(*the partition function combines lesser and greater*)
let partition pivot list1 =
	(lesser pivot list1, (greater pivot list1));;

(*
	8. Write a recursive function called quicksort that takes a list and sorts it
	by using the ﬁrst item in the list as a pivot, partitioning the remaining items
	using that pivot, sorting the partitions, and appending the ﬁrst partition to the
	pivot and the second partition. You may use the partition function from the
	previous problem, but you may not use any built-in list functions.
*)

(*if the list is empty then list1 else if h cons t then use patition to help with
the sort.*)
let quicksort list1 =
	let rec helper list1 =
		match list1 with
		| [] -> list1
		| h::t -> let tuple = partition h t
			in quicksort (list1 tuple) @ [h] @ quicksort (snd tuple)
			in helper list1;;
(*Line 6 characters 6-15 error: unbound value quicksort*)
