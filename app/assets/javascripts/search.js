$(function() {

  const search_list = $('.items.my-items');

  function appendItem(item) {
    let html = `
        <li class='item'>
          <div class='item__name'>  
            ${item.name}
          </div>
        </li>
      `;
    search_list.append(html);
  };

  function appendErrMsgToHTML(msg) {
    let html = `
      <div class='message'>${msg}</div>
      `;
    search_list.append(html);
  };

  $('.search-input').on('keyup', function() {
    const input = $('.search-input').val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/user/items/searches',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(items) {
      search_list.empty();
      if (items.length !== 0) {
        items.forEach(function(item) {
          appendItem(item);
        });
      } else {
        appendErrMsgToHTML('一致するアイテムがありません');
      };
    })
    .fail(function() {
      alert('error');
    });
  });
});