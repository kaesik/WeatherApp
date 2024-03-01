import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/image/image_bloc.dart';
import 'package:weather_app/bloc/theme/theme_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return BlocBuilder<ThemeBloc, ThemeMode>(
            builder: (contextTheme, stateTheme) {
              // print('check state: ${contextTheme.read<ThemeBloc>().state}');
              return BlocBuilder<ImageBloc, ImageState>(
                bloc: ImageBloc()
                  ..add(FetchImage(
                    state.weather,
                    contextTheme.read<ThemeBloc>().state == ThemeMode.dark ||
                        contextTheme.read<ThemeBloc>().state ==
                            ThemeMode.system ||
                        (MediaQuery.of(context).platformBrightness ==
                                Brightness.dark &&
                            contextTheme.read<ThemeBloc>().state ==
                                ThemeMode.dark),
                  )),
                builder: (context, state) {
                  if (state is ImageSuccess) {
                    // print('/kaesik WeathesrImage: ${state.imageUrl}');
                    return Image(
                        image: AssetImage(state.imageUrl),
                        width: 256,
                        height: 256);
                  } else {
                    return const Image(
                        image: AssetImage('assets/images/unknown.png'),
                        width: 256,
                        height: 256);
                  }
                },
              );
            },
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherFailure) {
          return const Image(
              image: AssetImage('assets/images/unknown.png'),
              width: 256,
              height: 256);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
