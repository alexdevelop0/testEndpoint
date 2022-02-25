import 'package:trii/redux2/settingApp/settingsHomeActions.dart';
import 'package:trii/redux2/settingApp/settingsHomeState.dart';


postsReducerHome(PostsStateHome prevState, SetPostsStateActionHome action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
   
    dataUserList: payload.dataUserList,


    // posts: payload.posts,
  );
}
