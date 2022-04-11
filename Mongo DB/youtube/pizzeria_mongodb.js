
  db.provincies.insertMany([{
  
    "_id": ObjectId("620e2f91badce9728393e2b9"),
    "nom_prov": "Barcelona"
  }])

  db.localitats.insertMany([{

        "_id": ObjectId("620e316bbadce9728393e2c4"),
        "nom_loc": "Igualada",
        "id_prov": "620e2f91badce9728393e2b9"
      },{
        "_id": ObjectId("62128d6117fcef6543ac0793"),
        "nom_loc": "Badalona",
        "id_prov": "620e2f91badce9728393e2b9"
      }])

 db.botigues.insertMany([{

        "_id": ObjectId("620e363abadce9728393e320"),
        "adress": "adress botiga1",
        "telefon": "111111111",
        "codiPostal": "08100",
        "id_loc": ObjectId("620e316bbadce9728393e2c4"),
        "id_prov": ObjectId("620e2f91badce9728393e2b9")
       }])

 db.treballadors.insertMany([{

        "id_treballador": ObjectId("6212787617fcef6543ac0712"),
        "nom": "treballadora1",
        "nif": "11111111A",
        "telefon": 111111111,
        "carrec": "cuinera",
        "id_botiga": ObjectId("620e363abadce9728393e320")

       },{

        "id_treballador": ObjectId("62128a9617fcef6543ac0746"),
        "nom": "treballadora2",
        "nif": "11111111A",
        "telefon": 111111111,
        "carrec": "repartidora",
        "id_botiga": ObjectId("620e363abadce9728393e320")

     }])

     db.clients.insertMany([{

        "id_client": ObjectId("620e2ae1badce9728393e2b2"),
        "nom_client": "client1",
        "cognom": "cognom1",
        "telefon": "111111111",
        "correu_electronic": "client1@client1.com",
        "adress": "adress client 1",
        "codiPostal": "08100",
        "id_local": ObjectId("620e316bbadce9728393e2c4"),
        "id_botiga": ObjectId("620e363abadce9728393e320")

      },{

        "id_client": ObjectId("620e2c8dbadce9728393e2b3"),
        "nom_client": "client2",
        "cognom": "cognom2",
        "telefon": "222222222",
        "correu_electronic": "client2@client2.com",
        "adress": "adress client 2",
        "codiPostal": "08200",
        "id_local": ObjectId("620e31c9badce9728393e2c9"),
        "id_botiga": ObjectId("620e363abadce9728393e320")

      }])
      
db.productes.insertMany([{
 
    "id_prod": ObjectId("6212796617fcef6543ac071b"),
    "tipus": "pizza",
      "nom_producte": "producte",
      "imatge": "imatge",
      "descripcio": "descripcio",
      "preu": 10,
      "nom_cat": "categoria"
    },{
  
      "id_prod": ObjectId("62127a8c17fcef6543ac071c"),
      "tipus": "burger",
      "nom_producte": "producte",
      "imatge": "imatge",
      "descripcio": "descripcio",
      "preu": 5.5,
      "nom_cat": null
        
    },{
  
      "id_prod": ObjectId("62127ac017fcef6543ac071d"),
       "tipus": "beguda",
      "nom_producte": "producte",
      "imatge": "imatge",
      "descripcio": "descripcio",
      "preu": 2.5,
      "nom_cat": null
    }])

    db.productes_demanats.insertMany([{
        "id_prod_dem": ObjectId("62128e2517fcef6543ac07ae"),
        "id_prod": ObjectId("6212796617fcef6543ac071b"),
        "id_comanda": ObjectId("6212955f17fcef6543ac07e9"),
        
      },{

        "id_prod_dem": ObjectId("6212926a17fcef6543ac07bb"),
        "id_prod": ObjectId("62127ac017fcef6543ac071d"),
        "id_comanda": ObjectId("62135ae101221abed27004cf"),
      }])

    db.comandes.insertMany([{
    
        "id_comanda": ObjectId("6212955f17fcef6543ac07e9"),
        "data_hora": "2021-01-28",
        "lliurament": "domicili",
        "preu_total": 53.5,
        "id_prod_dem": ObjectId("6212926a17fcef6543ac07bb"),
        "id_treballador": ObjectId("62128a9617fcef6543ac0746"),
        "id_client": ObjectId("620e2ae1badce9728393e2b2")
             
      },{
        "id_comanda": ObjectId("62135ae101221abed27004cf"),
        "data_hora": "2021-02-28",
        "lliurament": "botiga",
        "preu_total": 25,
        "id_prod_dem": ObjectId("62128e2517fcef6543ac07ae"),
        "id_treballador": null,
        "id_client": ObjectId("620e2c8dbadce9728393e2b3")
       }])


       // Esborra la base de dades si existís i la crea de nou.
use('youtube');
db.dropDatabase();
use('youtube');

// Creació de col·leccions (Equivalent a taules a MySQL).
db.createCollection('usuaris');

// Inserir camps i valors a la col·lecció de etiquetes.
db.usuaris.insertMany(
    [
        {
            id: 0,
            email: 'maria@gmail.com',
            contrasenya: '1234',
            nom_usuari: 'Maria123',
            data_naixement: '1992-23-07',
            sexe: 'Dona',
            pais: 'Espanya',
            codi_postal: 08032,
            canal: {
                id: 0,
                nom: 'Hater one',
                descripcio: 'Aquest es un canal molt agradable',
                creacio: ISODate(),
                suscriptors: [
                    {
                        $ref: 'usuaris',
                        $id: 1
                    },
                    {
                        $ref: 'usuaris',
                        $id: 2
                    }
                ]
            }
        },
        {
            id: 1,
            email: 'aitor@gmail.com',
            contrasenya: '1234',
            nom_usuari: 'Aitor123',
            data_naixement: '1990-09-11',
            sexe: 'Home',
            pais: 'Espanya',
            codi_postal: 08012,
            canal: {
                id: 1,
                nom: 'El canal de Aitor',
                descripcio: 'El millor canal de YouTube del mon',
                creacio: ISODate(),
                suscriptors: [
                    {
                        $ref: 'usuaris',
                        $id: 0
                    },
                    {
                        $ref: 'usuaris',
                        $id: 2
                    }
                ],
                playlists: [
                    {
                        id: 0,
                        nom: 'Els meus videos',
                        data_creacio: ISODate(),
                        estat: 'Privada'
                    }
                ],
                videos: [
                    {
                        id: 1,
                        títol: 'Qui es l`Aitor',
                        descripció: 'Aquest es un video de presentació del canal',
                        grandària: '428mb',
                        nom_arxiu: 'MVI7986',
                        durada: '3 minuts i 13 segons',
                        miniatura: 'https://i.ytimg.com/vi/olQwfDjYAqA/maxresdefault.jpg',
                        reproduccions: 245,
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 2,
                                    data: ISODate()
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 0,
                                    data: ISODate()
                                }
                            }
                        ],
                        estat: 'Public',
                        etiquetes: [
                            {
                                $ref: 'etiquetes',
                                $id: 0
                            }
                        ],
                        playlists: {
                            $ref: 'playlists',
                            $id: 0
                        },
                        data_pujada: ISODate(),
                        etiquetes: [
                            {
                                id: 0,
                                nom: 'Vlogs',
                                data_creacio: ISODate(),
                                estat: 'Privada',
                                usuari_id: {
                                    $ref: 'usuaris',
                                    $id: 2
                                }
                            }
                        ],
                        comentaris: [
                            {
                                id: 0,
                                text: 'Bon video Aitor, pasa`t pel meu canal per saludar al meu gos',
                                data_i_hora: ISODate(),
                                likes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 1,
                                            data: ISODate()
                                        }
                                    }
                                ],
                                dislikes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 0,
                                            data: ISODate()
                                        }
                                    }
                                ]
                            }
                        ]
                    }

                ]
            }
        },
        {
            id: 2,
            email: 'anna@gmail.com',
            contrasenya: '1234',
            nom_usuari: 'Annyta',
            data_naixement: '1989-11-21',
            sexe: 'Dona',
            pais: 'Espanya',
            codi_postal: 08030,
            canal: {
                id: 2,
                nom: 'La vida del meu gos',
                descripcio: 'En aquest canal us aniré contant la vida del meu gos, Rocky',
                creacio: ISODate(),
                suscriptors: [
                    {
                        $ref: 'usuaris',
                        $id: 0
                    },
                    {
                        $ref: 'usuaris',
                        $id: 1
                    }
                ],
                playlists: [
                    {
                        id: 1,
                        nom: 'Bachata',
                        data_creacio: ISODate(),
                        estat: 'Publica'
                    }
                ],
                videos: [
                    {
                        id: 0,
                        títol: 'El meu gos es lleva del seu llit',
                        descripció: 'Així es el despertar del meu gos pels matins',
                        grandària: '1.2gb',
                        nom_arxiu: 'Rocky llevant-se del llit',
                        durada: '15 minuts, 30 segons',
                        miniatura: 'http://2.bp.blogspot.com/-4J6Cm2KtqnA/UxiTVtAXKGI/AAAAAAAABAo/Z9LZUs8swhw/w1200-h630-p-k-no-nu/image.jpg',
                        reproduccions: 128,
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 1,
                                    data: ISODate()
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 2,
                                    data: ISODate()
                                }
                            }
                        ],
                        estat: 'Public',
                        etiquetes: [
                            {
                                $ref: 'etiquetes',
                                $id: 0
                            },
                            {
                                $ref: 'etiquetes',
                                $id: 4
                            }
                        ],
                        playlists: {
                            $ref: 'playlist',
                            $id: 2
                        },
                        data_pujada: ISODate(),
                        etiquetes: [
                            {
                                id: 0,
                                nom: 'Mascotes',
                                data_creacio: ISODate(),
                                estat: 'Privada',
                                usuari_id: {
                                    $ref: 'usuaris',
                                    $id: 2
                                }
                            }
                        ],
                        comentaris: [
                            {
                                id: 1,
                                text: 'Hola Anna, m`agrada molt la teva mascota, jo també tinc un goset, estic pendent de les aventures d`en Rocky',
                                data_i_hora: ISODate(),
                                likes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 2,
                                            data: ISODate()
                                        }
                                    },
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 1,
                                            data: ISODate()
                                        }
                                    }
                                ],
                                dislikes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 0,
                                            data: ISODate()
                                        }
                                    }
                                ],
                                video_id: {
                                    $ref: 'videos',
                                    $id: 0
                                },
                                usuari_id: {
                                    $ref: 'usuaris',
                                    $id: 1
                                }
                            }
                        ]
                    }
                ]
            }
        }
    ]
);