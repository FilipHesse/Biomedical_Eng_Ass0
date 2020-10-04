function [] = save_images()
%SAVE_IMAGES Summary of this function goes here
% Detailed explanation goes here
h = findobj('type','figure');
n = length(h);
for i=1:n
saveas(figure(i),"Images/image"+i,'jpg');
end
end
