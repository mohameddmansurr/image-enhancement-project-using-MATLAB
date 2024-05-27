% Specify the input and output folders
inputFolder = 'D:\noisy\';
outputFolder = 'D:\cleaned\';

% Create the output folder if it does not exist
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Get a list of all images
files = dir([inputFolder, '*.jpg']);

% Loop through each image and process
for i = 1:length(files)
    % Read the original image
    img = imread([inputFolder, files(i).name]);
    
    % Create figure for subplot
    figure;
    
    % Plot original image
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');
    
    % Apply median filtering 3 x 3
    filteredImg = medfilt2(img, [3 3]);
    
    % Sharpen the image
    % H = fspecial('laplacian');
    % fimg = filter2(H, filteredImg);
    % S = filteredImg + uint8(fimg);
    sharpImg = imsharpen(filteredImg);
    


    % Plot edited image
    subplot(1, 2, 2);
    imshow(sharpImg);
    title('Processed Image');
    
    % Save the enhanced image
    imwrite(sharpImg, [outputFolder, files(i).name]);
    
    disp(['Processed and saved: ', files(i).name]);
    
    % Pause for 3 seconds before the next image
    pause(3);
    
    % Close the figure to display the next image
    close(gcf);
end

disp('All images have been processed.');