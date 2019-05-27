

%% Add path of your local installation
addpath 'Laguerre-GrangerCausality/'

%% Load example data
load 'data_netid300.mat'; 
data=normalize(Expression1,1); 

%%
%% 'data' has the dimensions of [ N L ]
%% where:
%% 	N is the number of time points
%% 	L is the number of signals
%%
%% data should be normalized
%%

%% Check dimensions of data
size(data)

%%
%%  Set the parameter alpha of laguerre expansions
%%  alpha MUST be in the interval:
%%	0 =< alpha < 1
%%
%%	if  alpha = 0 the algorithm reduces itself to an AR process
%%
alpha=0.3;

%%
%%  Set the number of base functions.
%%  If alpha=0, the number of base functions has the meaning of an autoregressive order.
%%
orders=4;


%%  Compute Laguerre-GrangerCausality
[ GCstrength , llsdata , N , L ] = LaguerreGC_GC(data,alpha,orders);


GCstrength

