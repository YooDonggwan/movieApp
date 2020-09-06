import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/model/movie_response.dart';

class FirestoreProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 이미 본 영화 리스트 Firestore에서 가져오기
  Future<MovieResponse> getSeenMovieList() async {
    var querySnap = await _firestore
      .collection('seen_movie')
      .get();

    var tmplist = querySnap.docs;

    var list = tmplist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

  }

  // Firestore의 seenMovie에 추가하기
  Future<void> uploadSeenMovie(Movie seenMovie) async {
    return _firestore
        .collection("seen_movie")
        .doc(seenMovie.title)
        .set({
          'id':seenMovie.id,
          'popularity':seenMovie.popularity,
          'title':seenMovie.title,
          'backdrop_path':seenMovie.backPoster,
          'poster_path':seenMovie.poster,
          'overview':seenMovie.overview,
          'vote_average':seenMovie.rating
        });
  }

}