atomsLoad("IPCV");

// Load host image and logo/watermark
host = imread(fullpath(getIPCVpath() + "/images/peppers.png"));
logo = imread(fullpath(getIPCVpath() + "/images/logo.png"));

// Resize logo to match host dimensions
[h, w, c] = size(host);
logo_resized = imresize(logo, [h, w]);

// Alpha blend: Watermarked = 0.8 * Host + 0.2 * Watermark
watermarked = imlincomb(0.8, host, 0.2, logo_resized);

figure("Figure_Name", "Watermarking / Alpha Blending");
subplot(1, 3, 1); imshow(host);         title("Host Image");
subplot(1, 3, 2); imshow(logo_resized); title("Watermark");
subplot(1, 3, 3); imshow(watermarked);  title("Watermarked Image (80/20 Blend)");
