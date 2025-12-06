// -----------------------NAVBAR------------------------------------

const navbarToggler = document.querySelector('.navbar-toggler');
const navbarHamburger = document.querySelector('#navbar-hamburger');
const navbarClose = document.querySelector('#navbar-close');

navbarToggler.addEventListener('click', () => {
  navbarHamburger.classList.toggle('d-none');
  navbarClose.classList.toggle('d-block');
});


// -----------------------SEARCH BAR------------------------------------

function searchTable() {
  const input = document.getElementById("searchInput");
  const filter = input.value.toUpperCase();
  const rows = document.querySelectorAll("table tbody tr");
  // If the filter is empty, show all rows
  if (!filter) {
    rows.forEach(r => r.style.display = "");
    return;
  }

  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    let matched = false;
    cells.forEach(cell => {
      const text = (cell.textContent || cell.innerText || '').toUpperCase();
      if (text.indexOf(filter) > -1) {
        matched = true;
      }
    });
    row.style.display = matched ? "" : "none";
  });
}
