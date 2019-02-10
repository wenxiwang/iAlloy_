#!/bin/bash

# This file is part of iAlloy. iAlloy is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# iAlloy is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with iAlloy.
# If not, see <https://www.gnu.org/licenses/>.
#
# Author: Wenxi Wang (wenxiw@utexas.edu)

currentdir="$(dirname "$(realpath $0)")"
#echo "$currentdir"

for ModelFile in $currentdir/experiments/CmdSelection/models/*;
do

  java -cp $currentdir/src:$currentdir/ant_bin/classes/core:$currentdir/lib/base.jar:$currentdir/lib/org.alloytools.alloy.dist.jar:$currentdir/lib/org.sat4j.core.jar:$currentdir/lib/org.sat4j.core-src.jar edu.utexas.ece.AlloyMain $ModelFile

done


for ModelFile in $currentdir/experiments/CmdSelection/models/*;
do
   
  java -cp $currentdir/src:$currentdir/ant_bin/classes/core:$currentdir/lib/base.jar:$currentdir/lib/org.alloytools.alloy.dist.jar:$currentdir/lib/org.sat4j.core.jar:$currentdir/lib/org.sat4j.core-src.jar edu.utexas.ece.BaseLine $ModelFile

done
