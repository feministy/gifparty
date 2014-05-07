$(document).ready(function() {
  $('img').click(function(event) {
    event.preventDefault();
    var src = $(this).attr('src');
    copyToClipboard(src);
  });
  function copyToClipboard(text) {
    window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
  }
});