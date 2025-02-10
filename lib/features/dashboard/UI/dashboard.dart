import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc_application/routes/routes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardBloc _dashboardBloc = DashboardBloc();

  @override
  void initState() {
    super.initState();
    _dashboardBloc.add(PhotoApiFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: _dashboardBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (PhotoApiLoadingState):
              return Center(child: CircularProgressIndicator());
            case const (PhotoApiSuccessState):
              state as PhotoApiSuccessState;
              return ListView.builder(
                itemCount: state.photoList.length,
                itemBuilder: (context, index) {
                  final item = state.photoList[index];
                  return ListTile(
                    title: Text(
                      '${item.iId}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text('${item.title}'),
                    // leading: SizedBox(
                    //   height: 90,
                    //   width: 100,
                    //   child: Hero(
                    //     tag: item.iId!,
                    //     transitionOnUserGestures: true,
                    //     child: Image.network(
                    //       '${item.thumbnailUrl}',
                    //       fit: BoxFit.cover,
                    //       errorBuilder: (context, error, stackTrace) {
                    //         return Icon(Icons.error);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteConstants.titleScreen,
                      arguments: item,
                    ),
                  );
                },
              );
            case const (PhotoApiFailureState):
              state as PhotoApiFailureState;
              return Center(child: Text(state.fail));
            default:
              return Center(
                child: Text('No Data!'),
              );
          }
        },
      ),
    );
  }
}
