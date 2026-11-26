Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712012;
	b=Uox9O70ikZAQ6aJ6BA9CFiitRJokI7+N8GlPUcVB7pKuLERPK5AGUyAd8LukzszxPRXe
	 Kakjdd6Sq3AqYKTqvbxK/aeLNSURqEIat6w1GO3RxN4YnEg9oi9MmnAGBtcRq331H0G64
	 FKrz9D0mppeXj8RsLy/jSq9ZqEOmQe7wH91QoiseGaRn1WXpsD4ZZKkCWG/mrPOdnnbKO
	 RfoFEEDdKQHpl5qFSGfdgUO7QIORPCTlWq3ZS+M0a0aaFKUmFF0+04h1nkeFqhkb3uTcD
	 mYx/A4WS2Heg98J2w/HGxBwWwxYMTn/RWBCMzG743bwT4gWtu/pLSNLD7zWFbdHuoRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712012;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YYeo7BmF8pBBKhpoVelsSbR8AsEMtm6Bi1fepPpoRO8=;
	b=km+lkGFHHM3t0a/7lUTXfqU/1ZnllKi07bTzOVQTMGvhQ2F0FqOL8WDExw0zGDpY3nB+
	 DGrMqi7PYGPa9XPPe9uq19Xm+AXeZPgn8ivW1v62D6V+Wwk1nfl1VcEOMe9v6Cfvfwo/j
	 brCMCgOFWZ6W5VljZIOYPg7eZh5odWdLzyuUk5n3k8FmuF2AZFxlIZaF1Dm+ln90vBGeN
	 hVI5UF35AVA2oeGV1tWK0slOFXJIbT7ooUSfT5xtogxs+NjH6Utr+2lrVgJtrySpbKWej
	 dNnIj5pbzIaSiQeeJ9swg53T2I48suexvYZmu4w4iBHPuAP2GF3EJJE3QRJiRtR14HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWtGxFsT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E56D606A326;
	Thu, 26 Nov 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWtGxFsT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712012;
	b=YauSiYwzE15/E9wOmJQO+ntMgltA3lCdomeNEVsypI8JBx6yZtEvLDnWExJ2EGvSLcT3
	 aPUIZefD0QF3DoAOBDEp3A/JJGnIbN/wltw7ZLAW0rWHrHRjFXZkHwN+NjwFWwnaOvzTn
	 QxUImCqwIXsY5eoGy8rfSt4dyPmZxaQ0HPEae3bArCZpXadAEiklEhLuFGwNH+jCFYxPa
	 4paZQn5FbK4a9Au/+Iz5msQbHmzxM6PvpP/Z1Sei7w8vnpIGpUH0FNAHONfxskPypM2yC
	 jZINuTSRY6J1oYDZ3r0BMp8K1tNBWZwNTFZsw7E6oSFnIl1DKfyncrRK0p3S1Fus2uA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712012;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YYeo7BmF8pBBKhpoVelsSbR8AsEMtm6Bi1fepPpoRO8=;
	b=Bx0N+9M6bQEuEg+xiPx/jyuW2mbpyy8skR+p80C0ph6ekwtjdCaG8inIf0ESkjTXyH4m
	 cckLoymExfN5yTS4Yv7RyR9IOV70kLs07CDYZoS9oH3IeWxaZYSHb+EQkeOw646lkfq2n
	 tuAyG7HZDGNZ40Ohi/ddEpIJO/i2FkbXb6NciKhPyuvaEpfgy/7J9JCn82F+/yz64Q3+w
	 55CuvvKYdaaQyI02GH3tgByVQfqFFDY87MxkYz9mJ4DQGz5IL/QLFAE0JcK+UJL5M8XI+
	 sDI1AqmEUvg/y4029i8FcJLtpK0J6FH7itbqzetKr71c7iu/EXNfgxaTV5fpPuHZC8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 274C21F000D4;
	Thu, 26 Nov 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712012;
	bh=YYeo7BmF8pBBKhpoVelsSbR8AsEMtm6Bi1fepPpoRO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SWtGxFsTbiOu6s/lYh3Rmi5iiLXqvX0li9U1Knxq8Ger/D58chDxYetvBlcrL0xQC
	 2PP/zoOYhdwHTgCMqhO9R5Pr89egq40tAe7Q1c3XZIiuSsNg9hKz5v1QLbqQxovnDS
	 +/7RMfGzEE0GHgnqp/R9hMQ7htTUVhOOimE6zt6CMXBB+JesO+tL9kHhxkmlj6Ttuz
	 sHO1KKVo8Qn+vWOVKgM0SdT873cJc4igGP0XSPj2F/eiLaawKpxb8cZIS98McNwVkb
	 De02jX8YhS4XTb7irweuY16cs/10s5OxwdCzitecZrCOlteOCNug7RcPWSWmP7h6zq
	 fzZk9dbX013Yw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AB1E84D73B;
	Thu, 26 Nov 2026 16:53:19 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:53:15 +0100
Subject: [PATCH 1/3] drm/panic: Check QR alignment centers one axis at a
 time
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
Message-Id: <20261126-perf-drm-panic-qr-v1-1-51856937dc4d@gmail.com>
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795711998; l=1856;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=s2q8rdTFeCLN5bHoYDEz1EAk1bfn2gf/0qI/0v1epNE=;
 b=ZfZ7KBdVFd7SeRGeNdUGHSQKNc2jubIGoqCU/aVY3tNkQJpKdCNopEjtU6bmADCEHL6TVamaZ
 4ielgeyFJfxBPfkTgdA2+BeQYzZMT3X3IAypVkonb7abK1vIyyXfo6a
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

is_alignment() scans pairs of alignment centers each time it tests
whether a module is reserved. At version 40 there are seven centers
per axis, so a lookup can visit 49 pairs.

Each center covers a five-module span, and adjacent centers are at
least 12 modules apart. Find the unique matching center on each axis
and apply the existing finder-pattern exclusion to that pair. The
lookup now needs at most 14 center tests.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
 drivers/gpu/drm/drm_panic_helper_qr.rs | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
index 4941731fb60fa..c6ed395c05bd2 100644
--- a/drivers/gpu/drm/drm_panic_helper_qr.rs
+++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
@@ -746,17 +746,14 @@ fn draw_alignments(&mut self) {
 
     fn is_alignment(&self, x: u8, y: u8) -> bool {
         let positions = self.version.alignment_pattern();
-        for &ax in positions.iter() {
-            for &ay in positions.iter() {
-                if self.is_finder(ax, ay) {
-                    continue;
-                }
-                if x >= ax - 2 && x <= ax + 2 && y >= ay - 2 && y <= ay + 2 {
-                    return true;
-                }
-            }
-        }
-        false
+        // Centers are at least 12 modules apart, so their five-module spans are disjoint.
+        let Some(&ax) = positions.iter().find(|&&center| x.abs_diff(center) <= 2) else {
+            return false;
+        };
+        let Some(&ay) = positions.iter().find(|&&center| y.abs_diff(center) <= 2) else {
+            return false;
+        };
+        !self.is_finder(ax, ay)
     }
 
     // Timing pattern: 2 dotted line between the finder patterns.

-- 
2.56.1


