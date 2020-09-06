import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieApp/model/movie.dart';

class FirestoreProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 이미 본 영화 리스트 Firestore에서 가져오기
  Stream<QuerySnapshot> seenMovieList() {
    return _firestore.collection("seen_movie").snapshots();
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