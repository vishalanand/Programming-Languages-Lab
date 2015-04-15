#########################################################################
Member Names     : Nishant Yadav and Vishal Anand
Member Roll Nos. : 11010147 and 11010170
Assignment No.   : 1
Date             : 18-08-2014
#########################################################################

1. Given a no. tell whether it's perfect power or not 
   How To Run : 
		The function for running the code is as follows:
		 a) perfectPower n
		 b) Output: True if n is perfect power of some no. and false if n is not a perfect power of any no.

2. Given a binary tree do Inorder, preorder, postorder tree traversal
   Input Format:
		Suppose user wants to check for the following tree:
					1
				       / \
				      2   3
					 /
					4
					 \
					  5
		We can visualize this tree as follows where 0 denotes null
					1
				       / \
				      /   \
				     2     3
                                    / \   / \
                                   0  0   4  0
                                  /\  /\  /\ /\
                                 0 0 0 0 0 6 0 0
               
		So, give the input as follows:
                       a) For inorder traversal  : inorder [1,2,3,0,0,4,0,0,0,0,0,0,6,0,0] , i.e., input in form of level order traversal after making the tree level
		       b) For preorder traversal : preorder [1,2,3,0,0,4,0,0,0,0,0,0,6,0,0]
                       c) For postorder traversal: postorder [1,2,3,0,0,4,0,0,0,0,0,0,6,0,0]

3. Functions to implement Dijkstra's algorithm are given in the file named 'Dijkstra'