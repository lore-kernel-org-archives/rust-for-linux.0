Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D9199E94
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758109; cv=none; b=Xzgliihl07QG6RdbTfWKfIPbXoDSZSG0+1x1E8WXKzZJqwXA/L+trX7+aRbrvhh5Y5RnYbaWCAsCkZLxf3ejfC6Bcjqx70sJuuPKboN5wafCdWdWBGlgnu2p+Gc2pzW6SSxgvcjEJSMyafrBE4Nu12ZNQ16UUIYtNZBpvgbdKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758109; c=relaxed/simple;
	bh=5trTzWP1lja7QgW2Nbxdt+5FrAQb5B+HqFiJ/tFGn+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+j0J6Wz7Ad4fIAEfwpCjkfafjS8qzbb7i3cp1nUrVOnbJynA39Nvup1f12sVjJWqBh479I4wK2ifz0GTuW+8uDvO6UFMXfE5G5ImnbZeeWWUbel3z8RjdjRH81xs4cmrfkoF2wZ5/QfStbuUTVP3mDKAJmtPoBUuHunbj7FXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4561839b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 06:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766758107; x=1767362907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eiGB8oXhegfDuwpDui4+XsxBRPl2FrgBVzFQBSYcUyQ=;
        b=EYV0cENsGM75995dBhdx7+wGVhfIqCxAIffZdk30ghmAhDOP/0Tv+eWOpSZ+NZRmhE
         pM5O5xLWwfDX2p2KU7Zw21zOfquzqzvQbNl5YLbW8eLbvWeNK+ZtkLTEbTCZ0JKv3zgL
         sm7NmnJPPxn9XWnTBtCpcF73KzT/9Z+gaKkY5jRtDzMxgkk/FCB7lBW+25Cy1fgXbj8k
         4dX0uwPC5lAJxt1TvKaJXghSGmv+SafSvNvuq6zlIvzaWEHyIRPtlE+jDE5uJFc6FIod
         bayS/Ag10DL9dFaIFVNJAN7TTKoXhBOwLBD+iUkp33lnmILfoD5oO733KwE5zgGKGidm
         SB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+mlHmo3k2YO8NFdnDVDqEN+gBBH5AfC7f+xYUrMBq/K9vjLL+I9Qk0kcAetixmgJDXv5t013+dp8xkPGQMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvaByke0HZIkhcbo8TqGrrrtldrCwx3zEO3n87LC6QGxaffNf
	Ml68AYhtzGoUahqQIlE+gfDkdK1ESJ8WnZZHAG9+b8Wb47FSFQXlVAe2
X-Gm-Gg: AY/fxX69kCzr2uLZf3BqxT+k/o4EXe5qWJLTDCwzVYb3zG/HQN3aUVnd3AGHB3DAO5n
	t5r3YAYwg507Kk4IVjaQw+nP5Ekae5a7oZfVkXOe13siXGFms/mVCfw2YurW7OUL1rJtliltKt3
	pNHay8pipgpoE8zMTdoqGg5AOMzX7KSyXBUlWXw3GrtKmBO5FQJeTRywpIdVk4RSepSTcyltbeW
	GlwgYfUpsauwg/VS0DMGKTACnCszX9RAZ2stOfKjSVSoISevm8S0B4WMB545tJ+DrHS7i103TGh
	ge6AWFPJG0awuMRRA1mws3ZQuLyZdoDxEy31+q1M4bpqZ0NNbDDThrEC97wzO7vhD0S/fvYbFiZ
	Y9aAhXyKD18Qzgww61xMpeEMoFhsrtwXxp8/aD5YI4N6YR/l5K8iWrINMtH9fCEjzAFnsHLzd6f
	SR69QvS5vWw8bYveK2OZlp
X-Google-Smtp-Source: AGHT+IFaT/vlOkeMZZ9uWaOC2iG/dbULKHmHwNSjXPe1o2uAzyHCSO6gV5Bcmzjc1nhKcAXg+Paqrg==
X-Received: by 2002:a05:6a20:3c8d:b0:35d:5d40:6d77 with SMTP id adf61e73a8af0-376a7cecaedmr23024952637.31.1766758107368;
        Fri, 26 Dec 2025 06:08:27 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm11460886a91.6.2025.12.26.06.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 06:08:26 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v5 4/4] docs: rust: Add pointer formatting documentation
Date: Fri, 26 Dec 2025 22:07:50 +0800
Message-ID: <20251226140751.2215563-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226140751.2215563-1-sunke@kylinos.cn>
References: <20251226140751.2215563-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a brief documentation for Rust pointer wrapper types (HashedPtr,
RestrictedPtr, RawPtr) that correspond to C kernel's printk format
specifiers %p, %pK, and %px.

The documentation provides:
- Overview of the three wrapper types
- Usage examples for each type
- When to use each type
- Security considerations

This complements the general pointer formatting documentation in
Documentation/core-api/printk-formats.rst.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 Documentation/rust/index.rst              |   1 +
 Documentation/rust/pointer-formatting.rst | 101 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)
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
index 0000000000000..9407307216c9a
--- /dev/null
+++ b/Documentation/rust/pointer-formatting.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Pointer Formatting in Rust
+===========================
+
+This document describes how to format kernel pointers safely in Rust code,
+corresponding to the C kernel's printk format specifiers ``%p``, ``%pK``, and ``%px``.
+
+For general information about pointer formatting in the kernel, please refer to
+:doc:`../core-api/printk-formats`.
+
+Overview
+--------
+
+The Rust kernel provides three wrapper types for formatting kernel pointers:
+
+- **``HashedPtr``** → ``%p`` (hashed, default)
+- **``RestrictedPtr``** → ``%pK`` (restricted, respects ``kptr_restrict``)
+- **``RawPtr``** → ``%px`` (raw address, debug only)
+
+When formatting raw pointers (``*const T`` or ``*mut T``) with ``{:p}``,
+they are automatically wrapped with ``HashedPtr``, providing safe default behavior.
+
+HashedPtr (%p)
+--------------
+
+Use ``HashedPtr`` for general kernel logging. Pointers are hashed before printing
+to prevent leaking information about the kernel memory layout.
+
+**Example**::
+
+    use kernel::ptr::HashedPtr;
+
+    pr_info!("Device pointer: {:p}\n", HashedPtr::from(ptr));
+
+RestrictedPtr (%pK)
+-------------------
+
+Use ``RestrictedPtr`` when producing content of a file read by userspace from
+e.g. procfs or sysfs (using e.g. ``seq_print!()``, not ``pr_info!()``). The behavior
+depends on the ``kptr_restrict`` sysctl setting.
+
+**Example**::
+
+    use kernel::ptr::RestrictedPtr;
+
+    seq_print!(seq_file, "Pointer: {:p}\n", RestrictedPtr::from(ptr));
+
+For more details about ``kptr_restrict``, see :doc:`../admin-guide/sysctl/kernel`.
+
+RawPtr (%px)
+------------
+
+**Warning**: This exposes the real kernel address and should **only** be used
+for debugging purposes.
+
+**Example**::
+
+    use kernel::ptr::RawPtr;
+
+    pr_info!("Debug pointer: {:p}\n", RawPtr::from(ptr));
+
+Formatting Options
+------------------
+
+All pointer wrapper types support standard Rust formatting options including
+width, alignment, and padding characters. These options are preserved through
+the formatting system.
+
+The following examples demonstrate formatting options using ``RawPtr`` for
+predictable output. The same options work with ``HashedPtr`` and
+``RestrictedPtr``, though the exact output may vary due to pointer hashing::
+
+    use kernel::ptr::RawPtr;
+
+    // Basic formatting
+    pr_info!("Pointer: {:p}\n", RawPtr::from(ptr));
+
+    // Minimum width
+    pr_info!("Pointer: {:30p}\n", RawPtr::from(ptr));
+
+    // Right align with zero padding
+    pr_info!("Pointer: {:0>30p}\n", RawPtr::from(ptr));
+
+    // Left align with zero padding
+    pr_info!("Pointer: {:0<30p}\n", RawPtr::from(ptr));
+
+    // Center align with zero padding
+    pr_info!("Pointer: {:0^30p}\n", RawPtr::from(ptr));
+
+    // Right align with space padding (default)
+    pr_info!("Pointer: {:>30p}\n", RawPtr::from(ptr));
+
+    // Center align with custom padding character
+    pr_info!("Pointer: {:*^30p}\n", RawPtr::from(ptr));
+
+See Also
+--------
+
+- :doc:`../core-api/printk-formats` - General pointer formatting documentation
+- `rust/kernel/ptr.rs <srctree/rust/kernel/ptr.rs>`_ - Implementation
-- 
2.43.0

