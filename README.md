Eric Mathison's Dotfiles
========================

These are the dotfiles that I take around with me on various machines. Running
link.sh from the root of this project will create symlinks in the home
directory. Be careful with that though because any dotfiles with a corresponding
name will be deleted before symlinking.

Tests
-----
If you would like to run the tests (not that they are the greatest or anything)
you will need to install [roundup](https://github.com/bmizerany/roundup). From
the root of this project, you can then run the tests with something like:
`roundup test/*`. Be advised that running the tests will run link.sh and
although the tests *should* run with a temporary, substituted home directory, I
can't guarantee that there won't be a bug that causes your existing dotfiles to
be deleted when running the tests.
