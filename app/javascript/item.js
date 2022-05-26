function item() {
  const priceText = document.getElementById("item-price");
  priceText.addEventListener("keyup", () => {
    const priceTax = document.getElementById("add-tax-price");
    tax = Math.floor(priceText.value / 10);
    priceTax.innerHTML = (tax);

    const profit = document.getElementById("profit");
    gain = (priceText.value - tax);
    profit.innerHTML = (gain);
  });
};

window.addEventListener('load', item);