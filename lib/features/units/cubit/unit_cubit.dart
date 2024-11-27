import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/units/model/unit_model.dart';
import 'package:inventory/features/units/repository/unit_repository.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

part 'unit_state.dart';

part 'unit_cubit.freezed.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitRepository repository;

  UnitCubit(this.repository) : super(const UnitState());

  Future<void> getUnits({bool showLoading = true}) async {
    emit(state.copyWith(status: showLoading ? const LoadingState() : const InitialState()));
    final response = await repository.getUnits();
    response.fold(
      (l) {
        emit(state.copyWith(status: const ErrorState()));
        log('Error fetching Units $l');
      },
      (r) {
        log('Fetched Units ==> ${r.data}');
        List<Unit> docTypeList = r.data.result;
        emit(state.copyWith(status: const LoadedState(), listOfUnits: docTypeList));
      },
    );
  }

  addUnits(Unit unit, BuildContext context) async {
    List<Unit> listOfUnit = List.from(state.listOfUnits);
    String lowerUnit = unit.name.toLowerCase();
    bool unitExists = listOfUnit.any((existingUnit) => existingUnit.name.toLowerCase() == lowerUnit);

    if (!unitExists) {
      final response = await repository.postUnit(unit);
      log('Unit added $response');
      response.fold(
        (l) {
          emit(state.copyWith(status: const ErrorState()));
          log('Error fetching Units $l');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              elevation: 10,
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 600),
              content: AppText('Error when adding Unit.')));
        },
        (r) {
          getUnits(showLoading: false);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          backgroundColor: Colors.white,
          duration: const Duration(milliseconds: 900),
          content: AppText('${unit.name} already exists.')));
    }
    emit(state.copyWith(listOfUnits: listOfUnit));
  }

/*  addRemove(Unit unit) {
    List<Unit> listOfUnit = List.from(state.listOfSelectedUnits);
    if (listOfUnit.contains(unit)) {
      listOfUnit.remove(unit);
    } else {
      listOfUnit.add(unit);
    }
    emit(state.copyWith(listOfSelectedUnits: listOfUnit));
  }*/

  deleteUnit(BuildContext context, int unitId) async {
    final response = await repository.deleteUnits(unitId);
    log('Unit added $response');
    response.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            elevation: 10,
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 600),
            content: AppText('Error when deleting Unit.')));
      },
      (r) {
        getUnits(showLoading: false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            elevation: 10,
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 600),
            content: AppText('Unit deleted successfully.')));
      },
    );
  }
}
