Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114EE1F460B
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Aug 2025 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323908; cv=none; b=DfGIyAN0Qsqoh252HzPTqknjzL+Yg5u1FoqUDF90FAON16Q8KsT5+WjaohKBnCUp6ev3fDQDQS1tWfCToa5lKr/jUSL/I2Xs94IvKXMkUU4IZ+W58UvZDHployqjA3XHz5PW6ik5HRO1vo6U97no5QAXeehGxK9NPnjtRyh2gDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323908; c=relaxed/simple;
	bh=DrbctBGMgceWHyU2G3iajKdl9FJ/GIp+Lv0AO0b4Ibw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe1YDztNLOmMdn26RgVAw4gJ5xEGMU5i0m7AdtuANrnK93EIqsmDI+QtO/5wd82hTfKElqHer+ZT5VBmFAeTr/sZW9L08AutHZuHWxDdo0ujKeHL0K4a3g+BSKmyeLQp6RKeIGV2zjFXp53RF6vN1YTScd34yEsiDVogkW5/XXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=Iiw/0hfx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="Iiw/0hfx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2e5c0d4fso2021168b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1755323906; x=1755928706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxd0WrYqOz4ItTjbQ6f59qSMdSo/i5unAWV7GJYBATY=;
        b=Iiw/0hfxV8o1WbHtTO25SWUFRu7XvuuNxAzV0YKkSLWsGYOzVdz1Wisnt65eKmphQW
         xGKXn92PraSM99YExq/aID/UL8D++jwFYM3WWpO2L7KmgrWRdG0/sIyMa88a37G40tKs
         wAg4UFL17Bz0KZCGy5fBblSKDnSlD+o4OnfEWNYuKilvR0ZtzL7L3DwFUSC48uCn7Yww
         vq2PfeMjTNtIeLkMzyXpRsWMtO1pDu0GMi6+zIluM270agGhmtscOPRmDoe8qM+oW1Fw
         ZFUP4ZlTZxyO/X/Lenpvj13A6XLI5AtJYD6Bnax+08xpZWkRpPnkGjNyW/cJBB+lYiYJ
         MOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755323906; x=1755928706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxd0WrYqOz4ItTjbQ6f59qSMdSo/i5unAWV7GJYBATY=;
        b=BnoZze31glGVB3Xf0/wteAeK+TWaVdKtZcawCjYGzthwVh1BZsK/qcpze/VWF2wgTe
         aXZ7RlVyBy0RQBGrsVJzRMpNWn9JQ3tLuakaKAWdiJV+39TvW8kVDsgSptC6N5OgphFK
         BQhx7sFJwVdPOe0sdHaXrI1fdmPVLbZMThLHoupWjI3zAubByzbZ5m/1EL5YT1q/c3uw
         mY32KQwbd4uFXUfSwagdtmcwGnunfnylIfk7AdtbuvP4pKwnCCh7A14z10+3oGfkX8QX
         90pMSnFCuJ49J5QyIIcr71k165BtWtnxR9U1xtbkJoaY083LkWYjVGfnAz+PjCGfoM0C
         KmmA==
X-Gm-Message-State: AOJu0YxYlOg2CDiAjDMrb8QO7wfv4Hp44lPY+IwMPg4aS7pUTcPK+Isg
	Si8jXiNv+38wKPO26f9+ffEs1jHm3qMOSrteUXwcoSlYJl397dQvTqEsjMNvSJRQ+Q==
X-Gm-Gg: ASbGncuPo6g9QrSMm+G6cMNLEWc3X56r+o1iSDUJoGjj7rc1ZLj78WOz1YYByT2uRJU
	+dQOjnQuQkhFOwOE1lju2HVhpvgV2bmmAYr1O1i9wvXOzO/zh7Kk9WNZXhkl6TNg4lZL78R20ye
	hJ2pH1zsJvDJZiXCsrgWnCMhANGimo4zcqhL253LLyTIQIm/zePk0l/i/oWvOry/UPIho/Lr9XO
	46y0tjQBqaZmUNcfA6ApXVM7rmDMxib2FuGIt5siGVQ5Yu4kbDdYAOfc48rY2ugpJ/ZKUwKS9dE
	4Fzv64jEuOrMyi5412+FwT9T2YUf5qmnn9RTRleiyEVNxTAf+GtZeuGx1Rak7rslEzSDXrTKlyQ
	5xTymzG1dQtokXy37n2jRVHCnFg95ORE=
X-Google-Smtp-Source: AGHT+IGMUi/8br7pdXwHNqC0siZsEeBmVj1wPTeFjaWA75a/tNNlmbnRO1ELIfRE9yhceLHbSOHfOQ==
X-Received: by 2002:a17:903:1a08:b0:242:9bc5:319f with SMTP id d9443c01a7336-24478ff0354mr20789205ad.55.1755323906287;
        Fri, 15 Aug 2025 22:58:26 -0700 (PDT)
Received: from [192.168.1.9] ([2401:4900:8899:e205:7ddd:6d95:7c30:9bd3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0a0a7sm28328245ad.65.2025.08.15.22.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 22:58:26 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 16 Aug 2025 11:27:46 +0530
Subject: [PATCH v2 2/2] rust: kernel: of: Add overlay id abstraction
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-rust-overlay-abs-v2-2-48a2c8921df2@beagleboard.org>
References: <20250816-rust-overlay-abs-v2-0-48a2c8921df2@beagleboard.org>
In-Reply-To: <20250816-rust-overlay-abs-v2-0-48a2c8921df2@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=DrbctBGMgceWHyU2G3iajKdl9FJ/GIp+Lv0AO0b4Ibw=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBooB3tJrlOtPTqSiWnSQcILitlwR6+YrzBwopAB
 skmiYeHt6aJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaKAd7QAKCRAFzvXHieVa
 dAQVD/0Q5hTcGTe/dOvA31APqGKCstjWbPgoIGuSHivTDdQ6WDmL8YTE0ye8sXqDS4b5+MMRZks
 Cp8ZRw+Nb6TxCCnnuBoBYtXcay5Mkl3jXX/DRS+TEkVP+y2iJz35C7rQrJv5f/i4acPBSnQmhN1
 rNAEL2JF+v1RkWfoJuScYR4geli6Ojcreb+03NAterVUVCeXauaMQjK6lY4YP1+cwyd45CXWKNT
 NPZK1PLZuwZxsif0TA+OmvbyXp2ByTFp35V1dGt9Cw/LeHvDzKgtZgw/Y6FEJWhS6i+nkEbLrDH
 CCveRN4nYFbofeXyDly4UPF+7fnmpUFAxUpZbbf9jg3RyK3J5BONwfLmeVlEFOr4J/GcSZxgi7W
 KhXiG2rombic+QRufQvRF5Yw7K9Xh0Gha20Nw6aCGuElxO5MKTQXYJbu4fGH7kEiEog8uwyDtH4
 Am6UsqTJ0BSz8nVMF2/o96uND58qfRvumguVGVhEB1y25+UjduKSNQMpnrF3CPN96CAqqXr4k4m
 MVuknIj3vd3/LolSZ98XP6L5iJFvYoT0oVVIosu7I8KWK64+AacUrmNzPzl6vbH5ZNQHJP/zS3N
 BCxSNKWrPuxYBWZedGrZVdsxkWKezUj2L+IiTJ7mSt+Q7BcVO/PKOC66Vqdcm1MJS16v2ULQu3F
 EBxGO4SdJcrjYTg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow applying devicetree overlays from Rust.

The overlay is removed on Drop.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 rust/kernel/of.rs | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 74d42dce06f0e9f67a0e5bd1287117b4966d4af9..646148cc959fd5414271f9cf9023ef5d77a2ac2c 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -75,3 +75,37 @@ pub fn as_raw(&self) -> *mut bindings::device_node {
         self.0.get()
     }
 }
+
+/// Devicetree overlay present in livetree.
+///
+/// The overlay is removed on Drop
+pub struct OvcsId(kernel::ffi::c_int);
+
+impl OvcsId {
+    /// Create and apply an overlay changeset to the live tree.
+    pub fn of_overlay_fdt_apply(overlay: &[u8], base: &DeviceNode) -> Result<Self> {
+        let mut ovcs_id: kernel::ffi::c_int = 0;
+
+        // Ensure that overlay length fits in u32
+        let Ok(overlay_len) = overlay.len().try_into() else {
+            return Err(crate::error::code::E2BIG);
+        };
+
+        crate::error::to_result(unsafe {
+            bindings::of_overlay_fdt_apply(
+                overlay.as_ptr().cast(),
+                overlay_len,
+                &mut ovcs_id,
+                base.as_raw(),
+            )
+        })?;
+
+        Ok(Self(ovcs_id))
+    }
+}
+
+impl Drop for OvcsId {
+    fn drop(&mut self) {
+        unsafe { bindings::of_overlay_remove(&mut self.0) };
+    }
+}

-- 
2.50.1

