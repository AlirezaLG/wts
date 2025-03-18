## To Embed 5 messages into 5 images
The initial step is to generate at least 5 copies of Test OutGuess 01 with different embedded messages

`java -jar openstego.jar embed -mf ./assets/msg1.txt -cf ./assets/img1.jpg -sf ./assets/output/simg1.png`

`java -jar openstego.jar embed -mf ./assets/msg2.txt -cf ./assets/img2.jpg -sf ./assets/output/simg2.png`

`java -jar openstego.jar embed -mf ./assets/msg3.txt -cf ./assets/img3.jpg -sf ./assets/output/simg3.png`

`java -jar openstego.jar embed -mf ./assets/msg4.txt -cf ./assets/img4.jpg -sf ./assets/output/simg4.png`

`java -jar openstego.jar embed -mf ./assets/msg5.txt -cf ./assets/img5.jpg -sf ./assets/output/simg5.png`

**now run the following robustness tests:**

## 1.Check if we can detect embedded message after rotation transformation
run this command to see the result:
`java -jar openstego.jar extract  -sf ./assets/transformation/rotation/rotated_simg1.png -xf ./assets/transformation/rotation/msg1.txt`

**Result is**: Embedded data is corrupt OR invalid password has been provided OR no algorithm found which can handle the given stego file

to check a normal extraction:
`java -jar openstego.jar extract  -sf ./assets/output/simg1.png -xf ./assets/output/msg1.txt`

## 2. Check if we can detect embedded message after crop
run this command to see the result:
`java -jar openstego.jar extract  -sf ./assets/transformation/crop/cropped_simg1.png -xf ./assets/transformation/crop/msg1.txt`

**Result is**:Embedded data is corrupt OR invalid password has been provided OR no algorithm found which can handle the given stego file

## 3. Check if we can detect embedded message after Jpeg comperssions
run this command to see the result:
`java -jar openstego.jar extract  -sf ./assets/transformation/comperssion/comp_simg1.jpeg -xf ./assets/transformation/comperssion/msg1.txt`

**Result is**:???? 

<br><br><br>
---
#### Sample Embed 
`java -jar openstego.jar embed -mf ./assets/text.txt -cf ./assets/img.jpg -sf ./assets/export/output.png`
`-mf`: Path to the message file (text file to hide)
`-cf`: Path to the cover file
`-sf`: Patht to the stego file

#### Sample Extract 
`java -jar openstego.jar extract  -sf ./assets/export/output.png -xf ./assets/export/txt/embeded.txt`
`-xf`: Path where the extracted text will be saved (text file)

## Reference 
online documentation at [openstego.com](https://www.openstego.com/cmdline.html)