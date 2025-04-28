k=itr+1;

%% Record transient 
if itr>0
record_SOp2_transient{k,1}  = SOp2_transient';
record_SO2_transient{k,1}  = SO2_transient';
end
%% Results store
record_fval{k,1}      = fval; % Objective function value

