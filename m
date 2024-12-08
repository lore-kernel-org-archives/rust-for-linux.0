Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8CC78276
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733663763; cv=none; b=BtxJnEup2UtC1c3JcUE7oodUmws+ZshFf4E2OEv+IIZwR2QqVkxxgGSljUiG49nRcxIOjP7SSXTroVOlFvcIeFfAA+Kx6UXl62dmo6xHmkhODt3jiSZzJw+o5W0NYDRAKpvI4O3EufD7UppIK5qTDSxMpna8X0v4RgEdfUi9lm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733663763; c=relaxed/simple;
	bh=egrnBJ3YLADktnSeRNUVoCn8mcPbj/j2TkX7MW+QvkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS/6+CN/NcRuP4LsAKkUrt91TZ+SMmV4oWfOjqC4o1ZIK7u1X8zaXeN+/PVvHuwZpd7sPsOgETgmcUADZiU4g/CuIAQCcHErB42oxKYa00wLt1+CI+crWToFX7qoqOg0+v7KWS4LR3NjGubOJVT6K1UFMzjoHe+g3F7+/+2nz/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=w1Vw6dU4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="w1Vw6dU4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa662795ca3so143591166b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 05:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733663760; x=1734268560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z36v11i7vzxn2/58w0JwbCwUYQhwvBE16vi8J5b7D9w=;
        b=w1Vw6dU4+1bugFr9rqDfRoG5GlaJYPCjjwHj/tnGAvfP0E//BFCxWkOcvD0QkTF3RQ
         uBrAnGDt1Z4Rd1d5NNtRj89m/I/5/Fc9qurJjbdMy6T2iH2BdWlzvgFnUddRydiprFU4
         cIEZ6Yt3u/fdwtMQg8LylCdQ5v94aCC9+4BWuwwQGT1/pghvQ9SXjokAc2tJ/wYnw/SQ
         fjyApwNNoKXBoNJyb4L9HFQGeGmH7JNC5jdvj8ljbEIpC/bJKgUFFtWNy3lUhVbxIvPZ
         Pk6HUpFaLfUtE+u2kYvkw2xrc69dMThRFYQHzM025pKiZFDGyYRpL0aA3O24b/0RTtuL
         yj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663760; x=1734268560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z36v11i7vzxn2/58w0JwbCwUYQhwvBE16vi8J5b7D9w=;
        b=K/y1XT2gcLCM7RfV2vKDMzfrk1EwLFAdjWGu/+KuZc44e2why3WbIAMevVB8Hz6oha
         xUyzq2DSGWzvcAGBhyD0grPBYH/9ahOuFNTBYiPiD9vgCqget0IXOFUjAFn7OOLUY0qG
         QgaCeNPjqGfgUJ6oyRk7MKKbmro9W+wrDmQ7BkkvyedqVoDgQcMRBOXgaVuerUaTq5RQ
         FP29x40VyRF2fOXNjDWYvqh3sMKUkofeG/qvX7IDnqTlcFu+XbXsbmHyHEbiF5ljcBKn
         yKCYCNN7C76AAon18wQ2FktbEF5DUglRXlFLQ5N89s56gwSMJ80TqkHiuCbL4ObK3MHv
         jl+g==
X-Forwarded-Encrypted: i=1; AJvYcCVyUldCsFAFpJTw+95BRdlsQILzfdglRppRbx7z3nbtHkhXLkMvDJROf6x2tQIP7DEXzrSgTajjGyIdOb5e/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YztQ/x6+8/A/zgX2+MrjxqOJEg3F7PldNIvq1HcIMWSysH8n+fO
	NxobMo7ro1ckLlqKG4UXRSDjEXAyTjrzP9zuVqklQcRSz1yJQEMyPh0Cjx9bG4Q=
X-Gm-Gg: ASbGncv/pFAJXSh652LFCEKY/Y9k7mHJThPi+A2yM1RRyp2vUW6vrfB3l4lTRo6Ah5A
	ttTQrl0s5lL5yAQ4vo2I0KMRGUxdxxW5pr0nyQMHnKIbuEIXm+KdpcjvIKBCjslGxnnGHpCBzOD
	H82UwYcgjii/6/XvwGBfB3EgBK2fwk5BcqmpXFfkfLGeJDa3umdKwYzDGHjGwdpAGNjXhlZ1Tko
	DSekuA5sFBVTMEHwgyQ42AYFJFCvUfUBGnIh2IKaBo=
X-Google-Smtp-Source: AGHT+IFQkX9pMvyOYmbUAkK24/cDVVzCq72+lxngqGgLLvBB4LDP9ra54YfXAbswKX5Ag8Qo3DANAA==
X-Received: by 2002:a17:907:86a6:b0:a9e:c440:2c9f with SMTP id a640c23a62f3a-aa6219df7b4mr1400218966b.19.1733663759670;
        Sun, 08 Dec 2024 05:15:59 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96c19sm529078966b.42.2024.12.08.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:58 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [RFC PATCH 3/3] samples: rust: add kobject sample
Date: Sun,  8 Dec 2024 14:15:45 +0100
Message-ID: <20241208131545.386897-4-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241208131545.386897-1-daniel@sedlak.dev>
References: <20241208131545.386897-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic example using the kobject API using Rust.
The example is similar to the already existing
examples samples/kobject/{kobject-example.c,kset-example.c}.

Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 samples/rust/Kconfig            |  8 ++++
 samples/rust/Makefile           |  1 +
 samples/rust/kobject_example.rs | 66 +++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 samples/rust/kobject_example.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9..75e6db1ba6c0 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -37,4 +37,12 @@ config SAMPLE_RUST_HOSTPROGS
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_KOBJECT
+	bool "Build kobject example in Rust"
+	help
+	  This config option allows to build kobject
+	  exampel written in Rust.
+
+	  If unsure, say N.
+
 endif # SAMPLES_RUST
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index c1a5c1655395..b3ae09ef2c24 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -3,6 +3,7 @@ ccflags-y += -I$(src)				# needed for trace events
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_KOBJECT)		+= kobject_example.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/kobject_example.rs b/samples/rust/kobject_example.rs
new file mode 100644
index 000000000000..90db937dea5a
--- /dev/null
+++ b/samples/rust/kobject_example.rs
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust example using kobjects.
+
+use kernel::{
+    c_str,
+    kobject::{subsystems, KObject, KObjectTextAttribute},
+    prelude::*,
+    str::CString,
+};
+
+module! {
+    type: RustKObject,
+    name: "rust_kobject",
+    author: "Rust for Linux Contributors",
+    license: "GPL",
+}
+
+struct RustKObject {
+    // This kobject may be referenced later by other parts of code to update
+    // the values stored within [`MyKObject`].
+    _kobject: Pin<KBox<KObject<MyKObject>>>,
+}
+
+/// Sample KObject state which creates directory in the `/sys/kernel/my_kobject`.
+#[derive(Default)]
+pub struct MyKObject {
+    text: Option<CString>,
+}
+
+/// Attribute of the [`MyKObject`], creates file in the `/sys/kernel/my_kobject/my-text`.
+/// Where `show()` is triggered when read is called and `store()` is called
+/// when new data are written.
+pub struct MyKObjectAttribute;
+#[vtable]
+impl KObjectTextAttribute<MyKObject> for MyKObjectAttribute {
+    const NAME: &'static CStr = c_str!("my-text");
+
+    /// Called for example by `cat /sys/kernel/my_kobject/my-text`.
+    fn show(this: &mut MyKObject) -> Result<CString> {
+        if let Some(text) = &this.text {
+            CString::try_from_fmt(fmt!("Text that was stored: '{text:?}'\n"))
+        } else {
+            CString::try_from_fmt(fmt!("No one stored anything yet, value {}.\n", this.value))
+        }
+    }
+
+    /// Called for example by `echo "Hi Rust!" > /sys/kernel/my_kobject/my-text`.
+    fn store(this: &mut MyKObject, input: &CStr) -> Result {
+        this.text = Some(input.to_cstring()?);
+        Ok(())
+    }
+}
+
+impl kernel::Module for RustKObject {
+    fn init(_module: &'static ThisModule) -> kernel::error::Result<Self> {
+        let mut kobject = KObject::new_with_dynamic_kobject_parent(
+            CString::try_from_fmt(fmt!("my_kobject"))?,
+            &subsystems::KERNEL_KOBJECT,
+            MyKObject::default(),
+        )?;
+        kobject.add_attribute(MyKObjectAttribute)?;
+
+        Ok(RustKObject { _kobject: kobject })
+    }
+}
-- 
2.47.1

