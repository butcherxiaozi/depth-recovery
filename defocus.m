I = im2double(imread('MyImage/coin/coin.jpg'));
[I_row,I_column,~] = size(I);

J=im2double(imread('MyImage/coin/coin_seg.jpg'));
edgeMap = Get_Flag(J);

% %%
% gI=rgb2gray(I);
% Gaus1 = fspecial('gaussian',[5 5],2);
% Gaus2 = fspecial('gaussian',[5 5],4);
% Blur1 = imfilter(gI,Gaus1,'replicate');
% Blur2 = imfilter(gI,Gaus2,'replicate');
% R = (gI-Blur1)./(Blur1-Blur2);
% fullDMap = 2.*4./((4-2).*R+4);
% sparseDMap = fullDMap.*edgeMap;
% 
% lambda=0.0005;
% maxBlur=3;
% sparseDMap(sparseDMap>maxBlur)=maxBlur;
% sd=5; % spatial sigma
% sr=0.1*maxBlur; % range sigma
% [sparseDMap ~]=sparseBilateralFilter(sparseDMap,I,sd,sr);
% % Propagate the spase defocus map based on color similarities to get full defocus map
% sizeI=I_row*I_column;
% constsMap=sparseDMap>0.0001;
% L=getLaplacian(I,1);
% D=spdiags(constsMap(:),0,sizeI,sizeI);
% x=(L+lambda*D)\(lambda*D*sparseDMap(:));  
% fullDMap=reshape(x,I_row,I_column);


%%
std=1;
lambda=0.0005;
maxBlur=3;
[sparseDMap, fullDMap] = defocusEstimation(I,edgeMap,std,lambda,maxBlur);
%%

K = im2double(imread('MyImage/coin/coin_L0.jpg'));
fullDMap=imguidedfilter(fullDMap, K);

figure(1);
imshow(sparseDMap,[0 maxBlur]);

figure(2);
imshow(fullDMap,[0 maxBlur]);


% [color,comp,comp_num] = Comp2(I);

% for i=1:length(comp)
%     Interpolate(comp{i});
% end
