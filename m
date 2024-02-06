Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53633133426
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233943; cv=none; b=SQsy+vwHmqB8dyTY0uaugE8nkT+10AApKVkDSkAv5LEYwlwWOIhh9Rpi3iBGk1fXW/dcrUHpZkuaCSsOYaY9wfL+MocKxfDlyOSP4BsDQ7EWg2WjArZv6Fa9nfnHooBQvIrl6+YQxlWGnoxIQIjq+tCL7idoqaXk8PdWOz9Elrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233943; c=relaxed/simple;
	bh=aAKm6Nld9v31edMu63VCx4c5g3FpbvOCWeGHm/3BSZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSvL4w9K8VZg9U+is055Wn8lCn2Na3dxlGlwu/jJDl1M0v4TvBUKCBC1UjxVA4d2SnNsFmywihXkLUiGPMaJta1y27jj30Zzm0Pkt2EdwxBRxZasM1cdtaV6pRLi8z0tCvpT/q8Yj4G9QpRmESd4JBLYx0OmWTSCS6wzUZFjb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnRzdB48; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnRzdB48"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7bed8faf6ebso253971939f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707233940; x=1707838740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7yzPT/L/mCrdMySNnxzf9xNdddXA4lt5CHV0aT0ZTWk=;
        b=dnRzdB48B4q/40QtdxYrvmXZamwECSxA4B4SbhhoZQ0scmcDqqdR+HeVfD8zjsEmOf
         vUZCICSfWMWMY0kOJ84ohCWnWcLZmpje8JuXTXv/C86/vwyyV0mhC757b5Kk15t2sQ9g
         RXHRA0Stn413eoQZAHne4ALCQl1cb3D94EHmfOLF20d2Zpm2FYNXeHRXTyaApwTS8rrf
         l4KCNmg3JXPC9Q9usA7qU7Sb1XKbeiyX7iwNVqq3+CytNYVNTG0i9pDHGgq+NOvu6wvn
         +8Ar5+geAdbaQ53+SaAuJ5bs4AOKJXH9GRldVdMkn8bjK7j7hU3U43OwSuVPGxZOiWFG
         YjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233940; x=1707838740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yzPT/L/mCrdMySNnxzf9xNdddXA4lt5CHV0aT0ZTWk=;
        b=rsO0ggzvxFrau2Sxs9Ao++xvlAo9LR/TBveagSoB9Sd6puTmlkuNkYoAsJV09iI5H1
         C3lcbVHu17YwwEVIY/sS+94/jVNBLuhE5H+2YNscGVeEWBbi61raOrzPVFnAoDJ1Du16
         +Elsf+LMdjUurHDc9eVhT4/iwaP07jA5tgoun7W0hLx/jD+V/lRfsBi6a/YWvpB8Aa86
         aMzjWTdLREyBCAw4Ytj3curKohvk5VEjf5fGXUKrzLWnFnsmLx9V7oDOr3S8pP+6qjIQ
         9uXywnRBOU4Ke5KiXyas6B2HuebiXOFzzMVi6Uwfpdfbjs+TCevv5eZ9e7/LNdwoSvLC
         GKjQ==
X-Gm-Message-State: AOJu0YyiVXCJ92Db3WB6/PbJE5dI5lsKPGusbToexEfHyFdA6SjdgiC8
	dQS+SeoXsIo5M6ETxHvGVMB9wxxcW4Nlvu+pjqOsfLZCfW14nags
X-Google-Smtp-Source: AGHT+IEJxveiLpRj0dfCWib7d1hdnkdkdahpDBQ99mjtTWGtmcCZZT9edm0xg16B/JDuMVB+HalpVA==
X-Received: by 2002:a05:6602:17c6:b0:7c3:f303:e274 with SMTP id z6-20020a05660217c600b007c3f303e274mr1855386iox.8.1707233940156;
        Tue, 06 Feb 2024 07:39:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVr8cE8ew8QfKG/SXE/9MkmckgxaukEMyCREn5tjquy29IsxiA2bdxJlT7/2V0b04j+NDuRY+Mns0D5k45COKSFcJ1KBdqNpSMR7doXeBQf9Do8xc9A6EQAaroI7d9Jzf91lroiv47cZLKAz0upyxo3CoTP5CIj5R0BUuAd4i9PKWBtGJ4Rf0HU/Or+R4Q/r7I9BXz4dvbw4n0/Vmq9ILtoIBPQ
Received: from fedora-laptop.hsd1.nm.comcast.net (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id y11-20020a02bb0b000000b004713c6a848dsm562604jan.74.2024.02.06.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:38:59 -0800 (PST)
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v3] rust: place generated init_module() function in .init.text
Date: Tue,  6 Feb 2024 08:38:06 -0700
Message-ID: <20240206153806.567055-1-tahbertschinger@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Rust kernel modules have their init code placed in the `.text`
section of the .ko file. I don't think this causes any real problems
for Rust modules as long as all code called during initialization lives
in `.text`.

However, if a Rust `init_module()` function (that lives in `.text`)
calls a function marked with `__init` (in C) or
`#[link_section = ".init.text"]` (in Rust), then a warning is
generated by modpost because that function lives in `.init.text`.
For example:

WARNING: modpost: fs/bcachefs/bcachefs: section mismatch in reference: init_module+0x6 (section: .text) -> _RNvXCsj7d3tFpT5JS_15bcachefs_moduleNtB2_8BcachefsNtCsjDtqRIL3JAG_6kernel6Module4init (section: .init.text)

I ran into this while experimenting with converting the bcachefs kernel
module from C to Rust. The module's `init()`, written in Rust, calls C
functions like `bch2_vfs_init()` which are placed in `.init.text`.

This patch places the macro-generated `init_module()` Rust function in
the `.init.text` section. It also marks `init_module()` as unsafe--now
it may not be called after module initialization completes because it
may be freed already.

Note that this is not enough on its own to actually get all the module
initialization code in that section. The module author must still add
the `#[link_section = ".init.text"]` attribute to the Rust `init()` in
the `impl kernel::Module` block in order to then call `__init`
functions. However, this patch enables module authors do so, when
previously it would not be possible (without warnings).

Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 v3: adjust safety comment to be more accurate

 rust/macros/module.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index d62d8710d77a..27979e582e4b 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -222,10 +222,15 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             }};
 
             // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
+            /// # Safety
+            ///
+            /// This function must not be called after module initialization, because it may be
+            /// freed after that completes.
             #[cfg(MODULE)]
             #[doc(hidden)]
             #[no_mangle]
-            pub extern \"C\" fn init_module() -> core::ffi::c_int {{
+            #[link_section = \".init.text\"]
+            pub unsafe extern \"C\" fn init_module() -> core::ffi::c_int {{
                 __init()
             }}
 
-- 
2.43.0

