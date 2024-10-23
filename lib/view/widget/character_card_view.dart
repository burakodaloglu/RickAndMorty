import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/core/service/local/shared_preferences_helper.dart';
import 'package:rickandmorty/navigation/router.dart';

import '../../core/localization/locator.dart';
import '../../model/character_model.dart';

class CharacterCardView extends StatefulWidget {
  final CharacterModel characterModel;
  bool isFavorited;

  CharacterCardView({
    super.key,
    required this.characterModel,
    this.isFavorited = false,
  });

  @override
  State<CharacterCardView> createState() => _CharacterCardViewState();
}

class _CharacterCardViewState extends State<CharacterCardView> {
  void _favoriteCharacter() {
    if (widget.isFavorited) {
      locator<SharedPreferencesHelper>()
          .removeCharacter(widget.characterModel.id);
      widget.isFavorited = false;
    } else {
      locator<SharedPreferencesHelper>()
          .saveCharacter(widget.characterModel.id);
      widget.isFavorited = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.push(AppRoutes.charactersDetail,extra: widget.characterModel),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      widget.characterModel.image,
                      height: 100,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            widget.characterModel.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.fade
                            ),
                          ),
                          const SizedBox(height: 5),
                          _infoWidget(
                              type: 'Origin',
                              value: widget.characterModel.origin.name),
                          const SizedBox(height: 4),
                          _infoWidget(
                              type: 'Status',
                              value:
                                  '${widget.characterModel.status} - ${widget.characterModel.species}'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: _favoriteCharacter,
              icon: Icon(
                  widget.isFavorited ? Icons.bookmark : Icons.bookmark_border),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
