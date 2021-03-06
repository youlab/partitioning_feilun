function [G,p] = drawGraph_noEdges(A_sim, names, abundanceVector, abundanceThreshold, colorMap,graphType)

% this function plot only the nodes
% however, it plots the edges but make them white and thin. This is
% computationally intensive. 
% Not a good function to use for community that has a lot of members. 

A = A_sim'; % transpose interaction matrix used for simulation to interaction matrix for graph generation
n = size(A,1);

G = digraph(A,names,'omitselfloops');

% hold off
p = plot(G,'Layout',graphType,'LineWidth',1*abs(G.Edges.Weight),'ArrowSize',5*abs(G.Edges.Weight));
% layout(p,'force','UseGravity',true)
% layout(p,'circle')
p.EdgeColor = [1,1,1];
p.LineWidth = 0.001; 

p.ArrowPosition =0.7;
labelnode(p,1:n,{''})

for i = 1:n
%     abundanceVector
%     i
    ind = mod(i,size(colorMap,1))+1;
%     ind
    if abundanceVector(i)> 0
        highlight(p,i,'NodeColor',colorMap(ind,:))
        highlight(p,i,'MarkerSize',abundanceVector(i)*30)
    else % placeholder for population that is not present
        highlight(p,i,'NodeColor',colorMap(ind,:))
        highlight(p,i,'MarkerSize',1)
    end
%     else
%         highlight(p,i,'NodeColor',[1,1,1])
%         nb_pre = predecessors(G,i); % neighbors
%         nb_suc = successors(G,i);
%         highlight(p,i,nb_pre,'EdgeColor',[1,1,1])
%         highlight(p,i,nb_suc,'EdgeColor',[1,1,1])
%     end
%     
end

% indsN = (G.Edges.Weight<0);
% for i = 1:size(G.Edges,1)
%     if indsN(i)== 1
%         highlight(p,G.Edges.EndNodes(i,:),'EdgeColor','r')
%     end
% end

for i = 1:n
    if abundanceVector(i)< abundanceThreshold

        highlight(p,i,'NodeColor',[1,1,1])
%         nb_pre = predecessors(G,i); % neighbors
%         nb_suc = successors(G,i);
% %         nb_pre
%         highlight(p,nb_pre,i,'EdgeColor',[1,1,1])
%         highlight(p,nb_pre,i,'LineStyle','--')
%         highlight(p,nb_pre,i,'LineWidth',0.001,'ArrowSize',0.001)
%         
%         highlight(p,i,nb_suc,'EdgeColor',[1,1,1])
%         highlight(p,i,nb_suc,'LineStyle','--')
%         highlight(p,i,nb_suc,'LineWidth',0.001,'ArrowSize',0.001)
    end
end

axis square
axis off


