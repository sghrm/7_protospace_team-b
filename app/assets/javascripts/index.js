$(function() {

  function buildHTML(data) {
    var html =
    `<div class="col-sm-4 col-md-3 proto-content">
      <div class="thumbnail">
        <a href="/prototypes/${data.id}">
          <img src="${data.main.url}">
        </a>
        <div class="caption">
          <h3>${data.title}</h3>
          <div class="proto-meta">
            <div class="proto-user">
              <a href="/users/${data.user_id}">
              ${data.user_name}
            </div>
            <div class="proto-posted">
              ${data.posted_date}
            </div>
          </div>
        </div>
      </div>
    </div>`
    return html;
  }

  $('.btn-newest').on('click', function() {
    $.ajax({
      url: "/newest",
      type: "GET",
      dataType: 'json'
    })
    .done(function(json) {
      $('#masonry-container').empty();
      json.forEach(function(data) {
        var html = '';
        html += buildHTML(data);
        $('#masonry-container').append(html);
      })
    });
  });
});
