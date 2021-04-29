#!/usr/bin/env -S swipl -q -g main

fizzbuzz(N, 'fizzbuzz') :-
  0 is N mod 3,
  0 is N mod 5, !.

fizzbuzz(N, 'fizz') :-
  0 is N mod 3, !.

fizzbuzz(N, 'buzz') :-
  0 is N mod 5, !.

fizzbuzz(N, N).

seq(From, From, [From]).

seq(From, To, [From|Seq]) :-
  To > From,
  Next is From + 1,
  seq(Next, To, Seq).

main(_) :-
  findall(W,
    (seq(1,100,S),
    member(N,S),
    fizzbuzz(N,W)), Ws),
  maplist(writeln,Ws),
  halt.
