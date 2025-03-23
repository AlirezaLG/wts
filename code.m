clc, clearvars, close all;

asset.output = "./assets/watermarked_openStego/";
asset.trans = "./assets/transformation_openStego/";


% Read all stego images
images = {imread(asset.output  + "openStego_img1.png"),
          imread(asset.output  + "openStego_img2.png"),
          imread(asset.output  + "openStego_img3.png"),
          imread(asset.output  + "openStego_img4.png"),
          imread(asset.output  + "openStego_img5.png"),
          };

% simple conversion
% img = imread(asset.output  + "simg1.png");
% imwrite(img, asset.output  + "simg1.jpeg");

% #################
% Task 1: Rotation 
% #################
% Rotation vector 
% 
rotation = [90, 180, 270, 360, 450];
rotated_imgs = {}
for i= 1:length(rotation)
    rotated_img = imrotate(images{i}, rotation(i));
    rotated_imgs{i} = rotated_img;
    imwrite(rotated_img, asset.trans + "/rotation/rotated_simg"+i+".png");
end

% Now check again after transformation, is it possible to check the
% embedded message
figure;
for i = 1:length(images)
    subplot(2, 3, i);
    imshow(rotated_imgs{i});
    title(sprintf("%d.Rotation %d°", i, rotation(i)));
end

% #################
% Task 2: Cut
% #################
 
crop = [0.1,0.2,0.5, 0.7,0.9];
cropped_images = {}
for i=1:length(images)
    [height, width, ~] = size(images{i});
    % return new height
    new_height = round(height * (1-crop(i)));
    cropped_img = images{i}(1:new_height,:,:);
    cropped_images{i} = cropped_img; 
    imwrite(cropped_img, asset.trans + "/crop/cropped_simg"+i+".png");
end

figure;
for i = 1:length(images)
    subplot(2, 3, i);
    imshow(cropped_images{i});
    title(sprintf("%d.Crop: %d%%", i, crop(i)*100));
end

% #########################
% Task 3: Jpeg Comperssions
% #########################
 
% comperssion = [100, 75, 50, 20, 10];
% comp_images = {}
% for i=1:length(images)
%     filename =  sprintf(asset.trans + "/comperssion/comp_simg" + i + ".png");
%     imwrite(images{i},filename , 'Quality', comperssion(i));
%     comp_images{i} = imread(filename);
% end
% 
% figure;
% for i = 1:length(images)
%     subplot(2, 3, i);
%     imshow(comp_images{i});
%     title(sprintf("%d.Comperssion: %d%%", i, comperssion(i)));
% end


% #########################
% Task 4: Image Filters
% #########################
watermarked_img = imread(asset.output  + "openStego_img1.png");

figure;
subplot(3, 3, 1);
imshow(watermarked_img);
title("Original Watermarked Image");

% Noise Reduction (Gaussian Filter)
% 0.5 is mild smoothing 
% 2 is strong blure (more noise removal, but image details are lost)
noise_reduced = imgaussfilt(watermarked_img, 1); 
subplot(3, 3, 2);
imshow(noise_reduced);
imwrite(noise_reduced, asset.trans + "/others/noise_reduced.jpg");
title("Noise Reduction (Gaussian)");

% Sharpening
% 1 is medium sharpening 
% 1.5 or 2 is more sharpening ( can introduce noise)
sharpened = imsharpen(watermarked_img, 'Amount', 1);
subplot(3, 3, 3);
imshow(sharpened);
imwrite(sharpened, asset.trans + "/others/sharpened.jpg");
title("Sharpened Image");

% Contrast Adjustment
% stretchlim(img) => Automatically detects the optimal contrast range.
contrast_adjusted = imadjust(watermarked_img, stretchlim(watermarked_img), []);
subplot(3, 3, 4);
imshow(contrast_adjusted);
imwrite(contrast_adjusted, asset.trans + "/others/contrast_adjusted.jpg");
title("Contrast Adjusted");

% Gamma Correction
% gamma < 1 like 0.5 Brighten the image
% gamma > 1 like 2 Darken the image
gamma_corrected = imadjust(watermarked_img, [], [], 0.5); % Gamma < 1 brightens the image
subplot(3, 3, 5);
imshow(gamma_corrected);
imwrite(gamma_corrected, asset.trans + "/others/gamma_corrected.jpg");
title("Gamma Correction (0.5)");


% Color Depth Reduction (Reduce to 32 Levels)
% 8-bit depth (256 colors) → img / 8 * 8 reduces to 32 levels.
color_depth_reduced = uint8(floor(double(watermarked_img) / 8) * 8);
subplot(3, 3, 6);
imshow(color_depth_reduced);
imwrite(color_depth_reduced, asset.trans + "/others/color_depth_reduced.jpg");
title("Reduced Color Depth");

% Add Gaussian Noise
% mean = 0 => No shift in brightness.
% variance = 0.01 => Controls noise strength
noisy_img = imnoise(watermarked_img, 'gaussian', 0, 0.01); % Add Gaussian noise
subplot(3, 3, 7);
imshow(noisy_img);
imwrite(noisy_img, asset.trans + "/others/noisy_img.jpg");
title("Gaussian Noise");

% Edge Detection (Sobel edge detection filter)
% 'canny' -> More advanced edge detection.
% 'prewitt' -> Similar to Sobel but less sensitive.
gray_img = rgb2gray(watermarked_img);
edges = edge(gray_img, 'sobel');
subplot(3, 3, 8);
imshow(edges);
imwrite(gray_img, asset.trans + "/others/gray_img_sobel.jpg");
title("Edge Detection (Sobel)");


%Histogram Equalization (Enhance Contrast)
% histeq(img) => Applies histogram equalization, enhancing contrast.
% Works best on grayscale images.
equalized = histeq(rgb2gray(watermarked_img));
subplot(3, 3, 9);
imshow(equalized);
imwrite(equalized, asset.trans + "/others/equalized.jpg");
title("Histogram Equalization");

