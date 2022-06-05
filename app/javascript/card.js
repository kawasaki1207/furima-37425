const pay = () => {
  Payjp.setPublicKey("pk_test_244c7c9f689b505c76e7515c");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) =>{
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token);

      }
    })
  });

};

window.addEventListener("load", pay);