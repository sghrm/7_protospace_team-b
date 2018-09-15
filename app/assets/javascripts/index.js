$(function() {

  function buildHTML(data) {
    var html =
    `<div class="col-sm-4.col-md-3.proto-content">
      <div class="thumbnail">
        <a href="/prototype/${data.id}">
          <img src="${data.set_main_thumbnail}">
        </a>
        <div class="caption">
          <h3>${data.title}</h3>
          <div class="proto-meta">
            <div class="proto-user">
              <a href="/users/${data.user_id}">
            </div>
            <div class="proto-posted">
              ${data.created_at}
            </div>
          </div>
        </div>
      </div>
    </div>`
    console.log(html);
    $('#masonry-container').append(html);
    // return html;
  }

  $('.btn-newest').on('click', function() {
    $.ajax({
      url: "/newest",
      type: "GET",
      dataType: 'json'
    })
    .done(function(data) {
      console.log(data);
      $('#masonry-container').remove();
      var html = buildHTML(data);
      // $('.proto-list').append(html);
    })
  });
});
