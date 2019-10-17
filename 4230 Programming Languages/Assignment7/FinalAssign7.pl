% Author: Mikayla Webber
% CSCI 4230 Assignment 7
consult('assign7data.pl').

% 1. Write a predicate mother(Mother, Child) that succeeds if Mother is the mother of Child.
mother(Mother, Child) :- female(Mother), parent(Mother, Child).

% 2. Write a predicate father(Father, Child) that succeeds if Father is the father of Child.
father(Father, Child) :- male(Father), parent(Father, Child).

% 3. Write a predicate sibling(Sibling1, Sibling2) that succeeds if Sibling1 and Sibling2 are siblings. Note: a person can not be their own sibling.
sibling(Sibling1, Sibling2) :-
  parent(Parent, Sibling1),
  parent(Parent, Sibling2).

% sibling(Sibling1, Sibling2) :-
  % father(Father, Sibling1),
  % father(Father, Sibling2),
  % Sibling1 \= Sibling2,
  % mother(Mother, Sibling1),
  % mother(Mother, Sibling2),
  % Sibling1 \= Sibling2.

% 4. Write a predicate first_cousin(Cousin1, Cousin2) that succeeds if Cousin1 and Cousin2 are ﬁrst cousins.
first_cousin(Cousin1, Cousin2) :-
  parent(Mother, Cousin1),
  sibling(Mother, Father),
  parent(Father, Cousin2).
  % or add this Cousin1 \= Cousin2.

% 5. Write a predicate ancestor(Ancestor, Descendant) that succeeds if Ancestor is an ancestor of Descendant. You will need to deﬁne this one recursively.
ancestor(Ancestor, Descendant) :- parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
  parent(Parent, Descendant),
  ancestor(Ancestor, Parent).
% ancestor(Ancestor, Descendant) :- parent(Ancestor, Descendant).
% ancestor(Ancestor, Descendant) :-
  % parent(Ancestor, Parent),
  % ancestor(Parent, Descendant).

% 6. Write a predicate common_ancestor(Ancestor, Person1, Person2) that succeeds if Ancestor is an ancestor of both Person1 and Person2.
common_ancestor(Ancestor, Person1, Person2) :-
  not(Person1 = Person2),
  ancestor(Ancestor, Person1),
  ancestor(Ancestor, Person2).

% 7. Write a predicate do_reverse(List, Reverse) that succeeds if Reverse contains the elements of List in reverse. You may not use the built-in predicate reverse.
do_reverse(List, Reverse) :- do_reverse(List, Reverse, []).
do_reverse([], List, List).
do_reverse([Head | Tail], List, Result) :- do_reverse(Tail, List, [Head | Result]).

% 8. Write a predicate insert_item(Item, List, Result) that succeeds if Result contains the elements of List with Item inserted and both List and Result are sorted. You do not have to verify that List is sorted, you may assume that it is instantiated with the value of a sorted list.
insert_item(Item, [], [Item]) :- !. % prevents backtracking
insert_item(Item, [Item1 | List], [Item, Item1 | List]) :- Item =< Item1, !.
insert_item(Item, [Item1 | List], [Item1 | Result]) :- insert_item(Item, List, Result).

% 9. Write a predicate insertion_sort(List, SortedList) that uses insert_item to sort List by ﬁrst recursively sorting its tail, then inserting the head into the result to get SortedList. You may not use the built-in sort predicate.
insertion_sort([], []) :- !. % prevents backtracking
insertion_sort([Item | List], SortedList) :- insertion_sort(List, SortedList1), insert_item(Item, SortedList1, SortedList).

% sort(+List, -Sorted) -- true if sorted can be unified with a list holding the elements of List, sorted to the standard order of terms. Duplicates are removed.

% 10. Write a predicate is_union(Set1, Set2, Union) that succeeds if Union is the union of Set1 and Set2, where Set1 and Set2 are unsorted lists of unique items. You may not use the built-in union predicate, but you may use the built-in member predicate.
is_union([], Set2, Union). % singleton variable warning but doesn't work without this
is_union([Head | List], Set2, Union) :-
  member(Head, Set2),
  is_union(List, Set2, Union).
is_union([Head | List], Set2, [Head | List1]) :-
  is_union(List, Set2, List1).
% member(X, [One]). -- true if X is a member of list.

% 11.  Write a predicate is_intersection(Set1, Set2,Intersection) that succeeds if Intersection is the intersection of Set1 and Set2, where Set1 and Set2 are unsorted lists of unique items. You may not use the built-in intersection predicate, but you may use the built-in member predicate.
is_intersection([], _, []).
is_intersection([Head | List], Set2, Intersection) :-
  member(Head, Set2),
  Intersection = [Head | List1],
  is_intersection(List, Set2, List1).
is_intersection([_ | List1], Set2, Intersection) :- is_intersection(List1, Set2, Intersection).
% member(X, [One]). -- true if X is a member of list.
