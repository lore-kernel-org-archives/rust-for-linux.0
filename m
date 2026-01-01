Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C3125B2
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767255381; cv=none; b=bX+IbiK2gvuaWb6Xl/26JyppXEea8OzXJIsDCz3pkEBgOOgdHLgGwnE+GJLtrY5wFiNFHmVFpJBo//gxd5cTB+8C5/acyBEddkoFt6oGO4M9/TejulBrlIvMwYvuKqaaUfYq9HxCCKGmFFbZ+Kyk3YeHEkVg/SpM2QHuj8FiW7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767255381; c=relaxed/simple;
	bh=0BJi+PTrLEQMI8hj7JVEGXazvlFrZDsFFUoOnk8dLac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=stKsxJZUABrlfmC0yKumkvzHM8GTUSFI21X9zgUuoD4HgiwnLkQ1aZlwaL0YkJtVv0wBnD5igkjUoSg6gA9Zdcy9HVQoLXf2lJdOk/oPCWCRYQ8oj3Z5wNRRDywFU0TsJbc/THgjZPBYiUmF2RWOiQJ6Sl8V5EaKf4Y30s1r4EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0c20ee83dso145126525ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 00:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767255377; x=1767860177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4exeRR49mY5t4EDoiFPlc4f73GWpuyK5DZ4VOtMqSDo=;
        b=EeRRghhMR8NgvF7Sr3ZgQHaP1g6LMaou1nGhTs3Ax3NBuwDDMGRBUB356MB4yDA48Z
         8evheTjgrukn7G4pT7GnC7fV5Z7znQPpEejMvCbI6vVgxoBcmlMtUj4mPvD4MP7LThY2
         cXoLvBkWugofA/J2lQPiESdHJd7nJvOFdMlblgu+YW0+I1kFXWeKrOY9EUJBaWaYpByK
         jDS4BB9xfcpilmfdvvyAp6HdzdGhq2rCKf8XBtzRGV7VgIoS6s4tM6n+Xhnukth694Jt
         I0F4grD8IKQX6kwKCbnO3DRsoO2nRuozeikshVHLM4FnFYNyKEaNcotll05AOG60B/Vt
         /JcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE1H5D1n/PO3/djo4DwEcXM0METcx16uE+gy+UG+c90uHiD4rBrL7x24XxBDPljcL+QGqqsJImhYUDKIyVhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbDnLCRxdZ9vQBl03SQkhMGDOf9IuB6UFmNWCqK1DqFItqqxy
	uByPUxwtoiZn8PoLsDVE+l6RYPT0LXpdCZESVmFzaaAGAMktwSengdnb
X-Gm-Gg: AY/fxX72KZZfUF8rf1vS2knP+FnUoaoO6EFDDRRwBGJda8k+x3qEb3zkO1VJtFrIaHB
	4o9207YZ9XoBy0oKzPwEQdwJllohS5hQe8i7dwYMbW2MSm+0PU2VeWZXTznS4B4yODmLr8ZTouB
	XrF+7B/EMlXVWATJYKnibCq2kph22mAhbcMw4dICklty+MFAt89ylJKn5CQFVjy+uj/EOvztWmL
	2r5/eK9OieR6yIkqT/AwficBmwbjgDWJo3VCqgU9s8yKhb92g6+n/fsbR1EmF8ap1BsKtHwAt1D
	/XFiWxJDIgEW9E0mytcmD7fvlyJPtd52OkpSfDfQwaMazdqqUZUaufZi4/8O5UenEA0ETJpC/S6
	YDCGi4TMlS07rkOGKyftKAK+P5DOzkQ/eqcevKqeFZraZ5SzBaGSKvoBvt5FEwccOqlcmDGtxE4
	qotd7X5cq5DQnNPjREn+abN8a5DjDrlF5ZKmY3RAjRK7/PDcymE4Zrweg=
X-Google-Smtp-Source: AGHT+IHAVuvelAQh/cB//m6b0GiYT8g+QUu7G+vPkcGl4sK8F58eP6dI24/tUWbRGj+nQJFAtSJ83w==
X-Received: by 2002:a17:902:e550:b0:29f:87f3:9c22 with SMTP id d9443c01a7336-2a2f2c4cc02mr420917365ad.52.1767255376517;
        Thu, 01 Jan 2026 00:16:16 -0800 (PST)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm342457585ad.3.2026.01.01.00.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:16:15 -0800 (PST)
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
Subject: [PATCH v8 0/4] rust: Add safe pointer formatting support
Date: Thu,  1 Jan 2026 16:16:00 +0800
Message-ID: <20260101081605.1300953-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds safe pointer formatting support for Rust kernel code,
providing two pointer wrapper types (HashedPtr, RawPtr) that correspond to
C kernel's printk format specifiers %p and %px.

The implementation ensures that raw pointers are automatically hashed when
formatted with {:p}, providing safe default behavior that prevents information
leaks about kernel memory layout. Users can also explicitly use wrapper types
when they need specific formatting behavior.

---
v8:
- Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
  EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
  pointer wrapper types (HashedPtr, RawPtr) for %p and %px
- Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct construction

v7: https://lore.kernel.org/rust-for-linux/20251229072157.3857053-1-sunke@kylinos.cn/
- Refactor kptr_restrict handling: extract kptr_restrict_value() from
  restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
  improve RestrictedPtr::fmt() implementation to directly handle
  kptr_restrict_value() return values (0, 1, 2, -1) for better code clarity
- Remove Debug derive from pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr)

v6: https://lore.kernel.org/rust-for-linux/20251227033958.3713232-1-sunke@kylinos.cn/
- Fix placeholder formatting to use `f.pad()` instead of `f.write_str()` in
  format_hashed_ptr(), ensuring width, alignment, and padding options are
  correctly applied to PTR_PLACEHOLDER

v5: https://lore.kernel.org/rust-for-linux/20251226140751.2215563-1-sunke@kylinos.cn/
- Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs using kernel
  vertical style with alphabetical ordering
- Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed Clippy warning)
- Update type ordering to alphabetical (HashedPtr, RawPtr, RestrictedPtr) in
  fmt.rs macro invocation

v4: https://lore.kernel.org/rust-for-linux/20251225225709.3944255-1-sunke@kylinos.cn/
- Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve formatting
  options (width, alignment, padding characters)
- Improve code structure: reduce unsafe block scope, use early return pattern
- Add doctests with formatting option tests for all pointer wrapper types
- Enhance documentation with detailed formatting options section, including
  examples for width, alignment, and padding
- Fix RestrictedPtr example to use pr_info! instead of seq_print! in docs

v3: https://lore.kernel.org/rust-for-linux/20251224081315.729684-1-sunke@kylinos.cn/
- Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
- Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
  rust/kernel/ptr.rs corresponding to %p, %pK, and %px
- Make raw pointers automatically use HashedPtr when formatted with {:p}
- Add documentation for pointer wrapper types

v2: https://lore.kernel.org/rust-for-linux/20251223033018.2814732-1-sunke@kylinos.cn/
- Disabled {:p} raw pointer printing by default to prevent accidental
  information leaks

v1: https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke@kylinos.cn/
- Initial implementation that directly printed raw pointers
---

Ke Sun (4):
  lib/vsprintf: Export ptr_to_hashval() for Rust kernel crate use
  rust: kernel: Add pointer wrapper types for safe pointer formatting
  rust: fmt: Default raw pointer formatting to HashedPtr
  docs: rust: Add pointer formatting documentation

 Documentation/rust/index.rst              |   1 +
 Documentation/rust/pointer-formatting.rst |  90 +++++++++++++++
 lib/vsprintf.c                            |   1 +
 rust/kernel/fmt.rs                        |  64 ++++++++++-
 rust/kernel/ptr.rs                        | 133 +++++++++++++++++++++-
 5 files changed, 285 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/rust/pointer-formatting.rst

base-commit: 7839932417dd53bb09eb5a585a7a92781dfd7cb2
-- 
2.43.0

