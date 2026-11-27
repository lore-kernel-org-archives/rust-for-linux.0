Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795802529;
	b=wiowBdOYd/Fa1VHFNK/uYWsCPNzD9ouZjnk5OZU98X2yTxUu7MzH42W0I9ZAVNXc8qbQ
	 RMa6w5AiScjpGRq7aEOjafVgr9dHOGuXZCih7KWPAmsf7oXQ4q98ewqYmJ9kHMkC9uOXL
	 YimN8SKfJK6cpBKI4QNuqSAH1n7mVUVHU8XcNu3Me+IWkEu5bZFt34qjPmg1C0FpEnWRI
	 /LzZnohU7LG/ndsl6mUCxXc7c4y3wOIEfkzNpQHTPk+OtKd4blx1NBDX0JKbt6Qy31Rfi
	 9V/HQfT8q81CMdCNSjOO7g+xtugc+wtGx75548Rhewizh5CztAkaWsq6Y0c/mGTsF+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802529;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=X9yNAdzryjQKZhPZtoVlIkMprxCbQ4QtZxwb0ASsv/Q=;
	b=E5vHAXaZbLPnbRp95InAuYYuEqU5K3cYF7vltdpcM2xTTy+fx+EO8tdiO6cjqsGrOhqw
	 Vuv5pZnU12d1FO506ocqrvLxQ5JNYVh1yslPZ8kjhEfiob4OYni2ZPEnIadhxmLZEWf5s
	 ZxBDBHjAdhkejoJnPHSmjrahrTuzuOhRNgw/B0zAsYDpBtrE3wggCV4CHwUNixjAwpXse
	 xcNie9qN0VLMlT5CsSI5Z6EeLfcyD9VaB9y977rCWWGuUujEwrjyiR3dbxcXzdPUH3fDJ
	 1+wWDuTCPoOW9PchBGOG371hWLNlZPOzZhL84F70jXcIOfcw7XlkJ2REORIn7px+b8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=efZ3tR0E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F85D606A31C;
	Fri, 27 Nov 2026 18:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F85D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=efZ3tR0E
ARC-Seal: i=1; a=rsa-sha256; t=1795802509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DvIUp2PfjhQSJwYEKqs2qf4Lyjm/tI0OJK3Ck9x/Kk86AHUMIrI0vW5j3iU4HGSAcjs4iIouMT5AyonvpAfpXcng166tfKMmldEW8g2FGZvRgLDGkSUYaVYsbembZ1KrdS1yU8VuZe5aDAaoRD7qOeuAxvmkTDOWaABkNMlbnfU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795802509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X9yNAdzryjQKZhPZtoVlIkMprxCbQ4QtZxwb0ASsv/Q=; 
	b=VosvB8uJ0TdcxCWVlnPPLti3/x7pftFVNIaTcL4NAJkAr+WxBAaQACZz92E+F/yDpYTBXsgp1ZAvY1H0u8AhceDuX4Yq7qJWW1Ii1VGD0l52d3g7To99gGJedeoHrqYkAzkBOPIDQ1WKcsH/6z/kewkj2x0uiL4yBE7MjWqAQwg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=efZ3tR0EuGaeB5FMn2lIXygaOD4Fy+f8alKj4fyBzmiowMpOBkoBFMIQ+4jHfhYcWJ4PXNY0wJn9FvePGrsfzB3w9rwHZH2QtOE667hV9MhLg73/GmmxuHJ8meO3CZtWym9H59OUJVQBTdWBl2eXrIOSTFHD/lp2XPIbM4qpRHw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=X9yNAdzryjQKZhPZtoVlIkMprxCbQ4QtZxwb0ASsv/Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795802508180997.6136186105167;
	Fri, 27 Nov 2026 10:01:48 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 15:01:38 -0300
Subject: [PATCH RESEND 2/3] drm/tyr: reject firmware sections that overlap
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-tyr-fw-parser-v1-2-8aab2a711f9b@collabora.com>
References: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
In-Reply-To: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
To: dakr@kernel.org, simona@ffwll.ch, airlied@gmail.com, 
 aliceryhl@google.com
Cc: Sami Tolvanen <samitolvanen@google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Firmware::new() maps each loadable section at the VA range given in its
section header. When two ranges overlap, GPUVM unmaps or splits the part
of the earlier mapping that the later one covers. The MCU then sees the
later section's pages there, and nothing reports the overlap.

Reject an image whose loadable sections overlap in FwParser::parse(),
and add a test for it.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/fw/parser.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/tyr/fw/parser.rs b/drivers/gpu/drm/tyr/fw/parser.rs
index de5881f1bf47..133b63c5cff1 100644
--- a/drivers/gpu/drm/tyr/fw/parser.rs
+++ b/drivers/gpu/drm/tyr/fw/parser.rs
@@ -188,6 +188,18 @@ pub(super) fn parse(&mut self) -> Result<KVec<ParsedSection>> {
             let entry_section = self.parse_entry(header_end)?;
 
             if let Some(inner) = entry_section.inner {
+                if parsed_sections.iter().any(|other: &ParsedSection| {
+                    inner.va.start < other.va.end && other.va.start < inner.va.end
+                }) {
+                    dev_err!(
+                        self.cursor.dev,
+                        "Firmware virtual address range {:#x}..{:#x} overlaps another section",
+                        inner.va.start,
+                        inner.va.end
+                    );
+                    return Err(EINVAL);
+                }
+
                 parsed_sections.push(inner, GFP_KERNEL)?;
             }
         }
@@ -883,4 +895,29 @@ fn shared_region_not_shared() {
         image.entries[1].flags = SectionFlags::READ_MASK;
         assert_eq!(image.parse().err(), Some(EINVAL));
     }
+
+    /// Loadable sections with overlapping VA ranges are rejected.
+    #[test]
+    fn overlapping_sections() {
+        let mut image = Image::new();
+        // The second section is the page at `second`.
+        let second = image.entries[1].va.start;
+
+        // The first section ends where the second one starts.
+        image.entries[0].va = second - 0x1000..second;
+        assert!(image.parse().is_ok());
+
+        // The first section starts where the second one ends.
+        image.entries[0].va = second + 0x1000..second + 0x2000;
+        assert!(image.parse().is_ok());
+
+        // The first section covers the page below the second one and the second one.
+        image.entries[0].va = second - 0x1000..second + 0x1000;
+        assert_eq!(image.parse().err(), Some(EINVAL));
+
+        // The second section covers three pages, and the first one is the page in the middle.
+        image.entries[0].va = second + 0x1000..second + 0x2000;
+        image.entries[1].va = second..second + 0x3000;
+        assert_eq!(image.parse().err(), Some(EINVAL));
+    }
 }

-- 
2.56.0

