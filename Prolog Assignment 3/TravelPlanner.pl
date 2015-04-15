welcome:-write('Welcome to Assam State Travel Planner'),nl,write('Please select one of the following two options.'),
			nl,write('1. Plan your journey between two places.'),nl,write('2. Plan your journey between two places via another place.'),
			nl,write('Your option: '),process.
			
process:-read(X),nl,selec(X).
			
selec(1):-write('You have selected option 1'),nl,nl,write('The available locations are as follows:'),nl,location,input(1),!;write('No travel routes exists.'),!.
selec(2):-write('You have selected option 2'),nl,nl,write('The available locations are as follows:'),nl,location,input(2),!;write('No travel routes exists.'),!.
selec(X):-write('Invalid option.Please select between option 1 and option 2'),nl,write('Your option: '),process.
		   
location:-see('locations.txt'),
        repeat,
        read(T),output(T),T=end_of_file,!,nl,seen. 
		
output(end_of_file).

output(T):-write(T),nl.
		   
input(1):-write('Please give the following details'),nl,write('Source: '),read(S),nl,write('Destination: '),read(D),nl,
          write('Day of travel: '),read(Da),nl,nl,finalprocess(S,D,Da).
		  
input(2):-write('Please give the following details'),nl,write('Source: '),read(S),nl,write('Destination: '),read(D),nl,
          write('Via : '),read(V),nl,write('Day of travel: '),read(Da),nl,nl,finalprocess2(S,V,D,Da).
		  
finalprocess(S,D,Da):-bagof(L,route(S,D,Da,0,00,'AM',[],L),Finallist),arrange,answers(Finallist,0).

finalprocess2(S,V,D,Da):-bagof(L,route2(S,V,D,Da,0,00,'AM',L),Finallist),arrange,answers(Finallist,0).
		  
answers([],X):-result([],X).
answers([H|T],X):-write('Plan '),A is X+1,write(A),tab(8),result(H,1),nl,nl,answers(T,A).

route2(S,V,D,Da,T1,T2,T3,L):-route(S,V,Da,T1,T2,T3,[],L1),length(L1,X),A is X-1,B is X-2,C is X-3,E is X-4,nth1(A,L1,P),nth1(B,L1,Q),
							 nth1(C,L1,R),nth1(E,L1,F),route(V,D,F,R,Q,P,[],L2),addelem(L1,L2,L).
							 
route2(S,V,D,Da,T1,T2,T3,L):-route(S,V,Da,T1,T2,T3,[],L1),length(L1,X),A is X-1,B is X-2,C is X-3,E is X-4,nth1(A,L1,P),nth1(B,L1,Q),
							 nth1(C,L1,R),nth1(E,L1,F),route(V,D,O,R,Q,P,[],L2),\+ (F=O),addelem(L1,L2,L).

route(S,D,Da,T1,T2,T3,L1,L):-journey(S,D,Da,Da,M,TL1,TL2,TL3,TA1,TA2,TA3),T3='AM',TL3='PM',count(S,L1,0,Y),\+ (Y>=2),
							 count(D,L1,0,X),\+ (X>=2),addelem([M,Da,TL1,TL2,TL3,S,Da,TA1,TA2,TA3,D],L1,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,D,Da,Da,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1>T1,count(S,L1,0,Y),\+ (Y>=2),
							 count(D,L1,0,X),\+ (X>=2),addelem([M,Da,TL1,TL2,TL3,S,Da,TA1,TA2,TA3,D],L1,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,D,Da,Da,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1=T1,TL2>=T2,count(S,L1,0,Y),\+ (Y>=2),
							 count(D,L1,0,X),\+ (X>=2),addelem([M,Da,TL1,TL2,TL3,S,Da,TA1,TA2,TA3,D],L1,L).
			   
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,D,Da,O,M,TL1,TL2,TL3,TA1,TA2,TA3),T3='AM',TL3='PM',\+ (Da=O),count(S,L1,0,Y),\+ (Y>=2),
							 count(D,L1,0,X),\+ (X>=2),addelem([M,Da,TL1,TL2,TL3,S,O,TA1,TA2,TA3,D],L1,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,D,Da,O,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1>T1,\+ (Da=O),count(S,L1,0,Y),\+ (Y>=2),
							 count(D,L1,0,X),\+ (X>=2),addelem([M,Da,TL1,TL2,TL3,S,O,TA1,TA2,TA3,D],L1,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,D,Da,O,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1=T1,TL2>=T2,\+ (Da=O),count(S,L1,0,Y),\+ (Y>=2),
							 count(D,L1,0,X),\+ (X>=2),addelem([M,Da,TL1,TL2,TL3,S,O,TA1,TA2,TA3,D],L1,L).
			   
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,X,Da,Da,M,TL1,TL2,TL3,TA1,TA2,TA3),T3='AM',TL3='PM',route(X,D,Da,TA1,TA2,TA3,L1,L2),count(S,L2,0,Y),\+ (Y>=2),
							 count(X,L2,0,Z),\+ (Z>=2),addelem([M,Da,TL1,TL2,TL3,S,Da,TA1,TA2,TA3,X],L2,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,X,Da,Da,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1>T1,route(X,D,Da,TA1,TA2,TA3,L1,L2),count(S,L2,0,Y),\+ (Y>=2),
							 count(X,L2,0,Z),\+ (Z>=2),addelem([M,Da,TL1,TL2,TL3,S,Da,TA1,TA2,TA3,X],L2,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,X,Da,Da,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1=T1,TL2>=T2,route(X,D,Da,TA1,TA2,TA3,L1,L2),count(S,L2,0,Y),\+ (Y>=2),
							 count(X,L2,0,Z),\+ (Z>=2),addelem([M,Da,TL1,TL2,TL3,S,Da,TA1,TA2,TA3,X],L2,L).
						
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,X,Da,O,M,TL1,TL2,TL3,TA1,TA2,TA3),T3='AM',TL3='PM',\+ (Da=O),route(X,D,O,TA1,TA2,TA3,L1,L2),count(S,L2,0,Y),\+ (Y>=2),
						     count(X,L2,0,Z),\+ (Z>=2),addelem([M,Da,TL1,TL2,TL3,S,O,TA1,TA2,TA3,X],L2,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,X,Da,O,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1>T1,\+ (Da=O),route(X,D,O,TA1,TA2,TA3,L1,L2),count(S,L2,0,Y),\+ (Y>=2),
							 count(X,L2,0,Z),\+ (Z>=2),addelem([M,Da,TL1,TL2,TL3,S,O,TA1,TA2,TA3,X],L2,L).
route(S,D,Da,T1,T2,T3,L1,L):-journey(S,X,Da,O,M,TL1,TL2,TL3,TA1,TA2,TA3),T3=TL3,TL1=T1,TL2>=T2,\+ (Da=O),route(X,D,O,TA1,TA2,TA3,L1,L2),count(S,L2,0,Y),\+ (Y>=2),
							 count(X,L2,0,Z),\+ (Z>=2),addelem([M,Da,TL1,TL2,TL3,S,O,TA1,TA2,TA3,X],L2,L).
						
addelem([],L,L).
addelem([H|T],L1,L):-addelem(T,L1,L2),add(H,L2,L).

add(X,L,[X|L]).

arrange:-write('Plans'),tab(10),write('Modes'),tab(16),write('Times'),tab(30),write('Locations'),nl.

result([],0):-write('No travel route exists.').

result([],X).

result(L,X):-dres(L),tab(16),write('Leave '),del(L,L1),dres(L1),write(' '),del(L1,L2),dres(L2),write(':'),
			 del(L2,L3),check(L3),del(L3,L4),dres(L4),tab(15),del(L4,L5),dres(L5),nl,
			 tab(36),write('Arrive '),del(L5,L6),dres(L6),write(' '),del(L6,L7),dres(L7),write(':'),del(L7,L8),check(L8),
			 del(L8,L9),dres(L9),tab(15),del(L9,L10),dres(L10),nl,del(L10,L11),tab(15),result(L11,1).
			 
dres([H|T]):-write(H).
			 
del([H|T],T).
			
check([H|T]):-H=0,write('00');H=1,write('01');H=2,write('02');H=3,write('03');H=4,write('04');H=5,write('05');H=6,write('06');
			  H=7,write('07');H=8,write('08');H=9,write('09');write(H).
		
count(X,[X|T],Z,Y):-A is Z+1,!,count(X,T,A,Y).
count(X,[H|T],Z,Y):-count(X,T,Z,Y),!.
count(X,[],Z,Z).

journey('Kapili','Khoka','Sunday','Sunday','Walking',10,00,'AM',10,05,'AM').
journey('Khoka','Jalukbari','Sunday','Sunday','Tempo',10,05,'AM',10,45,'AM').
journey('Khoka','Ferry Ghat1','Sunday','Sunday','Tempo',11,05,'AM',11,15,'AM').
journey('Ferry Ghat1','Ferry Ghat2','Sunday','Sunday','Ferry',11,20,'AM',11,35,'AM').
journey('Ferry Ghat2','Panbazaar','Sunday','Sunday','Bus',11,45,'AM',12,05,'PM').
journey('Jalukbari','Panbazaar','Sunday','Sunday','Bus',10,45,'AM',11,15,'AM').
journey('Khoka','Kapili','Sunday','Sunday','Walking',10,05,'AM',10,10,'AM').
journey('Kapili','Khoka','Sunday','Sunday','Walking',10,10,'AM',10,15,'AM').
journey('Khoka','Kapili','Sunday','Sunday','Walking',10,15,'AM',10,20,'AM').
journey('Kapili','Khoka','Sunday','Sunday','Walking',10,20,'AM',10,25,'AM').