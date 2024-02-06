Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1111373
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 01:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182774; cv=none; b=oHFA6Il+xdIxc9Y1oZ9zz48/a6z5myDw9Mf89Mmven9eJeO1/OZI8263gA98cz7egz1omC0w+QapdoM4n8CeQN55cjqb+pN+U1HRqu/7z40Gc+Z9ZrzeCSYGlKwfK6Yja6W9UI/uomiMSz283lTdDuVw30Y7A5LpRvYV7IHL6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182774; c=relaxed/simple;
	bh=9d+FPuBgqbiU26qEbc0YDIxTLtDxin4U0jbVgMYZMkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5eWWrqlRMvMDYQfXq5MiD6I4p/ITt1g9ADkJFBn/QKmZ+b8Igv2/aardYWJn7fauPdy7V6Uz7WA6eFxhAV/Vgo7FgoCI3m1v//H6EF0jPo/Xba3FAOGW7lhy7MfsXPd/bIiR4eEOTLLiRPmX0qLThqkNgo2FN7PzLQepynmiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WI/vGDeL; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI/vGDeL"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7bc32b04dc9so195273739f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 17:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707182772; x=1707787572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nsyw028VpZ2wMo8xbsiJ2U+ECGM8aWdSmenDO2b5LxE=;
        b=WI/vGDeLCKtMUkmfWvTbUmlcOM03Dy0qwHrddruCplFv3XTw2pVJnnR8hO9RAgzr5l
         2roRUi4tAw8sjbVwQoptieG8xdbvuhYgq86FxUUFhulE7o6fKXbXvU2tSmmO0z0FRF1f
         nex//n7KcEaj824qOGJVIEhebE6epihKRRExcDpIgP5UHazcsjqMO+YrFlApGdXbPZvj
         5JAuvydDbvIVoA3MvjakAUn7pASSD43vLAVt0w5aFpjTVerJemZXz/0FyGEn6kHsz1ss
         KYixyx05wWIfG+tCFIg9K4auvNK1rikCgOmIH4YjEwJ7lwDnGUgNqYDuYPPd1E0mQyT4
         G8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182772; x=1707787572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsyw028VpZ2wMo8xbsiJ2U+ECGM8aWdSmenDO2b5LxE=;
        b=mylPqi+4Hb/TMv1pCCEwLsFBAWQxdBxV032J4wDhX49gM9lPCTl67h9cZ8/cuKjos8
         gM3RQ8soeugOOA3MWrN7pxQIxi/iCk8apKboWWsa5Avs52E4QFmvjvMrtAnEiMqssEUm
         7RnSN1G3uw4h46KaPgAsz8lBpSguHhW+BKEqxObS0VSreeYh0WzmxBLPEBIAbwPeGr0g
         MhrEs7Zca+BRS81zBbL7PYR0trsMRqLujs4Htc4Otd/y3JjUGo1Kz93/t5HimVnRQeRq
         BqgNwKXKFMfcuxok6/SVRIPhCwFhXJzAHoxJuvvzr/5l2p8PvyFH6dI75MWnvCXEUz7L
         2e+w==
X-Gm-Message-State: AOJu0YxbwnSVJPPXb4J6WXTS9lzI4dTf93+yhvKDbqNITHCv+uO3Q8q9
	VRhz7StS+9wS3AaQflLSSy5aZGlGm5ghUXHbkUz3+p18+eL4OXVA
X-Google-Smtp-Source: AGHT+IH9JR+SE3Wzae1QSHBSOYbus1reVscWxxLz1fAcfHSJJTMV7FmlRortx8wehbYE/wfBusbDPQ==
X-Received: by 2002:a92:2811:0:b0:363:b46c:963d with SMTP id l17-20020a922811000000b00363b46c963dmr608409ilf.12.1707182772097;
        Mon, 05 Feb 2024 17:26:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX+6xrdT85LnXhj12w/Cwjq8VYkshR14YrF91sKNwXM7i4qEhhyZ/o1QMNzclpy/s6pZUl3IdDnVAlg7VEfPMbTZTljDmMfbmrrFzV3FGfsWR2DhIEier7kW9/YnvgVreBEMZC85i4fLuQYBIdwJ0WXDFVzNnl7UmPqBX8FgmKQk5ojKDCEaWa4Cy5juJGdSlD03IsjAmzZvRy65fY1tk1Pdz9S
Received: from fedora-laptop.hsd1.nm.comcast.net (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id cd8-20020a056e02320800b00363ca35b55dsm252306ilb.3.2024.02.05.17.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 17:26:11 -0800 (PST)
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v2] rust: place generated init_module() function in .init.text
Date: Mon,  5 Feb 2024 18:25:35 -0700
Message-ID: <20240206012535.480193-1-tahbertschinger@gmail.com>
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
for Rust modules but it does present a challenge with implementing Rust
functionality for existing C modules.

If a Rust `init_module()` function (that lives in `.text`) calls a C
function annotated with `__init`, then a warning is generated because
the C function lives in `.init.text`.

I ran into this while experimenting with converting the bcachefs kernel
module from C to Rust. The module's `init()`, written in Rust, calls C
functions like `bch2_vfs_init()` which are placed in `.init.text`.

This patch places the macro-generated `init_module()` Rust function in
the `.init.text` section. It also marks that function as unsafe--now it
may not be called again after returning because it may be freed already.

Note that this is not enough on its own to actually get all the module
initialization code in that section. The module author must still add
the `#[link_section = ".init.text"]` attribute to the Rust `init()` in
the `impl kernel::Module` block in order to then call C `__init`
functions. However, this patch enables module authors do so, when
previously it would not be possible (without warnings).

Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
V2: add "unsafe" to the init_module() function

 rust/macros/module.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index d62d8710d77a..e54293faf523 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -222,10 +222,14 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             }};
 
             // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
+            /// # Safety
+            /// This function must only be called once, during module initialization, because it
+            /// may be freed after it returns.
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

