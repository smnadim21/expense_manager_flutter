import 'dart:ffi';

import 'package:floor/floor.dart';

import 'entity.dart';

@dao
abstract class LocalDao {
  //============Account====================
  @Query('SELECT * from ${Table.Account}')
  Future<List<Account>> getAllAccounts();

  @Query('DELETE from ${Table.Account}')
  Future<void> deleteAllAccounts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertAccount(Account account);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> update(Account account);

  @delete
  Future<void> deleteAccount(Account account);

/* //=================LVehicle===============
  @Query('SELECT * from ' + Table.LVehicle)
  Future<List<Vehicle>> getAllVehicles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertVehicle(Vehicle vehicle);

  @Query('DELETE from ' + Table.LVehicle)
  Future<void> deleteAllVehicles();

  //=================Trucks===============
  @Query('SELECT * from ' + Table.Trucks)
  Future<List<Trucks>> getAllTrucks();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTrucks(Trucks trucks);

  @Query('DELETE from ' + Table.Trucks)
  Future<void> deleteAllTrucks();

  //=================RunSheet===============
  @Query('SELECT * from ' + Table.RunSheet)
  Future<List<RunSheet>> getAllRunSheet();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertRunSheet(RunSheet runSheet);

  @Query('DELETE from ' + Table.RunSheet)
  Future<void> deleteAllRunsheets();

  //=================Orders===============
  @Query('SELECT * from ' + Table.Orders)
  Future<List<Orders>> getAllOrders();

  @Query('SELECT * from ' + Table.Orders + ' where rid = :rid')
  Future<List<Orders>> getOrdersById(int rid);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertOrders(Orders orders);

  @Query('DELETE from ' + Table.Orders)
  Future<void> deleteAllOrders();

  //=================OrderChecklist===============
  @Query('SELECT * from ' + Table.OrderChecklist)
  Future<List<OrderChecklist>> getAllOrderChecklist();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertOrderChecklist(OrderChecklist orderChecklist);

  @Query('DELETE from ' + Table.OrderChecklist)
  Future<void> deleteAllOrderCheckList();

  //=================DriverReport===============
  @Query('SELECT * from ' + Table.DriverReport)
  Future<List<DriverReport>> getAllDriverReport();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertDriverReport(DriverReport driverReport);

  @Query('DELETE from ' + Table.DriverReport)
  Future<void> deleteAllDriverReports();

  //=================ImageFiles===============
  @Query('SELECT * from ' + Table.ImageFiles)
  Future<List<ImageFiles>> getAllImages();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertImage(ImageFiles imageFiles);

  @delete
  Future<void> deleteImage(ImageFiles imageFiles);

  @Query('DELETE from ' + Table.ImageFiles)
  Future<void> deleteAllImageFiles();*/
}
