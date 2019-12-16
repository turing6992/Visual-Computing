function [res] = ruleOfThirds(img)
sm = Saliency(img);
figure, imshow(sm);
[height, width] = size(sm);
x_points = width./[3 3/2];
y_points = height./[3 3/2];

sm_normalized = sm/(max(sm(:)));
x_roi_sum = 0;
y_roi_sum = 0;
for i = 1:height
for j = 1:width
%pulls towards the center
%if sm_normalized(i,j) is 0 no effect but if it is one it gets stronger.
    x_roi_sum = x_roi_sum + sm_normalized(i,j) * j;
    y_roi_sum = y_roi_sum + sm_normalized(i,j) * i;
end
end
%to make sure that the center point is in the image
x_roi = x_roi_sum/sum(sm_normalized(:));
y_roi = y_roi_sum/sum(sm_normalized(:));

threshold = sqrt(height^2 + width^2)/10;

res = false;
for i = 1:2
    for j = 1:2
        distance = sqrt((x_roi - x_points(j))^2 + (y_roi - y_points(i))^2);
        if (distance < threshold)
            res = true;
            break;
        end
    end
end


end

