--code for inorder tree traversal
inorder x y | null x = []
			| x!!y == 0 = []
			| (2*y + 2) <= ((length x) - 1) = inorder x (2*y + 1) ++ [x!!y] ++ inorder x (2*y + 2)
			| (2*y + 1) <= ((length x) - 1) = inorder x (2*y + 1) ++ [x!!y]
			| otherwise = [x!!y]

			
--code for preorder tree traversal
preorder x y | null x = []
			| x!!y == 0 = []
			| (2*y + 2) <= ((length x) - 1) = [x!!y] ++ preorder x (2*y + 1) ++ preorder x (2*y + 2)
			| (2*y + 1) <= ((length x) - 1) = [x!!y] ++ preorder x (2*y + 1)
			| otherwise = [x!!y] 

--code for postorder tree traversal
postorder x y | null x = []
			| x!!y == 0 = []
			| (2*y + 2) <= ((length x) - 1) = postorder x (2*y + 1) ++ postorder x (2*y + 2) ++ [x!!y]
			| (2*y + 1) <= ((length x) - 1) = postorder x (2*y + 1) ++ [x!!y]
			| otherwise = [x!!y] 
