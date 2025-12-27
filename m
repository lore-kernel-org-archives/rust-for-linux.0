Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7401C7012
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 03:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766806836; cv=none; b=dy7E4QjEhX4MT/cJ8jdGXMVrtu+JB1bNqJRveMoe8Qn0Xsjun9uyw08stjsSMRShLkk8WQrxYSkHA/rShyvkhBpa5RUkyop/9WkLVVUnElKrpTCFfdefP5FfHWeedGfBXWS9DygOkTqw88S7R5hRegLl33ECJzzuEKfzP062DIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766806836; c=relaxed/simple;
	bh=5trTzWP1lja7QgW2Nbxdt+5FrAQb5B+HqFiJ/tFGn+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2+1NsB45bSPZXsisPWgVrsMEDjJ0GSHDMYQjutq8qv3IU7/1ovYl739VA1qmvtMCwVdS9JWh5QlswnS180FKuiJx2VBBBbQ9IfZkACSfLznMkkApChEZLOoOlSzfBwYbXLQbtunP4xTma67LWwh1bKljfFmFYmKtkx2/Jt/Lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a2ea96930cso87922275ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766806834; x=1767411634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eiGB8oXhegfDuwpDui4+XsxBRPl2FrgBVzFQBSYcUyQ=;
        b=ub2UJqBx4cjTCpZRlUrXD+aHTGdSStPEn7GlHTFLoLbB8AlyuuVVtip4yEKaxRj6/Q
         2H4L5QdP6ApO/sQakkG8R5mzMHv4xWIpYbJ8WLhUYpLfaKxwlW3XBfEaQc9aVCzC9+C4
         yC0MepU90fFIeMhqyoPfasvBwzqpQyBCBsmu6YpVwgMdquG2gvhXQg5G82Y7mO1T/Ug0
         GH513yuhZhBm06b+heHfQRQK79aL4RzrjOhdyRsRriwrY7wYbF72gbtb//u0zxOq44mA
         naAxn1fss1QNTZhi2fIBMLdSA2bK7rfDOF0iWTJw9azRLAxNURuq8MgRU43HfCWR4HV4
         8J1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhyTq/gX/LWlNVJx4JyUCOknoVrKWuTaNB6a0fkBRBtr4uFUuG7NGChd+BAigp4k/IyCEZm8KIeBndfG26nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qo3JuAB/wq02NLYtghoC6APmCEDKT1CCatI068M5vZ95MQBP
	b4aig70k8nlTO0BFJ4LjkCQa9sVtbtoJniDbs8HUxfbFkfWiX9zk+BjB
X-Gm-Gg: AY/fxX6sevELNILenVE5IEJnySdNHPVreZ2JOJdfOCUntIXHBFU62WQa/dk155KqJ2R
	CBxH6L29nCw7JHglpZO5EDNLmeJ0/v7mvYk1QC+S19B1uGyvhMEYSteDpxcw1PBSkjWnn6di2BR
	sfxzrczEDR8cnWFGm+BFY/5Q1kRIH4dxysUOX2gxp+CKClvCKfNErFbhuNd6BClkfB4bxSjsJb3
	GboemTVzi/LvjWltW22+l3qOoVPuBvTA3Ean1vxUUHBiHljUFlKHvKnwK1drA73CJ+E/r3jvmCo
	w692KKbUV2C74o8RoeGEl8LKkOg7Sx+zzBBx+kS6YAzubvVNvFo2UQ/nDfhwXXQ8HtOXRkSYw41
	/oop/1AWlkJRBPy7OcFZCbtMJfzHHAGHvz6E8sr/uIeBtoeS2jtrYhrwsEY7M7suE6p0ipVF5sL
	Fzgk6I3RkcE4+4VH84LRMWYBA7lRPv6/xs+pOIi9bLKgplnfO4e95lm785NIZPs/AyqQ==
X-Google-Smtp-Source: AGHT+IHLxMWKeiuZAHBKsepvtsD0YaXLnpJ2vDDzK3VdBFeDGlkU55ge70MAc1iXDV7XlVNG7FF3Pw==
X-Received: by 2002:a17:903:234c:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a2f2736de4mr220241215ad.33.1766806834253;
        Fri, 26 Dec 2025 19:40:34 -0800 (PST)
Received: from localhost.localdomain (61-221-120-112.hinet-ip.hinet.net. [61.221.120.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm215323135ad.44.2025.12.26.19.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 19:40:33 -0800 (PST)
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
Subject: [PATCH v6 4/4] docs: rust: Add pointer formatting documentation
Date: Sat, 27 Dec 2025 11:39:55 +0800
Message-ID: <20251227033958.3713232-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227033958.3713232-1-sunke@kylinos.cn>
References: <20251227033958.3713232-1-sunke@kylinos.cn>
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

