package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB
var err error

// Pegawai struct (Model) ...
type Pegawai struct {
	IDPegawai  string `json:"idPegawai"`
	Bagian     string `json:"bagian"`
	Nama       string `json:"nama"`
	Jekel      string `json:"jekel"`
	TglLahir   string `json:"tglLahir"`
	DaerahAsal string `json:"daerahAsal"`
	Status     string `json:"status"`
	Foto       string `json:"foto"`
}

// Get all pegawai
func getPegawai(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	var pegawaii []Pegawai

	sql := `SELECT
				id_pegawai,
				IFNULL(bagian,''),
				IFNULL(nama,''),
				IFNULL(jekel,''),
				IFNULL(tgl_lahir,''),
				IFNULL(daerah_asal,''),
				IFNULL(status,''),
				IFNULL(foto,'')
			FROM pegawai`

	result, err := db.Query(sql)

	defer result.Close()

	if err != nil {
		panic(err.Error())
	}

	for result.Next() {

		var pegawai Pegawai
		err := result.Scan(&pegawai.IDPegawai, &pegawai.Bagian, &pegawai.Nama,
			&pegawai.Jekel, &pegawai.TglLahir, &pegawai.DaerahAsal,
			&pegawai.Status, &pegawai.Foto)

		if err != nil {
			panic(err.Error())
		}
		pegawaii = append(pegawaii, pegawai)
	}

	json.NewEncoder(w).Encode(pegawaii)
}

func createPegawai(w http.ResponseWriter, r *http.Request) {

	if r.Method == "POST" {

		idPegawai := r.FormValue("id_pegawai")
		Bagian := r.FormValue("bagian")
		Nama := r.FormValue("nama")
		Jekel := r.FormValue("jekel")
		tglLahir := r.FormValue("tgl_lahir")
		daerahAsal := r.FormValue("daerah_asal")
		Status := r.FormValue("status")
		Foto := r.FormValue("foto")

		stmt, err := db.Prepare("INSERT INTO pegawai (id_pegawai,bagian,nama,jekel,tgl_lahir,daerah_asal,status,foto) VALUES (?,?,?,?,?,?,?,?)")

		_, err = stmt.Exec(idPegawai, Bagian, Nama, Jekel, tglLahir, daerahAsal, Status, Foto)

		if err != nil {
			fmt.Fprintf(w, "Data Duplicate")
		} else {
			fmt.Fprintf(w, "Data Created")
		}

	}
}

func getPegawaii(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var pegawaii []Pegawai
	params := mux.Vars(r)

	sql := `SELECT
				id_pegawai,
				IFNULL(bagian,''),
				IFNULL(nama,''),
				IFNULL(jekel,''),
				IFNULL(tgl_lahir,''),
				IFNULL(daerah_asal,''),
				IFNULL(status,''),
				IFNULL(foto,'')
			FROM pegawai WHERE id_pegawai = ?`

	result, err := db.Query(sql, params["id"])

	if err != nil {
		panic(err.Error())
	}

	defer result.Close()

	var pegawai Pegawai

	for result.Next() {

		err := result.Scan(&pegawai.IDPegawai, &pegawai.Bagian, &pegawai.Nama,
			&pegawai.Jekel, &pegawai.TglLahir, &pegawai.DaerahAsal,
			&pegawai.Status, &pegawai.Foto)

		if err != nil {
			panic(err.Error())
		}

		pegawaii = append(pegawaii, pegawai)
	}

	json.NewEncoder(w).Encode(pegawaii)
}

func updatePegawai(w http.ResponseWriter, r *http.Request) {

	if r.Method == "PUT" {

		params := mux.Vars(r)

		newNamaPegawai := r.FormValue("nama")

		stmt, err := db.Prepare("UPDATE Pegawai SET nama = ? WHERE id_pegawai = ?")

		_, err = stmt.Exec(newNamaPegawai, params["id"])

		if err != nil {
			fmt.Fprintf(w, "Data not found or Request error")
		}

		fmt.Fprintf(w, "Pegawai dengan ID_Pegawai = %s berhasil Diupdate", params["id"])
	}
}

func deletePegawai(w http.ResponseWriter, r *http.Request) {

	params := mux.Vars(r)
	stmt, err := db.Prepare("DELETE FROM pegawai WHERE id_pegawai = ?")

	_, err = stmt.Exec(params["id"])

	if err != nil {
		fmt.Fprintf(w, "delete failed")
	}

	fmt.Fprintf(w, "Pegawai dengan ID = %s berhasil Dihapus", params["id"])
}

// func delCustomer(w http.ResponseWriter, r *http.Request) {

// 	customerID := r.FormValue("CustomerID")
// 	companyName := r.FormValue("CompanyName")

// 	stmt, err := db.Prepare("DELETE FROM customers WHERE CustomerID = ? and CompanyName = ?")

// 	_, err = stmt.Exec(customerID, companyName)

// 	if err != nil {
// 		fmt.Fprintf(w, "delete failed")
// 	}

// 	fmt.Fprintf(w, "Customer with ID = %s was deleted", customerID)
// }

func getPost(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "application/json")

	var pegawaii []Pegawai

	idPegawai := r.FormValue("idPegawai")
	nama := r.FormValue("nama")

	sql := `SELECT
				id_pegawai,
				IFNULL(bagian,''),
				IFNULL(nama,''),
				IFNULL(jekel,''),
				IFNULL(tgl_lahir,''),
				IFNULL(daerah_asal,''),
				IFNULL(status,''),
				IFNULL(foto,'')
			FROM pegawai WHERE id_pegawai = ? and nama =  ?`

	result, err := db.Query(sql, idPegawai, nama)

	if err != nil {
		panic(err.Error())
	}

	defer result.Close()

	var pegawai Pegawai

	for result.Next() {

		err := result.Scan(&pegawai.IDPegawai, &pegawai.Bagian, &pegawai.Nama,
			&pegawai.Jekel, &pegawai.TglLahir, &pegawai.DaerahAsal,
			&pegawai.Status, &pegawai.Foto)

		if err != nil {
			panic(err.Error())
		}

		pegawaii = append(pegawaii, pegawai)
	}

	json.NewEncoder(w).Encode(pegawaii)

}

// Main function
func main() {

	db, err = sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/db_perusahaan")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()

	// Init router
	r := mux.NewRouter()

	// Route handles & endpoints
	r.HandleFunc("/pegawai", getPegawai).Methods("GET")
	r.HandleFunc("/pegawai/{id}", getPegawaii).Methods("GET")
	r.HandleFunc("/pegawai", createPegawai).Methods("POST")
	r.HandleFunc("/pegawai/{id}", updatePegawai).Methods("PUT")
	r.HandleFunc("/pegawai/{id}", deletePegawai).Methods("DELETE")

	//New
	r.HandleFunc("/getcustomer", getPost).Methods("POST")

	//Delete Post
	// r.HandleFunc("/customers", delCustomer).Methods("POST")

	// Start server
	log.Fatal(http.ListenAndServe(":8080", r))
}
