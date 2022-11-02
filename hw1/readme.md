This is the code for value function iteration algorithm.

The file `valfun.m` contains the value function calculation and linear interpolation for points off of the k grid.

Run `iteration.m` to start the iteration algorithm.

The `truevalfun.m` is only valid when variable `delta` is set to 1. Otherwise, comment out this function to avoid misunderstanding.

To test the time of compuation, sandwich the whole code chunk in `iteration.m` by `tic;` & `toc` commands.
