function total() {
  const priceInput = document.getElementById("purchase_quantity");
  if (!priceInput) {
    return false;
  }
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTotalDom = document.getElementById("purchase-total");
    addTotalDom.innerHTML = inputValue * 10;
  });
}
window.addEventListener("load", total);
