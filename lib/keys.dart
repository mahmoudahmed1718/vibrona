import 'package:flutter_dotenv/flutter_dotenv.dart';

class Keys {
  static final String supabaseUrl = dotenv.env['SUPABASE_URL']!;
  static final String supabaseApiKey = dotenv.env['SUPABASE_ANON_KEY']!;
}
