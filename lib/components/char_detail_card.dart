import '../models/character.dart';
import '../theme/app_colors.dart';
import 'package:flutter/material.dart';

class CharDetailCard extends StatelessWidget {
  const CharDetailCard({
    Key? key,
    required this.charDetail,
  }) : super(key: key);

  final Character charDetail;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: AppColors.primaryColorLight,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 7.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(charDetail.image),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  charDetail.name.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Icon(
                          Icons.circle,
                          color: charDetail.status == 'Dead'
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                      Text('${charDetail.status} - ${charDetail.species}',
                          style: const TextStyle(
                            color: AppColors.white,
                          )),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                child: Text(
                  'Last know location:',
                  style: TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Text(
                  charDetail.location.name,
                  style: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w900),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Text(
                  'First seen in:',
                  style: TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Text(
                  charDetail.origin.name,
                  style: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
