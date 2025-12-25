Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAA2BE7BE
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703456; cv=none; b=q40GFNw+lM4GE0iJVjYLz+7e8l/jnp0vybDPy+SsqO3BgHoaOXCC5Hy+3jhMwelFIxrzNbW1mToCoYxZ++TehbjJ80nXZm6LpxVmBjgNmcn+DV0OxUGQFw/MGnQy0MieORW6QtlGWQytNr7wENSqSAypFxxyyz5kyn8B+v/zYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703456; c=relaxed/simple;
	bh=5trTzWP1lja7QgW2Nbxdt+5FrAQb5B+HqFiJ/tFGn+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGSF6/D0gqCHmy4VvvlMKvbJQUz7YcAXjptGooDz5UoY+MCsHPoSGaf24AhHZXqYVZmEDpLkieNdsElVeTvnn9YduBmDHWg/IauJJuXjQc/GYPLormIFkJ4vUiYZr1saVrQpLGRDqqVVruZbA7BRBj0CuxoHJynHD8anlmqTgIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-29f102b013fso84037415ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 14:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766703453; x=1767308253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eiGB8oXhegfDuwpDui4+XsxBRPl2FrgBVzFQBSYcUyQ=;
        b=A3gSI2D2YGSLvJpySdptwupYTBIDMiJnjzw7zZYvFAIjg/mx1dgCjJHBgzq+2cYDEb
         Xk28l26GZ3SUz+ZAwSDDZQZrXLO8v9cTVcaqbwYOYupD2e4TST4QfmpY43Bc6UY+qR5N
         oAXW6+Fgd3DcorsTBHLF5rOMmnWiQZqMIqfKQRoXWA0/b57wmoY27n02romCl2Qn3iPA
         FGWGIgRiYQxI0KS66EmIgqr1X5fYwHBVxVOFvD2pcrJzQooSTaiFxXpKK3m5QCvebCXp
         emjYXby4TNzcCe+bA0Ot67jjVJd6MsKNScdD1ncWMzmOT6JnsKYPa3M1PW+mz95RxoOR
         ckqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHdW+eKhu6PVt6M2L0HCqjrmbDADzN3gShAItrV/zwzaDY5EHRNOS4T8fv3NTg7IL4rwoQh0E5t86NWaWzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPiIj1B/QzyBYa2wu7ZyeKOOqW2RJPYRyZ+qJUUoNt+YXsC8O
	5JCpAmxAh8GabCXGFytkqOEgKjOYlf182YSz3wHpynF5dJnTJ53eoTpx
X-Gm-Gg: AY/fxX7CPmzzYuVb//fl2dpSm1LdJ4AhQcjGlQIXfKhjUL1w0Kdt9KWUbWL8CazxTMm
	wroDmpJHgTcu/wrNO4kyxK+a8k8qW+NrnWrXi1hhzL2J8342TMcP8n5WXpupkO5uCSi1xFGXvUe
	hTr4DIUjV4svqj+5Ssb/IHnWSiyEALRcU2PQzkrQs7w7uh8DBnL6TNSzk7+3LNvXGY/DzDBVW/l
	Vu2KJFuIMIa/5wEOPAjNJAwxEbtRQhHsjnproySg2XRruxT9lUkPXDAOPfNEeYBw45dvbORJtTj
	B8NAkwhhCdqElGuWcUhhyCSoG8zlcsYeCkHD6GbjLx6M//bKDwK2k0apKd9DdXl5VQXf+hzM80K
	HwcKEytPiDylbvtVLHIfqTdwHnYgL6vJGHb6b5F0uEtPG47fwxPXaF+LM6RSuZ83lugpnqqGD6C
	/rurMM9eTplqkfPE079OcYqL1lxDtFXQ==
X-Google-Smtp-Source: AGHT+IH/bMa/UPupLY8yaLZL/Kxr7RKmCkzRomqHJ9sWTdSyDPGE6wAZKNJtdb+hg0l0iaYL31HRXg==
X-Received: by 2002:a17:902:e811:b0:2a0:b62e:e012 with SMTP id d9443c01a7336-2a2f2836972mr220745215ad.38.1766703452592;
        Thu, 25 Dec 2025 14:57:32 -0800 (PST)
Received: from localhost.localdomain ([103.56.52.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm187308755ad.44.2025.12.25.14.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 14:57:32 -0800 (PST)
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
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v4 4/4] docs: rust: Add pointer formatting documentation
Date: Fri, 26 Dec 2025 06:57:07 +0800
Message-ID: <20251225225709.3944255-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225225709.3944255-1-sunke@kylinos.cn>
References: <20251225225709.3944255-1-sunke@kylinos.cn>
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

