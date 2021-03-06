window.metadata = {
  title: "Statistiques des commits",
  display: function(axis, x, y, z, r, v, b) {
    return "" +
      "<dl>" +
        "<dt>" + axis.x + ":</dt>" +
        "<dd>" + x + "</dd>" +
        "<dt>" + axis.y + ":</dt>" +
        "<dd>" + y + "</dd>" +
        "<dt>" + axis.z + ":</dt>" +
        "<dd>" + z + "</dd>" +
        "<dt>" + axis.v + ":</dt>" +
        "<dd>" + v + "</dd>" +
      "</dl>";
  }
}

window.axis = {
  x: "Developpeur",
  y: "Jour",
  z: "Projet",
  r: null,
  v: "Commits",
  b: "Commits"
}

window.data = [
  {
    "Developpeur":"Alain",
    "Jour":"Lundi",
    "Projet":"Framework",
    "Commits":45
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mardi",
    "Projet":"Framework",
    "Commits":32
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mercredi",
    "Projet":"Framework",
    "Commits":21
  },
  {
    "Developpeur":"Alain",
    "Jour":"Jeudi",
    "Projet":"Framework",
    "Commits":12
  },
  {
    "Developpeur":"Alain",
    "Jour":"Vendredi",
    "Projet":"Framework",
    "Commits":65
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Lundi",
    "Projet":"Framework",
    "Commits":26
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mardi",
    "Projet":"Framework",
    "Commits":32
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mercredi",
    "Projet":"Framework",
    "Commits":8
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Jeudi",
    "Projet":"Framework",
    "Commits":49
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Vendredi",
    "Projet":"Framework",
    "Commits":26
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Lundi",
    "Projet":"Framework",
    "Commits":26
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mardi",
    "Projet":"Framework",
    "Commits":13
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mercredi",
    "Projet":"Framework",
    "Commits":36
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Jeudi",
    "Projet":"Framework",
    "Commits":34
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Vendredi",
    "Projet":"Framework",
    "Commits":42
  },
  {
    "Developpeur":"Denis",
    "Jour":"Lundi",
    "Projet":"Framework",
    "Commits":28
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mardi",
    "Projet":"Framework",
    "Commits":30
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mercredi",
    "Projet":"Framework",
    "Commits":12
  },
  {
    "Developpeur":"Denis",
    "Jour":"Jeudi",
    "Projet":"Framework",
    "Commits":51
  },
  {
    "Developpeur":"Denis",
    "Jour":"Vendredi",
    "Projet":"Framework",
    "Commits":58
  },
  {
    "Developpeur":"Alain",
    "Jour":"Lundi",
    "Projet":"Terminator",
    "Commits":24
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mardi",
    "Projet":"Terminator",
    "Commits":11
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mercredi",
    "Projet":"Terminator",
    "Commits":34
  },
  {
    "Developpeur":"Alain",
    "Jour":"Jeudi",
    "Projet":"Terminator",
    "Commits":60
  },
  {
    "Developpeur":"Alain",
    "Jour":"Vendredi",
    "Projet":"Terminator",
    "Commits":58
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Lundi",
    "Projet":"Terminator",
    "Commits":6
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mardi",
    "Projet":"Terminator",
    "Commits":6
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mercredi",
    "Projet":"Terminator",
    "Commits":30
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Jeudi",
    "Projet":"Terminator",
    "Commits":42
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Vendredi",
    "Projet":"Terminator",
    "Commits":40
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Lundi",
    "Projet":"Terminator",
    "Commits":43
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mardi",
    "Projet":"Terminator",
    "Commits":26
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mercredi",
    "Projet":"Terminator",
    "Commits":32
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Jeudi",
    "Projet":"Terminator",
    "Commits":6
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Vendredi",
    "Projet":"Terminator",
    "Commits":28
  },
  {
    "Developpeur":"Denis",
    "Jour":"Lundi",
    "Projet":"Terminator",
    "Commits":58
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mardi",
    "Projet":"Terminator",
    "Commits":10
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mercredi",
    "Projet":"Terminator",
    "Commits":26
  },
  {
    "Developpeur":"Denis",
    "Jour":"Jeudi",
    "Projet":"Terminator",
    "Commits":22
  },
  {
    "Developpeur":"Denis",
    "Jour":"Vendredi",
    "Projet":"Terminator",
    "Commits":21
  },
  {
    "Developpeur":"Alain",
    "Jour":"Lundi",
    "Projet":"Hoverboard",
    "Commits":49
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mardi",
    "Projet":"Hoverboard",
    "Commits":48
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mercredi",
    "Projet":"Hoverboard",
    "Commits":23
  },
  {
    "Developpeur":"Alain",
    "Jour":"Jeudi",
    "Projet":"Hoverboard",
    "Commits":32
  },
  {
    "Developpeur":"Alain",
    "Jour":"Vendredi",
    "Projet":"Hoverboard",
    "Commits":57
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Lundi",
    "Projet":"Hoverboard",
    "Commits":35
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mardi",
    "Projet":"Hoverboard",
    "Commits":41
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mercredi",
    "Projet":"Hoverboard",
    "Commits":32
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Jeudi",
    "Projet":"Hoverboard",
    "Commits":49
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Vendredi",
    "Projet":"Hoverboard",
    "Commits":50
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Lundi",
    "Projet":"Hoverboard",
    "Commits":48
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mardi",
    "Projet":"Hoverboard",
    "Commits":41
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mercredi",
    "Projet":"Hoverboard",
    "Commits":32
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Jeudi",
    "Projet":"Hoverboard",
    "Commits":23
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Vendredi",
    "Projet":"Hoverboard",
    "Commits":5
  },
  {
    "Developpeur":"Denis",
    "Jour":"Lundi",
    "Projet":"Hoverboard",
    "Commits":44
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mardi",
    "Projet":"Hoverboard",
    "Commits":46
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mercredi",
    "Projet":"Hoverboard",
    "Commits":43
  },
  {
    "Developpeur":"Denis",
    "Jour":"Jeudi",
    "Projet":"Hoverboard",
    "Commits":60
  },
  {
    "Developpeur":"Denis",
    "Jour":"Vendredi",
    "Projet":"Hoverboard",
    "Commits":51
  },
  {
    "Developpeur":"Alain",
    "Jour":"Lundi",
    "Projet":"Duckface detector",
    "Commits":7
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mardi",
    "Projet":"Duckface detector",
    "Commits":43
  },
  {
    "Developpeur":"Alain",
    "Jour":"Mercredi",
    "Projet":"Duckface detector",
    "Commits":56
  },
  {
    "Developpeur":"Alain",
    "Jour":"Jeudi",
    "Projet":"Duckface detector",
    "Commits":50
  },
  {
    "Developpeur":"Alain",
    "Jour":"Vendredi",
    "Projet":"Duckface detector",
    "Commits":48
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Lundi",
    "Projet":"Duckface detector",
    "Commits":29
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mardi",
    "Projet":"Duckface detector",
    "Commits":15
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Mercredi",
    "Projet":"Duckface detector",
    "Commits":8
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Jeudi",
    "Projet":"Duckface detector",
    "Commits":45
  },
  {
    "Developpeur":"Benoît",
    "Jour":"Vendredi",
    "Projet":"Duckface detector",
    "Commits":58
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Lundi",
    "Projet":"Duckface detector",
    "Commits":38
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mardi",
    "Projet":"Duckface detector",
    "Commits":47
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Mercredi",
    "Projet":"Duckface detector",
    "Commits":43
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Jeudi",
    "Projet":"Duckface detector",
    "Commits":40
  },
  {
    "Developpeur":"Christophe",
    "Jour":"Vendredi",
    "Projet":"Duckface detector",
    "Commits":57
  },
  {
    "Developpeur":"Denis",
    "Jour":"Lundi",
    "Projet":"Duckface detector",
    "Commits":21
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mardi",
    "Projet":"Duckface detector",
    "Commits":33
  },
  {
    "Developpeur":"Denis",
    "Jour":"Mercredi",
    "Projet":"Duckface detector",
    "Commits":17
  },
  {
    "Developpeur":"Denis",
    "Jour":"Jeudi",
    "Projet":"Duckface detector",
    "Commits":24
  },
  {
    "Developpeur":"Denis",
    "Jour":"Vendredi",
    "Projet":"Duckface detector",
    "Commits":36
  }
]