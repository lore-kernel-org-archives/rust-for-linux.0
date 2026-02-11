Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B07634C134
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834565; cv=none; b=SDrnjuDLyzpwjrMbDcq6nmGNHhqyMk8tWpPFmqqr0B71lVhvGuGRA/bKSkWTdfqyx9wgeDXN3KK5CrLdVTBgig4yGHjyERBm0xQotHy1SO6KQqeerCqB/kjkGW0mo3zmH+qt9wIurloOr3/rN7MzV+3P4J/BZvXKug38iOzoItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834565; c=relaxed/simple;
	bh=WQpVW/oDOphVv/4uJd2OzbDiuRxqVxfbHqvvB7C+vho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktaxLq5bgdZoL9TXYH1D7FFIcwQHq9C80CKYpv39QcHrUPO6km7T1x4XbMKs69NuxJKzXJyEC3anzdQiOgoirukCG8LriAhnwOs06eOic1cigZ6tSLntg7wTvDaRU22joeM/dZHhGtWNN6HtQ1DydGyGNcg3TL280qtWHFKrVa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ta/bbJ3A; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta/bbJ3A"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a9296b3926so13677195ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770834563; x=1771439363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaABifRNKqssgfdqYHudelLxNmXQ+VSLCReMOwAkY2s=;
        b=Ta/bbJ3AMQ/AvKv52JWp+EYLkzoVAQkGKzDcLCgMbq4E7BO31j7DKPjw8EQWDRgJ5Y
         eZdBgfIk8YkUK8nuP4ArbmH725wrWT75Ic0/RZ2XT7TgsdA+TDVfZm9G/gALPztkXeJE
         ZkWi+abhTrtJD8iHUv9CY66fi8gPiQ0ZRMtOOJX4eJT7pxKSTfKQHPnzBOHoLkRB0zet
         1egB14QSkabpjqW+EmnZcPxL8TDQ5FxYuz06LvxGyNdhINdTtqeQE1GyASBbycMme1wm
         acKFsyXluyOTDUF+V7ocAY0BJeoqY0XYvAXu6yOgkX45R6YDx53otU+6dP8U6v6vEKnm
         v41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770834563; x=1771439363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaABifRNKqssgfdqYHudelLxNmXQ+VSLCReMOwAkY2s=;
        b=UjTDfqVbT0ucZ/i3YhipgRaaEKgSG/5QGgP76F1u/Ca0PeZiVijLw99a/Yj69jgSL+
         kl1wJ/+Sxqy7V0P/PqJXXrMNdq4O3sBpz2iyVIMIcqlQzVAkulexhtcf+RDa40rukDvj
         q6jd003qoRR/I7OrcaLcqHqaY22wkLlAij5KOMRrWigfC3jfvm/62qqZWNZSgDuaA8Wi
         3V3vlLkq5EcVk3g95dDCmQpUeULiMKtxFFxfTyN6YNyIfNQhFNCpNwl3NiVYYkVNDAbe
         ic708THpqJv9F72q2Zsubfel+uzBm2HpsCdpnKnsaakoWqxUUh24tpCDaZJwa5LC4LwD
         35GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvmXqbFKUWGyeJBEnkOeZSIc7mcxN5XViEKYPoYKjrWbkpjO20P6liBiPhYPo2UZg0xjGE3Cvgfq57jANGSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygD6bffnYKXm1wJBAQuw9TAD07HLWYgAmHHve6TDaRhuGIXER/
	CoNrc8gS9ktLczVfEQ6QtbexpMfuDhcJ3qu+BXim4AdHaZwJ3K3JIU+8
X-Gm-Gg: AZuq6aKCB8T4osJ+5rIwNhQ0VLZ5GLJpsm9SUlHqnhGpLcvLi+SLlGRzDSS51t9BQy1
	jobF6WlGhCy5r14a3MiZ57Q5oUtpdKlMxuyiR6o1GtNCMAGPl9ZZnuGQMmidOvue4fhWDPzfuYH
	xWjYzS9i0cG2WXmAbIz10mwe2uefwAegSY+JYP22v6m5QaDpypti94PHR+nOeswVo6RR4wLcE8Q
	P++KLgpGSXVT0m9wdZhrLtRT8pqYn+5RpgaRHf2iDQEuSLuIxi69UyRCsZVPotL3OKRul3lccbn
	/w+LvgoqDOXr9tbW+c5tji1Hvzj+Hhe3o7q+wKoU5ypy5n3bkKW+0t40otTms5uzv5OIyz/hYtp
	GWkYj3niNCMD6czEnvk5LGP18QC/scgUjn4spMuPo3Jz4ls10Jqju78dbOZfTpIrWR9G6zYxwPo
	p8H4bhxoPx4VEqVTmhyOYk
X-Received: by 2002:a17:902:eb83:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2ab3988c991mr267705ad.14.1770834563304;
        Wed, 11 Feb 2026 10:29:23 -0800 (PST)
Received: from nixos ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2986f532sm28762425ad.25.2026.02.11.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:29:22 -0800 (PST)
From: Shivendra Sharma <shivendra02467@gmail.com>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivendra Sharma <shivendra02467@gmail.com>
Subject: [PATCH v2] rust: print: add safety documentation for %pA handling
Date: Wed, 11 Feb 2026 23:57:55 +0530
Message-ID: <20260211182755.82220-1-shivendra02467@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CAO26r3Rh7WEYrH9ksD3ary=2OUSmYj372iCAGx=VsGnXAN4ySQ@mail.gmail.com>
References: <CAO26r3Rh7WEYrH9ksD3ary=2OUSmYj372iCAGx=VsGnXAN4ySQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing safety documentation to `rust_fmt_argument` and `call_printk`.
These comments clarify the safety requirements for dereferencing
pointers and calling the C `_printk` function, specifically
addressing the contract between `lib/vsprintf.c` and Rust regarding
the `%pA` format specifier.

The safety guarantee is made generic to cover all users of `%pA`,
including `seq_file.rs`.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Signed-off-by: Shivendra Sharma <shivendra02467@gmail.com>
---
v2:
  - Combined work with Muchamad Coirul Anwar.
  - Refined safety comments to be generic per Alice Ryhl's feedback.
  - Added formal "# Safety" section to rust_fmt_argument per Miguel Ojeda's
    previous suggestion.
  - Added documentation to include/linux/sprintf.h.
  - Links to previous versions:
    v1 (Shivendra): https://lore.kernel.org/rust-for-linux/20260128202130.196419-1-shivendra02467@gmail.com/
    v1 (Muchamad): https://lore.kernel.org/rust-for-linux/20260205042132.40772-1-muchamadcoirulanwar@gmail.com/

 include/linux/sprintf.h |  7 ++++++-
 rust/kernel/print.rs    | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index f06f7b785091..f915829cbba5 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -25,7 +25,12 @@ __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
 extern bool no_hash_pointers;
 void hash_pointers_finalize(bool slub_debug);
 
-/* Used for Rust formatting ('%pA') */
+/**
+ * Used for Rust formatting ('%pA').
+ *
+ * Safety preconditions are documented in the Rust implementation
+ * (rust/kernel/print.rs).
+ */
 char *rust_fmt_argument(char *buf, char *end, const void *ptr);
 
 #endif	/* _LINUX_KERNEL_SPRINTF_H */
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..15d4039a7646 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -19,7 +19,12 @@
 };
 
 // Called from `vsprintf` with format specifier `%pA`.
-#[expect(clippy::missing_safety_doc)]
+///
+/// # Safety
+///
+/// - `buf` must be valid for writes until `end`.
+/// - `ptr` must point to a valid `fmt::Arguments` instance.
+/// - The `fmt::Arguments` must remain valid for the duration of the call.
 #[export]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
@@ -27,9 +32,13 @@
     ptr: *const c_void,
 ) -> *mut c_char {
     use fmt::Write;
-    // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
+    // SAFETY: The safety requirements of this function (see above)
+    // guarantee that `buf` and `end` define a valid range.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: The C implementation of `vsprintf` (in `lib/vsprintf.c`) specifically
+    // calls this function ONLY when processing the `%pA` format specifier.
+    // On the Rust side, we always pair `%pA` with a valid pointer to
+    // `fmt::Arguments`, satisfying the requirements of this function (see above).
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +118,9 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: The format string is constructed to use `%pA`, which corresponds to the
+    // pointer to `fmt::Arguments` passed as the third argument.
+    // Since `args` is a valid reference, casting it to a pointer is safe.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.51.2

