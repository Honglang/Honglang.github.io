# Seminar flyer source

This folder contains the editable and rendered versions of Caihong Qin's seminar flyer.

- `index.qmd`: editable Quarto source containing the flyer design and seminar content
- `CaihongQin.jpg`: profile image used by the flyer
- `index.html`: self-contained HTML flyer with the profile image embedded
- `CaihongQin-flyer.png`: high-resolution PNG flyer
- `render-flyer.sh`: one-command renderer for the HTML and PNG outputs

To reuse the design for another seminar, copy this folder, replace the profile image, update the speaker and event content in `index.qmd`, change the PNG filename in `render-flyer.sh`, and run:

```zsh
./render-flyer.sh
```
