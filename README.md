# Flixnet

## Ejercicio integrador 

**Hoy en día con un abono mensual, conexión a internet y una pantalla se puede ver una enorme cantidad de material audiovisual. Películas modernas y antiguas, trilogías u otras sagas, series, y lo que se les ocurra (o mejor dicho, lo que la empresa quiera) está disponible en todo momento. Lo interesante, es que se puede interactuar calificando el contenido y que -de alguna manera misteriosa- la empresa te va conociendo y te sugiere cosas para que ver.**
  
Bien, pero no se trata de contar lo que ya se sabe, sino comenzar a delimitar lo que nos preocupa del problema y plantear lo que necesitamos.


###Viendo películas
El material más simple para presentar es una película. Son muchas y de todas se conoce el título, su duración, el director y un conjunto de actores. 
Como las películas no se ven solas, también necesitamos usuarios. Sabemos su nombre y apellido y la edad. Los usuarios pueden calificar una película con una escala de 0 a 5 estrellas (No es necesario que se vea la película para calificarla, lo puede haber visto en otro momento o simplemente ser trolls). Cuando un usuario ve una película, se lo registra.


###Hacer los métodos que permitan
1. Que un usuario vea una película
2. Que un usuario califique una película con una cantidad de estrellas.
3. Calcular el promedio de todas las calificaciones que haya recibido una película de todos los usuarios.
4. Obtener la película que mejor calificó un usuario, entre todas las que vio. (si la mejor calificación es igual para más de una, cualquiera que retorne está bien. Si no calificó ninguna de las que vio, se considera un error)
5. Retornar el conjunto de películas que nadie calificó.
6. Averiguar si es cierto que el actor o director indicado trabajó en la película

###Mucho más que películas
Como se anticipaba, hay mucho más que películas para ver. Especialmente, lo que hizo conocida a la empresa, que son las series. 
Una serie está conformada por una sucesión de capítulos, a veces organizados en temporadas. A veces se trata de historias que empiezan y terminan en cada capítulo (por ejemplo "Los Simuladores"), y en otras son historias con continuidad, como las clásicas novelas de la tarde (por ejemplo, 24). Puede haber series sin temporadas, o que combinan temporadas con capítulos sueltos.

En cuanto a la información que se registra, es similar a las películas. Cada capítulo tiene un título, la duración tiende a ser parecida, pero hay capítulos con más minutos que otros. En cualquier serie, el director puede ir cambiando o haber capítulos con un director invitado (por ejemplo, Campanella dirigió algunos capítulos de Dr House), la mayoría de los actores se repite entre un capítulo y el siguiente, pero muchas veces aparecen personajes nuevos u otros dejan de estar. 

Otra cosa que sucede con algunas películas es que constituyen sagas (por ejemplo, todas las de Harry Potter). No dejan de ser películas individualmente, pero se registra que son todas parte de una misma secuencia.

Adaptar, rehacer o complementar los métodos anteriores para que contemplen la nueva situación, teniendo en cuenta:

1. Que un usuario pueda ver una película, como anteriormente, pero también un capítulo de una serie. (Por ejemplo, un determinado episodio de "Los simpson", pero no la serie completa) 
2. Que un usuario tenga la posibilidad de calificar una película, un episodio en particular, una temporada, una serie completa o una saga. En estos últimos casos, se asume que la calificación es la misma para todos los episodios (o temporadas) que la componen. 
3. Se puede pedir el promedio de calificación de cualquier contenido. Por ejemplo, si un usuario calificó a "Los Simpson" con 5 estrellas,  otro usuario calificó a la primera temporada de los simpson con 3 estrellas y otro calificó a un episodio de esa temporada con 1 estrella, las calificaciones serían: para ese capitulo, 3 (1+3+5)/3, para los otros capítulos de esa temporada 4 (3+5)/2, para la temporada también 4, para otros capitulos, otras temporadas y la serie misma, directamente 5 por ser la única calificación. 
4. De todo lo que el usuario vio (películas o episodios), obtener lo mejor calificado por el mismo usuario, con las mismas consideraciones anteriores. 
5. Retornar el conjunto de materiales audiovisuales que nadie calificó.
6. Averiguar si es cierto que el actor o director indicado trabajó en un material audiovisual. En el caso de las series, sagas o temporadas, alcanza para ser cierto que haya trabajado en alguno de los capítulos. 


###Sugerencias
Una de las características más importantes del sistema es poder sugerir nuevas cosas para ver. La sugerencia depende del perfil del usuario y de lo último que vio:
- A un usuario distinguido, se le ofrece algo del mismo director. 
- A un usuario fanático, se le ofrece algo donde trabaje un mismo actor.
- A un usuario aburrido, se le ofrece un material que elige la empresa.
Incorporar un usuario personalizado, con una lógica inventada. 

Es importante que siempre se sugiera material no visto por el usuario. También, contemplar que el usuario eventualmente cambie su perfil. 

Hacer un método que devuelva la película o capítulo que se le sugiere ver a un usuario.


