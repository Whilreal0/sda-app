const puppeteer = require('puppeteer');
const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 3000;

app.use(cors());

app.get('/latest-video', async (req, res) => {
  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  try {
    const page = await browser.newPage();

    // Go to the Facebook videos tab (public page)
    await page.goto('https://www.facebook.com/C5SDAC/videos', {
      waitUntil: 'networkidle2',
    });

    // Scroll down a bit to trigger lazy loading
    await page.evaluate(() => window.scrollBy(0, 1000));
    await new Promise(resolve => setTimeout(resolve, 3000));

    // Look for anchor links to actual video pages
    const videoUrl = await page.evaluate(() => {
      const anchors = Array.from(document.querySelectorAll('a'));
      const videoLinks = anchors
        .map(a => a.href)
        .filter(href => href.includes('/videos/') && !href.includes('live') && !href.includes('/watch/'));

      return videoLinks.length > 0 ? videoLinks[0] : null;
    });

    await browser.close();

    if (videoUrl) {
      res.json({ latest_video: videoUrl });
    } else {
      res.status(404).json({ error: 'No video found' });
    }

  } catch (error) {
    await browser.close();
    res.status(500).json({ error: error.toString() });
  }
});

app.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}/latest-video`);
});
