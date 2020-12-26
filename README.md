git-credential-pass
===================

A Git credential helper for pass.

Before prompting for a username and password, this script will check the
password store for login info to the given host, and use the credentials it
finds to authenticate.

Requirements
------------

Requires git, pass, and (for installation) Make.

Installation
------------

Use Make to install the script and pass extension globally (with root permissions).

    # make install

The `uninstall` rule can be used to undo this.

Usage
-----

Configure Git to use the script as its credential helper, e.g.:

    $ git config --global credential.helper pass

Add login details to the password store under the `Git` directory; the
`--multiline` option can be used to do this, but note that your password will
be visible as you type it:

    $ pass insert --multiline Git/host.com
    Enter contents of Git/dummy and press Ctrl+D when finished:

    username=myuser
    password=my_password_OR_auth_token
    <Ctrl+D>
