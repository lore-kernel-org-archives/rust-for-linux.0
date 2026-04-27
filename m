Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12F3A9DA9
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287307; cv=none; b=TBEj9/aTns3IXELB79KQOFh2DVqUt2rg245JhMLMUvZ8bH6uD8mGd8m4WRfkKS9zAsmMvsC/6RsqMX8FSzxYXw51l2GhFqRcoLUhu3lAVoe7MM1GumNWPBG7u94cO5w/0TVaBBgUpH4ViP4iRyB9CaiJHQC7iwtrz411Zo9tOvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287307; c=relaxed/simple;
	bh=iC9UKEYFd1hxRN/BBrR4i7U1kEqG/9GdscpolsokoDU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fyhbV0xnG7sZrcgJe/XpJaZU2dh1F04lltD1DDK394yhfK0D0QnGh+xQKR3ESuhubnHytYYAAzzq26Sl7RY0J9BIzX/d0YmF16iNr6hmOXl4sVXu6ofHYhon9GzIRyC9CemZz2IMwYE4rtcO++ud8PESMK81LnxxWavdusKkNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CUPGAlq6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CUPGAlq6"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so88962225e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777287303; x=1777892103; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=slNdLl1QnszC1nVfd/YNLxP2CuhQTb4CiAEcELPAfjc=;
        b=CUPGAlq6SAExNJ8IOHtOGC6U1de+rhpBtgtj1VVb8UzDQDMRBGCGK05HBInWL8rDZJ
         nAoLaazEOeeB7QpaU24L5tdPQF9tDOCg9+rVel+sKpwOLgLgbiylSz8w6z5cabAzownb
         DttzD1tTc52oVHaN8LEAUiLEDFIaaa5Ks6kg0nk/szSwEfqhvnY2gntjdNj6WnCkqd0b
         r17bEan7wmi+huM2OzVSRus0UIysKskk4MNqSPumMa12J0uHnSkspdH0nfXDNfcsDxZr
         77h7NPdBQTfiQKSzbQI2HGqXdNEr6i12FhyhkWIpX2sUW0+J3WsIzZitGqyQ7pBuXWup
         cVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287303; x=1777892103;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slNdLl1QnszC1nVfd/YNLxP2CuhQTb4CiAEcELPAfjc=;
        b=WYGOLvMqSJeCoqszRUz4JW2ymAaUTY+v4zgd/So3TLEB5B+zSgsxk6XBXcuXoL+yJh
         FLytOGQ9956uqFRZQCkvpG2Dgl14MUVgLWppxj+z3CacOza64A0uMp0RtKmz6JJHIfqV
         liEZ9M/bJmcATSvS1xbiEw2Ezx0kMheo0pko2I+4j7yGlcvCauTLIleTlXPZgQ0bvi/c
         RZK44epLvicZfld/Z3FEKZyO2UAKtLIO6b90aWy3wVe+cHxrVknc2wJhIMhy9hymMilY
         ViLznqtN6tReXGoB5KR1L+LlfHMLSID0zMtWlamvvuBPWlif5GjiI5u5IkNqM+FyduKf
         YcMw==
X-Forwarded-Encrypted: i=1; AFNElJ8Goh1H3Q31CV0OH4IoM1k2jDeZ0h18bJ8cHEwAhIJJufit7bStFtprrJ9YXFTMlg2TYGWToMWhUqhLbeRYCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKMcc5WgL0ybzTQlTsJ2bdRr5f+V0eUTi9Q76zc+me7tcq82Y
	CqNSswumUpZOWFovO0Ixj0BABWlA0ms64jk4Q436oGxgEPkCQxxSkVViq3xN0bFe7op6PRpjBvN
	mSzN7g2ipcXGQn65LgQ==
X-Received: from wmer8.prod.google.com ([2002:a05:600c:4348:b0:488:e192:6fb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2d4b:b0:489:c57:75da with SMTP id 5b1f17b1804b1-4890c57760emr302303095e9.31.1777287303305;
 Mon, 27 Apr 2026 03:55:03 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:54:51 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHtA72kC/0XMQQrDIBCF4auEWVeI0jqJVylZGB2ti5pUoxRC7
 l5pCl3+D963Q6YUKIPqdkhUQw5LbMEvHZiHjp5YsK1B9EL2V4HMr6U+mVmiC56hnp3AUaIbLLT LmsiF95e7T2cnepWmbuf4R1XXyBvnYviRqeSNzchHo41AbaWqEqbj+ADK3zp0owAAAA==
X-Change-Id: 20260427-gpuvm-config-7abf27967f8d
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2320; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iC9UKEYFd1hxRN/BBrR4i7U1kEqG/9GdscpolsokoDU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp70CBb9/adsAFIIObSYbX1ZNaF+oXnWArWBxCj
 xaxSbVnJc6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCae9AgQAKCRAEWL7uWMY5
 RqWtEACALHpNzzwhdlfxjhNjzmy+v3wo3Zf2sOY54zdlI9RRVH6GSyTOT5rEaFUzxp3az68gAQb
 5b7wrFyZEN9vHIAwx+Jv+zJDCuX8jJru4ITocXSrg7J4qD+yVwHKOeYrCpLwDtJDeNAT+JM724s
 z43UNerXJli7UpiArZNXihbDiL4HI5xtXaik4NtWfypz6JkDFTkHx45Brv9jWPRjZRlsAK+DE/4
 IoVbR9CvnYrqCgZlOweuVNl4/gmFVByGIBJSOVrqonrcSoaKLa3ZvxpFUOF/QL1FQd/EGXjFRzf
 SFUn7dbFuRnHJ+DU0pgDlYn54rhei3JFe567gTgJtvoR3kULkRU0ppb/3KAJb/1kWI5E2VwNKh7
 8C65Zi+Y+cuQUO1MpEpY7+XcJAPsbAE33ma9WP6ApoQg5FERjTmPmogiQmedpq89fjLdPpenX17
 lviNOG7bb/IyprxUDiQz26284DsJa7ImMtQNv0PaA7O6updE0CVe6Mi205UqebLIHZQUjiA2hBP
 uNBmBVM61HgctZ2A8+Jvgk35LeBm3XIxkmg9k+6hpUg0fMlrTbOqZdA8zumlbMPmbC9gCh+HXDZ
 L6e4f0bAIWkTAikoQCwhJVzXxHIkuXG8tg6qpE5PnzPn4Oeo9BaA2qY4IPvlXBgWUM954EqgcZH 30rN2uQjfwTbUVQ==
X-Mailer: b4 0.14.3
Message-ID: <20260427-gpuvm-config-v1-1-8ece03771f8a@google.com>
Subject: [PATCH] drm/gpuvm: rust: add RUST_DRM_GPUVM option to Kconfig
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Since Rust uses GPUVM via the kernel crate, which is built-in, the GPUVM
module must also be built-in to use GPUVM from Rust. Adjust the Kconfig
settings accordingly.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/Kconfig      | 7 +++++++
 rust/helpers/drm_gpuvm.c     | 4 ++--
 rust/kernel/drm/gpuvm/mod.rs | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8f5a8d3012e4..323422861e8f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -218,6 +218,13 @@ config DRM_GPUVM
 	  GPU-VM representation providing helpers to manage a GPUs virtual
 	  address space
 
+config RUST_DRM_GPUVM
+	bool
+	depends on DRM
+	select DRM_GPUVM
+	help
+	  Choose this if you need GPUVM functions in Rust
+
 config DRM_GPUSVM
 	tristate
 	depends on DRM
diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
index ca959d9a66f6..4130b6325213 100644
--- a/rust/helpers/drm_gpuvm.c
+++ b/rust/helpers/drm_gpuvm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-#ifdef CONFIG_DRM_GPUVM
+#ifdef CONFIG_RUST_DRM_GPUVM
 
 #include <drm/drm_gpuvm.h>
 
@@ -23,4 +23,4 @@ bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
 	return drm_gpuvm_is_extobj(gpuvm, obj);
 }
 
-#endif // CONFIG_DRM_GPUVM
+#endif // CONFIG_RUST_DRM_GPUVM
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index dc755f248143..ae58f6f667c1 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 
-#![cfg(CONFIG_DRM_GPUVM = "y")]
+#![cfg(CONFIG_RUST_DRM_GPUVM)]
 
 //! DRM GPUVM in immediate mode
 //!

---
base-commit: 5ba12cca3230f6bee5fe1090a30db6b70733e2c7
change-id: 20260427-gpuvm-config-7abf27967f8d
prerequisite-change-id: 20251128-gpuvm-rust-b719cac27ad6:v6
prerequisite-patch-id: f1f55d8f1e7d6e5378673812830d40a6ab00ac15
prerequisite-patch-id: 69eaacfa09229181832b2c2a19ce1a2f96e5e532
prerequisite-patch-id: 27fb7278e13bb18b493e207720dcad4e41862281
prerequisite-patch-id: 76a7592dd4f4da18243091a615f9a8f8579b5d56
prerequisite-patch-id: 0044f8f6356e6fe0759db08ec663822df204cdad

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

