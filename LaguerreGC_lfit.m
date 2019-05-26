function  [ covD , AA ] = LaguerreGC_lfit(predictees,obs)
	[ N L O ] = size(obs);
	reObs=reshape(obs,N,L*O);
	AA = reObs\predictees;
    	predictions=reObs*AA; 
	res=predictions-predictees;
	covD=cov(res);
end
