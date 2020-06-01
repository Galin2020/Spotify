create table Artista
(
    id_Artista        int         not null
        primary key,
    ` nombre_artista` varchar(20) null,
    imagen_artista    blob        not null
);

create table Album
(
    id_Album     int         not null
        primary key,
    año_album    year        not null,
    titulo_album varchar(20) not null,
    imagen_album blob        null,
    id_artistaA  int         not null,
    constraint Album_Artista_id_Artista_fk
        foreign key (id_artistaA) references Artista (id_Artista)
);

create table Forma_pago
(
    id_forma_pago int not null
        primary key
);

create table Pago
(
    num_orden        int  not null
        primary key,
    fecha_pago       date not null,
    total_pagos      int  not null,
    fecha_renovacion date not null
);

create table Paypal
(
    username_paypal int not null
);

create table Playlist
(
    id_Playlist           int         not null
        primary key,
    `#canciones_playlist` int         not null,
    fechaSRC              date        not null,
    titulo_playlist       varchar(45) null
);

create table Relacion_con_artista
(
    id_artistaR int not null,
    constraint Relacion_con_artista_Artista_id_Artista_fk
        foreign key (id_artistaR) references Artista (id_Artista)
);

create table Tarjeta_credito
(
    nombre_banco int not null
);

create table Usuarios
(
    id_usuario       int         not null
        primary key,
    username         varchar(20) not null,
    password         varchar(20) not null,
    email            varchar(20) not null,
    sexo             varchar(10) null,
    fecha_nacimiento date        not null,
    pais             char        not null,
    cod_postal       varchar(20) null
);

create table cancion
(
    id_cancion         int         not null
        primary key,
    duracion_cancion   time        not null,
    titulo_cancion     varchar(20) not null,
    `#_reproducciones` int         not null,
    id_albumC          int         not null,
    constraint cancion_Album_id_Album_fk
        foreign key (id_albumC) references Album (id_Album)
);

create table añada_cancion
(
    id_usuario1 int not null,
    id_cancion1 int not null,
    constraint añada_cancion_Usuarios_id_usuario_fk
        foreign key (id_usuario1) references Usuarios (id_usuario),
    constraint añada_cancion_cancion_id_cancion_fk
        foreign key (id_cancion1) references cancion (id_cancion)
);

create table guarda_album
(
    id_album    int not null,
    id_usuarioA int not null,
    constraint guarda_album_Album_id_Album_fk
        foreign key (id_album) references Album (id_Album),
    constraint guarda_album_Usuarios_id_usuario_fk
        foreign key (id_usuarioA) references Usuarios (id_usuario)
);

create table guarda_cancion
(
    id_cancionA int not null,
    id_usuarioB int not null,
    constraint guarda_cancion_Usuarios_id_usuario_fk
        foreign key (id_usuarioB) references Usuarios (id_usuario),
    constraint guarda_cancion_cancion_id_cancion_fk
        foreign key (id_cancionA) references cancion (id_cancion)
);

create table playlist_activa
(
    es_compartida int not null
);

create table playlist_eliminada
(
    fecha_eliminacion int not null
);

create table sigue_artista
(
    id_usuarioS int         not null,
    id_artistaS varchar(45) not null
);

create table tiena_playlist
(
    nombre_creador int not null,
    id_usuario     int not null,
    id_playlist    int not null
);

create table usuario_free
(
    id_cuenta int not null
        primary key
);

create table usuario_premiun
(
    fecha_renovacion date not null,
    id_forma_pago    int  not null
);


