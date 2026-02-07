const fs = require('fs');
const path = require('path');

const indexPath = path.join(__dirname, 'index.html');
let content = fs.readFileSync(indexPath, 'utf8');

const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL;
const key = process.env.SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY;

if (url && key) {
    console.log('💉 Injecting Supabase environment variables...');
    content = content.replace(/__SUPABASE_URL__/g, url);
    content = content.replace(/__SUPABASE_ANON_KEY__/g, key);
    fs.writeFileSync(indexPath, content);
    console.log('✅ Injection complete.');
} else {
    console.warn('⚠️ SUPABASE_URL or SUPABASE_ANON_KEY not found in environment.');
}
