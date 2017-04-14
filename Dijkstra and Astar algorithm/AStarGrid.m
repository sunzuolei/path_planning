 in the map, f, g and parent arrays
    
           neighbor = [i-1,j;... 
            i+1,j;... 
            i,j+1;... 
            i,j-1];

    
        outRangetest = (neighbor(:,1)<1) + (neighbor(:,1)>nrows) +...
                   (neighbor(:,2)<1) + (neighbor(:,2)>ncols );
locate = find(outRangetest>0);
neighbor(locate,:)=[];
neighborIndex = sub2ind(size(map),neighbor(:,1),neighbor(:,2));
for i=1:length(neighborIndex) 
if ((map(neighborIndex(i))~=2) && (map(neighborIndex(i))~=3 && map(neighborIndex(i))~= 5))
    map(neighborIndex(i)) = 4; 
  if (f(neighborIndex(i))> min_f + 1)     
      f(neighborIndex(i)) = min_f+1; 
        parent(neighborIndex(i)) = current;
         f(neighborIndex(i)) = H(neighborIndex(i)); 
  end 
 end 
end 
 
end

%% Construct route from start to dest by following the parent links
if (isinf(f(dest_node)))
    route = [];
else
    route = [dest_node];
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end

    % Snippet of code used to visualize the map and the path
    for k = 2:length(route) - 1        
        map(route(k)) = 7;
        pause(0.1);
        image(1.5, 1.5, map);
        grid on;
        axis image;
        pause(0.5);
    end
end

end
