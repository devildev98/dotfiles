# apt-add-repository
# Autogenerated from man page /usr/share/man/man1/apt-add-repository.1.gz
complete -c apt-add-repository -s h -l help --description 'Show help message and exit.'
complete -c apt-add-repository -s d -l debug --description 'Print debug information to the command line.'
complete -c apt-add-repository -s r -l remove --description 'Remove the specified repository.'
complete -c apt-add-repository -s y -l yes --description 'Assume yes to all queries.'
complete -c apt-add-repository -s n -l no-update --description 'After adding the repository, do not update the package cache.'
complete -c apt-add-repository -s l -l login --description 'Login to Launchpad (this is only needed for private PPAs).'
complete -c apt-add-repository -s s -l enable-source --description 'Allow downloading of the source packages from the repository.'
complete -c apt-add-repository -s c -l component --description 'Which component(s) should be used with the specified repository.'
complete -c apt-add-repository -s p -l pocket --description 'What pocket to use.'
complete -c apt-add-repository -l dry-run --description 'Show what would be done, but don\'t make any changes.'
complete -c apt-add-repository -s L -l list --description 'List currently configured repositories.'
complete -c apt-add-repository -s P -l ppa --description 'Add an Ubuntu Launchpad Personal Package Archive.'
complete -c apt-add-repository -s C -l cloud --description 'Add an Ubuntu Cloud Archive.'
complete -c apt-add-repository -s U -l uri --description 'Add an archive, specified as a single URI.'
complete -c apt-add-repository -l sourceslist --description 'only one (or none) of them may be specified.'
complete -c apt-add-repository -o updates -o proposed --description '.'
complete -c apt-add-repository -s S --description 'Add an archive, specified as a full source entry line in one-line sources.'

