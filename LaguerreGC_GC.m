function [ GC , llsdata , N , L ] =  LaguerreGC_rightdrop(data,alpha,orders)

	[ N , L ] = size(data);
	if (N<L); data=data'; end;
	[ N , L ] = size(data);
	
	GC = NaN(L,L);

	rightdrop = LaguerreGC_rightdrop(alpha,orders);
	sdata = normalize(data,1);
	llsdata = LaguerreGC_convolve(sdata,alpha,orders);




end

