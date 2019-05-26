function [ AA , GC , llsdata , N , L ] =  LaguerreGC_rightdrop(data,alpha,orders)

	[ N , L ] = size(data);
	if (N<L); data=data'; end;
	[ N , L ] = size(data);
	
	GC = NaN(L,L);

	rightdrop = LaguerreGC_rightdrop(alpha,orders);
	maxdrop = max(rightdrop);
	sdata = normalize(data,1);
	llsdata = LaguerreGC_convolve(sdata,alpha,orders);

%	i->j

	predictees=sdata(maxdrop+1:end,:);
	obsMatrix=llsdata(maxdrop:end-1,:,:);

%	size(obsMatrix)

	[ globalcovD globalAA ] = LaguerreGC_lfit(predictees,obsMatrix);



end

