window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price"); // 販売手数料を表示する場所のid
  const profitDom = document.getElementById("profit"); // 利益を表示する場所のid

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 入力が数字でない場合や空の場合のエラーハンドリング
    if (isNaN(inputValue) || inputValue === "") {
      addTaxDom.textContent = "有効な金額を入力してください";
      profitDom.textContent = "";
    } else {
      // 販売手数料の計算（10%）
      const salesTax = Math.floor(inputValue * 0.1);
      addTaxDom.textContent = `${salesTax}`;

      // 利益の計算
      const profit = inputValue - salesTax;
      profitDom.textContent = `${profit}`;
    }
  });
});