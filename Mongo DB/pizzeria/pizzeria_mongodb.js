
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