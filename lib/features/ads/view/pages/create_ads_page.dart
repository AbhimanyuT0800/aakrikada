import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/edit_my_address_page.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CreateAdPage extends StatelessWidget {
  const CreateAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    // language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.createAd,
          style: TextStyle(color: Colorpallets.primary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colorpallets.primary),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFFDFFFEF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Icon(Icons.camera_alt_outlined, size: 30),
              ),
            ),
            SizedBox(height: 12),
            Text(lang.selectCategory),
            SizedBox(height: 4),
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(value: 'iron', child: Text(lang.iron)),
                DropdownMenuItem(
                  value: 'newsPaper',
                  child: Text(lang.newsPaper),
                ),
                DropdownMenuItem(
                  value: 'electronic',
                  child: Text(lang.electrolic),
                ),
                DropdownMenuItem(value: 'plastic', child: Text(lang.plastic)),
                DropdownMenuItem(value: 'others', child: Text(lang.others)),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Summary
            Text(lang.summary),
            SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                hintText: lang.briefSummary,
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),

            // nbr of Items
            Text(lang.approxNbr),
            SizedBox(height: 4),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Priority
            Text(lang.priority),
            SizedBox(height: 4),
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(value: 'high', child: Text(lang.high)),
                DropdownMenuItem(value: 'medium', child: Text(lang.medium)),
                DropdownMenuItem(value: 'low', child: Text(lang.low)),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 24),

            // User Information
            Text(
              lang.userInfo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              tileColor: Colors.green[50],
              leading: CircleAvatar(
                backgroundColor: Colorpallets.greenColor,
                child: Icon(Icons.map, color: Colorpallets.whiteColor),
              ),
              title: Text(lang.chooseAdress),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // choose address config

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditMyAddressPage()),
                );
              },
            ),
            SizedBox(height: 8),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              tileColor: Colors.orange[50],
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.access_time, color: Colorpallets.whiteColor),
              ),
              title: Text(lang.preferrrdPickup),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // pick up time config
              },
            ),
            SizedBox(height: 24),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: Text(
                  lang.create,
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colorpallets.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
