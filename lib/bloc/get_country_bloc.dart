import 'package:movieApp/model/produc_country.dart';
import 'package:movieApp/model/produc_country_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class CountryBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<ProductionCountryResponse> _subject = BehaviorSubject<ProductionCountryResponse>(); // behaviorsubject 클래스는 가장 최근에 받은 이벤트를 리스너가 받음

  getCountries(int id) async {
    ProductionCountryResponse response = await _repository.getCountries(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductionCountryResponse> get subject => _subject; 

}

final contriesBloc = CountryBloc();