function convolved = LaguerreGC_convolve(data,alpha,orders)
	[ N , L ] = size(data);
	convolved = NaN(N,L,orders);
	convolved(1,:,1) = sqrt(1.-alpha).*data(1,:); 
	for i=2:N
		convolved(i,:,1) =  sqrt(alpha).*convolved(i-1,:,1) +  sqrt(1.-alpha).*data(i,:); 
	end
	for j=2:orders
		convolved(1,:,j) = sqrt(alpha).*convolved(1,:,j-1); 
		for i=2:N
			convolved(i,:,j) =  sqrt(alpha).*convolved(i-1,:,j) +  sqrt(alpha).*convolved(i,:,j-1) - convolved(i-1,:,j-1) ; 
		end
	end
end
