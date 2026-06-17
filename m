Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB144E049
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709192; cv=none; b=VVactGfAI/RdzvhPc1X02OLXfWQdrw240uEpJCPB8AhxdiU2RW6o2GoFou+NAbqb4BQK49li3uP7MMZflZ8tTHjpUwi2K+zTN8cqJE+bKeElE+OWdI0XQXHuZH/+dOdLrX2SBcI5VvA4vQi0z3uqNYkcTnlDTEPAMVR9qX6j51g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709192; c=relaxed/simple;
	bh=h+j7+BAVrfb8K95BjfJYIW5/J1vZ5+CDJ5CgAb0oArE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=przUyxYBEEM3/IoAj8EM3M/FNoUDCbS+yoIVmC8lbS9wYIyWaI6XcxX4gO60AouiTED7qWgO424IDydmPwUGdDtGqQRMcoqSmIWKyyY7+rhYUMoOCImPFHGO6k8CB9J7BomOeyGfaujsAcJ2b1jTjV+cDNApDCXAJrMOEP2bQCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ZgK1iPi0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ZgK1iPi0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4908b92904fso73157515e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781709187; x=1782313987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOSqDcY55hE/WxXDX9xT6Nc6iiv8+voXa20btNiTsJk=;
        b=ZgK1iPi0gFLDQo5kBeN7qwy1Rw1n0ECrQ5/Q2Iq/Kdv8INK4GYs3+3NT5DAu9wbuT+
         PyovOog98de7iOmaCIhgofbQhHPssYvVdy796Ti/DqNAQICzEL5omTDPhKSKBfxqzr0o
         v5BqekXQFVNga1hJ1qThaji6PBVIYXvUZN7exyqw712uUbIf8oycBrYI5ldBANn+Bk1p
         Jh0Qs841futEnjKoer5/0lQNls9xLrg+Sc+3ytVryt+yRxcjH6AnuRneti6fEU60PVB2
         VyRHSo5yeXkvwj+d5hLlnXk1a4KGA0nfZKxssv2Rqa9wIjJbKipT6lu8bqIdYxnJogKZ
         0vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709187; x=1782313987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOSqDcY55hE/WxXDX9xT6Nc6iiv8+voXa20btNiTsJk=;
        b=mbGe4Gz3LzOubjK4OB4xwRKzBwna5Q5DMemkUew5gaHO/diahedNsNrbus8X6hsfVg
         POuWy3jTbF8D40f0qLpMZ8eqNkrSI3FNEp5SRmIyBSDI1J5TJBRp/wOdLy7BQVjZyXK+
         pvzLuVF4EuAna3MRIIq2B5Mo90/mXVTk1Xsqdbz3+UehcV0MJVH9FFwo9Y19ewII15kL
         KP8hmrnSrj72meL9Gx7lQ1RnGt3X7Cq6PigvncdHHdrVhCt1K4gCq6xcYGBKMSLtyc7n
         xRw1arV/owNSJpHeqIJSsWU/u2quIDCMlPsm5cEB9OwTifNDQRL1Tsu8GAPBIE4pAuOJ
         y2fg==
X-Forwarded-Encrypted: i=1; AFNElJ9JOUMbzY82t5UmOqHir3dAUtdMs9me8KrOOFhDDs1aiSAqGS6pDBbd1yjthnjS3D+h4g2akHi+NhiM16AHWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44W7iXZnDn7wwlsQz6QFS/4BJ0cCBbC0GDG2qaPKK6TMSMnoC
	DjNpHsWB1F/LZfrhN+pVCns5T0pXiQc6qpxFns33GsJnwcdUiAEpuhqugOube7Psbg==
X-Gm-Gg: Acq92OExsFav3d2CqpmMoPx33XvH8OPWp91QG8kbQkf4UV/0Gim33Ro3eFYzgzX8LAa
	n5B6wi7z7uA4HBbBXPO1L+4pvkxxWV3zWuw0YVDcCtKkNR007rDJi51ZHtLh/tKlne5gXhYnpw3
	FaF7ul50D0kJgoaU0h23FAEt2//RIoXoa9WXqYmG6c8MmzL9MyyD2IfqRAvqNM74yzpvvB8bs4q
	6n86VJpy0PzLaIRVHOs51koedVx5vMCs57akbgk5v6c/gtFmFCreG+go1iLCTtvRauOan4/Eo6i
	0+JVhfGfIUD6wJmQHOxUbkJW28rX7brVDKWi2ZkHRb7zWQHDxuKnqnCkm8g7/Mo5l7avxzHw5uf
	ZIb6bw37WkcHBiF9CN+f076eWcwlUcxLo8QUook0zLjyw5E6K8kfcaWGDu+4MJlFvqY78r7DACj
	CBtA32utyj5XxJZPjQ/PMqp5szDaNGulPN6O4R5Hn7XOyaB0TsnE4RRijQ
X-Received: by 2002:a05:600c:4503:b0:490:cdb2:fb5e with SMTP id 5b1f17b1804b1-4923412792amr61449095e9.22.1781709187340;
        Wed, 17 Jun 2026 08:13:07 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9a399sm151019305e9.14.2026.06.17.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:13:06 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/7] drm/vino: add KUnit self-tests for the protocol and crypto paths
Date: Wed, 17 Jun 2026 16:12:44 +0100
Message-ID: <20260617151249.2937-8-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617151249.2937-1-mike@fireburn.co.uk>
References: <20260617151249.2937-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add offline KUnit self-tests for the pure protocol builders/parsers and
the crypto bindings the control plane relies on. The crypto cases are
published known-answer vectors (FIPS-197 AES-128, RFC 4493 AES-CMAC) and
a live seal round-trip; the rest pin wire layout, EDID timing extraction,
the WHT codec stages and the DDC/CI Set-VCP encoding that have no hardware
oracle. Gated behind CONFIG_KUNIT, so they have zero effect on a
production build; run with a KUnit-enabled kernel.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 drivers/gpu/drm/vino/vino.rs | 299 +++++++++++++++++++++++++++++++++++
 1 file changed, 299 insertions(+)

diff --git a/drivers/gpu/drm/vino/vino.rs b/drivers/gpu/drm/vino/vino.rs
index ee63ce7e4625..2d22c3f822cd 100644
--- a/drivers/gpu/drm/vino/vino.rs
+++ b/drivers/gpu/drm/vino/vino.rs
@@ -1752,3 +1752,302 @@ fn disconnect<'bound>(intf: &'bound usb::Interface<Core<'_>>, _data: Pin<&Self>)
     description: "DisplayLink DL3 (Vino) open driver",
     license: "GPL v2",
 }
+
+/// Build a minimal valid 128-byte EDID with a 1920x1080@60 detailed timing at base-block
+/// offset `dtd_at` (54 = preferred slot), a correct checksum, and the standard magic.
+#[cfg(CONFIG_KUNIT = "y")]
+fn mk_test_edid(dtd_at: usize) -> [u8; 128] {
+    let mut e = [0u8; 128];
+    e[..8].copy_from_slice(&[0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00]);
+    // 1920x1080@60: pclk 14850 (148.5 MHz, 10 kHz units); hblank 280, vblank 45;
+    // hsync_front 88, hsync_width 44, vsync_front 4, vsync_width 5.
+    let dtd: [u8; 18] = [
+        0x02, 0x3a, // pixel clock 0x3a02 LE
+        0x80, 0x18, 0x71, // hactive 1920 / hblank 280 (high nibbles in byte 4)
+        0x38, 0x2d, 0x40, // vactive 1080 / vblank 45 (high nibbles in byte 7)
+        0x58, 0x2c, 0x45, 0x00, // hsync/vsync front+width
+        0, 0, 0, 0, 0, 0, // trailing flags (DTD is 18 bytes total)
+    ];
+    e[dtd_at..dtd_at + 18].copy_from_slice(&dtd);
+    let s = e[..127].iter().fold(0u8, |a, &b| a.wrapping_add(b));
+    e[127] = 0u8.wrapping_sub(s); // base-block checksum: all 128 bytes sum to 0
+    e
+}
+
+/// Offline self-tests for the pure protocol builders/parsers and the crypto bindings the
+/// control plane relies on. Gated behind `CONFIG_KUNIT` (the macro adds the cfg), so they
+/// have zero effect on a production build; run with a KUnit-enabled kernel. The crypto cases
+/// are published known-answer vectors (FIPS-197 AES-128, RFC 4493 AES-CMAC); the seal case is
+/// a live round-trip; the rest pin wire layout and EDID parsing that have no hardware oracle.
+#[kunit_tests(vino_protocol)]
+mod tests {
+    use super::*;
+    use kernel::error::code::EINVAL;
+
+    #[test]
+    fn aes128_ecb_fips197_kat() -> Result {
+        // FIPS-197 / NIST SP800-38A F.1.1 AES-128 ECB known-answer vector.
+        let key = [
+            0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf,
+            0x4f, 0x3c,
+        ];
+        let pt = [
+            0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93,
+            0x17, 0x2a,
+        ];
+        assert_eq!(
+            crypto::aes128_ecb(&key, &pt)?,
+            [
+                0x3a, 0xd7, 0x7b, 0xb4, 0x0d, 0x7a, 0x36, 0x60, 0xa8, 0x9e, 0xca, 0xf3, 0x24, 0x66,
+                0xef, 0x97,
+            ]
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn aes_cmac_rfc4493_kat() -> Result {
+        // RFC 4493 sec 4 AES-CMAC test vectors (same key as above).
+        let key = [
+            0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf,
+            0x4f, 0x3c,
+        ];
+        assert_eq!(
+            crypto::aes_cmac(&key, &[])?,
+            [
+                0xbb, 0x1d, 0x69, 0x29, 0xe9, 0x59, 0x37, 0x28, 0x7f, 0xa3, 0x7d, 0x12, 0x9b, 0x75,
+                0x67, 0x46,
+            ]
+        );
+        let msg = [
+            0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93,
+            0x17, 0x2a,
+        ];
+        assert_eq!(
+            crypto::aes_cmac(&key, &msg)?,
+            [
+                0x07, 0x0a, 0x16, 0xb4, 0x6b, 0x4d, 0x41, 0x44, 0xf7, 0x9b, 0xdd, 0x9d, 0xd0, 0x4a,
+                0x28, 0x7c,
+            ]
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn seal_livemac_roundtrip() -> Result {
+        // A sealed CP frame must decrypt back to its content under the IN riv, and its
+        // appended tag must equal a fresh Dl3Cmac over the ciphertext (encrypt-then-MAC).
+        let ks = [
+            0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
+            0xee, 0xff,
+        ];
+        let riv = [0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17];
+        let content = [0xa5u8; 32];
+        let mut hdr = [0u8; 16];
+        hdr[12..16].copy_from_slice(&4u32.to_le_bytes()); // wire_seq = 4
+        let frame = cp::seal_livemac(&ks, &riv, &hdr, &content)?;
+        assert_eq!(frame.len(), 16 + 32 + 16);
+        let ct = &frame[16..16 + 32];
+        assert_eq!(&cp::open_in(&ks, &cp::in_riv(&riv), 4, ct)?[..], &content[..]);
+        assert_eq!(&frame[16 + 32..], &cp::dl3cmac_tag(&ks, &riv, 4, ct)?[..]);
+        Ok(())
+    }
+
+    #[test]
+    fn aux_for_id_constants() {
+        // The CP header `aux` field is a per-inner-id constant, not body_len/4.
+        assert_eq!(cp::aux_for_id(0x14, 48), 0x0a);
+        assert_eq!(cp::aux_for_id(0x15, 32), 0x09);
+        assert_eq!(cp::aux_for_id(0x48, 96), 0x06);
+        assert_eq!(cp::aux_for_id(0x99, 40), 10); // unknown id falls back to body_len/4
+    }
+
+    #[test]
+    fn edid_timing_parse_and_validate() {
+        // A well-formed EDID yields the DTD timing; a bad checksum is rejected; a leading
+        // monitor descriptor (pclk 0) does not hide the preferred timing in a later slot.
+        let edid = mk_test_edid(54);
+        let t = cp::timing_from_edid(&edid).expect("valid EDID parses");
+        assert_eq!(t.hactive, 1920);
+        assert_eq!(t.vactive, 1080);
+        assert_eq!(t.refresh_hz, 60);
+        assert_eq!(t.pixel_clock_10khz, 14850);
+
+        let mut bad = edid;
+        bad[127] ^= 0xff;
+        assert!(cp::timing_from_edid(&bad).is_none(), "bad checksum rejected");
+
+        let scanned = mk_test_edid(72); // off54 left as a zero (monitor) descriptor
+        assert_eq!(
+            cp::timing_from_edid(&scanned).expect("scans past off54").hactive,
+            1920
+        );
+    }
+
+    #[test]
+    fn edid_reply_guards() -> Result {
+        // The pre-decrypt guards reject non-EDID frames without touching the cipher.
+        let ks = [0u8; 16];
+        let riv = [0u8; 8];
+        assert!(cp::parse_edid_from_reply(&ks, &riv, &[0u8; 10])?.is_none());
+        let mut wrong_sub = [0u8; 20];
+        wrong_sub[8] = 0x44; // wire sub != 0x45
+        assert!(cp::parse_edid_from_reply(&ks, &riv, &wrong_sub)?.is_none());
+        Ok(())
+    }
+
+    #[test]
+    fn rgb565_packing() {
+        assert_eq!(video::rgb565(0xff, 0x00, 0x00), 0xf800);
+        assert_eq!(video::rgb565(0x00, 0xff, 0x00), 0x07e0);
+        assert_eq!(video::rgb565(0x00, 0x00, 0xff), 0x001f);
+        let _ = EINVAL; // silence unused import on configs without the assert paths
+    }
+
+    #[test]
+    fn cursor_messages_structure() -> Result {
+        // Create: id=0x1b sub=0x42, `00 02 00` marker + w,h at off20.
+        let c = cp::cursor_create(7, 64, 64)?;
+        assert_eq!(c.len(), 27);
+        assert_eq!(&c[0..6], &[0x1b, 0x00, 0x42, 0x00, 0x07, 0x00]); // id, sub, counter (LE)
+        assert_eq!(&c[20..23], &[0x00, 0x02, 0x00]); // marker
+        assert_eq!(u16::from_le_bytes([c[23], c[24]]), 64); // width
+        assert_eq!(u16::from_le_bytes([c[25], c[26]]), 64); // height
+
+        // Move: id=0x1a sub=0x43, head@22, flag@23, X@24, Y@26 (LE).
+        let m = cp::cursor_move(9, 1, 0x0140, 0x00f0)?;
+        assert_eq!(m.len(), 28);
+        assert_eq!(&m[0..4], &[0x1a, 0x00, 0x43, 0x00]); // id, sub
+        assert_eq!(m[22], 1); // head id
+        assert_eq!(u16::from_le_bytes([m[24], m[25]]), 0x0140); // X
+        assert_eq!(u16::from_le_bytes([m[26], m[27]]), 0x00f0); // Y
+
+        // Image: create-style 27-byte header + w*h*4 BGRA bitmap; wrong-size input rejected.
+        let bitmap = KVec::from_elem(0xabu8, 64 * 64 * 4, GFP_KERNEL)?;
+        let img = cp::cursor_image(3, 64, 64, &bitmap)?;
+        assert_eq!(img.len(), 27 + 64 * 64 * 4);
+        assert_eq!(&img[0..4], &[0x1c, 0x00, 0x41, 0x00]); // id, sub
+        assert_eq!(img[27], 0xab); // bitmap begins right after the 27-byte header
+        assert!(cp::cursor_image(3, 64, 64, &[0u8; 16]).is_err()); // wrong bitmap length
+        Ok(())
+    }
+
+    #[test]
+    fn timing_from_drm_mode_1080p60() {
+        // CEA 1920x1080@60: clock 148.5 MHz, h 2008/2052/2200, v 1084/1089/1125.
+        let mut m = bindings::drm_display_mode::default();
+        m.clock = 148_500; // kHz
+        m.hdisplay = 1920;
+        m.hsync_start = 2008;
+        m.hsync_end = 2052;
+        m.htotal = 2200;
+        m.vdisplay = 1080;
+        m.vsync_start = 1084;
+        m.vsync_end = 1089;
+        m.vtotal = 1125;
+        // SAFETY: `m` is a fully-initialised local drm_display_mode.
+        let t = unsafe { cp::timing_from_drm_mode(&m) };
+        assert_eq!(t.hactive, 1920);
+        assert_eq!(t.hblank, 280); // htotal - hdisplay
+        assert_eq!(t.hsync_front, 88); // hsync_start - hdisplay
+        assert_eq!(t.hsync_width, 44); // hsync_end - hsync_start
+        assert_eq!(t.vactive, 1080);
+        assert_eq!(t.vblank, 45); // vtotal - vdisplay
+        assert_eq!(t.vsync_front, 4);
+        assert_eq!(t.vsync_width, 5);
+        assert_eq!(t.pixel_clock_10khz, 14_850); // clock(kHz) / 10
+        assert_eq!(t.refresh_hz, 60); // via drm_mode_vrefresh
+    }
+
+    #[test]
+    fn rotation_pixel_mapping() {
+        use bindings::{
+            DRM_MODE_REFLECT_X, DRM_MODE_ROTATE_0, DRM_MODE_ROTATE_180, DRM_MODE_ROTATE_270,
+            DRM_MODE_ROTATE_90,
+        };
+        // Source 2x3 (sw=2, sh=3). 0deg is identity; 180deg mirrors both axes.
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_0, 0, 0, 2, 3), (0, 0));
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_0, 1, 2, 2, 3), (1, 2));
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_180, 0, 0, 2, 3), (1, 2));
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_180, 1, 2, 2, 3), (0, 0));
+        // 90deg: output dims are (sh,sw)=(3,2); (dx,dy) -> (dy, sh-1-dx).
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_90, 0, 0, 2, 3), (0, 2));
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_90, 2, 1, 2, 3), (1, 0));
+        // 270deg: (dx,dy) -> (sw-1-dy, dx).
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_270, 0, 0, 2, 3), (1, 0));
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_270, 2, 1, 2, 3), (0, 2));
+        // Reflect-X composes on top of the rotation (here identity): sx -> sw-1-sx.
+        assert_eq!(drm_sink::rot_src(DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X, 0, 0, 2, 3), (1, 0));
+    }
+
+    #[test]
+    fn wht_colour_and_quantize() {
+        use video::wht;
+        // Exact colour transform: white -> Y=16320, achromatic -> Cb=Cr=0.
+        assert_eq!(wht::colour(255, 255, 255), (16320, 0, 0));
+        assert_eq!(wht::colour(128, 128, 128), (128 * 64, 0, 0)); // gray: chroma zero
+        assert_eq!(wht::colour(255, 0, 0), (16 * 255, 64 * 255, 0)); // red: Cb>0, Cr=0
+        // The documented ground-truth vector: white Y_DC=16320 quantizes (DC, position 0) to 1020.
+        assert_eq!(wht::quantize(16320, 0), 1020);
+        // AC clamps to the 12-bit signed long-token range.
+        assert_eq!(wht::quantize(1_000_000, 16), 2047);
+        assert_eq!(wht::quantize(-1_000_000, 16), -2048);
+    }
+
+    #[test]
+    fn wht_transform_uniform() {
+        use video::wht;
+        // A uniform block: DC = the per-pixel value, every AC coefficient = 0 (VIDEO.md invariant).
+        let block = [16320i32; wht::BLOCK];
+        let c = wht::transform(&block);
+        assert_eq!(c[0], 16320); // DC = mean = the uniform value
+        assert!(c[1..].iter().all(|&x| x == 0)); // AC all zero
+        // End-to-end: white pixel -> Y plane -> WHT DC -> quantize -> 1020.
+        let (y, _, _) = wht::colour(255, 255, 255);
+        assert_eq!(wht::quantize(wht::transform(&[y; wht::BLOCK])[0], 0), 1020);
+    }
+
+    #[test]
+    fn wht_token_bitstream() -> Result {
+        use video::wht::TokenWriter;
+        // 16-bit zero pad, then short tokens 5 (00101) and 30 (11110), zero-padded to a byte:
+        // 0000000000000000 00101 11110 000000 = 0x00 0x00 0x2F 0x80.
+        let mut w = TokenWriter::new()?;
+        w.token(5)?;
+        w.token(30)?;
+        assert_eq!(&w.finish()?[..], &[0x00, 0x00, 0x2f, 0x80]);
+        // A value > 30 escapes to a 17-bit long token: 16 pad + 17 + byte-pad = 5 bytes.
+        let mut w = TokenWriter::new()?;
+        w.token(100)?;
+        assert_eq!(w.finish()?.len(), 5);
+        Ok(())
+    }
+
+    #[test]
+    fn ddc_ci_set_vcp_checksum() {
+        // VESA DDC/CI 1.1 sec 4.4 worked example: Set brightness (VCP 0x10) to 50 (0x0032).
+        // Bytes after the 0x6e write address: 51 84 03 10 00 32, checksum = XOR incl. 0x6e.
+        let p = cp::ddc_ci_set_vcp(cp::VCP_BRIGHTNESS, 50);
+        assert_eq!(&p[..6], &[0x51, 0x84, 0x03, 0x10, 0x00, 0x32]);
+        let want = 0x6e ^ 0x51 ^ 0x84 ^ 0x03 ^ 0x10 ^ 0x00 ^ 0x32;
+        assert_eq!(p[6], want);
+        // The checksum makes the XOR of {dest, source, len, opcode, vcp, hi, lo, chk} zero.
+        assert_eq!(0x6eu8 ^ p.iter().fold(0u8, |a, &b| a ^ b), 0);
+        // Contrast (0x12) and the power VCP (0xd6 = off) carry their codes/values verbatim.
+        assert_eq!(cp::ddc_ci_set_vcp(cp::VCP_CONTRAST, 0x0140)[3..6], [0x12, 0x01, 0x40]);
+        assert_eq!(cp::ddc_ci_set_vcp(cp::VCP_POWER_MODE, cp::POWER_OFF)[3..6], [0xd6, 0x00, 0x04]);
+    }
+
+    #[test]
+    fn ddc_set_vcp_message_structure() -> Result {
+        // CP wrapper: id=0x15 sub=0x22, counter (LE) at off4, I2C slave 0x37 + len 7 at off20,
+        // the 7-byte DDC/CI Set-VCP payload at off22, padded to a 32-byte block.
+        let m = cp::ddc_set_vcp(0x11, cp::VCP_BRIGHTNESS, 75)?;
+        assert_eq!(m.len(), 32);
+        assert_eq!(&m[0..6], &[0x15, 0x00, 0x22, 0x00, 0x11, 0x00]); // id, sub, counter (LE)
+        assert_eq!(&m[20..22], &[0x37, 7]); // monitor DDC/CI I2C slave + payload length
+        assert_eq!(&m[22..29], &cp::ddc_ci_set_vcp(cp::VCP_BRIGHTNESS, 75)); // DDC/CI payload
+        assert_eq!(&m[29..32], &[0, 0, 0]); // block padding
+        Ok(())
+    }
+}
-- 
2.54.0

