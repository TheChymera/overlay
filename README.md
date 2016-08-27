# Chymeric Gentoo Overlay

An overlay for Gentoo, with various packages used and/or maintained by [TheChymera](https://github.com/TheChymera).
A number of the ebuilds available from this overlay are regularly copied from external sources (see respective commit mesages), and thus have a different maintainer.
The repository structure is somewhat based on that of the *gentoo science overlay*, and we also use thin manifests.

If you are looking for the neuroscience software packages maintained by [TheChymera](https://github.com/TheChymera), use the [NeuroGentoo overlay](https://github.com/TheChymera/neurogentoo) instead.

##Install

As per the [current Portage specifications](https://dev.gentoo.org/~zmedico/portage/doc/man/portage.5.html), overlays should be managed via `/etc/portage/repos.conf/`.
To enable this overlay make sure you are using a recent Portage version (at least `2.2.14`), and create an `/etc/portage/repos.conf/chymeric` file containing precisely:

```
[chymeric]
location = /usr/local/portage/chymeric
sync-type = git
sync-uri = https://github.com/TheChymera/gentoo-overlay.git
priority=8889
```

Afterwards, simply run `emerge --sync`, and Portage should seamlessly make all our ebuilds available. 
Many of our packages are available as live (`*-9999`) ebuilds, and also need manual unmasking in `/etc/portage/package.accept_keywords` before they can be emerged. 

---

*Please report issues via the GitHub tracking system! Please fork and submit pull requests! We're happy to merge!*
