Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AF1E1DEC
	for <rust-for-linux@vger.kernel.org>; Sun,  4 May 2025 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377779; cv=none; b=hyYXJF5p3J+b4Jxj994YDSSXMQKbRbovUKXyJoTtOmh4ThUzzOh7nvP8ZDrTOgCpHdcXItC1oANRV4vmmEg8UQO26elmM/8fqSJjjNnmn8VU5zFKDjEo7jja89XMfT3Qu3KnxGP6ph1e14J4Uw/HxXXOvA2cp5DvCn1pVKom9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377779; c=relaxed/simple;
	bh=LQtV8lHDzc+CMokuAzD41pIg98/IkgeLxOdq2cYt8Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcfzFDUgaoXlvazD4wPy6jOPH77g3wWbubVqIfuBn3yu6mhQKCv5XNfb9Iz3lTERh/BvMzMsDSe3ebr7ewRh3oGQwyqSrZocZ1DDDAd/nLOb2phOfIgv6RXJuyKFimHS1+tWBPse4b12d9wvhaxsktqGziVSUTVSdeoQeOfale8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=lavGT8SH; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="lavGT8SH"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e694601f624so2694818276.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 May 2025 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1746377776; x=1746982576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RBYujogfLUZ3PlQZNt8RAS1zgiTtoYg9qRwc5Itf+8=;
        b=lavGT8SHuvw+LbhraT6d7IAFtH8hKtA8MZWYBXxpmvwBfme4WeAYraQy+kdBDEA+ve
         MTeWg3Mhq2sxPJbAm6OfkqZKzxuO1SOMieqtv0/bA7W+Cgk61KzCDO91hsxHJ61zVuoB
         a/htJKUosYksx4dj3aE0XqXI2z9CwY5CJ0ebT67XRiM6d85akgVN1wiuHkj52saKU30V
         LIKucaJ2YWown9YD8Cbo9yi/EQU42w1AqwcfTKPspDJq6rXd7JmGV99qqJApQfC4LtrP
         dsS7PIpy7OSuMbvGcuzba9f7D+ARI2Epg2J1zhhyyehOA0hrWjneUOer3CZKvKmiYiL9
         gUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746377776; x=1746982576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RBYujogfLUZ3PlQZNt8RAS1zgiTtoYg9qRwc5Itf+8=;
        b=wN/lt86bbxRGo0PaLQlG/GdOglLnnxhbizwQzjjKFZGtZs1aY6jaoFbvWxuom7mwbT
         HnODz7jHh4ZyvB62p3NqDsxiT2dLH9X5ClzxAnG8jZUSeknIWY11ALFrL6H46louInnK
         MPe4DeWfqy1QxSHiUPSc/LheDQ35aB9ytE7V5xT6c73ae/i6EV5E/QJ3AfmnGHaOtA3D
         7UoXCqNRRTNvU8ruwfKesNrgoCl9UHkbwLlCf5DBHmcmeJGApoR5QqvXuqTdngfNGS+X
         7w17kzx/B8CErRmS8k1+zWQ/ysX4UmBJHAYhrXrBq9GnrcTC7PxwBmCphoTsP3leib42
         rYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPK+kz/bQaM4tMRyFsz4jXYXa6pRYhPlTjnBIP4XiFV6hvJumeb6/0iLfyRmnE9NLiO7uSbBOoZZit7E7SJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xGP8gcL+7gDF8XQGd2VSxGBDdWmd4c5l1lY9sVMWt3nwiOLf
	vBKstReFZdIlsemxuqOuS3oTbYAcvV5LVorirha65z4p+HhPnLlpRuJKekkF6os=
X-Gm-Gg: ASbGnct7eFQPUuDndeViBZnjtDfmEHWcDXiIIow7NQQV4rZuSS/drZpUZkERSZgruKd
	fVlSi+CQwbX9w5lx7ZuJM8578se++33Y5m1moqzM+++I7CB70eivLMrTIbloBrdrZQpYQ2gvJKN
	PIft9Zn2g2O4HjOdM7W8eQfbkFaMxq5XMtP18XblCEqz4UGGPvr+Od6Dmyv0XZomlhGac+PYnCq
	OYhpKg1MDNPY/WA8m06GYbTfg2bJa/FbESQ+k9e8qxuqFMHPa4x4f/jIbdZg5pd2DNPB5gIILCe
	ro5LVN3TSJ2O4k66a6UDdbwY2OLijOobopykN+nY0IOgoaupHy3iui7qEir6LPY4Aoxwtsudjty
	HoDw3wH3HhZWxJ1s+Ji5/vGhvKEyVzExiWrxX
X-Google-Smtp-Source: AGHT+IEa2yS9SJ+MhaLa+NMOeU8G7eoJ6sm3mdNm+WnnYPNGskL4XR/yEpmEQOFnT7GR0KIdEM76uA==
X-Received: by 2002:a05:690c:6905:b0:6fd:4473:5184 with SMTP id 00721157ae682-708e13679a6mr83285157b3.35.1746377776214;
        Sun, 04 May 2025 09:56:16 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c467dfffsm17567817b3.72.2025.05.04.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:56:16 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/1] rust: kernel: create `overflow_assert!`
Date: Sun,  4 May 2025 12:56:11 -0400
Message-ID: <20250504165612.86459-2-contact@antoniohickey.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504165612.86459-1-contact@antoniohickey.com>
References: <20250504165612.86459-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit creates a macro for overflow assertions, the use of this
macro will avoid local `#ifdef`s by encapsulating the conditional
behavior to the macro. In addition this macro allows us to document
the intent of the assertion more clearly.

Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 42 ++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 rust/kernel/overflow_assert.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5..feeb99fc4bbd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -64,6 +64,7 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
+pub mod overflow_assert;
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert.rs
new file mode 100644
index 000000000000..aa4438bb0165
--- /dev/null
+++ b/rust/kernel/overflow_assert.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Overflow assert.
+
+/// Overflow assert (i.e. runtime bound check).
+///
+/// Verifies at runtime that an expression is within an expected bound.
+///
+/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
+///
+/// # Examples
+///
+/// ```
+/// overflow_assert!(3, 10);
+/// overflow_assert!(5, 5);
+///
+/// const X: u8 = 5;
+/// overflow_assert!(X + 1, 10);
+///
+/// const fn f(x: i32) -> i32 {
+///     x + 2
+/// }
+/// overflow_assert!(f(40), 42);
+/// ```
+#[macro_export]
+#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+macro_rules! overflow_assert {
+    ($x:expr, $y:expr) => {
+        core::assert!($x <= $y, "overflow assertion failed: {} > {}", $x, $y);
+    };
+}
+
+/// Disabled overflow assertion (no-op).
+///
+/// This macro exists to allow code using `overflow_assert!` to compile when
+/// `CONFIG_RUST_OVERFLOW_CHECKS` is **not** enabled. It expands to nothing
+/// so it performs no checks and emits no code.
+#[macro_export]
+#[cfg(not(CONFIG_RUST_OVERFLOW_CHECKS))]
+macro_rules! assert_no_overflow {
+    ($x:expr, $y:expr) => {};
+}
-- 
2.49.0

