import System.Environment
import System.IO
import System.Random

t0 = [[1,2],[2],[2],[2]]
t1 = [[1,1,2,3,4],[2],[0,3,4],[1],[0],[1,6,7,8,9,10,11],[1],[2,8,9,10,11],[0,9],[2],[2,11],[0],[2,13,14,15,16,17,18,19,20],[0,14],[0],[1,16,17],[2],[1],[2,19,20],[0],[2]]
t2 = [[1,2,3],[2],[2],[0]]

maps = [t0,t1,t2]

main = do
  putStrLn "Welcome, please select the mode of the game: "
  putStrLn "Press '1 + Enter' for player vs player game."
  putStrLn "Press '2 + Enter' for player vs computer game."
  putStrLn "Press '3 + Enter' to quit."
  option <- getLine
  if (read option) == 3 
        then do
			putStrLn "Thank you for playing, Have a nice day :)"
			return()
        else do
			let outstr = stageMsg ((length maps)-1)
			putStrLn outstr
			stage <- getLine
			if (read option) == 1
				then do
					putStrLn "Player vs Player"
					putStrLn "The following map is loaded."
					print (maps!!(read stage))
					putStrLn ""
					putStrLn ""
					pvp  (maps!!(read stage)) (1::Int)
			else if (read option) == 2
				then do
					putStrLn "Player vs Computer"
					pvc
			else putStrLn "Invalid input."
			main
			
stageMsg x = "Please select the stage you want to play from 0 to " ++ totalStages ++ "." 
		where totalStages = show x
				
inpmsg x = "Player " ++ num ++ " enter input."
		where num = show x

message x = "Player " ++ num ++ " wins"
		where num = show x
		
validmoves x = "Valid moves for player " ++ num ++ " are as follows:"
		where num = show x
		
pvp x y = do
	if (check x 0 ((length x)-1)) == 0
		then do
			let msg = message y
			putStrLn msg
			putStrLn ""
		else do
			let moves = (playermoves x y 0) ++ (playermoves x 0 0)
			if moves == []
				then do
					let msg = message (flpuser y)
					putStrLn msg
					putStrLn ""
				else do
					let m = validmoves y
					putStrLn m
					print moves
					let msg = inpmsg y
					putStrLn msg
					inp <- getLine
					let z = correct x (read inp) y
					if z == 1
						then do
							putStrLn "Invalid Input."
							pvp x y
						else do
							let l = findlist x (read inp) 0
							let temp = newtree x l 0
							if (check temp 0 ((length temp)-1)) == 0
								then do
									let msg = message y
									putStrLn msg
									putStrLn ""
								else pvp temp (flpuser y)
				
correct x y z | (x!!y)!!0 == z = 0
			  | (x!!y)!!0 == 0 = 0
			  | otherwise = 1
			  
findlist x y a | a == 0 = [y] ++ snd(splitAt 1 (x!!y))
			   | otherwise = []
			   
newtree x y z | y == [] = x
			  | z == length x = []
			  | confirm y z 0 == 0 = [[-1] ++ snd(splitAt 1 (x!!z))] ++ (newtree x y (z+1))
			  | otherwise = [(x!!z)] ++ (newtree x y (z+1))
			  
confirm y z a | a == (length y) = 1
			  | z == y!!a = 0
			  | otherwise = confirm y z (a+1)
			  
check x y z | y > z = 0
			| (x!!y)!!0 == -1 = check x (y+1) z
			| otherwise = 1 

flpuser x | x == 1 = 2
		  | otherwise = 1
			
playermoves x y z | z == length x = []
				  | (x!!z)!!0 == y = [z] ++ playermoves x y (z+1)
				  | otherwise = playermoves x y (z+1)
			
pvc = print "2"