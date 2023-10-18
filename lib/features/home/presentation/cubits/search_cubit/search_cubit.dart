import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/cubits/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Job> searchedJobsList = [];

  void getSearchedDoctorsList(
      {required String jobName, required List<Job> jobs}) {
    searchedJobsList = jobs.where((element) {
      return element.name!.toLowerCase().contains(jobName.toLowerCase());
    }).toList();
    emit(GetSearchedDoctorsList());
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(ChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(ChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(ChangeIsSearchingState());
  }
}
