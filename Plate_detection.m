close all;
clear all;

im = imread('C:\Users\disha\Desktop\image1.png');
imgray = rgb2gray(im);
imbin = imbinarize(imgray);
im = edge(imgray, 'prewitt');

%Below steps are to find location of number plate
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end  


im = imcrop(imbin, boundingBox);%crop the number plate area
im = bwareaopen(~im, 500); %remove some object if it width is too long or too small than 500

 [h, w] = size(im);%get width

imshow(im);

Iprops=regionprops(im,'BoundingBox','Area', 'Image'); %read letter
count = numel(Iprops);
noPlate=[]; % Initializing the variable of number plate string.
initial=[];
for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow<(h/2) && oh>(h/3)
       letter=Letter_detection(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
       noPlate=[noPlate letter]% Appending every subsequent character in noPlate variable.
       
   end
   

end
for k=1:2
   initial=[initial noPlate(k)]
end

codes = {'AP';'AR';'AS';'BR';'CG';'GA';'GJ';'HR';'HP';'JK';'JH';'KA';'KL';'MP';'MH';'MN';'ML';'MZ';...
    'NL';'OR';'PB';'RJ';'SK';'TN';'TR';'UK';'UP';'WB';'TS';'AN';'CH'; 'DH'; 'DD'; 'DL'; 'LD'; 'PY'}
states = {'Andhra Pradesh';'Arunachal Pradesh';'Assam';'Bihar';'Chhattisgarh';'Goa';'Gujarat';...
    'Haryana';'Himachal Pradesh';'Jammu and Kashmir';'Jharkhand';'Karnataka';'Kerala';'Madhya Pradesh';'Maharashtra';'Manipur';'Meghalaya';'Mizoram';'Nagaland';'Orissa';'Punjab';'Rajasthan';'Sikkim';'Tamil Nadu';'Tripura';'Uttarakhand';'Uttar Pradesh';'West Bengal';'Telangana';'Andaman and Nicobar Islands';'Chandigarh';'Dadra and Nagar Haveli';'Daman and Diu';'Delhi';'Lakshadweep';'Pondicherry'}
our = {initial}

T = table(codes, states)
O = table(our)
 
for i=1:height(T)
    if isequal(T{i,1}, O{1,1})
       state= T{i,2}
       %disp(s)
    end
end


    

