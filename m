Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC35FB99
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Feb 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706984875; cv=none; b=lVdiuMxIUx7JVvlpKVIBq+WCq9ROM6v+8R8PTfYyIyPYcFbDC7WiRRD/mAQ9VxVrXeZiiXkuawsPrL2PdPjttlWrr/kpQlTsdteOI3a2rlblWKSajim1KtNsMeoOQgQuPwUOmeA/6IsqWHCK6jWAeiL6HsxLla468SUTDqQmMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706984875; c=relaxed/simple;
	bh=GzicIahv4Tt2lzuqFuZnvS56kx5LJ9XD6ksc+iGyqug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D730VDxXV84OmGrXs1um78/XodVf4tcaMIcXbl4EaOhOVbBUtX4XPdz1MijeSgMHBhlXEfVSgFvgQps2x8OLkO1N1W0RMS/SbRzordLcv4pd7y6cNHek3eeYzytkOPWbTy+aDnH1MfsQCDaeavin5htestsq/Zlf0YQd8cXJjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESUUvFHV; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESUUvFHV"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7beda2e6794so64771539f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Feb 2024 10:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706984873; x=1707589673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZrax1m5MfrMJHavxk7ro3yh3LU3ZNUmoF3AGBKcm54=;
        b=ESUUvFHVPQ6xZRPtRSZTbBSPqjd5drMeDpiIQCVLIEpSX/p9el+dA6kCdN7xRooNRD
         IJ88IdItZDK+iEIjSEfWrz9p+vF45JYlTh0zTclAv41CZHNU9s5B035M3M/dN6YBSJ5r
         4cgLG7yKXXY6mu7nSR4XSX9v0GQmcYjjouMghSUCoTYhku9r+kbn0SZTErQQHHjlDHab
         LpKu8uydPP2FEyvtvClYVdRJR8WYROJjgOoHOoc8wIt8qgSVZzMqdxq/2TQr8oau3QX+
         dGSEV72dFADEtGcbRdIVpPknCN2udGXwat4ipc0xBOKnYCI9bUdVI4WZ1I6ijNTvftwp
         HmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706984873; x=1707589673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZrax1m5MfrMJHavxk7ro3yh3LU3ZNUmoF3AGBKcm54=;
        b=fe5VKahpt5kkOiwdc++tepVvhXBeD141eu84EgBtDgv7CQ+FA1th6zXc8F1ORmz27m
         KaAConxBEo1E17Pll04pXcEl8fxF2RCbrKzU9EdRAnba6+eEN0y62SaClMireCGR4nEs
         QDK2MyLTxMAjCiOjiIQGmOmnRX2trx7BJxxVmDj2Ii9WKnpT5wkvXzdt6MqaZPJE1xkP
         IvDzgKs892Qy90arNqPRgMClzctk7M8q8FzTeV/g17u1LoLQ4pXIp5gepX/oBk5HrBPv
         gWGuBifYaILXxlwPS62tXrGd3pRXntTx8D5zg77DhxjhC9zR561aqYLDLpWmP5Xk9RrX
         YTzg==
X-Gm-Message-State: AOJu0YwQtN2jH+QVgRXZDnyZ4E9+lsl9nsOCVIx4tYoqG+HELo4EnA22
	KFgEj7/4pjCkjh5uD1ck2aioyZmScwDA3SVIvqD+Qtp1m1eM2fvWZpsOF8av804=
X-Google-Smtp-Source: AGHT+IEwnlbU4AEkjYQHevCEtfQpihiEU9BrMsjKOptW2xAZk4ACrqtPNDc4wDyUBPhk8t8OudqQqA==
X-Received: by 2002:a05:6602:2d84:b0:7bf:e164:e4f1 with SMTP id k4-20020a0566022d8400b007bfe164e4f1mr1524367iow.2.1706984872780;
        Sat, 03 Feb 2024 10:27:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVUHcZU7FGGOY+8KctRNUZksj8fUtbrUdSlw5G8HXXFmqAM7pRFZ4JujELqH7mLMwc96EITlS+lja4ai3mROPW8trCRlZpE2pMd4/1hcIJEWgO7xZIT5YU/JzNI/VI9HcGPOjR8HYqjIUU8VA==
Received: from fedora-laptop.hsd1.nm.comcast.net (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id t23-20020a6b0917000000b007bfea3c536esm1185773ioi.28.2024.02.03.10.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 10:27:52 -0800 (PST)
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: rust-for-linux@vger.kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>
Subject: [PATCH] rust: place generated init_module() function in .init.text
Date: Sat,  3 Feb 2024 11:27:35 -0700
Message-ID: <20240203182735.295946-1-tahbertschinger@gmail.com>
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
functions like `bch2_vfs_init()` which are placed in the `.init.text`
section.

This patch places the macro-generated `init_module()` Rust function in
the `.init.text` section.

Note that this is not enough on its own to actually get all the module
initialization code in that section. The module author must still add
the `#[link_section = ".init.text"]` attribute to the Rust `init()` in
the `impl kernel::Module` block in order to then call C `__init`
functions. However, this patch enables module authors do so, when
previously it would not be possible (without warnings).

Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
---
 rust/macros/module.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index d62d8710d77a..d09be1bee397 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -225,6 +225,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             #[cfg(MODULE)]
             #[doc(hidden)]
             #[no_mangle]
+            #[link_section = \".init.text\"]
             pub extern \"C\" fn init_module() -> core::ffi::c_int {{
                 __init()
             }}
-- 
2.43.0

