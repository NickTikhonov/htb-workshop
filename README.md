# Hack the Burgh GitHub workshop project: Sourcerer
This repository contains the code for the GitHub workshop at Hack the Burgh 2016.
This repository will be of use to anybody wishing to follow along without coding
along (athough you should, it will be great fun :) Please read below to learn
how to install this project as an Atom plugin (so you can test it out for yourself),
and how to navigate the commits in order to view the code at each step. Finally, check
out the challenge at the bottom of this readme and win some free GitHub swag!

## Installing this atom package (Linux / OSX)

Before you take a look at the code, you should install this package in [Atom](www.atom.io).

Navigate to a directory on your file system where we will place the source code
(such as your projects directory, but can be anywhere) and run this command to clone the source code:

```
git clone https://github.com/NickTikhonov/htb-workshop.git
```

Open up Atom and navigate to `Atom > Install Shell Commands` in order to install the
`apm` command line tool. Then navigate into the directory created by the previous step
and run the link command on the package in order to install it:

```bash
cd htb-workshop         # move into the cloned repository
apm link                # install the package (make sure you have shell commands installed)
```

## Reloading Atom during development

When making changes to the package contents, such as source code, you will need
to refresh the Atom editor in order to load the package changes. This is analogous
to refreshing your web browser when editing a web page. To reload Atom, hit
`Shift + Ctrl (Cmd) + p` to open the command window and search for /  run `Window: Reload`.

## Following along using this repository
If you don't want to code during the workshop - that's okay! This repository
makes it easy to follow along with each step of the workshop. Each commit
corresponds to one iteration in the project. You can follow along by jumping to
individual commits using the git `checkout` command. To view all commits, run:

```
git log --graph --abbrev-commit
```

You should see a list of commits printed out in the console:

```
* commit 6c2b75a
| Author: Nick Tikhonov <nt34@st-andrews.ac.uk>
| Date:   Tue Mar 15 13:29:58 2016 +0000
|
|     step 7: configure notifications + insert snippet
|
* commit 96f280c
| Author: Nick Tikhonov <nt34@st-andrews.ac.uk>
| Date:   Tue Mar 15 13:27:07 2016 +0000
|
|     step 6: grab top result from google
|

... and so on
```

You are interested in the commit hash associated with each step in the workshop. To view the code at the end of each step, take the commit hash (the 7 character string that identifies each commit) and run the following command:

```
git checkout <hash>
```

For example, to view the code after step 6, I would run the following:

```
git checkout 96f280c
```

To return to the latest commit, simply run:

```
git checkout master
```

## Extra Credit

I'd love to see you build your own developer tools, or help me make this tool better! For extra credit, you can build your own Atom plugin, or send me a pull request for [Sourcerer](http://www.github.com/NickTikhonov/sourcerer) (this tool). Show me something awesome you built with Atom, or new Sourcerer features to get some GitHub shop credit!
