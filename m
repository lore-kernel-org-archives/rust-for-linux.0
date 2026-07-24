Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B0367F36
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929825; cv=none; b=EWOZ6U7GcEOiOKANcpOcFQ22dP1AfcJxaAr5Fc4L2XUXJmYUTCESqlWWiP0GD5TY+HDX1XpYoclmrrL24DWdX/pL+eElkdRBkv6GN2Ac7iexn2pT9kOWqPqRqaBXDMBTGoTLD0Aen1SwlkUzEMESSVkL2sav0YiiEulSYNORyuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929825; c=relaxed/simple;
	bh=03n9LggzIahxNWd35SjZrfsEA6I24Ly/Dj3927O09JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgmvARgTDwSkV2nNsKtBh2bGK53MLyIwQElnMqeBTk8a1Hg0CN+hD/1FpYYJ9fIKyahY3vE+W5Vbm5dgTx3qGxQcOsvW6hfOFfV8IwIaBHw03mFkKiIOSJtnvzeEQ/dyNmQm7dTpXKaxTvnVWRe5BotaNQEt3baJWCFoQYJ2oRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdJf+APC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdJf+APC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6592845e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929820; x=1785534620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlatW4HpDr7thdKalku5Y/2w97piq1fA3NaBSGiIrYE=;
        b=SdJf+APCNr58zA1H9ihtrAP5f3+RhPeHr0kFmw6wOWMHSkdhipvosBoi7uyCbFBbo7
         JpWMWFDM04wWHXhwxpWoIif9MFIz4kJaKf+4L+FS68tklUIsG9r7vTk3GM66uuWGmGau
         hxZHxhV824qot99D/TfbXNNZ2whfI9V4VdktA5CYGPPZOCltBf0K8PfnsYDrp5SRxOhp
         s0HUYfUxxLiFar08Y/H2VeLhj3rApO6oXYWvd2Lz2QGGbZS0b7xv7GUODavOT8Myih7e
         ak4D7ESy0q8B0geYvi0XFMgVxh524+0S+Nm7hOuRD+z8pzKLu9syfQSg3eOjvAUIjNUO
         /Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929820; x=1785534620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlatW4HpDr7thdKalku5Y/2w97piq1fA3NaBSGiIrYE=;
        b=EK+ss43DyJc3BfZYoDPC1O5kwUqgZUBA8GkgBSxlcY3AkeYu64qGbX9J+P7IzilnJE
         YmoIQ7yrzCbA1mXi5TNHMG2bsGhIgkGOddS/4dAghzeuxftFsbkzYO/VY/FN4MxDjc28
         qQjAdLdA7nW6XQI8gsb5rMsUsZg6P1XywgAcEuOwE+VEG56DE/Dch9vDkpIeG1swQukZ
         5BZLi1zzfMl+K1nvvitYuPdTXSQ3p69Ho4kX7wejjmg/7kPKA0s1rBA4HLC+M7U7ZX2L
         92zZ/FhsNHfKfRRdlqCoyLxWGndut6eEcde1TH48OQQ/Aw/mkAGHZM5VHgJ0T/r/trtr
         wuWA==
X-Forwarded-Encrypted: i=1; AHgh+RrfrOfj4A9BKmL2T6mPRGnft6HJ72qHXjZDLYIGAOgjPfY87n021HntJAJ7jXf6JDtiOlZI4I4G3Qzm++Ww7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+I9fRUT1kgDVfnVHTZTKakwhEIqQnE633fxoGBQME4gPSSKY4
	XqIQ+Hf48+3tbqbDaW58y9JueJlyrvBsDL8ykg4ZbTzHpe8gTbgJhV9W
X-Gm-Gg: AR+sD12S5QkA56RBODuzSjB9etcSHvAVOmquv5d+rxv+mqSoA9qoxsZmbH75nZN1LiA
	DkBy69i2Tw5dwC+1xU9ltjPqDdMlxzBp+1CfsFt9vC8c1xiERCkAqcELO+dM35u72E3c0aAAsh0
	+BRgG0UG9Xvlm4wHwHTORVuTTBlb9bTXHhmPt0LlT70GfQEouIPnSeHvxXnNQRsrNMaBQiwqxqL
	zigXdNOn91eUTuh34cpaVy2wMny6e5CyjOLBxxaTY8AVGMVUvWZhm1Z/OrfIhQ1DM+5CsO34Ekr
	CHbmevF0VyAxinWcz5NI/wyOE2eLi1lIU3aSuA8bC2nU2t/Rp8zuhrYoiDGmOXXWdp1zFg4+wuR
	ndB3XsK/f0oQcvHRCVTRDXpcFOWEb2UxBMaDpk9yXIavvrqIHMxdu7ZXOSaUFAHJtHBcBV5jksZ
	R6gvMHbQfEHCr2qZ/S+6itmaFN8NAgwzhkX6tWJeZIop+pPb0F07IXbE8W
X-Received: by 2002:a7b:c3cb:0:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-496b571fef8mr495785e9.17.1784929819799;
        Fri, 24 Jul 2026 14:50:19 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm17588265e9.0.2026.07.24.14.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:50:19 -0700 (PDT)
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
Subject: [PATCH 2/4] rust: print: document safety of _printk FFI calls
Date: Fri, 24 Jul 2026 22:49:38 +0100
Message-ID: <20260724214940.1070221-2-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724214940.1070221-1-cianmcguire167@gmail.com>
References: <20260724214940.1070221-1-cianmcguire167@gmail.com>
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

Both are two ends of the same round trip. `call_printk` passes a raw
pointer to its `args: fmt::Arguments<'_>` parameter into `_printk`,
whose format string always contains a `%pA` specifier for it. The `%pA`
case in `lib/vsprintf.c`'s pointer formatter calls back into
`rust_fmt_argument` with that same pointer, synchronously, as one call
in a `switch` dispatch that returns its result immediately -- there is
no deferred use or storage of the pointer on the C side. So `args`
remains alive on `call_printk`'s stack for the whole time
`rust_fmt_argument` is running with `ptr` pointing at it.

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
 rust/kernel/print.rs | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..0e341262f83e 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,11 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: This function is only reachable via the `%pA` format specifier handled in
+    // `lib/vsprintf.c`, which calls it synchronously with the `ptr` that `call_printk`
+    // derived from a live `&fmt::Arguments`, before that reference's scope can end. `ptr`
+    // is therefore valid and properly aligned for a `fmt::Arguments<'_>` for the duration
+    // of this call.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +113,11 @@ pub unsafe fn call_printk(
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

