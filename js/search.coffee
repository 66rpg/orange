search_result_games_template = Mustache.compile $('#search_result_games_template').html()
$.getJSON 'http://3.chengguangtest.sinaapp.com/test/games', (data)->
  data.score = ()->
    if score_count = parseInt(@score1) + parseInt(@score2) + parseInt(@score3) + parseInt(@score4) + parseInt(@score5)
      score = (parseInt(@score1) + parseInt(@score2)*2 + parseInt(@score3)*3 + parseInt(@score4)*4 + parseInt(@score5)*5) / score_count
      console.log score_count
      Array(score + 1).join('★') + Array( 5 - score + 1).join('☆')
    else
      '没有评分'

  $('#search_result').html search_result_games_template(data)
.error (xhr)->
  $('#search_result').html xhr.responseText