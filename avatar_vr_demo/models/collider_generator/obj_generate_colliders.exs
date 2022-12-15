# MIT License

# Copyright (c) 2022 SaracenOne
# Copyright (c) 2022 K. S. Ernest (iFire) Lee
# Copyright (c) 2022 V-Sekai Contributors

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

## Install CoACD
# scoop install ninja cmake
# mkdir build
# cd build
# cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release
# Use univrm to export to a glb.
# Have blender use fbxbundler to export to a input folder
# Create an output folder
# Make sure the scale is in meters and if a hut. in human scale
# Apply all transforms.
# set the pivot at 0,0,0
# elixir .\batch_convert.exs
# Use blender fbxbundle to import the output folder back into the scene
# Rename the mesh to have a suffix of `-convcolonly` using Edit ‣ Batch Rename

defmodule BatchConvertHutWithCoACD do
  def run_coacd(path, output) do
    System.cmd("coacd.exe", ["--input", path, "--output", output, "--no-manifold-plus", "-t", "0.04"], into: IO.stream())
  end
end

input_objs = Path.wildcard("input/**/*.obj")
for x <- input_objs do
  input = Path.basename(x)
  BatchConvertHutWithCoACD.run_coacd("input/" <> input, "output/" <> input)
end
