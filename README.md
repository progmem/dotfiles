# These are my dotfiles.
There are many like them, but these ones are mine.

Mine, like everyone else's dotfiles, are works in progress. Things evolve and change over time, and having a repository to track these changes provides both a means to revert and a way to journal why I would change things.



## What's with all of the folders?
I like topics. I love topical structure. [I take all my notes using a topical structure](https://github.com/progmem/notebook) (shameless plug). Why?

Because I'm unorganized, simply put. A nice thing that comes with this is that the structure of this repository allows me to pluck a piece out of it and offer it to somebody else, be it as part of a discussion or some kind of peace offering.



## What's with the .system folder?
I made an installation system! So did [@holman](https://github.com/holman/dotfiles) and he has a ton of stars so clearly it's a good idea!

I forget to copy and commit things a lot. I also don't like the idea of 'manual provisioning'; if I'm putting my dotfiles on a machine that I'm using, I want to be able to run a command and get it all over with, and I'd like to do that with symlinks. To do so, I want to instruct which files are symlinked where, and to do that we use `.symlink` files.

To install these dotfiles (don't; learn from them, but don't blindly install them), simply bury your head in the sand and run `system/bootstrap`, which will completely overwrite any files with symlinked versions of the files in here.

Adding new files to a topic is as simple as this:
  * Create a file in the topic folder of your choice, or create a new folder for your topic.
  * Once your file is populated, create or edit the `.symlink` file.
  * Bury your head in the sand and run `system/bootstrap` to install it.



## .symlink?
The easiest way to explain a `.symlink` file is to look at the one for the bash topic:

```
# $HOME
.bash_aliases
.bash_profile
.bash_prompt
.bashrc
.profile
```

This symlinks the five listed files to $HOME, wherever that may be. Each time a comment representing a path is encountered, it is used as the path to symlink files to. Note the relative nature of the dotfiles listed; `system/bootstrap` runs relative to the folder the `.symlink` file is in, so ideally any given topic (or the root folder) will have a `.symlink` file.



## ...so why shouldn't I just install these?
Because you're not me.

...no, *seriously*, you're not me. I do things differently. Everyone uses tools differently, or likes their environment with the right amount of customization. Some people can live in `vim` all day, and some people like me are dirty sinners who just can't stand modal editors.

While I don't *mind* copying small (large) chunks of this, customize it. Make it yours. Tailor it to *you*. I like my specific editor, and my specific git pager setup. It's also possible for me (like anyone) to make a mistake in one of these which could, I dunno, mess up your home folder permissions or something.

`...see what components may mesh up with you. Fork it, remove what you don't use, and build on what you do use.` - [@holman](https://github.com/holman/dotfiles)
