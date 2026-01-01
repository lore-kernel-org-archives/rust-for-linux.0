Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BD125B2
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767255406; cv=none; b=AVLLuUcn/MaDhx5i28XgGJiYJeRTlltuhaAHnHbB1wy2PS8eV15InyeMS/IQxr9qMNoj24PdnJF49KkjbobYiv7UhCFxmaqiSweTWrtgcK6+ugY/LfaUBkjBHe/O8dzDcbr6gVrPU2uaz1Egn2ZVKrgST5thFG+iw3qR2BHeBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767255406; c=relaxed/simple;
	bh=Etm1/olb4y2XkevZ1Z09MJuXjTv8NiegQr28cosJDt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4NTymHYdhngIRrcg7dcOygeyU9uiI+c08defB7n1yylXmnG2dnKoZqO7SgW9RVwG5oARIVYpTIeHHuNAoPPL65xTnsERKN/pkbfC9eOsLV8ryycmRGSvPn0rrtG07G3K5FtOZGNXsbItcCENJEVHTyB6DLo71V1C664vNaakzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so101020355ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 00:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767255404; x=1767860204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwNAoBYoQC8m0fneER7REWAaEqFpEl13NstxkPIKG/M=;
        b=mqRH1Tm9/mVYdvNUEb6wQaFBfR/WWEsrU+y6i9kP2V6ElEkc8mG0YjMlIoKy5n1Mht
         PCu4ytR0w5sxoLU35ZrkkERrX6jMoIEbRJKLYy3qQ+uL+G6rArkpIhl+KcZF7pH48sch
         BdSGM0I5yQ/HiS4WYIADgoW0bJ2HU4cNDffSIefTeSgfYrDFjZxlvorpHIal+DIcSqVv
         JSpKGJCxt4URw8joiFSdk7INbQITaGIvimXA6hSvsKRKvGURfhpHn2Y4zemWY5FFlFSX
         VecQX8osDTf3Bv7Rku3MxC5eWI8qMl14t4+BRfnQ98kcH0tSFJ7ML2NGlNCng3dNfHVp
         uQSg==
X-Forwarded-Encrypted: i=1; AJvYcCWUqqPLcNJu4TZnu4HlVJoMndHkB2kPWdNv3DHHoWtGT3PRe4PrSLyhZOom6goy47LJmYKaenioSzA9EPKWWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyomxpo8MKIgbJran3h+isBsJG1PRierwj1WgozyF/jyhkNLpx
	LKS1lqWJYx1WUa+iZ9QizwCH5O9xI+KG66n0vlVj4AAnoTaB7kMEQ/X+
X-Gm-Gg: AY/fxX7psCtlsIxdh34SuSJTpPoex1nUGVOP/M2esI5B4kqlGuC7ULKPHuIOmzgDqfd
	agzfAsAr9pdiGv3pNYX122q+Pk1rnbS0gcCIzTQuqS1VIdz6auOeoLGDCvKOEoeNmht0t2JbP/r
	uD53PdxQKVlvbsxqGrs8lF8PjdhhxZYvp3bdMK5n68C5Y3ctqZm19lX1fwTs/mDFCqOu13C+Igo
	Wrt4YfLtKEf1fN1gah5Ww90oJ6dxdjtBQfyzVuV3arHFSQlSpJbb2anJeQsLOQPogl1vX0uoR6d
	zAek5k3RMVa1+cV+cdsmFXSgyVj5lCl4sHVHRdiAWLzJ8eAf2aqDNonpcxdWJi37S9OYjC+2jGM
	J9eYAAo2XoCVuKqSDRZQQ9dR6OrMdULtQRS2GAIS1cJrZ19nSm9grAE9lMJ9yUhAsjrBzQigVql
	AS+GDcWTbXQjz97x3MvjYCniUa9RKfman5mE5yv6Et8yQMWdk0BRDjhgU=
X-Google-Smtp-Source: AGHT+IHgkUo/2uMCeJGBtl6Cb518QJbt+MYBfmY5Dc00rcS0hxqg6KwUU5UyjFMFi+ZUh9Sc/5Wzbw==
X-Received: by 2002:a17:903:2345:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a2f220cebfmr384983865ad.3.1767255403900;
        Thu, 01 Jan 2026 00:16:43 -0800 (PST)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm342457585ad.3.2026.01.01.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:16:43 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v8 4/4] docs: rust: Add pointer formatting documentation
Date: Thu,  1 Jan 2026 16:16:04 +0800
Message-ID: <20260101081605.1300953-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101081605.1300953-1-sunke@kylinos.cn>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for Rust pointer wrapper types (HashedPtr, RawPtr)
that correspond to C kernel's printk format specifiers %p and %px.

The documentation provides:
- Overview of the two wrapper types
- Usage examples for each type
- When to use each type
- Security considerations
- Formatting options

This complements the general pointer formatting documentation in
Documentation/core-api/printk-formats.rst.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 Documentation/rust/index.rst              |  1 +
 Documentation/rust/pointer-formatting.rst | 90 +++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/rust/pointer-formatting.rst

diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index ec62001c7d8c7..4f4f8b393031e 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -55,6 +55,7 @@ more details.
     coding-guidelines
     arch-support
     testing
+    pointer-formatting
 
 You can also find learning materials for Rust in its section in
 :doc:`../process/kernel-docs`.
diff --git a/Documentation/rust/pointer-formatting.rst b/Documentation/rust/pointer-formatting.rst
new file mode 100644
index 0000000000000..5928987f21bb0
--- /dev/null
+++ b/Documentation/rust/pointer-formatting.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Pointer Formatting in Rust
+===========================
+
+This document describes how to format kernel pointers safely in Rust code,
+corresponding to the C kernel's printk format specifiers ``%p`` and ``%px``.
+
+For general information about pointer formatting in the kernel, please refer to
+:doc:`../core-api/printk-formats`.
+
+Overview
+--------
+
+The Rust kernel provides two wrapper types for formatting kernel pointers:
+
+- **``HashedPtr``** → ``%p`` (hashed, default)
+- **``RawPtr``** → ``%px`` (raw address, debug only)
+
+When formatting raw pointers (``*const T`` or ``*mut T``) with ``{:p}``,
+they are automatically wrapped with ``HashedPtr``, providing safe default behavior.
+
+HashedPtr (%p)
+--------------
+
+Use ``HashedPtr`` for general kernel logging. Pointers are hashed before printing
+to prevent leaking information about the kernel memory layout. This is the default
+behavior when formatting raw pointers directly.
+
+**Example**::
+
+    use kernel::ptr::HashedPtr;
+
+    // Explicit use of HashedPtr
+    pr_info!("Pointer: {:p}\n", HashedPtr(ptr));
+
+    // Automatic hashing for raw pointers (default behavior)
+    pr_info!("Pointer: {:p}\n", ptr);
+
+RawPtr (%px)
+------------
+
+**Warning**: This exposes the real kernel address and should **only** be used
+for debugging purposes. Consider using ``HashedPtr`` instead for production code.
+
+**Example**::
+
+    use kernel::ptr::RawPtr;
+
+    pr_info!("Debug pointer: {:p}\n", RawPtr(ptr));
+
+Formatting Options
+------------------
+
+All pointer wrapper types support standard Rust formatting options including
+width, alignment, and padding characters. These options are preserved through
+the formatting system.
+
+The following examples demonstrate formatting options using ``RawPtr`` for
+predictable output. The same options work with ``HashedPtr``, though the exact
+output may vary due to pointer hashing::
+
+    use kernel::ptr::RawPtr;
+
+    // Basic formatting
+    pr_info!("Pointer: {:p}\n", RawPtr(ptr));
+
+    // Minimum width
+    pr_info!("Pointer: {:30p}\n", RawPtr(ptr));
+
+    // Right align with zero padding
+    pr_info!("Pointer: {:0>30p}\n", RawPtr(ptr));
+
+    // Left align with zero padding
+    pr_info!("Pointer: {:0<30p}\n", RawPtr(ptr));
+
+    // Center align with zero padding
+    pr_info!("Pointer: {:0^30p}\n", RawPtr(ptr));
+
+    // Right align with space padding (default)
+    pr_info!("Pointer: {:>30p}\n", RawPtr(ptr));
+
+    // Center align with custom padding character
+    pr_info!("Pointer: {:*^30p}\n", RawPtr(ptr));
+
+See Also
+--------
+
+- :doc:`../core-api/printk-formats` - General pointer formatting documentation
+- `rust/kernel/ptr.rs <srctree/rust/kernel/ptr.rs>`_ - Implementation
-- 
2.43.0

