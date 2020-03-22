#!/bin/sh

# Cambia metadatos de archivos mp3# Lo uso para bajar playlist con youtube-dl
# Dependencia: mp3info 

# Conviene copiarlo a ~/.local/bin/; chmod +x canc.sh (otorga permiso de ejecución)
# Crear carpeta en /Música/Artista/Album: mkdir -p Música/Nombre\Artista/Nombre\ Album\ \(Año\) 
# Entrar en la carpeta antes de ejecutar el script: cd Música/Nombre\Artista/Nombre\ Album\ (Año)/  
# Renombrar archivos como "01Nombre De Pista.mp3" (2 dígitos al principio), Conviene usar Ranger u otro gestor de archivos que tenga la opción de renombrar archivos usando Vim
 
read -p "Descargar Playlist (1), Cambiar Metadatos mp3 (2)" opcion
case $opcion in
1)
	read -p "URL Playlist: " url
	youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$url"
;;
2)
	#read -p "Artista: " a
	#read -p "Año: " y
	#read -p "Álbum: " l
	
	parent="`pwd`"
	auxl=${parent##*/}; l=${auxl%% (*}
	auxa=${parent%/*}; a=${auxa##*/}
	auxy=${parent%)}; y=${auxy#* (}
	for i in *.mp3
	do
		mp3info -d "$i"
		auxt=${i:2} 
		t=${auxt%.*} 
		n=${i::2}
		mp3info -a "$a" -y "$y" -l "$l" -t "$t" -n "$n" "$i"
	done
;;
esac
