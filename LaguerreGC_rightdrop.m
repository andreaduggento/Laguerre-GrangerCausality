function [ drops ] =  LaguerreGC_rightdrop(alpha,orders)
	impulse = [ 1 ; zeros(1000-1,1) ];
	drops=zeros(orders,1);
	flippedconvolvedImpulse = flip(LaguerreGC_convolve(impulse,alpha,orders));
	for j=1:orders
		i=1;	
		while abs(flippedconvolvedImpulse(i,1,j)) < 0.01;
		    i=i+1;
		end
		drops(j)=1000-i;
	end
end
