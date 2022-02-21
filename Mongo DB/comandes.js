db.comandes.insertMany([{

    "id_comanda": ObjectId("6212955f17fcef6543ac07e9"),
    "data_hora": "2021-01-28",
    "lliurament": "domicili",
    "preu_total": 53.5,
    "id_prod_dem": ObjectId("6212926a17fcef6543ac07bb"),
    "treballador": ObjectId("62128a9617fcef6543ac0746"),
    "id_client": ObjectId("620e2ae1badce9728393e2b2"),

    },
    {

    "id_comanda": ObjectId("62135ae101221abed27004cf"),
    "data_hora": "2021-02-28",
    "lliurament": "botiga",
    "preu_total": 25,
    "id_prod_dem": ObjectId("62128e2517fcef6543ac07ae"),
    "treballador": null,
    "id_client": ObjectId("620e2c8dbadce9728393e2b3"),

    }])

    db.clients.insertMany([{

"id_client":ObjectId("620e2ae1badce9728393e2b2"),
"nom_client": "client1",
"cognom": "cognom1",
"telefon": "111111111",
"correu_electronic": "client1@client1.com",
"adress": "adress client 1",
"codiPostal": "08100",
"id_local": ObjectId("620e316bbadce9728393e2c4"), 
"id_botiga":  ObjectId("620e363abadce9728393e320")
    },
    {
        "id_client":ObjectId("620e2c8dbadce9728393e2b3"),
        "nom_client": "client2",
        "cognom": "cognom2",
        "telefon": "222222222",
        "correu_electronic": "client2@client2.com",
        "adress": "adress client 2",
        "codiPostal": "08200",
        "id_local": "620e31c9badce9728393e2c9",
        "botiga": {
          "$oid": "620e363abadce9728393e320"
    } 
}])
  
  
  
 
  