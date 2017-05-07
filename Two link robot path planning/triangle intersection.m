function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise
%用于检查给定三角形是否重叠的函数。
%%% All of your code should be between the two lines of stars.
% *******************************************************************
flag=true;%函数的返回值，如果确定三角形相交，则设置为true，否则为false。
%% 
%P1(1,:)：P1矩阵的第一行所有列，:表示所有的。
C=P2-[P1(1,:);P1(1,:);P1(1,:)];
CM=[C';0 0 0]';

P1EA1=P1(2,:)-P1(1,:);
P1EA2=P1(3,:)-P1(1,:);

P1Edge1=[P1EA1';0]';
P1Edge2=[P1EA2';0]';

C1=cross(P1Edge1,CM(1,:));%C = cross(A,B)返回向量叉积A和B，即，C = A x B,A和B必须是3元向量。
C2=cross(P1Edge1,CM(2,:));
C3=cross(P1Edge1,CM(3,:));

C4=cross(P1Edge1,P1Edge2);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

C1=cross(P1Edge2,CM(1,:));
C2=cross(P1Edge2,CM(2,:));
C3=cross(P1Edge2,CM(3,:));

C4=cross(P1Edge2,P1Edge1);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end
%%
%P1(2,:)
C=P2-[P1(2,:);P1(2,:);P1(2,:)];
CM=[C';0 0 0]';

P1EA1=P1(1,:)-P1(2,:);
P1EA2=P1(3,:)-P1(2,:);

P1Edge1=[P1EA1';0]';
P1Edge2=[P1EA2';0]';

C1=cross(P1Edge1,CM(1,:));
C2=cross(P1Edge1,CM(2,:));
C3=cross(P1Edge1,CM(3,:));

C4=cross(P1Edge1,P1Edge2);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

C1=cross(P1Edge2,CM(1,:));
C2=cross(P1Edge2,CM(2,:));
C3=cross(P1Edge2,CM(3,:));

C4=cross(P1Edge2,P1Edge1);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end
%%
%P1(3,:)
C=P2-[P1(3,:);P1(3,:);P1(3,:)];
CM=[C';0 0 0]';

P1EA1=P1(1,:)-P1(3,:);
P1EA2=P1(2,:)-P1(3,:);

P1Edge1=[P1EA1';0]';
P1Edge2=[P1EA2';0]';

C1=cross(P1Edge1,CM(1,:));
C2=cross(P1Edge1,CM(2,:));
C3=cross(P1Edge1,CM(3,:));

C4=cross(P1Edge1,P1Edge2);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

C1=cross(P1Edge2,CM(1,:));
C2=cross(P1Edge2,CM(2,:));
C3=cross(P1Edge2,CM(3,:));

C4=cross(P1Edge2,P1Edge1);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end
%%
%P2(1,:)
C=P1-[P2(1,:);P2(1,:);P2(1,:)];
CM=[C';0 0 0]';

P1EA1=P2(2,:)-P2(1,:);
P1EA2=P2(3,:)-P2(1,:);

P1Edge1=[P1EA1';0]';
P1Edge2=[P1EA2';0]';

C1=cross(P1Edge1,CM(1,:));
C2=cross(P1Edge1,CM(2,:));
C3=cross(P1Edge1,CM(3,:));

C4=cross(P1Edge1,P1Edge2);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

C1=cross(P1Edge2,CM(1,:));
C2=cross(P1Edge2,CM(2,:));
C3=cross(P1Edge2,CM(3,:));

C4=cross(P1Edge2,P1Edge1);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end
%%
%P2(2,:)
C=P1-[P2(2,:);P2(2,:);P2(2,:)];
CM=[C';0 0 0]';

P1EA1=P2(1,:)-P2(2,:);
P1EA2=P2(3,:)-P2(2,:);

P1Edge1=[P1EA1';0]';
P1Edge2=[P1EA2';0]';

C1=cross(P1Edge1,CM(1,:));
C2=cross(P1Edge1,CM(2,:));
C3=cross(P1Edge1,CM(3,:));

C4=cross(P1Edge1,P1Edge2);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

C1=cross(P1Edge2,CM(1,:));
C2=cross(P1Edge2,CM(2,:));
C3=cross(P1Edge2,CM(3,:));

C4=cross(P1Edge2,P1Edge1);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end
%%
%P2(3,:)
C=P1-[P2(3,:);P2(3,:);P2(3,:)];
CM=[C';0 0 0]';

P1EA1=P2(2,:)-P2(3,:);
P1EA2=P2(1,:)-P2(3,:);

P1Edge1=[P1EA1';0]';
P1Edge2=[P1EA2';0]';

C1=cross(P1Edge1,CM(1,:));
C2=cross(P1Edge1,CM(2,:));
C3=cross(P1Edge1,CM(3,:));

C4=cross(P1Edge1,P1Edge2);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

C1=cross(P1Edge2,CM(1,:));
C2=cross(P1Edge2,CM(2,:));
C3=cross(P1Edge2,CM(3,:));

C4=cross(P1Edge2,P1Edge1);

if(C1(3)>0&&C2(3)>0&&C3(3)>0&&C4(3)<0||C1(3)<0&&C2(3)<0&&C3(3)<0&&C4(3)>0)
    flag=false;
    return;
end

end
