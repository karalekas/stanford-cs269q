Stanford CS 269Q: Quantum Computer Programming
==============================================

[![Binder](https://mybinder.org/badge_logo.svg)][binder]

Binder repository that contains the Jupyter notebook for my [CS 269Q](https://cs269q.stanford.edu/)
guest lecture on "Programming a quantum algorithm with pyQuil", offered at Stanford in Spring 2019.

To run the notebook on Binder, click the badge at the top of the README. This will bring you
to a loading page, and after about a minute on average (sometimes longer, but it's worth the wait!)
you will enter into a JupyterLab session with the Lecture 4 notebook open. I'd recommend that
you begin by clicking on "Kernel > Restart & Clear Output" before running through the notebook.

Additionally, this repository contains the LaTeX source and output PDF of the notes I put
together for the lecture. I hope they are helpful!

## Docker configuration

The Docker image for this repo is built using the [`rigetti/forest-notebook`][forest-notebook] Docker
image, which comes with [pyQuil][pyquil] installed, [quilc][quilc] and [QVM][qvm] servers running
in the background, and additional Python packages for data analysis and visualization. To learn
more, check out the [rigetti/forest-notebook][forest-notebook-repo] repository.

[binder]: https://mybinder.org/v2/gh/karalekas/stanford-cs269q/master?urlpath=lab/tree/Lecture4.ipynb
[forest-notebook]: https://hub.docker.com/r/rigetti/forest-notebook
[forest-notebook-repo]: https://github.com/rigetti/forest-notebook
[pyquil]: https://github.com/rigetti/pyquil
[quilc]: https://github.com/rigetti/quilc
[qvm]: https://github.com/rigetti/qvm
