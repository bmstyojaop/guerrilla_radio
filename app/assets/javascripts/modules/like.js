$(document).on('ajax:success', '.favorite a', function(e) {
  e.preventDefault();
  if (e.detail[0][0].done == "save"){

    let tweet_like = document.getElementById('tweet_like')
    tweet_like.innerHTML = '<a id="tweet_favorites__destroy" data-remote="true" rel="nofollow" data-method="delete" href="tweets/'+e.detail[0][0].tweet_id+'/favorites"><span style="color:red;">❤︎</span></a>'
  }
  if (e.detail[0][0].done == "destroy"){
      let tweet_like = document.getElementById('tweet_like')
      tweet_like.innerHTML = '<a id="tweet_favorites_create" data-remote="true" rel="nofollow" data-method="tweet" href="tweets/'+e.detail[0][0].tweet_id+'/favorites"><span>❤︎</span></a>'
    }
  }, { passive: false });