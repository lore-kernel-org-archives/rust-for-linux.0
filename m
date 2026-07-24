Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E5476052
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936322; cv=none; b=oEQcV1E3fCjovQ9twLndWOrl7ionbDCirrYkVz9daNA9MbTr+G5doguMC0P9CfuXUUx9e2C1wr2Z3T8Kl/SfFW/JpBMqc0viUtseUiPAU2W5oGrLaw8EUGTX3l6u6NdR8QH2g3jvLRw8ZPh3JclgcZ33fNM/n0uj7Ph15EEgXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936322; c=relaxed/simple;
	bh=JDKyV4W2BjZg5GjCq6RIA2OL6ZpLVs/C1bKacsvhbqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhhUNtZ5IQNSisXP/HU5siFr90pvODYh2VGYkXBbXq9VDCoH63AfEJ5PJ1v7qIJxIV5BX1h+6zeY7gKjzaTgbISXzDRiVkkw3vmcPyTvi5O+7RVS0fg5vBkGcCLqZSG8Hk/HfZPl6aWp6FBS7ElHU1Q8PhpyGDuF8XyfI4OPJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDGyk31H; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDGyk31H"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4957eefd361so7448245e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936319; x=1785541119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyGCLZe7s+TVetzGO2XyQi/oKbitcaVFU4jBbM8ggUo=;
        b=aDGyk31HZK0Illd907KxU/2E5AkTj1rtrG5xqjdcV+pQ/V7lDG1/HAf4CJ7MXSLdo4
         P6RiFT5Z6VICWf69n5UxzGPZ58e5WA4YTgcUBEe3VnAAd+4XB0hycEjpxTn8KG8pjzsw
         yUKDOuJdllz6AA6ESgPRUz6NHyo7EGqlPORxsFbbIdXcmi4EGk2j2sQnWKDchfxKdJPG
         QHoUM8Cm6p4Fy5tVphH6bWQrecGSnFbDE+CLh4tYU5E/uVGlEsDX55uhs1YOm/7p134n
         epBFMV4/vN3275pYp/yyS/ylgf9Z31PthawSZXvltX4xCMfxqFRSb6vwD2TPSpYc9J8U
         QiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936319; x=1785541119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nyGCLZe7s+TVetzGO2XyQi/oKbitcaVFU4jBbM8ggUo=;
        b=f93S0ohyyEB2KJarPfNV1JCLjDQymvRk740MSlchyjM0ZW4Q4C+Trdn+2y5LO3nfoS
         B3Ner89NY+kGtTiSjuZ/7oD1UieNbqC26UyWST3xtg5wJX5J1SI7g3skzqR17UFryoat
         dOHOjZeKa5kX7rF5VlxbzGswOknVQG0CElP9Z17bneiRH4N59neJgKrEimNi/xykr85n
         3klZvhIcQUYbIwN3unuqKHqQfFywtTIfNQM9NgfYfZXXPppI6L1w11T8bGz5KLr3xlQk
         wK6b6zDMWfii/g4UGnnJn+fo0llluxKb+dt5GJ9M6LNUhEa42aivEDKGmJ0gM++mdNYL
         NEBw==
X-Forwarded-Encrypted: i=1; AHgh+RozmhTbb6tIFInBK10HjQow4aGFswSm40uB3HVy3D5W+RqNTURKYFRfU4lvcG/uYcsAjQeSCFxoQlTyn3rK7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkG3oLXCJETyusjH7Lj7rMZJbNixXIHXBfGsyogN9F+GG6qRUT
	+uOrHEZnQOf51FGAd+Z/pYFGYe6hLcZ2O6NQZosmZdMz2moGYBLSCQPY
X-Gm-Gg: AR+sD10wyNz1BiMFDrxsLaobrdK93K23T4DVCZYMHnpRR9n7UwX1dBDogPerL/MK/zW
	6Fu+QPjGmpoJwomVi7IA4TQ3jjnd3DHUuBEy4a+Lzh7yDYf30ZrlJbSal6aoAfDo6E3xpkqgtsN
	bGCACjfRUwdvCV+7zWYs5q9aE5T5bOlWQL2zHCKEZlbiU9Fz3vT7k15rIt2jV/fERWfGGVtbVnn
	gf49gwu+AGM9x0HxQbhVuJbIZZDmhB7U+Dvl+7EERX7pcKwYlB+HWGUtMy6ZuEXBNMRoz6j11ad
	L94aoY2o1X6oBvKAtu1fHnUWjsE5o918ukIIANqYFM6RHFaAkdkkWQoQZVlOoySo5aICDiatTX+
	jaMHxiYXUpJG+bw876usGkAbPqBy7+x7PfV/bTaTUy2eYr5hLP6fxyYUEauy+siKnYBH9uTeQ3+
	SG9klEYGygwc07HKVA/TO0fsMYlYSiNvq7uy2xawBLCE92WgLk/nWVZeQU
X-Received: by 2002:a05:600c:4295:b0:495:7990:a1d0 with SMTP id 5b1f17b1804b1-496b571a0c6mr2206105e9.19.1784936319091;
        Fri, 24 Jul 2026 16:38:39 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5f35a1sm72226775e9.0.2026.07.24.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:38:38 -0700 (PDT)
From: Cian McGuire <cianmcguire167@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cian McGuire <cianmcguire167@gmail.com>
Subject: [PATCH v2 2/4] rust: print: document safety of _printk FFI calls
Date: Sat, 25 Jul 2026 00:38:23 +0100
Message-ID: <20260724233825.1321247-2-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724233825.1321247-1-cianmcguire167@gmail.com>
References: <20260724233825.1321247-1-cianmcguire167@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two calls in this file had their SAFETY comments left as "TODO.": the
cast back to `fmt::Arguments` in `rust_fmt_argument`, and the call to
`bindings::_printk` in `call_printk`.

`rust_fmt_argument` is only reachable through the `%pA` format
specifier. Every in-tree Rust caller that uses `%pA` -- `call_printk`,
`device::printk`, `kunit::printk`, and `seq_file::call_printf` -- invokes
it synchronously with a pointer derived from its own live
`fmt::Arguments`, as one call in a `switch` dispatch in
`lib/vsprintf.c`'s pointer formatter that returns its result immediately;
there is no deferred use or storage of the pointer on the C side. So the
`fmt::Arguments` value stays alive on the caller's stack for the whole
time `rust_fmt_argument` is running with `ptr` pointing at it.

The `_printk` call itself is also justified by this function's own
`# Safety` section: `format_string` is guaranteed to be one of the fixed
`format_strings` statics (traced through every `pr_*!` macro, each of
which hardcodes a specific one), so its `%s`/`%pA` specifiers always
match the two extra arguments supplied, and `module_name` is guaranteed
null-terminated by both of its possible origins (`kernel::__LOG_PREFIX`
and the one generated by the `module!` proc macro).

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
---
v2:
- The `rust_fmt_argument` comment named only `call_printk` as the caller
  supplying `ptr`; it now names all four in-tree `%pA` callers
  (`call_printk`, `device::printk`, `kunit::printk`,
  `seq_file::call_printf`), since the argument applies to any of them.

 rust/kernel/print.rs | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..b2be5ab50f15 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,10 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: This function is only reachable via the `%pA` format specifier; using `%pA` from
+    // Rust requires the caller to invoke it synchronously with a `ptr` derived from a live
+    // `&fmt::Arguments`, before that reference's scope can end. `ptr` is therefore valid and
+    // properly aligned for a `fmt::Arguments<'_>` for the duration of this call.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +112,11 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: By this function's safety requirements, `format_string` is one of the fixed
+    // `format_strings` statics, so its `%s`/`%pA` specifiers match the two arguments
+    // supplied below, and `module_name` is null-terminated as `%s` requires. The third
+    // argument points at `args`, which remains valid for the duration of this call and is
+    // only read back synchronously, through `%pA`, by `rust_fmt_argument`.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.55.0

