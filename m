Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819E3A1A3C
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Jul 2026 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347615; cv=none; b=mNJmMMCUShzyAKbrbZi2ni5QB4TVYGNhfHkHurpiCgAm5mnnHSGlTTq0r2N4mxuMGm0GXZnHMuJ2vPsqnvyJaI40a+BHK7vac+uwYj/0c5r96m/723NiCQsPOUY9jNZsr05+TXZ1KD/Av5vP068WusMXVCB4sd9Rt2nHMgKocDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347615; c=relaxed/simple;
	bh=ZuhohfsfGK8qZ1od6jkDkls25a4U3lt9iE+o1rAw39o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrPqn/OKZQtLJDUpP5CJZGnSf5zXFRUY9iHIiSgrcX5RT4s1nUat5LxK8X7sJzFs0hzX3eLQ196DcsWN29BnUu+Ifqguat5/wXp5/QRdXHIcx26T4d5m1sm/K91D4bd07dbusd6J4Ub5KiG6U4+B0qrVvgZp2fJS8v0VyutKRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVeAwbkX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVeAwbkX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f97d310caso1251623f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Jul 2026 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347607; x=1785952407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+S9PMJhfL90g3gQkXITMLd3dkVmP3fQHpI001CMZSI=;
        b=YVeAwbkX8txcjNgonal3BDDX/U4ihui3gqW7A1v/YfP0xSfSp2mqIhW2DM4EcSCPHj
         blXEVcUSjk2/o8tq/D0HakF1vh9lSJRlsItL++cYyCg0gwm0Ndaz5Rl0PmSV8VXX9tgS
         lrRtK8OIXwNNaVvsD8J/amU8uezVFKdA0IRBCunbkFK3fqZHRkqKX1c71lt3Sd1yg0Dm
         mUUg4jveHMyoLoYCT25rF/Qs7C96IfYgJSdtDEywztBeAkv4Wx8zmyB3L4hO8gxr1nE4
         rs4S8KwdY4pwObzekFOAfzEN28FFb24baTAEMePQgKE4P1PUa10LtwZJ7zwcLQxl0HIL
         dIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347607; x=1785952407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+S9PMJhfL90g3gQkXITMLd3dkVmP3fQHpI001CMZSI=;
        b=eTJcehzIQ4UyZ+6gSLRn8maYTWWh9lTM5PjwdX0syANLitYCAGrQ+pga3mfOPLy0pl
         NTs5vCilNhz2MFHYQnMOMEGuiRd8DTMcMT2cHKcjsw9InJrAUbPx6uwvr6/OSoj5TOrn
         Y0+KFeJc4UVH4eBAEw/ZSo/isMB96QXe9gUaMSTw0DQ1yLKq/8Cm/0WjiJB/tJeFigiK
         doPqE9e+DnddXipVTnXJJYwyo/X1DtKRM/UIstj4h9wHlIU3e/qlXTDI2DP2fzzN9Sgt
         dYHgW9Fy2jGaZuqulNTeXl8mox5orqOZm7Ps9P7UfOjYlLldPNG4A7M1peTNpvOV9lu6
         E42Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqtw4mwR/3WimWylH25QAPZYKi6lcj17NCSzXwU3GWrApzuc5totX+f/0Hf9K2s3RX7iMdiu0vmDWZWEbRD/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55SaZXXjYBU+FkEZ3K2St0ZbETvlyaY/6fevii8kVnteEE7l6
	K4w1tbNO4jjuk2a3QcnGiOVLB/Os9hkNfiboDH532p1I36OySxuroZ4Y
X-Gm-Gg: AR+sD11aRyecF9sacR1dBD6KJXUdHuCvZGh/7H6eF5sTUFeKYqwI+ykZINpNuUmbZkB
	nw9jidI8gyxzhXPLWxEnmzswk7uS9i/fCYTTc/pPw6zfwAm83SwGwNMNtxE5U/u+955lTBIYdYY
	ojzLvx/inBrnRWHTQtBCfBPE2itEvbsE0EbtMavfjQ0P4gZbUWM1jKyri3r9AJxx7azLYQL7Hmq
	Amn09lKPaxGPJPx/qzSl5PDIuraUhz6i4ZX0SRE2ZObyCMoFXX3utYw0DQAivhKtdpMXgI4qhhb
	kmDXJSMkJgiT54tpeq2aoG2oTtPAfr5k0miuBLl40fqXBV/SgMM7gWhvCh6ZDVRtu1zZ/UQWcbv
	E2LEyg3O0dS08Ih/Tko1UsqcP8ybksxZ/LkQY0UykYT6kWRmlk4UGOdJTVxCaJVASLlKm8YZIZf
	5LYixQibQjIK712zBjsUk8Bvrl5/j4zKNk+SBUXo+2C5M3Jm9AoSo0XQNXtr654r/zqV5uYscdF
	8BaTTjNM8iM73wdeW6PsgL5Fmrtr4vf7898oaVhrok=
X-Received: by 2002:a5d:584a:0:b0:460:70ae:f1af with SMTP id ffacd0b85a97d-47fb1e9f9damr8878058f8f.27.1785347606865;
        Wed, 29 Jul 2026 10:53:26 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6acb6c9sm10833311f8f.13.2026.07.29.10.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:53:26 -0700 (PDT)
From: cianM167 <cianmcguire167@gmail.com>
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
Subject: [PATCH v4 2/4] rust: print: document safety of _printk FFI calls
Date: Wed, 29 Jul 2026 18:53:05 +0100
Message-ID: <20260729175305.723486-1-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726115929.82150-1-cianmcguire167@gmail.com>
References: <20260726115929.82150-1-cianmcguire167@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cian McGuire <cianmcguire167@gmail.com>

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
v4:
- Trim the `// SAFETY:` comment on the `_printk` call in `call_printk`
  down to what's specific to this call site (that `args` stays valid and
  is read back synchronously). The shape-matching reasoning it used to
  repeat is already covered by the `# Safety` section above it, which is
  the right place for it as a precondition rather than a per-call-site
  justification. (Gary Guo)
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

 rust/kernel/print.rs | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..3111f8f4c2e1 100644
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
@@ -109,7 +115,9 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: By this function's safety requirements, `format_string` and `module_name` match
+    // `_printk`'s expectations. `args` remains valid for the duration of this call and is only
+    // read back synchronously, through `%pA`, by `rust_fmt_argument`.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.55.0

