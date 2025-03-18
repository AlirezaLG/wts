clc, clearvars, close all;

asset.output = "./assets/output/";
asset.trans = "./assets/transformation/";


% Read all stego images
images = {imread(asset.output  + "simg1.png"),
          imread(asset.output  + "simg2.png"),
          imread(asset.output  + "simg3.png"),
          imread(asset.output  + "simg4.png"),
          imread(asset.output  + "simg5.png"),
          };

% simple conversion
img = imread(asset.output  + "simg1.png");
imwrite(img, asset.output  + "simg1.jpeg");

% #################
% Task 1: Rotation 
% #################
% Rotation vector 

% rotation = [90, 180, 270, 360, 450];
% rotated_imgs = {}
% for i= 1:length(rotation)
%     rotated_img = imrotate(images{i}, rotation(i));
%     rotated_imgs{i} = rotated_img;
%     imwrite(rotated_img, asset.trans + "/rotation/rotated_simg"+i+".png");
% end
% 
% % Now check again after transformation, is it possible to check the
% % embedded message
% figure;
% for i = 1:length(images)
%     subplot(2, 3, i);
%     imshow(rotated_imgs{i});
%     title(sprintf("%d.Rotation %d°", i, rotation(i)));
% end

% #################
% Task 2: Cut
% #################

% crop = [0.1,0.2,0.5, 0.7,0.9];
% cropped_images = {}
% for i=1:length(images)
%     [height, width, ~] = size(images{i});
%     % return new height
%     new_height = round(height * (1-crop(i)));
%     cropped_img = images{i}(1:new_height,:,:);
%     cropped_images{i} = cropped_img; 
%     imwrite(cropped_img, asset.trans + "/crop/cropped_simg"+i+".png");
% end
% 
% figure;
% for i = 1:length(images)
%     subplot(2, 3, i);
%     imshow(cropped_images{i});
%     title(sprintf("%d.Crop: %d%%", i, crop(i)*100));
% end

% #########################
% Task 3: Jpeg Comperssions
% #########################

comperssion = [100, 75, 50, 20, 10];
comp_images = {}
for i=1:length(images)
    filename =  sprintf(asset.trans + "/comperssion/comp_simg" + i + ".jpeg");
    imwrite(images{i},filename , 'Quality', comperssion(i));
    comp_images{i} = imread(filename);
end

figure;
for i = 1:length(images)
    subplot(2, 3, i);
    imshow(comp_images{i});
    title(sprintf("%d.Comperssion: %d%%", i, comperssion(i)));
end
