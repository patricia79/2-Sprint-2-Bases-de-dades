
db.productes.insertMany([{
 
  "_id": ObjectId("6212796617fcef6543ac071b"),
  "tipus": "pizza",
    "nom_producte": "producte",
    "imatge": "imatge",
    "descripcio": "descripcio",
    "preu": 10,
    "nom_cat": "categoria"
  },{

    "_id": ObjectId("62127a8c17fcef6543ac071c"),
    "tipus": "burger",
    "nom_producte": "producte",
    "imatge": "imatge",
    "descripcio": "descripcio",
    "preu": 5.5,
    "nom_cat": null
      
  },{

    "_id": ObjectId("62127ac017fcef6543ac071d"),
     "tipus": "beguda",
    "nom_producte": "producte",
    "imatge": "imatge",
    "descripcio": "descripcio",
    "preu": 2.5,
    "nom_cat": null
  }])

  db.provincies.insertMany([{
  
    "_id": ObjectId("620e2f91badce9728393e2b9"),
    "nom_prov": "Barcelona"
  }])


  "_id": ObjectId("620cca122991df4442fe1172"),
  "nameclient": "client2",
  "telefon": "222222222",
  "correu_electronic": "client2@client2.com",
  "adress": "adress client 2",
  "codiPostal": "08200",
  "ciutat": "ciutat",
  "pais": "pais",
  "data registre": "20-02-2021",
  "client_recom": ObjectId("620cca122991df4442fe1171"),
  "venedor": "venedor1",
  "ulleres":[ObjectId("621bd6b475fb67acae933ddc")]

}, {

  "_id": ObjectId("620d45effd3d1cb91d6abd73"),
  "nameclient": "client3",
  "telefon": "333333333",
  "correu_electronic": "client3@client3.com",
  "adress": "adress client 3",
  "codiPostal": "08300",
  "ciutat": "ciutat",
  "pais": "pais",
  "data registre": "20-03-2021",
  "client_recom": ObjectId("620cca122991df4442fe1172"),
  "venedor": "venedor3",
  "ulleres":[ObjectId("621e0687bee9349940ad9b7d")]

}])


db.proveidors.insertMany([{

  "_id": ObjectId("620ccae82991df4442fe1187"),
  "name_prov": "prov1",
  "telefon": "111111111",
  "correu_electronic": "prov1@prov1.com",
  "adress": "adress prov1",
  "codiPostal": "08100",
  "ciutat": "ciutat",
  "pais": "pais"
}, {
  "_id": ObjectId("620ccae82991df4442fe1188"),
  "name_prov": "prov2",
  "telefon": "222222222",
  "correu_electronic": "prov2@prov2.com",
  "adress": "adress prov2",
  "codiPostal": "08200",
  "ciutat": "ciutat",
  "pais": "pais"
}, {
  "_id": ObjectId("620ce1ec2991df4442fe11f2"),
  "name_prov": "prov3",
  "telefon": "333333333",
  "correu_electronic": "prov3@prov3.com",
  "adress": "adress prov3",
  "codiPostal": "08300",
  "ciutat": "ciutat",
  "pais": "pais"
}])

db.ulleres.insertMany([{

  "_id": ObjectId("621bd63675fb67acae933ddb"),
  "marca": "D&G",
  "modelo": "mimo2",
  "grad ud": "2.25",
  "grad ue": "2",
  "tipus muntura": "metalica",
  "color munt": "plata",
  "color vidre": "transparent",
  "preu": "123",
  "proveidor":ObjectId("620ccae82991df4442fe1187")
  
},{

  "_id": ObjectId("621bd6b475fb67acae933ddc"),
  "marca": "prada",
  "model": "LKIOP',",
  "grad ud": "2.5",
  "grad ue": "2",
  "tipus muntura": "pasta",
  "color munt": "blanca",
  "color vidre": "TRANSPARENT",
  "preu": "345",
  "proveidor":ObjectId("620ccae82991df4442fe1188")

},{

  "_id": ObjectId("621e0687bee9349940ad9b7d"),
  "marca": "oakley",
  "model": "KJU3',",
  "grad ud": "1.25",
  "grad ue": "1",
  "tipus muntura": "flotant",
  "color munt": "NEGRA',",
  "color vidre": "TRANSPARENT',",
  "preu": "567",
  "proveidor":ObjectId("620ce1ec2991df4442fe11f2")

}])