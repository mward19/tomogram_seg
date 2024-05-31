# Pipeline
 - Run the script `seg_setup.sh` by typing `source seg_setup.sh` where the script is located.
 - Be sure that ITK-SNAP is installed and callable from the terminal with the command `itksnap`.
 - Be sure the current python environment has the necessary packages installed (like `mrcfile`). This is easy with a Python virtual environment.
 - Navigate to folder containing `.mrc` data
 - Call `segment [path/to/myfile.mrc]` to convert `myfile.mrc` to a .mha file and open in in ITK-SNAP
 - Segment the image as desired
 - When you are done segmenting, in the program, do the following:
         - Save the segmentation by selecting "Segmentation -> Save Segmentation Image..." and use the `.mha` (MetaImage) filetype, with whatever filename you choose.
         - Save the labels by selecting "Segmentation -> Label Editor -> Actions... -> Export", with whichever filetype or filename you choose.
 - Close itksnap
 - In the terminal, the segmenatation and labeling you have just created are now saved in the SegData folder.
 - In the folder in which the original .mrc file came from, call `to_julia SegData/[mysegmentation.mha]` to convert the .mha segmentation data to a Julia array, which is saved in a `.jld2` (JLD2) file.

