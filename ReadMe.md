# Prerequis

Avoir Ubuntu d'installé sur le poste avec le disque chiffré

# Setup de base

Pour installer Nix et les utilitaires necessaires de base, copier ce repo et lancer step1.sh puis relancer un nouveau terminal.
Enfin lancer step2.sh

# Machine Virtuelle

Copier le fichier `.qcow2` et céer une nouvelle VM en utilisant ce fichier

Démarrer la machine et configurer son compte `.gptw.fr`

# Utiliser gpg pour ssh

Désactivier ssh-agent dans le fichier `/etc/X11/Xsession.options` remplacer `use-ssh-agent` par `no-use-ssh-agent`.

Dans .gnupg/gpg-agent.conf 

```
enable-ssh-support
```

Dans bashrc

```
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
```

# Yubikey au login

https://support.yubico.com/hc/en-us/articles/360016649099-Ubuntu-Linux-Login-Guide-U2F

# Verouiller l'écran quand la yubikey est enlevée

Copier le fichier `90-yubikey.rules` dans `/etc/udev/rules.d/`
