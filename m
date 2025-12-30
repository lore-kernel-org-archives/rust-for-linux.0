Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA731D750
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117240; cv=none; b=Q/Gc6fIW/o5Dz6MzTQChTfBpVf6uRLlOKvUC6Dt+CywOYFtFM/kKv2pA5PrvsH6mmjNpw1RYmqyFl+1N9WoPeNbmDlmE5a+MA2jvM9rEjD8MuAm87MowAyaRII8XPcM2AUyYeoaxFiZHKXgKmEgKjdzY31y1ytfRcz+2H4GPgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117240; c=relaxed/simple;
	bh=JBh+MFnoGyYCeEvR8aZhFlDltAqOMVVaHmWlhKuZav4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nhkU/xMoRfh3J/DEs8XsjBVdDB6zy7j9z0BipjqkivkyMjDGmSIDmgM56Liorzi8NOWnfpO1Xb1zZmrFiEx3JjBjJ2Wu5Pe32swpXKLFnsh9PknExzz7EJ0rq6TXJMT2wZu6G05SimfuX5MWJz3kij0FopRw3447Egb/20GWisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nalapQQp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nalapQQp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34ac814f308so23017398a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767117239; x=1767722039; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=far2F8SCiAeYEaUvenEigD/H34t42x7S+P8As/u5ias=;
        b=nalapQQpMMFKxjxlaTejRUVAViVtmjNea9JXh/A1B1sqOrLlJ50PrWw9zB+69njybo
         s4YWnTZqk7iEvJDtw8dio8chQYI41E4JYBMiOAkiUGIp9HaYFglJmNl+mKNUZVzTvdjr
         DaxIoo6mFl7tkqRnCX03EygXLbBWWwMCV/4mUIZSXbPaPLc20+k5wg3GCOVtl/9hAdpa
         YnXON15fwSj8Og1Ae1rNaHQK9Z/YSV7tFTX/pY8KSvnUeKBj489AM5GeipX1+rht11yb
         3+5+Ze7dpBAcUJembHXN4mHnV4n/1pbM1d/yp+bfG4WkoVrkW+vqZrHT9eLeXWCbSwM6
         fN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767117239; x=1767722039;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=far2F8SCiAeYEaUvenEigD/H34t42x7S+P8As/u5ias=;
        b=fPGO92eLiXNoanp5Auoon58V/VFDoSqEZc8KVa+E0gIbc3C8vXmc+1sqPwPLGZFd75
         AqZ4PGErsNscguzd3lM2Ioq4KhzCO/jpLnWhNLCIHCxgyZ6WFJLv9M5jUEHABXBef9C8
         ixK/uh/vjfXCPXQJl1kNDFmCtKETUMz00emy/A9MbHFsZTmrATeeuxzsspHyDhWZKThl
         UZSSKXuustIO5rQ0DBb5UE74iS/oa93FYEbY2d/uimueKw1sTisf2W8gu9CqoeXu1d7F
         L8PHoYKandkWpFikNx34uoFhxXU3E/LoEODwOPfc03Jmc/55XrUvX8RezXzG+xuqdn9S
         Axbw==
X-Forwarded-Encrypted: i=1; AJvYcCU/LsxteMxDO9lO9wjytcM5Zb9qSoYl6sgWS7dZVPf92aQqLw2yyFALXaUONhOdtwzcerCIZ89U2JXkkANETQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WhYsXJuuPysSuXweigngYdshJtJCS1DShQ7rrnCFtNLjLvRl
	iM9qlwdLOlE41CYQLPpI2lZ1PcuWOjvPRw7P2JJ8JRXCfyi9CWy9wxmOlDqgEPmEF210Lehu5UB
	wU8wh0Dxzkg==
X-Google-Smtp-Source: AGHT+IHV2kdC1JaYTIJG6O6YnJRAt6P0XRekxsdSb1kCm56XaC/gulRACcgSKgWwuMs3jAxCLVN4rnMYZfz9
X-Received: from dlbeg11.prod.google.com ([2002:a05:7022:f8b:b0:121:766b:11e4])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:150d:b0:11b:9386:7ecd
 with SMTP id a92af1059eb24-121722fa7c2mr31544819c88.42.1767117238799; Tue, 30
 Dec 2025 09:53:58 -0800 (PST)
Date: Tue, 30 Dec 2025 17:53:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALQRVGkC/2XMQQ6CMBCF4auQrq3pTAtFV97DuCh0gCZKSSFEQ
 ri7BTegyzeT759ZT8FRz67JzAKNrne+jUOdElY2pq2JOxs3Q4EpCLxwYy2ndgi+m3iVagKkggA
 Ei6ILVLn3Vrs/4m5cP/gwbfER1uu3g4CHzggcOGlhLBTlpczSW+19/aRz6V9sDY24x9kRY8TK5 llWxa/S6g/LHcYfLCM2UimRozRC2wNeluUDuUfrJiEBAAA=
X-Change-Id: 20251029-add-entropy-f57e12ebe110
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767117237; l=2619;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=JBh+MFnoGyYCeEvR8aZhFlDltAqOMVVaHmWlhKuZav4=; b=hTahNGSIZWN5fMIGiiwqZSArhmkOx8lNQCkXNCp8GTeHbpi99H7N8MNHbgNqJMjgw6zAw4d4a
 fUyMmJ8Rl9vCW6Hq1cH/gKB4RA4IMyE3zB/0OdXJl85Uv/roQKYgIFV
X-Mailer: b4 0.14.2
Message-ID: <20251230-add-entropy-v4-1-fa9485b6d372@google.com>
Subject: [PATCH v4] rust: Add support for feeding entropy to randomness pool
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds just enough support to allow device drivers to feed entropy to the
central pool.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v4:
- Adjusted documentation phrasing.
- Renamed module from `rand` to `random` to be more in line with the
  header name.
- Link to v3: https://lore.kernel.org/r/20251226-add-entropy-v3-1-a3440823a07d@google.com

Changes in v3:
- Fixed doclink to be srctree-based instead of relative.
- Switched to prelude import instead of fine-grained imports.
- Link to v2: https://lore.kernel.org/r/20251216-add-entropy-v2-1-4d866f251474@google.com

Changes in v2:
- Added more details in the docs about the API, specifically about it
  not crediting entropy and when it ought to be used.
- Link to v1: https://lore.kernel.org/r/20251212-add-entropy-v1-1-e70ad1bc9c65@google.com
---
 rust/kernel/lib.rs    |  1 +
 rust/kernel/random.rs | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..c82e6747043e2472d6b5e4d9043fa8bc6d3c8434 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -130,6 +130,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod random;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/random.rs b/rust/kernel/random.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a9b19698e09665696fef77b4486c4a1a20d0a42e
--- /dev/null
+++ b/rust/kernel/random.rs
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Randomness.
+//!
+//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)
+
+use crate::prelude::*;
+
+/// Adds the given buffer to the entropy pool, but does not credit any entropy.
+///
+/// This function mixes in data that is likely to differ between devices or boots, but may
+/// otherwise be predictable. Examples include MAC addresses or RTC values. This slightly improves
+/// randomness in entropy-constrained environments (especially common for embedded devices).
+pub fn add_device_randomness(buf: &[u8]) {
+    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
+    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
+}

---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-add-entropy-f57e12ebe110

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

