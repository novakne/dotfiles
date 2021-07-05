# Scripts

All scripts made by me, use _bash_, and I don't mind using bashism and not
being _POSIX_ compliant. I try to always follows [shellcheck][]
recommendation. For formatting I use [shfmt][], be aware that it put `if
...; then` on the same line and I usually put it on a new line, but I
can make exception

        shfmt -fn -ci -w <script>

All my scripts have a header that follow the same pattern if you want to
read to have more info on one script

```bash
#!/usr/bin/env bash
#
# <description>
#
# USAGE:
#
# REQUIREMENTS:
# OPTIONALS:
```

[shellcheck]: https://www.shellcheck.net/
[shfmt]: https://github.com/mvdan/sh

---

app/ - Mainly appimages and compiled bin (not in the repo)

---

fzf/ - Scripts using _[fzf][]_

-   `fe` - Open selected file in _[neovim][]_, `ctrl-o` to use
    _[neovim-remote][]_
-   `fkill` - Kill processes, list only the ones you can kill
-   `fmenu` - Fuzzy find in `bin-list`
-   `fnote` - Search for `header` in markdown files
-   `fpass` - Fuzzy search passwords in _[pass][]_ and copy it
-   `fre` - Search with _[ripgrep][]_ and only use _[fzf][]_ as a UI
-   `ftnote` - Search for `@tag` in markdown files
-   `fvpn` - Fuzzy find config for _wireguard_

[fzf]: https://github.com/junegunn/fzf
[neovim]: https://github.com/neovim/neovim
[neovim-remote]: https://github.com/mhinz/neovim-remote
[pass]: https://www.passwordstore.org/
[ripgrep]: https://github.com/BurntSushi/ripgrep

---

run/ - Scripts used to launch program configured by command line options

-   `bmenu-run` - Launch _[bmenu][]_
-   `dwl-autostart` - Script to use at _[dwl][]_ launch
-   `dwl-run` - Launch _[dwl][]_
-   `footlight.run` - Launch a _[foot][]_ instance with a light theme
-   `fuzzel-run` - Launch _[fuzzel][]_
-   `river-run` - Launch _[river][]_
-   `rtag.run` - Launch _[river-tag-overlay][]_
-   `sway-run` - Launch _[sway][]_

[bmenu]: https://github.com/Cloudef/bemenu
[dwl]: https://github.com/djpohly/dwl
[foot]: https://codeberg.org/dnkl/foot
[fuzzel]: https://codeberg.org/dnkl/fuzzel
[river]: https://github.com/ifreund/river
[river-tag-overlay]: https://git.sr.ht/~leon_plickat/river-tag-overlay
[sway]: https://github.com/swaywm/sway

---

-   `bldup` - Update different pkg I build from master branch
-   `extract` - Extract archive
-   `git-merged` - Print latest commits for each branch and status of current branch
-   `git-sfr` - Git switch -> fetch -> rebase upstream
-   `logwrite` - Redirect `STDERR` to file
-   `lowercase-space` - Change to lowercase and add space
-   `mdpdf` - Convert markdown to pdf with [Pandoc][]
-   `new-mail` - Run _[isync][]_ and _[notmuch][]_
-   `note` - Open notes directory in _neovim_ or open TODO/QUICK note file
-   `oweb` - Quickly open some urls in `$BROWSER`
-   `paste-0x0` Submit file to https://0x0.st/
-   `paste-srht` Submit paste to https://paste.sr.ht/
-   `pkg-list` - List installed packages in _arch_
-   `rofi-power_menu` - Open a exit menu in _[rofi][]_
-   `rs` - Manage _runnit_ services
-   `script-template` - Create a file to make a bash script
-   `snap` - Take screenshot with _maim_ & _slop_ or _grim_ & _slurp_
-   `sysinfo` - Display some info in a notification
-   `xb` - Basically some aliases for xbps

[pandoc]: https://github.com/jgm/pandoc
[isync]: https://isync.sourceforge.io/
[notmuch]: https://notmuchmail.org/
[rofi]: https://github.com/davatorium/rofi
