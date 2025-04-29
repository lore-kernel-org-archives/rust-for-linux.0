Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46CD2DEBBB
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968572; cv=none; b=V2RdvAWDYML8ILsSPQxu190fI/Pje2wiXO2rQYKvfgVtN9oWeQFZPeXQviIrZ1yeLh7MWMogU3L14k2zBo4sNaU2JPBsVQOIuPmrgtayof7YjeUzF1jFA/NPPUHp8uOIeUoQvtBkzWaW8UjSIlWQKImvriQq6rXC+KdJA8bL6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968572; c=relaxed/simple;
	bh=YUqCqi7aUTwdF3KpHEUhIFercRLeKzLAnJ50JHhUVFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oqLfMb1qGzuxMnxt4z1QEglTXg4wpmQzd+rE05Q1eUEzFe0sdYypE4Y5JkhRITozlYhEUsaViOSe80+LfrkdfiXUHf/DXRsHFF+d2EgMn11XgR0jKaEoZ+hCATu4kHISUsUJ6fWyBjO2RmGDLkwVKT4Gxr3yRPhiTiz6f9CPaRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x4o5Graz; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x4o5Graz"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2264e5b2b7cso57280525ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 16:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968570; x=1746573370; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRMAHF+KfmYzUz/9PJ/MZYytTgEPSKOAlccvFnnMFBU=;
        b=x4o5Grazv9lxKJ0SV8g4FlY0Hy3BHluvLr8xxRjTxUi4GXxTiXuc+cUsW8iEPMYyGl
         b0Db0VtH3FvX1o5n4B0ieTvpZFvi4DQR96x8o489VHL6IyNJjoUvWLXVtMvAlomOwsYM
         ve2LJ9qPRxnynTAB8izHUOoSqlNhQEppoMzMqssVI5meIIj9xsllNmnNHDdmJF7lgPjR
         NgWlr5yqhqTqK6AAlSP2mfJLdmjk2/o2idYsZHXjO0Qu7LUFgeZ9E1hQ+eBVAsZggGTp
         X0lfQxiqRTWax7cqbUYK14YDCZRGgrOfMXpI6vXMzxW8GLwzCobXJkDesDMGFAv6WXhQ
         5ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968570; x=1746573370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRMAHF+KfmYzUz/9PJ/MZYytTgEPSKOAlccvFnnMFBU=;
        b=N1YFeMz6PwImQ1P3TPhw4BJqf5EJ5KBK4fyxC1lwoQt//qKaInN4YSzm58ABMhLOCO
         DxJxEiB66rHohcBQgNG/oyfdz0iMU7jZvQ5iMBsulS33GXIKiw6uX5H5byjrj/oUTIge
         x1P5bjXrsUuhasB0BJGxCX61Y+7MtjQTMSeA6kV6D7783wlGeYAmSffFH/LpZuD9o0Zf
         /z1hvA5oXgvvUMcpV8Pdpj44SfBdT8O1IOlShcuWM4qrMD53YeM5u4HAbT94B2AJ7W3Q
         JfSqf/Hdc1bsz1GwBkZAlo3u7geqm/Oge+mBusAtzQbFUZkTpTKhuTMkDuu1SP9GpQej
         lt+w==
X-Forwarded-Encrypted: i=1; AJvYcCWyl5a/kqN7tK9QTYnVbEf4omrr45KzoLN+uevdSFVxkgMJqSVfru/7yTlR7RF4TbI0dgblgjbaMDZx6FvpOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM92wMDlr99J98vE/Xxw1ay4cmbMf/T4Cu/Et1l9hv9XFz8SbA
	TmcKBLXDsunYT6BnfrvaKSa428ov+yCGnLTll6jWBZ5Ai2Us65IN05rBQbvEp0+1ACI7+2d7x+l
	ZKRx1Xw==
X-Google-Smtp-Source: AGHT+IG74B+k9PFA7uUny3+Nk6P70J9+F71Nfzr4e6zW198ufm+tlhfRnWenZ2slERkmS+au8VqvGQvRx69k
X-Received: from plrr18.prod.google.com ([2002:a17:902:c612:b0:223:690d:fd84])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:24d:b0:220:e63c:5aff
 with SMTP id d9443c01a7336-22df3588029mr16244025ad.47.1745968569964; Tue, 29
 Apr 2025 16:16:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:16:02 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=5886;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=YUqCqi7aUTwdF3KpHEUhIFercRLeKzLAnJ50JHhUVFI=; b=6ZRnSFlqqOhhDiugHVgaWWE07+Gw7dJ+BcYOX25vri87/MCWT//orKgD3tLWG3pahtTme7r2I
 pYqmVjLfUjCDItq1KEMRdtqfcJmlWLSyTROy2/mlt+qjwYgASzDkwQ+
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-8-6b6e7cb7929f@google.com>
Subject: [PATCH 8/8] rust: samples: Add debugfs sample
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Provides an example of using the Rust DebugFS bindings.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                  |   1 +
 samples/rust/Kconfig         |  11 ++++
 samples/rust/Makefile        |   1 +
 samples/rust/rust_debugfs.rs | 120 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a3b835e427b083a4ddd690d9e7739851f0af47ae..426bcdac025134e20911de8e2cf5c9efb0591814 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7278,6 +7278,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
 
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 43cb72d72631bb2d6e06185e1d88778edff6ee13..6c42ed73f842cda26256039e6917bb443738d3f1 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -51,6 +51,17 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DEBUGFS
+	tristate "DebugFS Test Driver"
+	depends on DEBUG_FS
+	help
+	  This option builds the Rust DebugFS Test driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_debugfs.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_PCI
 	tristate "PCI Driver"
 	depends on PCI
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6a466afd2a21eba84a3b7b2be29f25dce44e9053..b1fc4677ed53fcf7d0f5a3dbf322f65851bc1784 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -4,6 +4,7 @@ ccflags-y += -I$(src)				# needed for trace events
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3fd25848f2d096b03fa70679103bd725d0e42fcf
--- /dev/null
+++ b/samples/rust/rust_debugfs.rs
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Sample DebugFS exporting module
+
+use core::fmt;
+use core::fmt::{Display, Formatter};
+use core::sync::atomic::{AtomicU32, Ordering};
+use kernel::c_str;
+use kernel::debugfs::{Builder, Dir, Values};
+use kernel::debugfs_fmt_file;
+use kernel::new_mutex;
+use kernel::prelude::*;
+use kernel::sync::{Arc, Mutex};
+
+module! {
+    type: RustDebugFs,
+    name: "rust_debugfs",
+    authors: ["Matthew Maurer"],
+    description: "Rust DebugFS usage sample",
+    license: "GPL",
+}
+
+struct RustDebugFs {
+    _debugfs: Pin<KBox<Values<Backing>>>,
+}
+
+struct Composite {
+    major: u32,
+    minor: u32,
+}
+
+impl Display for Composite {
+    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+        write!(f, "{}.{}", self.major, self.minor)
+    }
+}
+
+struct Record {
+    name: &'static CStr,
+    size: usize,
+    stride: usize,
+}
+
+struct Backing {
+    simple: u32,
+    composite: Composite,
+    custom: u32,
+    many: KVec<Record>,
+    atomic: AtomicU32,
+    locked: Arc<Mutex<u32>>,
+}
+
+impl Backing {
+    fn new() -> Result<Self> {
+        let mut many = KVec::new();
+        many.push(
+            Record {
+                name: c_str!("foo"),
+                size: 1,
+                stride: 2,
+            },
+            GFP_KERNEL,
+        )?;
+        many.push(
+            Record {
+                name: c_str!("bar"),
+                size: 3,
+                stride: 4,
+            },
+            GFP_KERNEL,
+        )?;
+        Ok(Self {
+            simple: 10,
+            composite: Composite { major: 1, minor: 2 },
+            custom: 37,
+            many,
+            atomic: AtomicU32::new(7),
+            locked: Arc::pin_init(new_mutex!(0), GFP_KERNEL)?,
+        })
+    }
+    fn build<'a>(&'a self, builder: Builder<'a>) -> Result<()> {
+        builder.display_file(c_str!("simple"), &self.simple)?;
+        builder.display_file(c_str!("composite"), &self.composite)?;
+        debugfs_fmt_file!(
+            builder,
+            c_str!("custom"),
+            &self.custom,
+            "Foo! {:#010x} Bar!\n"
+        )?;
+        for record in self.many.iter() {
+            let dir = builder.dir(record.name)?;
+            dir.display_file(c_str!("size"), &record.size)?;
+            dir.display_file(c_str!("stride"), &record.stride)?;
+        }
+        builder.fmt_file(c_str!("atomic"), &self.atomic, &|atomic, f| {
+            write!(f, "{}\n", atomic.load(Ordering::Relaxed))
+        })?;
+        builder.fmt_file(c_str!("locked"), &self.locked, &|locked, f| {
+            write!(f, "{}\n", *locked.lock())
+        })?;
+        Ok(())
+    }
+}
+
+impl kernel::Module for RustDebugFs {
+    fn init(_this: &'static ThisModule) -> Result<Self> {
+        let dir = Dir::new(c_str!("sample_debugfs"), None)?;
+        let backing = Backing::new()?;
+        let locked = backing.locked.clone();
+        let debugfs = KBox::pin_init(Values::attach(backing, dir), GFP_KERNEL)?;
+        debugfs.as_ref().build(Backing::build)?;
+        // These mutations could occur at any time in the future, and would remain visible through
+        // debugfs.
+        debugfs.as_ref().atomic.store(8, Ordering::Relaxed);
+        *locked.lock() = 42;
+        Ok(Self { _debugfs: debugfs })
+    }
+}

-- 
2.49.0.901.g37484f566f-goog

