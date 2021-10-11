function total() {
  const messageInput = document.getElementById("message");
  if (!messageInput) {
    return false;
  }
  messageInput.addEventListener("input", () => {
    const inputValue = messageInput.value;
    const valLength = inputValue.replace(
      /[\uD800-\uDBFF][\uDC00-\uDFFF]/g,
      "+"
    ).length;
    const nowLength = document.getElementById("now-length");
    nowLength.innerHTML = valLength;

    const stockQuantity = document.getElementById("stock");
    const stockValue = stockQuantity.innerHTML;
    const balanceLength = document.getElementById("balance-length");
    balanceLength.innerHTML = stockValue - valLength;

    const quantity = document.getElementById("quantity");
    quantity.value = valLength;

    const unitInput = document.getElementById("unit_price");
    unitInput.addEventListener("input", () => {
      const unitValue = unitInput.value;
      const addTotalDom = document.getElementById("buy-total");
      addTotalDom.innerHTML = valLength * unitValue;
    });
  });
}
window.addEventListener("load", total);
