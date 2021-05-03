window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const valueResult = inputValue * 0.1;
    addTax.innerHTML = Math.floor(valueResult);
    profit.innerHTML = Math.floor(inputValue - valueResult);
  });
});