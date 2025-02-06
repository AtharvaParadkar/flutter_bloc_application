import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/features/dashboard/bloc/dashboard_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    super.initState();
    dashboardBloc.add(PhotoApiFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: dashboardBloc,
        builder: (context, state) {
          switch (state.photoApiStatus) {
            case PhotoApiStatus.loading:
              return Center(child: CircularProgressIndicator());

            case PhotoApiStatus.success:
              return ListView.builder(
                itemCount: state.photoList.length,
                itemBuilder: (context, index) {
                  final item = state.photoList[index];
                  return ListTile(
                    title: Text(
                      '${item.iId}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item.title}'),
                    leading: SizedBox(
                      height: 90,
                      width: 100,
                      child: Image.network(
                        '${item.thumbnailUrl}',
                        fit: BoxFit.cover,
                        errorBuilder: (context,error,stackTrace){
                          return Icon(Icons.error);
                        },
                      ),
                    ),
                  );
                },
              );
            case PhotoApiStatus.failure:
              return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }
}
