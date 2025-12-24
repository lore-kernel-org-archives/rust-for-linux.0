Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4C130BB94
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564027; cv=none; b=WNp7q6gl4z41etjXeS+sUEq+Jklrsp6LRalaZlxzZp7HlvuAnXLVxjg3kEzMdrtXFTHWrzaRTME2dxh5lTDY/X3m2QW1iIyhDJ1NQAeBmp17RiPbVrTu7NJixp/Dqk2G7Feny3kqEK+K5/g9L7ZUWYGBqiM+EJHbfKxGTRuGxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564027; c=relaxed/simple;
	bh=pYBRIV8E0RN8u48NBa2P2siTdVr5Jf3fyRpOX6EWB2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVH9jaGtpY+f5F+0lIHrNNhkRxcRAfhkTWiuggwC5Ufx3WC5faggGHKdNjEd7sFxW2Lmz2BinmYbSJVNycJA5d6GXgYi9OKk0gAOsgkmGgMzviN0VubyLupeqxl8e7y7eLHfOn2EQ1KcqwdhYOgSq7yR8ckb0jHtuKutzfoz2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso62025895ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 00:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564025; x=1767168825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXOFFWchQzQPPcXSC+TWg0VfORsM5qPlOg/dxRGzGxg=;
        b=ER/hKQTwqTqSgnWZcj4G8AFtcdjYCEoNNo8f+KwYoaqhInnaBusMJpBVbxB7Tx6Msz
         weFe2yXaX0CZdE0hR8KWF+WumrzipFQLFtQbkLRTO11tLY4GEU9Zqj4ob8n0bwXPs48M
         AOeKJCL7wF81tPuYf9fpH+Xwz4iuq2bvBR6bbk4YX/ikW6Nc3iN0CLjNC6mxm98aRnM+
         E/KL2O6IHvwXiM3SMZpI4v1ycZswuYnD3gL9q7iwAi9WvpOazN05iHRfMN4d0TILRjLx
         AJWGKXNWNJ/vGaAI26B5nVLC2SYt6VK6wMGPIWaD/SwRefom6KxmqHeTiChjTljEozUd
         ZOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3PqlC0VKli9sxoRmkh8Pyxs8c8azQ/iObD0S11t/5NmsbReB0L+IDMA8qs2W+NGOIfqSFozWdFIteYLHR4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuIj0a1nXQ5kJnRCco+WdurWv9EhY6EefIW1ubLV0FXMOuyp1t
	Z+2eo5fuq8KxpT0M1hK3g/gNlJu5syElNEslsugweVagLVdgnmjp1a/l
X-Gm-Gg: AY/fxX7YmY7h/+oUpqVF0jANTloKaZC61yCjwV1QmmA/RLEC9ygBvroIky8A01ltxgG
	hXQP2/WQqfuOuEkMnN3n1lIcqzIUAMG1CPPIcZpWRUAGM+6wD08ngdjLNiiSrfw7RAEl8Ra31WJ
	6a6U07M2HNfYG0FbtC3SZ7WIzl4pVzLmwolH9QPBDCFJ/WNYwN0YxAuG48ZvpUtZ2bs5EeSncQ0
	+5TpotE0WSfsjiBkbgK0fzwOEaCGN0Nn4J3T877AULxmKZacq2St7eRI++EB/mb+Kwv93TZV0TZ
	unTdAA2cWPR1zdBD75ZcOMT5Fg93ivL2Sp19foOoO2/d9w9P5GHJc/JYQkhDe8xvATa+M4YRes3
	xl80QWaMWwoF8T9mch3DTJ6JC4SA3zVfb8ry4mDqCCtjc7KHNMJa5RoGPzymWP8znmXY2w1dd+S
	P7fl1QV7cOPJv9+kMdsIz9SWpq8GXd7pHy92seYQ2dw81YAPJ0T6PBGG4=
X-Google-Smtp-Source: AGHT+IHrw5mdGa2BqiDIEUpNaR6xDPNSAssProWTnwkwvaIx2LBcfgTtOK2jT46L2kIl0kVnArN9mw==
X-Received: by 2002:a17:903:2f85:b0:2a0:d364:983b with SMTP id d9443c01a7336-2a2f2c53f15mr135023475ad.60.1766564025222;
        Wed, 24 Dec 2025 00:13:45 -0800 (PST)
Received: from localhost.localdomain (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm146462895ad.40.2025.12.24.00.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:13:44 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
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
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v3 4/4] docs: rust: Add pointer formatting documentation
Date: Wed, 24 Dec 2025 16:13:13 +0800
Message-ID: <20251224081315.729684-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224081315.729684-1-sunke@kylinos.cn>
References: <20251224081315.729684-1-sunke@kylinos.cn>
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
 Documentation/rust/index.rst              |  1 +
 Documentation/rust/pointer-formatting.rst | 67 +++++++++++++++++++++++
 2 files changed, 68 insertions(+)
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
index 0000000000000..999634697ae12
--- /dev/null
+++ b/Documentation/rust/pointer-formatting.rst
@@ -0,0 +1,67 @@
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
+See Also
+--------
+
+- :doc:`../core-api/printk-formats` - General pointer formatting documentation
+- `rust/kernel/ptr.rs <srctree/rust/kernel/ptr.rs>`_ - Implementation
-- 
2.43.0

