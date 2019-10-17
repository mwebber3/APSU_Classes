% Author: Mikayla Webber
% CSCI 4230 Assignment 7
% This file contains the commands typed into the interpreter and the results of said commands. It also shows what the instrucions were and what my solution was.

% 1. Write a predicate mother(Mother, Child) that succeeds if Mother is the mother of Child.
% Rule: mother(Mother, Child) :- female(Mother), parent(Mother, Child).
?- mother(Mother, Child).
% Results:
X = rosa_baggins,
Y = adalgrim_took
X = eglantine_banks,
Y = peregrin_took
X = berylla_boffin,
Y = mungo_baggins
X = berylla_boffin,
Y = largo_baggins
X = berylla_boffin,
Y = ponto_baggins
X = ruby_bolger,
Y = drogo_baggins
X = primula_brandybuck,
Y = frodo_baggins
X = mimosa_bunce,
Y = rosa_baggins
X = adamanta_chubb,
Y = hildigrim_took
X = adamanta_chubb,
Y = belladonna_took
X = adamanta_chubb,
Y = mirabella_took
X = menegilda_goold,
Y = saradoc_brandybuck
X = laura_grubb,
Y = bungo_baggins
X = tanta_hornblower,
Y = fosco_baggins
X = belladonna_took,
Y = bilbo_baggins
X = esmerelda_took,
Y = meriadoc_brandybuck
X = mirabella_took,
Y = primula_brandybuck
X = mirabella_took,
Y = rorimac_brandybuck

% 2. Write a predicate father(Father, Child) that succeeds if Father is the father of Child.
% Rule: father(Father, Child) :- male(Father), parent(Father, Child).
father(Father, Child).
% Results:
Child = mungo_baggins,
Father = balbo_baggins
Child = largo_baggins,
Father = balbo_baggins
Child = ponto_baggins,
Father = balbo_baggins
Child = bilbo_baggins,
Father = bungo_baggins
Child = frodo_baggins,
Father = drogo_baggins
Child = drogo_baggins,
Father = fosco_baggins
Child = fosco_baggins,
Father = largo_baggins
Child = bungo_baggins,
Father = mungo_baggins
Child = rosa_baggins,
Father = ponto_baggins
Child = primula_brandybuck,
Father = gorbadoc_brandybuck
Child = rorimac_brandybuck,
Father = gorbadoc_brandybuck
Child = saradoc_brandybuck,
Father = rorimac_brandybuck
Child = meriadoc_brandybuck,
Father = saradoc_brandybuck
Child = palladin_took_ii,
Father = adalgrim_took
Child = esmerelda_took,
Father = adalgrim_took
Child = adalgrim_took,
Father = hildigrim_took
Child = peregrin_took,
Father = palladin_took_ii
Child = hildigrim_took,
Father = gerontus_took
Child = belladonna_took,
Father = gerontus_took
Child = mirabella_took,
Father = gerontus_took

% 3. Write a predicate sibling(Sibling1, Sibling2) that succeeds if Sibling1 and Sibling2 are siblings. Note: a person can not be their own sibling.
% Rule:
% sibling(Sibling1, Sibling2) :-
  % father(Father, Sibling1),
  % father(Father, Sibling2),
  % Sibling1 \= Sibling2,
  % mother(Mother, Sibling1),
  % mother(Mother, Sibling2),
  % Sibling1 \= Sibling2.
?- sibling(Sibling1, Sibling2).
% Results:
Sibling1 = mungo_baggins,
Sibling2 = largo_baggins
Sibling1 = mungo_baggins,
Sibling2 = ponto_baggins
Sibling1 = largo_baggins,
Sibling2 = mungo_baggins
Sibling1 = largo_baggins,
Sibling2 = ponto_baggins
Sibling1 = ponto_baggins,
Sibling2 = mungo_baggins
Sibling1 = ponto_baggins,
Sibling2 = largo_baggins
Sibling1 = primula_brandybuck,
Sibling2 = rorimac_brandybuck
Sibling1 = rorimac_brandybuck,
Sibling2 = primula_brandybuck
Sibling1 = hildigrim_took,
Sibling2 = belladonna_took
Sibling1 = hildigrim_took,
Sibling2 = mirabella_took
Sibling1 = belladonna_took,
Sibling2 = hildigrim_took
Sibling1 = belladonna_took,
Sibling2 = mirabella_took
Sibling1 = mirabella_took,
Sibling2 = hildigrim_took
Sibling1 = mirabella_took,
Sibling2 = belladonna_took

% 4. Write a predicate first_cousin(Cousin1, Cousin2) that succeeds if Cousin1 and Cousin2 are ﬁrst cousins.
% Rule:
% first_cousin(Cousin1, Cousin2) :- parent(X, Cousin1), parent(Y, Cousin2), sibling(X, Y), Cousin1 \= Cousin2.
?- first_cousin(Cousin1, Cousin2).
% Results:
Cousin1 = frodo_baggins,
Cousin2 = saradoc_brandybuck
Cousin1 = bilbo_baggins,
Cousin2 = adalgrim_took
Cousin1 = bilbo_baggins,
Cousin2 = primula_brandybuck
Cousin1 = bilbo_baggins,
Cousin2 = rorimac_brandybuck
Cousin1 = adalgrim_took,
Cousin2 = bilbo_baggins
Cousin1 = adalgrim_took,
Cousin2 = primula_brandybuck
Cousin1 = adalgrim_took,
Cousin2 = rorimac_brandybuck
Cousin1 = primula_brandybuck,
Cousin2 = bilbo_baggins
Cousin1 = primula_brandybuck,
Cousin2 = adalgrim_took
Cousin1 = saradoc_brandybuck,
Cousin2 = frodo_baggins
Cousin1 = rorimac_brandybuck,
Cousin2 = bilbo_baggins
Cousin1 = rorimac_brandybuck,
Cousin2 = adalgrim_took
Cousin1 = fosco_baggins,
Cousin2 = bungo_baggins
Cousin1 = fosco_baggins,
Cousin2 = rosa_baggins
Cousin1 = bungo_baggins,
Cousin2 = fosco_baggins
Cousin1 = bungo_baggins,
Cousin2 = rosa_baggins
Cousin1 = rosa_baggins,
Cousin2 = fosco_baggins
Cousin1 = rosa_baggins,
Cousin2 = bungo_baggins

% 5. Write a predicate ancestor(Ancestor, Descendant) that succeeds if Ancestor is an ancestor of Descendant. You will need to deﬁne this one recursively.
% Rule:
% ancestor(Ancestor, Descendant) :-
    % parent(Ancestor, Descendant).
% ancestor(Ancestor, Descendant) :-
    % parent(Parent, Descendant),
    % ancestor(Ancestor, Parent).
?- ancestor(Ancestor, Descendant).
% Results:
Ancestor = drogo_baggins,
Descendant = frodo_baggins
Ancestor = primula_brandybuck,
Descendant = frodo_baggins
Ancestor = bungo_baggins,
Descendant = bilbo_baggins
Ancestor = belladonna_took,
Descendant = bilbo_baggins
Ancestor = saradoc_brandybuck,
Descendant = meriadoc_brandybuck
Ancestor = esmerelda_took,
Descendant = meriadoc_brandybuck
Ancestor = palladin_took_ii,
Descendant = peregrin_took
Ancestor = eglantine_banks,
Descendant = peregrin_took
Ancestor = adalgrim_took,
Descendant = palladin_took_ii
Ancestor = adalgrim_took,
Descendant = esmerelda_took
Ancestor = hildigrim_took,
Descendant = adalgrim_took
Ancestor = rosa_baggins,
Descendant = adalgrim_took
Ancestor = gorbadoc_brandybuck,
Descendant = primula_brandybuck
Ancestor = mirabella_took,
Descendant = primula_brandybuck
Ancestor = gerontus_took,
Descendant = hildigrim_took
Ancestor = adamanta_chubb,
Descendant = hildigrim_took
Ancestor = gerontus_took,
Descendant = belladonna_took
Ancestor = adamanta_chubb,
Descendant = belladonna_took
Ancestor = gerontus_took,
Descendant = mirabella_took
Ancestor = adamanta_chubb,
Descendant = mirabella_took
Ancestor = rorimac_brandybuck,
Descendant = saradoc_brandybuck
Ancestor = menegilda_goold,
Descendant = saradoc_brandybuck
Ancestor = gorbadoc_brandybuck,
Descendant = rorimac_brandybuck
Ancestor = mirabella_took,
Descendant = rorimac_brandybuck
Ancestor = fosco_baggins,
Descendant = drogo_baggins
Ancestor = ruby_bolger,
Descendant = drogo_baggins
Ancestor = largo_baggins,
Descendant = fosco_baggins
Ancestor = tanta_hornblower,
Descendant = fosco_baggins
Ancestor = mungo_baggins,
Descendant = bungo_baggins
Ancestor = laura_grubb,
Descendant = bungo_baggins
Ancestor = balbo_baggins,
Descendant = mungo_baggins
Ancestor = berylla_boffin,
Descendant = mungo_baggins
Ancestor = balbo_baggins,
Descendant = largo_baggins
Ancestor = berylla_boffin,
Descendant = largo_baggins
Ancestor = balbo_baggins,
Descendant = ponto_baggins
Ancestor = berylla_boffin,
Descendant = ponto_baggins
Ancestor = ponto_baggins,
Descendant = rosa_baggins
Ancestor = mimosa_bunce,
Descendant = rosa_baggins
Ancestor = fosco_baggins,
Descendant = frodo_baggins
Ancestor = ruby_bolger,
Descendant = frodo_baggins
Ancestor = largo_baggins,
Descendant = frodo_baggins
Ancestor = tanta_hornblower,
Descendant = frodo_baggins
Ancestor = balbo_baggins,
Descendant = frodo_baggins
Ancestor = berylla_boffin,
Descendant = frodo_baggins
Ancestor = gorbadoc_brandybuck,
Descendant = frodo_baggins
Ancestor = mirabella_took,
Descendant = frodo_baggins
Ancestor = gerontus_took,
Descendant = frodo_baggins
Ancestor = adamanta_chubb,
Descendant = frodo_baggins
Ancestor = mungo_baggins,
Descendant = bilbo_baggins
Ancestor = laura_grubb,
Descendant = bilbo_baggins
Ancestor = balbo_baggins,
Descendant = bilbo_baggins
Ancestor = berylla_boffin,
Descendant = bilbo_baggins
Ancestor = gerontus_took,
Descendant = bilbo_baggins
Ancestor = adamanta_chubb,
Descendant = bilbo_baggins
Ancestor = rorimac_brandybuck,
Descendant = meriadoc_brandybuck
Ancestor = menegilda_goold,
Descendant = meriadoc_brandybuck
Ancestor = gorbadoc_brandybuck,
Descendant = meriadoc_brandybuck
Ancestor = mirabella_took,
Descendant = meriadoc_brandybuck
Ancestor = gerontus_took,
Descendant = meriadoc_brandybuck
Ancestor = adamanta_chubb,
Descendant = meriadoc_brandybuck
Ancestor = adalgrim_took,
Descendant = meriadoc_brandybuck
Ancestor = hildigrim_took,
Descendant = meriadoc_brandybuck
Ancestor = rosa_baggins,
Descendant = meriadoc_brandybuck
Ancestor = gerontus_took,
Descendant = meriadoc_brandybuck
Ancestor = adamanta_chubb,
Descendant = meriadoc_brandybuck
Ancestor = ponto_baggins,
Descendant = meriadoc_brandybuck
Ancestor = mimosa_bunce,
Descendant = meriadoc_brandybuck
Ancestor = balbo_baggins,
Descendant = meriadoc_brandybuck
Ancestor = berylla_boffin,
Descendant = meriadoc_brandybuck
Ancestor = adalgrim_took,
Descendant = peregrin_took
Ancestor = hildigrim_took,
Descendant = peregrin_took
Ancestor = rosa_baggins,
Descendant = peregrin_took
Ancestor = gerontus_took,
Descendant = peregrin_took
Ancestor = adamanta_chubb,
Descendant = peregrin_took
Ancestor = ponto_baggins,
Descendant = peregrin_took
Ancestor = mimosa_bunce,
Descendant = peregrin_took
Ancestor = balbo_baggins,
Descendant = peregrin_took
Ancestor = berylla_boffin,
Descendant = peregrin_took
Ancestor = hildigrim_took,
Descendant = palladin_took_ii
Ancestor = rosa_baggins,
Descendant = palladin_took_ii
Ancestor = gerontus_took,
Descendant = palladin_took_ii
Ancestor = adamanta_chubb,
Descendant = palladin_took_ii
Ancestor = ponto_baggins,
Descendant = palladin_took_ii
Ancestor = mimosa_bunce,
Descendant = palladin_took_ii
Ancestor = balbo_baggins,
Descendant = palladin_took_ii
Ancestor = berylla_boffin,
Descendant = palladin_took_ii
Ancestor = hildigrim_took,
Descendant = esmerelda_took
Ancestor = rosa_baggins,
Descendant = esmerelda_took
Ancestor = gerontus_took,
Descendant = esmerelda_took
Ancestor = adamanta_chubb,
Descendant = esmerelda_took
Ancestor = ponto_baggins,
Descendant = esmerelda_took
Ancestor = mimosa_bunce,
Descendant = esmerelda_took
Ancestor = balbo_baggins,
Descendant = esmerelda_took
Ancestor = berylla_boffin,
Descendant = esmerelda_took
Ancestor = gerontus_took,
Descendant = adalgrim_took
Ancestor = adamanta_chubb,
Descendant = adalgrim_took
Ancestor = ponto_baggins,
Descendant = adalgrim_took
Ancestor = mimosa_bunce,
Descendant = adalgrim_took
Ancestor = balbo_baggins,
Descendant = adalgrim_took
Ancestor = berylla_boffin,
Descendant = adalgrim_took
Ancestor = gerontus_took,
Descendant = primula_brandybuck
Ancestor = adamanta_chubb,
Descendant = primula_brandybuck
Ancestor = gorbadoc_brandybuck,
Descendant = saradoc_brandybuck
Ancestor = mirabella_took,
Descendant = saradoc_brandybuck
Ancestor = gerontus_took,
Descendant = saradoc_brandybuck
Ancestor = adamanta_chubb,
Descendant = saradoc_brandybuck
Ancestor = gerontus_took,
Descendant = rorimac_brandybuck
Ancestor = adamanta_chubb,
Descendant = rorimac_brandybuck
Ancestor = largo_baggins,
Descendant = drogo_baggins
Ancestor = tanta_hornblower,
Descendant = drogo_baggins
Ancestor = balbo_baggins,
Descendant = drogo_baggins
Ancestor = berylla_boffin,
Descendant = drogo_baggins
Ancestor = balbo_baggins,
Descendant = fosco_baggins
Ancestor = berylla_boffin,
Descendant = fosco_baggins
Ancestor = balbo_baggins,
Descendant = bungo_baggins
Ancestor = berylla_boffin,
Descendant = bungo_baggins
Ancestor = balbo_baggins,
Descendant = rosa_baggins
Ancestor = berylla_boffin,
Descendant = rosa_baggins

% 6. Write a predicate common_ancestor(Ancestor, Person1, Person2) that succeeds if Ancestor is an ancestor of both Person1 and Person2.
% Rule:
% common_ancestor(Ancestor, Person1, Person2) :-
  % not(Person1 = Person2),
  % ancestor(Ancestor, Person1),
  % ancestor(Ancestor, Person2).
?- common_ancestor(balbo_baggins, drogo_baggins, fosco_baggins).
% Results: true
?- common_ancestor(balbo_baggins, drogo_baggins, rosa_baggins).
% Results: true
?- common_ancestor(balbo_baggins, drogo_baggins, berylla_boffin).
% Results: false

% 7. Write a predicate do_reverse(List, Reverse) that succeeds if Reverse contains the elements of List in reverse. You may not use the built-in predicate reverse.
% Rule:
% do_reverse(List, Reverse) :- do_reverse(List, Reverse, []).
% do_reverse([], List, List).
% do_reverse([Head | Tail], List, Result) :- do_reverse(Tail, List, [Head | Result]).
?- do_reverse([1,2,3],[3,2,1]).
% Results: true
?- do_reverse([1,2,3],[2,3,1]).
% Results: false

% 8. Write a predicate insert_item(Item, List, Result) that succeeds if Result contains the elements of List with Item inserted and both List and Result are sorted. You do not have to verify that List is sorted, you may assume that it is instantiated with the value of a sorted list.
% Rule:
% insert_item(Item, [], [Item]) :- !.
% insert_item(Item, [Item1 | List], [Item, Item1 | List]) :- Item =< Item1, !.
% insert_item(Item, [Item1 | List], [Item1 | Result]) :- insert_item(Item, List, Result).
?- insert_item(3, [1,2], [1,2,3]).
% Results: true
?- insert_item(3, [1,2], [1,2,4]).
% Results: false

% 9. Write a predicate insertion_sort(List, SortedList) that uses insert_item to sort List by ﬁrst recursively sorting its tail, then inserting the head into the result to get SortedList. You may not use the built-in sort predicate.
% Rule:
% insertion_sort([], []) :- !.
% insertion_sort([Item | List], SortedList) :- insertion_sort(List, SortedList1), insert_item(Item, SortedList1, SortedList).
?- insertion_sort([3,2,1], [1,2,3]).
% Results: true
?- insertion_sort([3,2,0], [1,2,3]).
% Results: false

% 10. Write a predicate is_union(Set1, Set2, Union) that succeeds if Union is the union of Set1 and Set2, where Set1 and Set2 are unsorted lists of unique items. You may not use the built-in union predicate, but you may use the built-in member predicate.
% Rule:
% union([], Set2, Union).
% union([Head | List], Set2, Union) :-
  % member(Head, Set2), !,
  % union(List, Set2, Union).
% union([Head | List], Set2, [Head | List1]) :-
  % union(List, Set2, List1).
?- union([1,2], [3,4], [1,2,3,4]).
% Results: true
?- union([1,7], [3,4], [1,2,3,4]).
% Result: false
