Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2E37CD30
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Jul 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785067200; cv=none; b=M6qT4xBXqDDefK9Yr0ERH+6tT21diLsm0UxH8YI96ULWQZ+sLQtisiZcgFzSPO9AghjiU4C9qmiLjWx8O7Nn3rnH1PjAmSQ40EmmeskQoiE63AjMN+5zULX6nIGoJSqUjePXkSwCgqbOYwAAsqKF3KAoh823vfS8+nlepD75nnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785067200; c=relaxed/simple;
	bh=JCLyLY8dgae/Sbwod2BMdY5luNYoPvnPa3MTPFhmmz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N+DPh9BrB1uUafqSAsYkuvd2ZGdlwfNsRhPopOxl8Pl5xyeQ2xnGaiVl8kz1pHwirRMoR3B2ItqSGjx2dv0zUgtzsj1jZqPvypfWR/mZZVdiHn+QJHmFRhTEs9/L6fCRvXk1v+a6c3ZWhuxynMfT1QOy0TxsdwgtfTM0ovhE3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myuEDAx9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myuEDAx9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso897195f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Jul 2026 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785067197; x=1785671997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADI/xa4fDOzHJVmDEfZGbvJQDEVg86zgIrIj9McDiRY=;
        b=myuEDAx9gQIoPH2Ijy6vqnSsVV3/datlDC8zpVAT8UzANc0ssXgYtZi++/iYTkFlqF
         mtM/fWvkbq+LyTUeukDTPqEDiDk5JF+D1pMxsQsVMUaZbgKxnvZG32iZJ6TxCRu04PVr
         n0rLDPKfZMR/5gPP7AXHTuAkliAZsW52IrMXdRuAJXSLS4T0G5A4iZxn8+wErZLRYUj8
         CRMC5VVk1UQ1enM2GW2GvgUzCjQlGSlKSJ1kE6ZuJBaj5bbumdeCEMNPIFirphDarl4X
         lX244bJkMhTCVJu5RIxGSLGxB7vRGiwmjkhRgeqXQZC68tuKXD9pTw9l28rxTYu2lDm2
         eNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785067197; x=1785671997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADI/xa4fDOzHJVmDEfZGbvJQDEVg86zgIrIj9McDiRY=;
        b=mR4D+OGfVIYRRoEz3ZRFWOFbCVLDMe0vaRR/m2F0ClkN83/S2BwJ9LKJWcvyq+EYrL
         PHm3GvA7B5uHqexYjGvWhweJwfmr0U3eJSW3RzztgpiUvfKoR0LQVr9UezmAFYBNSuhG
         TwZDV4ANKqo4BHrj4H+BAYcrCjWoM6GkXRNNzDulP7EGj9kerzQKHe2i9GlyiYx1McaA
         rYU3wWGAODaVZE9mvLSsOw8OGxkT7YLRLIWJYdk/zCPXwNfEefqr+NcMMn1fMj2SL/sn
         vJiTxETmTTiuv8siLBm7BH7tvAKAwpQOmp0T/oYCgRfXa6jCYztT6x7OpEfqvMdJOAdm
         FeQQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/gl2iadUnuVUcgqUWF1W7ynOH3kXg8orZoXEr/kNf4E/BW6BwSAYCngRDOiK9kJAE0x12P3NA3KTYs2khkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9ucuME7MLv0UoOe3sGBQ0chGuH8qQNsTz74I4E3YlVMikdGw
	BxLW/wqlC3RWsvRwos29IYjAAy379IypM40SXlqHnsvpVfUbiIs7jheE
X-Gm-Gg: AR+sD10+Q8mOmetGozWelkhevNVsLR3/l9KYJxKiEKGQDtt1bWZPYfZGx916w0ikNcs
	PZxOh+1kv0kjh7XRnFae2s8Yt79O+zVamVwlUsmYzvONibVufYC/sINshPfAqAMbxWBZZ+6ZQdK
	CuTIoDR8q0F3K2vn3tBOgQsp0QcNGkyk+3YW3I6atn3hQfbMjus8it0K4GoirJAEzMXnl/biTc2
	hxG67L5t0XEBuBtqDBFIcO1g8lPB8GTMiROo1IRXhro4I2hqeWpgW3E02N/JrFKduf2Sq5xQgbb
	KWl8aBkFnEK6XYHIzWWmKJHlrCyW+qcbdq94DYLE+9IHQnTEnU9K0sO9YNqGW/ueyAbxiYaHI/2
	uB+ZMtFTeTTPnQKjqJvRe7ByY8dTkrPjuTYxxwOZyQnmKG76i26p1GWBz/7HqJ34pDfOH1VXLSl
	S07bU0632DO1//rc5RZJanoRBkJUeOfNdkifiFKsvRJOGxuaPH3RvCxi/R
X-Received: by 2002:adf:e191:0:b0:47f:962a:9f4d with SMTP id ffacd0b85a97d-47f9fc8cee5mr6266416f8f.15.1785067196500;
        Sun, 26 Jul 2026 04:59:56 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm39094265f8f.33.2026.07.26.04.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 04:59:56 -0700 (PDT)
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
Subject: [PATCH v3 2/4] rust: print: document safety of _printk FFI calls
Date: Sun, 26 Jul 2026 12:59:29 +0100
Message-ID: <20260726115929.82150-1-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The `_printk` call itself is justified by this function's `# Safety`
section, which this patch also tightens: `format_string` must be one of
the non-continuation `format_strings` statics, not
`format_strings::CONT`. `call_printk` always supplies two extra
arguments -- `module_name` for `%s` and `args` for `%pA` -- which only
matches the `"%s: %pA"` shape shared by every non-continuation string;
`CONT`'s format string is `"%pA"` only, so passing it here would make
`_printk` consume `module_name`'s pointer for `%pA` instead, and
`rust_fmt_argument` would then reinterpret that `*const c_char` as a
`*const fmt::Arguments` and dereference it. No caller does this today --
`call_printk` is only reached from `print_macro!`'s non-continuation arm;
the continuation arm calls the separate, safe `call_printk_cont`, which
hardcodes `CONT` together with the single argument it expects -- but the
previous, broader contract permitted it. With `format_string` guaranteed
non-`CONT`, and `module_name` guaranteed null-terminated by both of its
possible origins (`kernel::__LOG_PREFIX` and the one generated by the
`module!` proc macro), the specifiers always match the supplied
arguments.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
---
v3:
- Tightened `call_printk`'s `# Safety` contract to require a
  non-continuation format string (i.e. not `format_strings::CONT`),
  since the function always supplies both a `%s` and a `%pA` argument,
  which only matches the non-continuation strings' `"%s: %pA"` shape.
  Passing `CONT` under the old, broader contract would make `_printk`
  consume `module_name`'s pointer for `%pA` instead of `args`, which
  `rust_fmt_argument` would then wrongly reinterpret as a
  `*const fmt::Arguments` and dereference. Updated the inline SAFETY
  comment to match.
v2:
- Reworded the SAFETY comment on `rust_fmt_argument`'s cast to argue
  from the property that makes every `%pA` call site safe (synchronous
  invocation with a live `&fmt::Arguments`), instead of enumerating
  callers by name, so it doesn't go stale if a new caller is added.

 rust/kernel/print.rs | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..5a0ee103b54e 100644
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
@@ -96,8 +99,11 @@ pub mod format_strings {
 ///
 /// # Safety
 ///
-/// The format string must be one of the ones in [`format_strings`], and
-/// the module name must be null-terminated.
+/// The format string must be one of the non-continuation strings in
+/// [`format_strings`] (i.e. not [`format_strings::CONT`]): this function
+/// always supplies both `module_name` and `args` as arguments, which only
+/// matches the `"%s: %pA"` shape used by the non-continuation strings, not
+/// `CONT`'s `"%pA"`-only shape. The module name must be null-terminated.
 ///
 /// [`_printk`]: srctree/include/linux/_printk.h
 #[doc(hidden)]
@@ -109,7 +115,11 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: By this function's safety requirements, `format_string` is one of the
+    // non-continuation `format_strings` statics (never `CONT`), so its fixed `"%s: %pA"` shape
+    // matches the two arguments supplied below: `module_name` is null-terminated as `%s`
+    // requires, and the third argument points at `args`, which remains valid for the duration
+    // of this call and is only read back synchronously, through `%pA`, by `rust_fmt_argument`.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.55.0

