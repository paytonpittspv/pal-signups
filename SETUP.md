# PAL Event Sign-Ups: setup with Supabase (about 10 minutes, free, no credit card)

## 1. Create the database
1. Go to https://supabase.com, click **Start your project**, and sign in with GitHub or email.
2. Click **New project**. Name it `pal-signups`, make up a database password (save it anywhere, you won't need it again), pick the region closest to Tampa (East US), and keep the **Free** plan. Click **Create new project** and wait about 2 minutes.
3. In the left menu open **SQL Editor** > **New query**. Open `setup.sql`, copy everything, paste it in, and click **Run**. You should see "Success".

## 2. Copy two values into config.js
1. In Supabase go to **Project Settings** (gear) > **API**.
2. Copy the **Project URL** and the **anon public** key (NOT the service_role key).
3. Open `config.js` in Notepad and paste them over `PASTE_PROJECT_URL` and `PASTE_ANON_KEY`. Keep the quote marks. Save.

## 3. Put it online (Netlify)
1. Go to https://app.netlify.com/drop
2. Drag the whole `pal-signups-web` folder onto the page.
3. You get a link like `https://something.netlify.app`. Optional: Site configuration > Change site name.

## 4. Load the schedule (one time)
Open your link. It says **No events yet**. Click **Load the Fall 2026 schedule**. That adds all 24 events and 86 current sign-ups.

## 5. Share in Teams
In the PAL Teams channel click **+** > **Website** and paste the link.

## Notes
- Anyone with the link can edit, and there are no logins. If the link leaks, change the Netlify site name to get a new link.
- Supabase's free plan pauses a project after 7 days with no activity. During the semester this won't happen. If it ever pauses, open your Supabase dashboard and click **Restore**; nothing is lost.
- To update the page later, drag the folder onto the same Netlify site's **Deploys** page again. Sign-ups stay, because they live in Supabase.

## Updating an existing site (new version)
Drag the whole folder onto your Netlify site's **Deploys** page again. Your sign-ups stay, and you don't need to run any SQL again.
The folder now also includes `favicon-32.png`, `favicon-192.png` and `apple-touch-icon.png` (the USF bull tab icon), so upload the whole folder, not just index.html.

## Hosting on GitHub Pages instead of Netlify
1. github.com > **New repository**. Name: `pal-signups`. Choose **Public** (free Pages needs public). Create it.
2. On the new repo page click **uploading an existing file**. Open the unzipped folder, select everything INSIDE it (not the folder itself), and drag it in. Click **Commit changes**.
3. **Settings > Pages**. Under Source choose **Deploy from a branch**, branch **main**, folder **/ (root)**, and Save. After about a minute the page shows your link: `https://YOUR-USERNAME.github.io/pal-signups/`
4. To update later: **Add file > Upload files**, drop the new files in, and commit. Same names replace the old ones.
You can delete `seed.js`, `setup.sql` and `SETUP.md` from the repo once the schedule is loaded. The page works without them.

## Flyers (one extra step)

Event flyer uploads need a storage bucket. In Supabase, open **SQL Editor > New query**, paste everything from `flyers.sql`, and click **Run**. You should see "Success". Until you do this, the Flyers tab works but uploads will say they need one more setup step.
