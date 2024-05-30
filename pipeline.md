# Pipeline
 - Add `segment` and `to_julia` to the `$PATH` variable, or if desired call them directly from their `Scripts` folder.
 - Be sure the current python environment has the necessary packages installed (like `mrcfile`). This is easy with a Python virtual environment.
 - Navigate to folder containing `.mrc` data
 - Call `segment [path/to/myfile.mrc]` to convert `myfile.mrc` to a .mha file and open in in itksnap
 - Segment the image as desired
 - When you are done segmenting, in the program, select "Segmentation -> Save Segmentation Image..." and use the `.mha` (MetaImage) filetype, with whatever filename you choose.
 - Close itksnap
 - In the terminal, the segmenatation you have just created is now saved in the SegData folder.
 - In the folder in which the original .mrc file came from, call `to_julia SegData/[mysegmentation.mha]` to convert the .mha data to a Julia array, which is saved in a `.jld2` (JLD2) file.


# Example
(The `ls` commands are only included to show what is going on. They are not necessary.)
```bash
matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ source ../py_research/bin/activate

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ ls
mrcdata  notes  pipeline.md  Scripts

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ ls mrcdata/
dga2017-07-08-101.mrc  dga2017-07-08-105.mrc  dga2017-07-08-10.mrc

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ ls Scripts/
convert_mrc_to_hdf5.py  mha_to_jld.jl  mha_to_np.py  mrc_to_mha.py  mrc_to_nii.py  segment  to_julia

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ Scripts/segment mrcdata/dga2017-07-08-105.mrc 
Running mrc_to_mha.py to convert mrcdata/dga2017-07-08-105.mrc...
Converted mrcdata/dga2017-07-08-105.mrc to SegData/dga2017-07-08-105.mha
Opening SegData/dga2017-07-08-105.mha with itksnap...
Launching ITK-SNAP
qt.qpa.plugin: Could not find the Qt platform plugin "wayland" in ""
Return code : 0
Process completed successfully.

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ ls
mrcdata  notes  pipeline.md  Scripts  SegData

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ ls SegData/
dga2017-07-08-105.mha  my_segmentation.mha

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ Scripts/to_julia SegData/my_segmentation.mha 
Julia array saved to SegData/my_segmentation.jld2

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ ls SegData/
dga2017-07-08-105.mha  my_segmentation.jld2  my_segmentation.mha

(py_research) matthew@mward19:~/gdrive/notas/BYU notes/Research/data_labeling$ 
```
