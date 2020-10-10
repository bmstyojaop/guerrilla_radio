$(function() {

  let search_list = $("TweetField");
  function appendTweet(tweet) {
    if(tweet.user_sign_in && tweet.user_sign_in.id == tweet.user_id){
      let html = `<article class="PostedItem">
                    <div class="ArticleHeader">
                      <h2>
                        @${tweet.nickname}
                      </h2>
                      <ul class="More">
                        <li>
                          <i class="fas fa-bars"></i>
                          <ul>
                            <li>
                              <a href="/tweets/${tweet.id}" data-method="get" >詳細</a>
                            </li>
                            <li>
                              <a href="/tweets/${tweet.id}/edit" data-method="get" >編集</a>
                            </li>
                            <li>
                              <a href="/tweets/${tweet.id}" data-method="delete" >削除</a>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div class="Picture">
                      <div class="content_post" style="background-image: url(${tweet.image});"></div>
                    </div>
                    <div class="Details">
                      ${tweet.text}
                    </div>
                  </article>`
    search_list.append(html);
    } else {
      let html = `<article class="PostedItem">
                    <div class="ArticleHeader">
                      <h2>
                        @${tweet.nickname}
                      </h2>
                      <ul class="More">
                        <li>
                          <i class="fas fa-bars"></i>
                          <ul>
                            <li>
                              <a href="/tweets/${tweet.id}" data-method="get" >詳細</a>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div class="Picture">
                      <div class="content_post" style="background-image: url(${tweet.image});"></div>
                    </div>
                    <div class="Details">
                      ${tweet.text}
                    </div>
                  </article>`
    search_list.append(html);
    }
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/tweets/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(tweets) {
      search_list.empty();
      if (tweets.length !== 0) {
        tweets.forEach(function(tweet){
          appendTweet(tweet);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});