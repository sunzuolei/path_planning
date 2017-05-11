path_planning

The various path planning algorithm.
PRM.m - The function for computing a probabilistic roadmap (PRM) of configuration space.
SixLinkPRMScript.m - The script for simulating the planned motion.
CollisionCheck.m - The function for determining if two sets of triangular faces overlap.
ShortestPathDijkstra.p- The function for finding the shortest path through a sparse graph using Dijkstra's algorithm.
RandomSampleSixLink.m, DistSixLink.m, LocalPlannerSixLink.m - Helper functions called by PRM.
AddNode2PRM.m - The function for adding a node to the PRM.
SixLinkRobot.m - The function for computing the layout of our six link robot as a function of the six joint angles, theta1...theta6.
appendFV.m, boxFV.m, transformFV.m, my linspace.m - Helper functions for constructing the simulation environment.