function G = make_alarm_graph_small2()
% MAKE_ALARM_GRAPH - Constructs a factor graph data structure for the Alarm
%   Network dataset.  The factor graph data structure consists of the
%   following fields:
%
%   var - Struct array of variable nodes
%   fac - Struct array of factor nodes
%
% The variable data structure consists of the fields:
%
%   name - Variable name (string)
%   id - Unique identifier (integer)
%   nbrs_fac - ID of neighboring factor nodes (integer)
%   dim - Number of values variable can take on (integer)
%   observed - 0 if hidden, otherwise equals observed value (integer)
%
% The factor data structure consists of the fields:
%
%   p - Multidimensional array of potential values.  The dimensions are
%       aligned with the ordering of variables in nbrs_var (integer multiarray).
%   nbrs_var - Ordered IDs of neighboring variables, this is also the 
%       "domain" of the factor (integer array).
%   id - Unique identifier (integer)
%
% Brown CS242

  G = init_graph();
  
  % INTUBATION
  [G, id_INTUBATION] = add_varnode(G, 'INTUBATION',3); 
  p = [ 0.92; 0.03; 0.05 ];
  G = add_facnode(G, p, id_INTUBATION);
  
  % VENTUBE 
  [G, id_VENTTUBE] = add_varnode(G, 'VENTTUBE',4); 
  p = [ 0.01; 0.01; 0.01; 0.97 ];
  G = add_facnode(G, p, id_VENTTUBE );  
  
  % KINKEDTUBE
  [G, id_KINKEDTUBE] = add_varnode(G, 'KINKEDTUBE',2);   
  p = [ 0.04; 0.96];
  G = add_facnode(G, p, id_KINKEDTUBE);
  
  % VENTLUNG | VENTTUBE, KINKEDTUBE, INTUBATION
  [G, id_VENTLUNG] = add_varnode(G, 'VENTLUNG',4); 
  p = zeros(4,4,2,3);
  p(:,1,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,1,1,2) = [ 0.95000005, 0.030000001, 0.010000001, 0.010000001 ];
  p(:,1,1,3) = [ 0.4, 0.58, 0.01, 0.01 ];
  p(:,1,2,1) = [ 0.3, 0.68, 0.01, 0.01 ];
  p(:,1,2,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,1,2,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,2,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,2,1,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,2,1,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,2,2,1) = [ 0.95000005, 0.030000001, 0.010000001, 0.010000001 ];
  p(:,2,2,2) = [ 0.5, 0.48, 0.01, 0.01 ];
  p(:,2,2,3) = [ 0.3, 0.68, 0.01, 0.01 ];
  p(:,3,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,3,1,2) = [ 0.01, 0.97, 0.01, 0.01 ];
  p(:,3,1,3) = [ 0.01, 0.01, 0.97, 0.01 ];
  p(:,3,2,1) = [ 0.01, 0.01, 0.01, 0.97 ];
  p(:,3,2,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,3,2,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,4,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,4,1,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,4,1,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,4,2,1) = [ 0.01, 0.97, 0.01, 0.01 ];
  p(:,4,2,2) = [ 0.01, 0.01, 0.97, 0.01 ];
  p(:,4,2,3) = [ 0.01, 0.01, 0.01, 0.97 ];
  G = add_facnode(G, p, id_VENTLUNG, id_VENTTUBE, id_KINKEDTUBE, id_INTUBATION);
  
  % PRESS | VENTTUBE, KINKEDTUBE, INTUBATION
  [G, id_PRESS] = add_varnode(G, 'PRESS',4); 
  p = zeros(4,4,2,3);
  p(:,1,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,1,1,2) = [ 0.01, 0.3, 0.49, 0.2 ];
  p(:,1,1,3) = [ 0.01, 0.01, 0.08, 0.9 ];
  p(:,1,2,1) = [ 0.01, 0.01, 0.01, 0.97 ];
  p(:,1,2,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,1,2,3) = [ 0.1, 0.84, 0.05, 0.01 ];
  p(:,2,1,1) = [ 0.05, 0.25, 0.25, 0.45 ];
  p(:,2,1,2) = [ 0.01, 0.15, 0.25, 0.59 ];
  p(:,2,1,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,2,2,1) = [ 0.01, 0.29, 0.3, 0.4 ];
  p(:,2,2,2) = [ 0.01, 0.01, 0.08, 0.9 ];
  p(:,2,2,3) = [ 0.01, 0.01, 0.01, 0.97 ];
  p(:,3,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,3,1,2) = [ 0.01, 0.97, 0.01, 0.01 ];
  p(:,3,1,3) = [ 0.01, 0.01, 0.97, 0.01 ];
  p(:,3,2,1) = [ 0.01, 0.01, 0.01, 0.97 ];
  p(:,3,2,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,3,2,3) = [ 0.4, 0.58, 0.01, 0.01 ];
  p(:,4,1,1) = [ 0.2, 0.75, 0.04, 0.01 ];
  p(:,4,1,2) = [ 0.2, 0.7, 0.09, 0.01 ];
  p(:,4,1,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,4,2,1) = [ 0.010000001, 0.90000004, 0.080000006, 0.010000001 ];
  p(:,4,2,2) = [ 0.01, 0.01, 0.38, 0.6 ];
  p(:,4,2,3) = [ 0.01, 0.01, 0.01, 0.97 ];
  G = add_facnode(G, p, id_PRESS, id_VENTTUBE, id_KINKEDTUBE, id_INTUBATION);
  
  
  % MINVOL | VENTLUNG, INTUBATION
  [G, id_MINVOL] = add_varnode(G, 'MINVOL',4); 
  p = zeros(4, 4, 3);
  p(:,1,1) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,1,2) = [ 0.01, 0.97, 0.01, 0.01 ];
  p(:,1,3) = [ 0.01, 0.01, 0.97, 0.01 ];
  p(:,2,1) = [ 0.01, 0.01, 0.01, 0.97 ];
  p(:,2,2) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,2,3) = [ 0.6, 0.38, 0.01, 0.01 ];
  p(:,3,1) = [ 0.5, 0.48, 0.01, 0.01 ];
  p(:,3,2) = [ 0.5, 0.48, 0.01, 0.01 ];
  p(:,3,3) = [ 0.97, 0.01, 0.01, 0.01 ];
  p(:,4,1) = [ 0.01, 0.97, 0.01, 0.01 ];
  p(:,4,2) = [ 0.01, 0.01, 0.97, 0.01 ];
  p(:,4,3) = [ 0.01, 0.01, 0.01, 0.97 ];
  G = add_facnode(G, p, id_MINVOL, id_VENTLUNG, id_INTUBATION);
  
  % add evidence
  G = add_evidence(G, id_MINVOL, 2); %G = add_evidence(G, id_MINVOL, 1);
  G = add_evidence(G, id_PRESS, 4); %G = add_evidence(G, id_PRESS, 1);
  
end




