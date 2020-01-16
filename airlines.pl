%   Erkan Yılmaz                    %
%   161044044                       %
%   CSE341 – Programming Languages  %
%   (Fall 2019)Homework #4          %
%                                   %



%       PART 1                  
%   
%





%               FACTS               %

flight(edirne ,edremit).
flight(edremit,edirne).
flight(edremit ,erzincan).
flight(erzincan,edremit ).
flight(istanbul,izmir).
flight(izmir,istanbul).
flight(izmir,ısparta).
flight(ısparta,izmir).
flight(ısparta,burdur).
flight(burdur,ısparta).
flight(istanbul,antalya).
flight(antalya,istanbul).
flight(antalya,konya).
flight(konya,antalya).
flight(konya,ankara).
flight(ankara,konya).
flight(ankara,van).
flight(van,ankara).
flight(van,rize).
flight(rize,van).
flight(istanbul,rize).
flight(rize,istanbul).
flight(istanbul,van).
flight(van,istanbul).
flight(istanbul,ankara).
flight(ankara,istanbul).
flight(istanbul,gaziantep).
flight(gaziantep,istanbul).
flight(antalya,gaziantep).
flight(gaziantep,antalya).



%               RULES               %

route(X,Y):-
    flight(X,Y).


route(X,Z):-
    flight(X,Y),
    flight(Y,Z),
    not(Y==Z).%buraya bak%










%               PART2               %


%               FACTS               %

distance(istanbul,izmir,328).
distance(izmir,istanbul,328).

distance(istanbul,antalya,482).
distance(antalta,istanbul,482).

distance(istanbul,konya,461).
distance(konya,istanbul,461).

distance(istanbul,gaziantep,848).
distance(gaziantep,istanbul,848).

distance(istanbul,ankara,350).
distance(ankara,istanbul,350).

distance(istanbul,kars,1189).
distance(kars,istanbul,1189).

distance(istanbul,trabzon,902).
distance(trabzon,istanbul,902).

distance(edirne,edremit,225).
distance(edremit,edirne,225).

distance(edremit,erzincan,1044).
distance(erzincan,edremit,1044).

distance(izmir,ankara,521).
distance(ankara,izmir,521).

distance(konya,ankara,231).
distance(ankara,konya,231).

distance(ankara,trabzon,593).
distance(trabzon,ankara,593).

distance(ankara,kars,872).
distance(kars,ankara,872).





% a predicate indicating there exist a route between X and Y if there is
% flight between X and Y

addList([],L,L).
addList(Element,L,[Element|L]).

member(X,[X|_]).
member(X,[_|Tail]):- member(X,Tail).

sroute(A,B,D) :-
       travel(A,B,[A],P,D),
       write(P).

travel(A,B,P,[B|P],D) :-
       %write('travel1'),
       flight(A,B),
       distance(A,B,D),!.

travel(A,B,Visited,Path,D) :-
       %write('travel2'),
       flight(A,C),
       C \== B,
       \+member(C,Visited),
       distance(A,C,Old),
       travel(C,B,[C|Visited],Path,D2),
       D is Old+ D2.


%               PART3               %

%               FACTS               %

when(102,10).
when(108,12).
when(341,14).
when(455,16).
when(452,17).

where(102,z23).
where(108,z11).
where(341,z06).
where(455,207).
where(452,207).


enroll(a,102).
enroll(a,108).
enroll(b,102).
enroll(c,108).
enroll(d,341).
enroll(e,455).



%               RULES               %



%   RULE THAT SHOW SCHEDULE         %
%           FOR A STUDENT           %
schedule(S,R,T):- enroll(S,L),
                where(L,R), 
                when(L,T).




%   RULE THAT SHOW TIME OF          %
%       THE GIVEN LECTURE           %
usage(L,T):- where(R,L),
             when(R,T).


%   RULE THAT CHECK CONFLICT        %
%       AS LOOKING TIME                 %
conflictTime(X,Y):-  when(X,T1),
                 when(Y,T2),
                 T1 == T2.


%   RULE THAT CHECK CONFLICT        %
%       AS LOOKING LOCATION         %
conflictClass(X,Y):- where(X,L1),
                where(Y,L2),
                L1==L2.


%   RULE THAT CHECK CONFLICT        %
conflict(X,Y):- not((not(conflictClass(X,Y)),
                     not(conflictTime(X,Y)))).



%       DO STUDENTS SEE EACTH       %
%               IN CLASS            %
meet(S1,S2):- enroll(S1,L1),
            where(L1,R1),
            enroll(S2,L2),
            where(L2,R2),
            L1==L2,R1==R2,
            !.




%               PART4               %

%               RULES               %



%       RETURNS TRUE if E IS IN S                       %
element(E,S):-member(E,S),!.

%   RETURNS TRUE if Z IS UNION OF X and Y               %
union(X,Y,Z):-append(X,Y,Z).


%   RETURNS TRUE if S3 IS  INTERSECTION OF S1 and S2    %
intersect(S1,S2,S3):-intersection(S1,S2,S3).

%   RETURNS TRUE if E1 AND  E2 IS EQUAL                 %
equivalent(S1,S2):-S1==S2.




