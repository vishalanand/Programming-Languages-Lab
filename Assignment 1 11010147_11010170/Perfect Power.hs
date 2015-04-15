--given a no. checks whether it is perfect power ot not
perfectPower x | x < 0 = "false"
				| x == 0 = "true"
				| x == 1 = "true"
				| otherwise = findmax x 2 0
				
				
--finds the min. power of a 2 which is just greater than or equal to the no. x 
findmax x y z | x > y = findmax x (y*2) (z+1)
			  | x == y = check 2 x x 2 (z+1)
			  | otherwise = check 2 x x 2 (z+1)
			  
--checks by binary search algorithm whether the given no. is perfect power or not
check l h x y z | y > z = "false"
			  | l > h = check 2 x x (y+1) z
			  | x > power ((l+h) `div` 2) ((l+h) `div` 2) y = check (((l+h) `div` 2) + 1) h x y z
			  | x < power ((l+h) `div` 2) ((l+h) `div` 2) y = check l (((l+h) `div` 2) - 1) x y z
			  | otherwise = "true"

--calculates a^y			  
power a x y | y == 1 = x
		  | otherwise = power a (a*x) (y-1)