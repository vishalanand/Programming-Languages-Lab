import System.Environment
import System.IO
import System.Random

t1 = [(1,2,2),(2,0,-1),(0,0,-1),(2,0,-1)]

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
			--content <- readFile "Tree.txt"
			--let line = lines content
			let outstr = stageMsg 1
			putStrLn outstr
			stage <- getLine
			if (read option) == 1
				then do
					putStrLn "Player vs Player"
					let msg = message (pvp t1 1)
					putStrLn msg
			else if (read option) == 2
				then do
					putStrLn "Player vs Computer"
					pvc
			else putStrLn "Invalid input."
			main
			
stageMsg x = "Please select the stage you want to play from 0 to " ++ totalStages ++ "." 
		where totalStages = show x
		
message x = "Player" ++ num ++ " wins"
		where num = show x
		
message x = "Player" ++ num ++ " enter input."
		where num = show x

pvp x y | x == [] = y
		| otherwise = do
			if (check x 0 ((length x)-1)) == 0
				then return y
				else do
					let msg = inpmsg y
					putStrLn msg
					inp <- getLine
					let z = newtree x (findlist x inp (correct x inp y) []) 0 []
					if z == x
						then do
							putStrLn "Invalid Input."
							pvp x y
						else if (check z 0 ((length z)-1)) == 0
							then return y
							else return (pvp z (flpuser y))
				
correct x y z | (x!!y)!!0 == z = 0
			  | (x!!y)!!0 == 0 = 0
			  | otherwise = 1
				
findlist x y a l | a == 0 = do
						if ((x!!y)!!1) == 0
							then return (l ++ [y])
							else return (findlist x (y+((x!!y)!!2)+(0..(z-1))) 0 (l ++ [y]))
				 | otherwise = l
					
newtree x y z l | y == [] = x
			    | otherwise = do
					if z == length x
						then return l
						else if (confirm y z 0) == 0
							then return (l ++ [(-1,((x!!z)!!1),((x!!z)!!2))] ++ (newtree x y (z+1) l))
							else return (l ++ [(((x!!z)!!0),((x!!z)!!1),((x!!z)!!2))] ++ (newtree x y (z+1) l))
					
confirm y z a | a == (length y) = 1
			  | z == y!!a = 0
			  | otherwise = confirm y z (a+1)
					
check x y z | y > z = 0
			| (x!!y)!!0 == -1 = check x (y+1) z
			| otherwise = 1 
					
flpuser x | x == 1 = 2
		  | otherwise = 1
		
pvc = print "2"