# Node.js (Last Updated: 2023-09-07)

## Reference
* @see [Node.js Reference](https://nodejs.org)
* @see [fnm Reference](https://github.com/Schniz/fnm)

## Install Fast Node Manager (fnm)
* Requires (curl / unzip). `apt get install` if necessary.
* `$ curl -fsSL https://fnm.vercel.app/install | bash` - **Note:** This will modify the shell file.
	* If reinstalling, add the `--skip-shell` option to skip shell file modification.


```
# NOTE: To allow project level versions, change (in .zshrc):
eval "`fnm env`"
to
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
```

## Install / Switching Node Versions
* Help: `$ fnm help`
* List available versions: `$ fnm ls-remote`
* List local versions: `$ fnm ls`
* Install specific version: `$ fnm install <VERSION>`
* Uninstall: `$ fnm uninstall <VERSION>`
* Install latest lts version: `$ fnm install --lts`
* Install lateest minor version: `$ fnm install <MAJOR_VERSION>`
* Alias: `$ fnm alias <VERSION> <NAME>`
* Unalias: `$ fnm unalias <NAME>`
* Set deafult: `$ fnm default <VERSION>`
* See current: `$ fnm current`
* Set project level version:
	* Create `.nvmrc` or `.node-version` file with the version (include the v).