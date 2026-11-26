Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712008;
	b=zu5/zL/Kh/05MrImmVEztJWGIpH4VQ9PdGWXV5YBNFuJs+T+BFCuRK9R8FACJPMUB4NA
	 Xch5DcDFnLPgDsn7f15qNBKKe8b66+XquEueqTPT4HyC9AXtJStmMNWhT13BpmOmIsOmm
	 /X3nsDXGGPQdAuPFgO8fq/JfMx6nF+Cwkw8+qbiFlw83T4+wxsgHc72cLz/t+JIr7fVsX
	 w9z2IH5Q3NK6U1u8c+3Mvnbx3sudNLuJCK5C3MA11kYgNYfkY3uIT7vg9YkCvTh9OxOyo
	 BCo0CRxQXO7SYYslFtbyWkPGvV1jS24OyANgPGccv8KzBLqvjr7HpwwO+A2iyw0cMJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712008;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BBgxIMJgFFVx7grtsn3dXP+nSFBup6h3SytP0JP2Kwk=;
	b=PRh9kq0CbTMwzd0clzqSPPfK7vw/AsVFu1XMbMJZeo+zxwui+4axjLqCK3FWMEY2X/Gc
	 YSaBIZrI+Z3YT/O1JHuc23bCraHHEDn2laDXe1MUKJJIJMtqVshvp79+10tkll69Jj920
	 V9hqxXtDbjHQjlv7G8tormIuucBKFf+qVECMpxevmXxe55y97Kn5Pyw67YPRPA3JApodT
	 wRot2916L0lq/G4jDjKR2ykcwZr3+EPUkYp+/K5MzrPiFiMo+ety62vYnKUlf4fq+OcKC
	 p0KQMXNpRrB9LhcBeESmD2xwqUEk2xlUxOgs0mjN+KJxjZ6RlzPzHloIdxNz+jAZ6Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YI7nF4o8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382C606A321;
	Thu, 26 Nov 2026 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YI7nF4o8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712007;
	b=sfFl77HfmRxty6/o/XKQboOpyDz0PTlvQahf2DM2qRU2b9cULoQrbLkGaLDLwwtt8urj
	 m8ePfJ6z11/4IXgt9lexV9JskapQ7lUH7vbU806NFkBIpbFmvJVx5FJx0gbF8cEKSSEiU
	 yhH8nUgPd2agQNNtWTble6/DeGoce8Lc3UmtC+V/T22Ld2N3H+sIzi85rEXUaXzvYSilc
	 mHNIbuX2nOrWBemeKCpyXpOrmSixbZeMALWFeqp4SFDSxt1Cun9E/F0t2Ayak+251cSXf
	 qxXXafFkQYJL6lzZNyySKPt93t8Vtax1xhQz8ZiG67+zraO5uE/KkR20PdxRXpA9KuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712007;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BBgxIMJgFFVx7grtsn3dXP+nSFBup6h3SytP0JP2Kwk=;
	b=FccVhddULzNFTACVDIw13J5Z1IosbqXruuPVVagrqkTabUfSAldN3gOdPD41DiebPpZm
	 5ZCx3lHNqoCNXDhXHd3EhdepOLfHT1x46lYdtzp93godrPw+VAKo1N7eV5E6/ac4Z+S6/
	 o4jrOEwyn22n7qkAPppXMCi2hGrufrkWVa0TokFbwR+NO8mY31YkRkh4i9NA/Ysl2Um91
	 pDzQbe1dFwWpkRLZRH7+MXS1EiXusqeIJUuXT9uRwf8pv2vclr5nhhZormEGY1H8CP/Wg
	 NymuE+AIO3316mvHrkb39T0aCIpyCGFaXPuzfJzjT9MU+9USh7hyEnhgndCd1zQ93uw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43FAF1F000D8;
	Thu, 26 Nov 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712007;
	bh=BBgxIMJgFFVx7grtsn3dXP+nSFBup6h3SytP0JP2Kwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YI7nF4o8sE7iU2yrsrPoVtO4WSdgdL+KSBN3QAFZLfzPa9U5Fjji06T318uo+RxC8
	 +Rxlo9Ux5yKR9Jdc9FZ0HAZHoFsPiIPJSXhzmFvG3z9LgTSpyHaYr8NQKcmekOiPBS
	 yXV6SweiVH6S9MAVwZb+tbUXshkhnK3q6UN4IVmEsfFl8r5qKL0VaL7GV6a92NQ+cc
	 F1XmddglXwGz1ue9u5DL+IZU/i3EZemPTKND2Yvj780qBEqB2rSUJEsGa2sJgF06yu
	 zJrEFeHT8NbMy9wtRu/3NtJmSvAMMa437V+Sw4xw3SVoR7hJPmbvL3jUJa9YeYhMjr
	 +Tb3pXIB5W0Sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8C824D73C;
	Thu, 26 Nov 2026 16:53:19 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:53:16 +0100
Subject: [PATCH 2/3] drm/panic: Apply the QR mask while drawing data
 modules
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
Message-Id: <20261126-perf-drm-panic-qr-v1-2-51856937dc4d@gmail.com>
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795711998; l=3294;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=ZAbo9XJK8sS3xUaaH1sSP/WDCUTJVmN5DS5JCEvtWZk=;
 b=wCS7L6+UV4zWSP45BF52yYOERefTbJ+dfA57nTVQ50Okvuv4wZQY0GGvdRE2tJHV+CNi53p1r
 nrgmXwv9H3aDbXiSKoMijuZF6otTmNKNDMGw70J3hhWDXWKhIeiEvf4
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

After placing data and remainder modules, apply_mask() scans the whole
image to invert the unreserved modules covered by checkerboard mask 0.
Data placement already visits every unreserved module once.

Apply mask 0 while drawing each data module and each zero-valued
remainder module. This removes the separate image pass and its buffer
read-modify-write operations. The format information still advertises
mask 0.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
 drivers/gpu/drm/drm_panic_helper_qr.rs | 35 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
index c6ed395c05bd2..1d96ae855052a 100644
--- a/drivers/gpu/drm/drm_panic_helper_qr.rs
+++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
@@ -691,12 +691,6 @@ fn set(&mut self, x: u8, y: u8) {
         self.data[off] = v;
     }
 
-    /// Invert a module color.
-    fn xor(&mut self, x: u8, y: u8) {
-        let off = y as usize * self.stride as usize + x as usize / 8;
-        self.data[off] ^= 0x80 >> (x % 8);
-    }
-
     /// Draw a light square at (x, y) top left corner.
     fn draw_square(&mut self, x: u8, y: u8, size: u8) {
         for k in 0..size {
@@ -864,37 +858,31 @@ fn next_available(&self, x: u8, y: u8) -> (u8, u8) {
         (x, y)
     }
 
+    /// Draw an unreserved module with checkerboard mask 0.
+    fn draw_data_module(&mut self, x: u8, y: u8, bit: bool) {
+        let invert = (x ^ y) % 2 == 0;
+        if !(bit ^ invert) {
+            self.set(x, y);
+        }
+    }
+
     fn draw_data(&mut self, data: impl Iterator<Item = u8>) {
         let (mut x, mut y) = (self.width - 1, self.width - 1);
         for byte in data {
             for s in 0..8 {
-                if byte & (0x80 >> s) == 0 {
-                    self.set(x, y);
-                }
+                self.draw_data_module(x, y, byte & (0x80 >> s) != 0);
                 (x, y) = self.next_available(x, y);
             }
         }
-        // Set the remaining modules (0, 3 or 7 depending on version).
-        // because 0 correspond to a light module.
+        // The remaining modules encode zero before masking.
         while !self.is_last(x, y) {
             if !self.is_reserved(x, y) {
-                self.set(x, y);
+                self.draw_data_module(x, y, false);
             }
             (x, y) = self.next(x, y);
         }
     }
 
-    /// Apply checkerboard mask to all non-reserved modules.
-    fn apply_mask(&mut self) {
-        for x in 0..self.width {
-            for y in 0..self.width {
-                if (x ^ y) % 2 == 0 && !self.is_reserved(x, y) {
-                    self.xor(x, y);
-                }
-            }
-        }
-    }
-
     /// Draw the QR code with the provided data iterator.
     fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
         // First clear the table, as it may have already some data.
@@ -905,7 +893,6 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
         self.draw_version_info();
         self.draw_data(data);
         self.draw_maskinfo();
-        self.apply_mask();
     }
 }
 

-- 
2.56.1


