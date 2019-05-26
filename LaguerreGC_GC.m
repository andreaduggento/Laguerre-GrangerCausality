function [ GC , llsdata , N , L ] =  LaguerreGC_rightdrop(data,alpha,orders)

	[ N , L ] = size(data);
	if (N<L); data=data'; end;
	[ N , L ] = size(data);
	
	GC = NaN(L,L);

	restrictedcovD = zeros(L-1,L-1,L);

	rightdrop = LaguerreGC_rightdrop(alpha,orders);
	maxdrop = max(rightdrop);
	sdata = normalize(data,1);
	llsdata = LaguerreGC_convolve(sdata,alpha,orders);

%	i->j

	predictees=sdata(maxdrop+1:end,:);
	obsMatrix=llsdata(maxdrop:end-1,:,:);

%	size(obsMatrix)

	[ globalcovD , globalAA ] = LaguerreGC_lfit(predictees,obsMatrix);

	ve=1:L;
	for j=1:L
		predictees=sdata(maxdrop+1:end,ve(ve~=j));
		obsMatrix=llsdata(maxdrop:end-1,ve(ve~=j),:);
		[ covD ] = LaguerreGC_lfit(predictees,obsMatrix);
		restrictedcovD(:,:,j) = covD;
	end

	for i=1:L
		for j=1:L
			if (i==j)
				GC(i,j)=0.;
			elseif (i<j)
				GC(i,j)=log(restrictedcovD(i,i,j)/globalcovD(i,i));
			else
				GC(i,j)=log(restrictedcovD(i-1,i-1,j)/globalcovD(i,i));
			end
		end
	end
end

