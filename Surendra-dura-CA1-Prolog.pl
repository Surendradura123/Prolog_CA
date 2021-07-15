% Question number 1
% print_status having the list of list then show in the each list have to show in new line
print_status([]):- !.
% print_status have the head and tail in the list then sublist shoud be head and tail will be the print_status.
print_status([H|T]):- sublist(H), print_status(T).
% if sublist have the list of list then each list will be seperated by the | and show in the new line.
sublist([]):- write('|'),nl.
% if sublist is divide into head and tail then, list will be seprate by the | and
% head will be show in the line and the tail will be recursion until the list doesnot finished
sublist([H|T]):- write('|'),write(H),sublist(T).


%ans print_status([[b, c, f], [a, d, g], [h, e]]).

% Question Number 2
% height predicate have the three value in which one is list and
% two other value is anonymous variable and both the anobymous variable represent different values
% '!' cut symbol is help me to stop the loop and 
% then'fail' which help to negation as failure so that 
% in the third part I will get only the correct element .
height([],_,_):-!,fail.
% i have list of list so i introduce height_sublist predicate.If height predicate having the list 
% then head goes to the sublist and tail goes to the height of the list.
height([H|T],X,N):- height_list(H,X,N);height(T,X,N).
% If the sublist having the list then head should be equal to block(H) and 
% the value will be started from the 0.
height_list([H|_],H,0).
% If the sublist have list of head and tail then block X will be the member of list, and
%tail goes to the sublist predicate but the number of the value will be increased by 1 where
% the first number is started from the 0.
height_list([_|T],Y,N):- height_list(T,Y,N1),N is N1+1.

%ans: height([[b,c,f],[a,d,g],[h,e]],c,H). 
%ans: height([[b,c,f],[a,d,g],[h,e]],X,2).

% Question Number 3
% i used findall method where i called hegiht from the second part
all_same_height(B,N,L):- findall(X,height(B,X,N),L),!.

% all_same_height([[b,c,f],[a,d,g],[h,e]],0,L). 

% Question Number 4
% if the same_height having the block of element B, and X and Y should be the value of the blocks having same height
% then i called the height where it has blocks of element B, X is the element and the H is the height of the element
% then X will be equal to Y.
same_height(B,X,Y):- height(B,X,H),height(B,Y,H),!.

%ans same_height([[b,c,f],[a,d,g],[h,e]],b,h).


% if the list is empty then other value should have wildcard.
move_block([],_,_,_) :- !.
% if the list is have head H and Tail T then 
% X will the block present in the second Stack which should be in the top of the stack
% S1 will the the integer value if the stack 2 which is 2.
% S2 will the the integer value if the stack 1 which is 1.
% so I have to move the value of X to the S1 and del from the S2
% and the rest of the stack should be present as normal
move_block([H|T],X,S1,S2):- 
    % getting the position of stack 1 by using the nth1 method present in prolog
    % nth1 having the S1 and the List[H|T] and the element on the Stack1 is E1
    %nth1(?Index, ?List, ?Elem)
    nth1(S1,[H|T],E1),
    % checking the length of the stack1 where E1 is the list and L is the length.
    len(E1,L),
    % Take the n-th element in the list
    L1 is L-1,
    % called the height from the second part which have E1 list and X block and
    % L1 is length of the stack which is equal to height of height predicates.
    height([E1],X,L1),
    % delete the block from the stack 2 
    del(X,E1,DEL),
    %get the position of stack2 is E2
    nth1(S2,[H|T],E2), 
    % append the block to the add the block to the top of Stack 1. and get the new list
    append(E2,[X],NEW),
    % print the list before the changes i called the print_status from the question 1
    write('Before: '),nl,print_status([H|T]),
    
    % print S1 and S2 after modified
    write('After: '),nl,print_status([NEW]),print_status([DEL|T]),!.
	


% if the list is the empty the length of the list will be 0.
len([],0).
% if the list have head and tail then the length of the list will be added by 1.
len([_|T],L):-len(T,L1),L is L1+1.


% This predicate is used to delete the block we are moving from a list
% This code was taken from a website, the reference is just below
% Logic programing, "Processing List in Prlogo -2", 2012. [Online]. 
% Available at: https://www.cs.bham.ac.uk/~pjh/modules/current/25433/lectures/lecture8/lecture8_slides.pdf [[Accessed on:10th April, 2021].
% 1 - base case when is the last block of the list
%delete(H, [H|T], T).
% 2 - recursive call
%delete(I, [H|T], [H|N]) :- delete(I, T, N).
%if Y is the delete from the list then if the list having only one Y then list will be empty at the end.
del(Y,[Y],[]).
%if X is delete from the list then if thelist having head X and tail L then the new list will be tail L only.
del(X,[X|L],L).
% if X is delete from the list then if the list having head Y and tail L then new list have head Y and tail L1
% where X will be delete from the list L to get L1.
del(X,[Y|L],[Y|L1]):- del(X,L,L1).



%ans move_block([[b,c,f],[a,d,g],[h,e]],g,2,1).








