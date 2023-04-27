 function supprimerAchat(id){

	        swal.fire({
              title: "Vous etes sur de supprimer ce versement ?",
              icon: "warning",
              showCancelButton: true,
              confirmButtonColor: "#3085d6",
              cancelButtonColor: "#d33",
              confirmButtonText: "Oui, supprimer",
            })
            .then((willDelete) => {
              if (willDelete.isConfirmed) {
                    $.ajax({
                      type: "GET",
                      url: "/ajax/form",
                      data: { value: id },
                      success: function ($data, $textStatus, $XMLHtpRequest) {
                        swal.fire({
                          title: "",
                          text: "Le versement est supprimé avec succes",
                          icon: "success",
                        }).then((willDelete) => {
                          if (willDelete) {
                            document.location.reload();
                          }
                        });
                      },
                      error: function () {
                        swal.fire({
                          title: "",
                          text: "Il y a erreur au serveur pour le moment!!",
                          icon: "error",
                        }).then((willDelete) => {
                          if (willDelete) {
                            document.location.reload();
                          }
                        });
                      },
                    });
              }
            });     
 }