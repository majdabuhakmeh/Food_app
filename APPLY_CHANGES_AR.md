# كيفية تطبيق التعديلات على المشروع
## How to Apply Changes to the Project

## التعديلات المطلوبة / Required Changes

تم إصلاح مشكلتين رئيسيتين في المشروع:
Two main issues have been fixed in the project:

### 1. إصلاح خطأ RenderFlex Overflow
**الملف:** `food_app/lib/widgets/app_column.dart`

**التغيير المطلوب:**
قم بتغليف عنصر `Column` بـ `SingleChildScrollView`

**قبل التعديل (Before):**
```dart
@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // ... children
    ],
  );
}
```

**بعد التعديل (After):**
```dart
@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ... children
      ],
    ),
  );
}
```

### 2. إصلاح خطأ SharedPreferences
**الملف:** `food_app/lib/helper/dependencies.dart`

**التغيير المطلوب:**
قم بتغيير طريقة تسجيل SharedPreferences من `lazyPut` إلى `put`

**قبل التعديل (Before):**
```dart
Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  // ...
}
```

**بعد التعديل (After):**
```dart
Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);
  // ...
}
```

---

## طريقة التطبيق / How to Apply

### الطريقة الأولى: نسخ التعديلات يدوياً (Manual Copy)

1. **افتح الملف الأول:**
   ```
   food_app/lib/widgets/app_column.dart
   ```

2. **في السطر 15، غير:**
   ```dart
   return Column(
   ```
   **إلى:**
   ```dart
   return SingleChildScrollView(
     child: Column(
   ```

3. **قبل نهاية الدالة `build`، أغلق `SingleChildScrollView`:**
   - أضف `)` بعد إغلاق `Column`

4. **افتح الملف الثاني:**
   ```
   food_app/lib/helper/dependencies.dart
   ```

5. **في السطر 21، غير:**
   ```dart
   Get.lazyPut(()=>sharedPreferences);
   ```
   **إلى:**
   ```dart
   Get.put(sharedPreferences);
   ```

### الطريقة الثانية: استخدام Git (Using Git)

إذا كنت تستخدم Git، يمكنك دمج التعديلات من هذا الفرع:

```bash
# 1. تأكد أنك في مجلد المشروع
cd food_app

# 2. احفظ تعديلاتك الحالية (إن وجدت)
git stash

# 3. احصل على آخر التحديثات
git fetch origin

# 4. ادمج التعديلات من الفرع
git merge origin/copilot/fix-runtime-errors

# 5. استرجع تعديلاتك (إن كانت محفوظة)
git stash pop
```

---

## التحقق من التطبيق / Verification

بعد تطبيق التعديلات:

1. **نظف المشروع:**
   ```bash
   flutter clean
   ```

2. **احصل على الحزم:**
   ```bash
   flutter pub get
   ```

3. **شغل التطبيق:**
   ```bash
   flutter run
   ```

4. **تحقق من:**
   - ✅ عدم ظهور خطأ RenderFlex overflow
   - ✅ عدم ظهور رسالة "SharedPreferences not found"

---

## النتائج المتوقعة / Expected Results

### قبل التعديلات (Before):
- ❌ خطأ RenderFlex overflowed by 2.7 pixels
- ❌ SharedPreferences not found errors

### بعد التعديلات (After):
- ✅ لا توجد أخطاء overflow
- ✅ SharedPreferences يعمل بشكل صحيح
- ✅ التطبيق يعمل بدون مشاكل

---

## المساعدة / Help

إذا واجهت أي مشاكل:
1. تأكد من أن لديك آخر إصدار من Flutter
2. نفذ `flutter doctor` للتحقق من البيئة
3. تأكد من تطبيق التعديلات في الملفات الصحيحة

---

**رقم الكوميت / Commit Hash:** `4571747`
**الفرع / Branch:** `copilot/fix-runtime-errors`
