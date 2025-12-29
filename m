Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F743317709
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992956; cv=none; b=rgrocunDFCmJj+EEoXHOnHEd0wanc4mlOz6CoA5rfGfu/4gc+qZ4VSN89vujyXN7losAAb7Ao5tD/GBrrFZKKBhhc2uIyY68pPBe0RPAVJ1eH6Td7J8bcSmWDOpT+ZrnJsR1gC5nbZgHxc+tZrxijre/n03OzoveSCCAo1xyI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992956; c=relaxed/simple;
	bh=5trTzWP1lja7QgW2Nbxdt+5FrAQb5B+HqFiJ/tFGn+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SV3Zt7Aywv7cR58zAkP5QZ7dOHRmNql6bT9124thcT/hr3lZsD6TGKlVQreszi7uxaquc0b/M6BfA1MHegGBl2JVcUbj80cqEAk1C2IrZUnzPXXK9jNHlpBWOye0vdZ2N1DtsyWKQeFIKZnDdMoUCPpBxR5w9GOWdPg0E+tDqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7f121c00dedso11986165b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766992952; x=1767597752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eiGB8oXhegfDuwpDui4+XsxBRPl2FrgBVzFQBSYcUyQ=;
        b=axpayoO3b+ewM4FExhYmEt1EnKAe0qji246AOidOPD9zahR5RVz34BfZ5mjHSW6OW+
         Cu5CuNtmgoilzNU0DNgcuJWx+vgA+RFBWt5WgdQHHv5n9sgJp/JuFj/h+kFuviBZfoSM
         lrwis3vsHi2r8qqsPPj67FeY8kWKLt9eSqNeN9gkyy8lxKiz2uQPC1Xwlk058aYFGzGA
         Mvk03vjAiR7fZrgY1TYxG4qNP7+wf4SMikq2ate+HYC7ekg7qcJJQQB/EQBJoooQ7AEE
         q1IWCL5fOlGgRXtZ9BrwjdaGNEH2eUgAix1xDVaVPUdRZzrgiw0/QB18TJampvIaiFjS
         Lg3w==
X-Forwarded-Encrypted: i=1; AJvYcCVa4anUruLI3Lc3oSjgwVswqi5G1DXPUfu4R4NxA2WrOdb8aOaF1Ll/ob2TuYVPUl2Hy0jGhwUWxPaZmVJbyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlz5xy2CXuck2TDiOt5MK4TfsMxGJbzg4KcEmE0UlhX9gO5Glm
	59dQHG+M1WKnWyciXTaF9rbhILJcgbjtaee4tPhAzc+NwjdeyIMeWy1x
X-Gm-Gg: AY/fxX5i6h9HpIbemN1uaEllkp2ZefxFNpntvy0xuipgYfMeWHPx9lRvv4V6hpyGULH
	ptQOsI0c6VBwrQVzBxV9BYtrX1fM3g31syNfDOF0cRIB09FnU33ptjzGvOw3skWVRn9E+SHhXQl
	0w+pbYhQXSwVgYH24BN7ZL1yKQAHud9NeR+uBF51SClo3kBV4ZKWpc4L9u9cvM5rpJ9n0s317/+
	WCVADVoYVq2NJqGIy4q6E5cwWAGU0L7ZQLRubmdkht6asOQXQGNCK4aJaSYPl/KCrbDc+u+Tq0M
	hkPfUAbiQ9UyYuJ10D2glT58Bb6kto3ffFNakIZVa2t6L/i2r1uK3AFMBVEcDzFIpTHxfPgldta
	Z06gmoCRK3t4rqxsOiD7wc09xCh3pRQq54rfZQYTVid+0pe+zY6h2A7jlIRnmyexl6Wa1brdr3W
	5mPHRNbu3xq8hw3Mjnu7MP8RHiqCLKDdyLjIeAVR2gptqqxEjs7BefuJI=
X-Google-Smtp-Source: AGHT+IEe0nbeA4xO7CnQdROoJ554QGEyv3v2im7lWpUz2rkz/djNymOWd1mq0CSzPTNld7VsOYgHdw==
X-Received: by 2002:a05:6a00:ad87:b0:7f7:5783:fc6d with SMTP id d2e1a72fcca58-7ff6647bc98mr26132305b3a.41.1766992951638;
        Sun, 28 Dec 2025 23:22:31 -0800 (PST)
Received: from localhost.localdomain (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm29021863b3a.45.2025.12.28.23.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:22:31 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v7 4/4] docs: rust: Add pointer formatting documentation
Date: Mon, 29 Dec 2025 15:21:22 +0800
Message-ID: <20251229072157.3857053-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229072157.3857053-1-sunke@kylinos.cn>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
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

