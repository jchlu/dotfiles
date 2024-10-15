##Dotfiles repo.

Currently managed using [GNU Stow](https://www.gnu.org/software/stow/manual/html_node/index.html)

##Fix dodgy HP on board wifi card:

Turn off wifi power save:
Create .conf file:

```sudo -E nvim /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf```

And copy these two lines inside it:
```
[connection]
wifi.powersave = 2
```
