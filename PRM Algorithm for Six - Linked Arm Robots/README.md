# path_planning

The various path planning algorithm.<br>
**PRM.m** - The function for computing a probabilistic roadmap (PRM) of configuration space.<br>
**SixLinkPRMScript.m** - The script for simulating the planned motion.<br>
**CollisionCheck.m** - The function for determining if two sets of triangular faces overlap.<br>
**ShortestPathDijkstra.p**- The function for finding the shortest path through a sparse graph using Dijkstra's algorithm.<br>
**RandomSampleSixLink.m, DistSixLink.m, LocalPlannerSixLink.m** - Helper functions called by PRM.<br>
**AddNode2PRM.m** - The function for adding a node to the PRM.<br>
**SixLinkRobot.m** - The function for computing the layout of our six link robot as a function of the six joint angles, theta1...theta6.<br>
**appendFV.m, boxFV.m, transformFV.m, my linspace.m** - Helper functions for constructing the simulation environment.<br>
