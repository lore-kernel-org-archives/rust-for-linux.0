Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66229264638
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764864428; cv=none; b=oXa++EOmIUzdnkY2Gyaj/mt/b4auOZtAj5pvGGfZRpTG4AdeykGclgXR2WJIrwbRWBLHmLnN4PnYSMn9AHTu2Ox86lYXsrnUcqGZHx8RrxL0vxvQqR2ZWpAjacTRWlnbUcjnPo+653lvLPIhoMfGif6EknS0CPS87W4pOnhNwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764864428; c=relaxed/simple;
	bh=3iOLc+eT151G5S7JW06eLDc9UNVPivHd9HyF/8ZuWjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLAYUiuH0seO3+JrJi9Nk8zBuSQZbL/UNdecOXAIvje487+wm7K15fb5GV7pSD9QzMUMe6JhCP2FXdItxmNQyZSA6rE4V/bnuDz+gzcZ9eKCsMHbRkxL36GGTO7PbIq8YyUZHyMShEiPFaaJDhmlFIJxcxjWgeoOWjmDjkNOpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mELQDfpY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mELQDfpY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2984dfae0acso18944055ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764864426; x=1765469226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsW63CUGlBIwKUKATLzCMVj94b8gTAMHRz89+IhPu4s=;
        b=mELQDfpY/ks2iAXb4OCp/bygbwsPQqLAQuOdmEo0nYBWPd0yziin/4f/mV6XMw5OXN
         KLc/MEAcUJ7dSPDtqq/SU5sqRNLLlMpB2Y3LivDleujLZex428O7s6SBg41bhEIhCqyq
         t8i++Bc1xT7VLBmHYKR6/tEjpPqYaPDee51dKNL7/YqluZdruUCvzySRyE0hYLVQnSB5
         Sk7z81QwTUoqKC0IgFT86HcF2mtiZP4gDfTsPvYGOMmVCeC7Q9pwRl7GTQWgz1lKkHSf
         6MucYPTxrWuIWaPfRMUBJT4k8r/R7hh37yX1rFOk58jaEjchbX3RCE4kBzItXclv+05B
         4MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764864426; x=1765469226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsW63CUGlBIwKUKATLzCMVj94b8gTAMHRz89+IhPu4s=;
        b=ZTf9aQzrK9izaudzgn3HbNJSDaK7eACc9cZgPi61Qi1RimBE0ujdZxWPX3y6HxR+jf
         ee8GmACnranFQE4KfbTqNmV7qpmLAk47J6frETq9tp/aQG1XzaL2ASwcKs52VRkBHOWH
         FZwxPJghAegoVjDK0cQpVIsoXqOkFgeruATvxlyJF5UHj7V4FOFtitP91V2UahlEPXcy
         LpeJDBCvTDzC0pYDmwdZOdi7yV3xp0uvQSyMiXEiCTOrli2oggpBbOhW3G87FoR2qk9A
         KXtQJazw5karOKrK9T1oqdSL0ODGT7jJvJB+ZqNX/7bXy06u1KawY4n6iR5g8br5Tw5o
         xR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1UwUAJ3Pyab6zQBItbt+OeDhA7jWTZGuTFQhxo8W6TuFeANQzSChgegrY0/hCjfHCBCOevV6NV5Ki15ZZ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xpDuLYo6S5r5lwV35UAImH/+kwjMoTH8GFxX75n/neRaSj3B
	BWngklhh1oIKWJ5qkB+ZH140yqcP+8qjGB2LvDRLMw2VrMtjkDOn8dzl
X-Gm-Gg: ASbGncsRO8wKmZa2WAEPRnZioeZ/ieXUbAz9yKIUe4QRi76HgK/617z70Ju8MDlX8s/
	oQPvoMdMaek99x8zoPKkcfOFbSfq28XrqoV6/8gzVaS8D96FEVaN55UQSNfAzyUewP5baFYrt3S
	qQwo3R3lM4KwxqQpmg0iTSP1X5n4ZOYciJEa+JYp3TrLWs7M1Wdk9YiafCE2vW3q3UivHZN0+G2
	apCllCP/o6rOg+NRR/MRpJPiYzxQeamX0SU1fIQNIDqHFT2VBvxTY47piwBwEY3PO+whGPlOBG5
	ukkQpmPfNpETNxLD2A+sLiP1rG7js0Kk+2wUIeftf91P4xpp2JsOsstC/J3+TKHjOlP9FBOLsVL
	4UZ2wkraQbku0Wc9zEXmeitnPL4CwiVIXMIk18+27LIFj8lmtpVMt7reAwd8y++AuAQ154LmzJl
	tBt4TH+chpFmwmZKbs6YjUhR5WUh7UTrL68Q7ag5+BvaxYBJfYIPMZqqgnkjA=
X-Google-Smtp-Source: AGHT+IEKP2RiI1Ytp0oGN6AZ06nuxiPWQ6cAmoMWSGBUSCLQVzhS7HAIQ0LNUHiym30zVBg98tduPA==
X-Received: by 2002:a17:902:fc50:b0:272:dee1:c133 with SMTP id d9443c01a7336-29da02497c6mr39083425ad.22.1764864426321;
        Thu, 04 Dec 2025 08:07:06 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9b1sm23621305ad.77.2025.12.04.08.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:07:05 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	abdiel.janulgue@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	robin.murphy@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1] rust: Add some DMA helpers for architectures without CONFIG_HAS_DMA
Date: Fri,  5 Dec 2025 01:06:39 +0900
Message-ID: <20251204160639.364936-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dma_set_mask(), dma_set_coherent_mask(), dma_map_sgtable(), and
dma_max_mapping_size() helpers to fix a build error when
CONFIG_HAS_DMA is not enabled.

Note that when CONFIG_HAS_DMA is enabled, they are included in both
bindings_generated.rs and bindings_helpers_generated.rs. The former
takes precedence so behavior remains unchanged in that case.

This fixes the following build error on UML:

error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
     --> /linux/rust/kernel/dma.rs:46:38
      |
   46 |         to_result(unsafe { bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
      |                                      ^^^^^^^^^^^^ help: a function with a similar name exists: `xa_set_mark`
      |
     ::: /build/um/rust/bindings/bindings_generated.rs:24690:5
      |
24690 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong, arg2: xa_mark_t);
      |     ---------------------------------------------------------------------------- similarly named function `xa_set_mark` defined here

error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bindings`
     --> /linux/rust/kernel/dma.rs:63:38
      |
   63 |         to_result(unsafe { bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value()) })
      |                                      ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_coherent_ok`
      |
     ::: /build/um/rust/bindings/bindings_generated.rs:52745:5
      |
52745 |     pub fn dma_coherent_ok(dev: *mut device, phys: phys_addr_t, size: usize) -> bool_;
      |     ---------------------------------------------------------------------------------- similarly named function `dma_coherent_ok` defined here

error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
    --> /linux/rust/kernel/scatterlist.rs:212:23
     |
 212 |               bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.into(), 0)
     |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_unmap_sgtable`
     |
    ::: /build/um/rust/bindings/bindings_helpers_generated.rs:1351:5
     |
1351 | /     pub fn dma_unmap_sgtable(
1352 | |         dev: *mut device,
1353 | |         sgt: *mut sg_table,
1354 | |         dir: dma_data_direction,
1355 | |         attrs: ffi::c_ulong,
1356 | |     );
     | |______- similarly named function `dma_unmap_sgtable` defined here

error[E0425]: cannot find function `dma_max_mapping_size` in crate `bindings`
   --> /linux/rust/kernel/scatterlist.rs:356:52
    |
356 |         let max_segment = match unsafe { bindings::dma_max_mapping_size(dev.as_raw()) } {
    |                                                    ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

error: aborting due to 4 previous errors

Fixes: 101d66828a4ee ("rust: dma: add DMA addressing capabilities")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/dma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
index 6e741c197242..2afa32c21c94 100644
--- a/rust/helpers/dma.c
+++ b/rust/helpers/dma.c
@@ -19,3 +19,24 @@ int rust_helper_dma_set_mask_and_coherent(struct device *dev, u64 mask)
 {
 	return dma_set_mask_and_coherent(dev, mask);
 }
+
+int rust_helper_dma_set_mask(struct device *dev, u64 mask)
+{
+	return dma_set_mask(dev, mask);
+}
+
+int rust_helper_dma_set_coherent_mask(struct device *dev, u64 mask)
+{
+	return dma_set_coherent_mask(dev, mask);
+}
+
+int rust_helper_dma_map_sgtable(struct device *dev, struct sg_table *sgt,
+				enum dma_data_direction dir, unsigned long attrs)
+{
+	return dma_map_sgtable(dev, sgt, dir, attrs);
+}
+
+size_t rust_helper_dma_max_mapping_size(struct device *dev)
+{
+	return dma_max_mapping_size(dev);
+}

base-commit: 559e608c46553c107dbba19dae0854af7b219400
-- 
2.43.0

