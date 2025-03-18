## To Embed 5 messages into 5 images
The initial step is to generate at least 5 copies of Test OutGuess 01 with different embedded messages

`steghide embed -p "" -ef ./assets/msg1.txt -cf ./assets/img1.jpg -sf ./assets/output/simg1.jpg`
`steghide embed -p "" -ef ./assets/msg2.txt -cf ./assets/img2.jpg -sf ./assets/output/simg2.jpg`
`steghide embed -p "" -ef ./assets/msg3.txt -cf ./assets/img3.jpg -sf ./assets/output/simg3.jpg`
`steghide embed -p "" -ef ./assets/msg4.txt -cf ./assets/img4.jpg -sf ./assets/output/simg4.jpg`
`steghide embed -p "" -ef ./assets/msg5.txt -cf ./assets/img5.jpg -sf ./assets/output/simg5.jpg`

**now run the following robustness tests:**

## 1.Check if we can detect embedded message after rotation transformation
Run this command to see the result:

`steghide extract -p ""  -sf ./assets/transformation/rotation/rotated_simg1.jpg -xf ./assets/transformation/rotation/msg1.txt` 

`steghide extract -p ""  -sf ./assets/transformation/rotation/rotated_simg5.jpg -xf ./assets/transformation/rotation/msg5.txt`

**Result is**: Could not extract any data


## 2. Check if we can detect embedded message after crop
Run this command to see the result:

`steghide extract -p ""  -sf ./assets/transformation/crop/cropped_simg1.jpg -xf ./assets/transformation/crop/msg1.txt` 

`steghide extract -p ""  -sf ./assets/transformation/crop/cropped_simg5.jpg -xf ./assets/transformation/crop/msg5.txt`

**Result is**: Could not extract any data

## 3. Check if we can detect embedded message after Jpeg comperssions
Run this command to see the result:

`steghide extract -p ""  -sf ./assets/transformation/comperssion/comp_simg1.jpg -xf ./assets/transformation/comperssion/msg1.txt` 

`steghide extract -p ""  -sf ./assets/transformation/comperssion/comp_simg2.jpg -xf ./assets/transformation/comperssion/msg2.txt`

**Result is**: Could not extract any data



## 4. Check if we can detect embedded message after different MatLab Filters
Run this command to see the result:

`steghide extract -p ""  -sf ./assets/transformation/others/noise_reduced.jpg -xf ./assets/transformation/comperssion/msg1.txt`

`steghide extract -p ""  -sf ./assets/transformation/others/gamma_corrected.jpg -xf ./assets/transformation/comperssion/msg2.txt`

**Result is**: Could not extract any data

<br><br><br>
---
### Sample Embed 

`steghide embed -cf ./assets/img1.jpg -ef ./assets/msg1.txt -sf ./assets/output/stego.jpg -p ""`
`-ef`: Path to the message file (text file to hide)
`-cf`: Path to the cover file
`-sf`: Path to the stego file

### Sample Extract 
`steghide extract  -sf ./assets/output/simg1.jpg -xf ./assets/output/msg1.txt -p ""`
`-sf`: Path to the stego file
`-xf`: Path where the extracted text will be saved (text file)

## Requirement
### For mac users
1. Install Macport <a href="https://www.macports.org/install.php">https://www.macports.org/install.php</a>
2. Install Steghide `sudo port install steghide`
### For windows users
Check offical repository of Steghide for windows users <a href="https://github.com/StegHigh/steghide?tab=readme-ov-file">https://github.com/StegHigh/steghide?tab=readme-ov-file</a>

## Reference 
Online documentation at [openstego.com](https://www.openstego.com/cmdline.html)

