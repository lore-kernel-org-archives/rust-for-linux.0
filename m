Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB927470
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339128; cv=none; b=kKWi50wRwiYo+KGGS9ThYTtomiwWB2cDUpeofCOi3AmzqyV+umOhUkxfyedeKakid3UjvH5Q9TJbQZlLM8T0831ehwkZdPbVt8OBUChpkArZsHSOMZS6UrKlL40mF2YkdG34n8Nz6z+mJkXfImSzlmNmURGD9oVLAaL80sqDLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339128; c=relaxed/simple;
	bh=bLbBGQLPgKabmaMcHhQl50O3uaf0DQRD6w50oOIWODI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WR79ZOluVan+dygLlvJNAp5vmbnGxFKr7+mk7dcxUG2xOi4iC1WBTpwxSAPDzrv7A1DGKlR0vEBex0MLTDiWzJFgJ29N6b1wJiJfVAde8/u/m4nRpYL9gKtsX0yrPV3pDiKVVKuw2tOCsnPXmsfchFYYWwIhi9ER6wYY4P1tXok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DI2ROite; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DI2ROite"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297d4a56f97so39777155ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763339126; x=1763943926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/H7XSBOw7BlW+9nCrBS/pF+jzg/15IlEfGhcGHidks=;
        b=DI2ROite9BNJLC3Y5TMYJdUXvPrafCejnLZ8KsXuZby6SthK/AwyIazV8+p4jP8RzL
         ZYT2a4ApBcAAUa0iA5OgfIWS9t5a56unAkyP9VTEbyP+mrB/VStzQwalg1ErjcIgrkV1
         J2LtP98Mg0eol+nOcA+n8bC0F/5uMM8TIVxqVcpc4Hlyl434Za7ipQldgIB+Tlt/gahe
         eEJWoipwQqHW6zVpp9/CMlu3yYuaB9nK7Rybag+rw/F5tG52nj8UH2H5iRi5L+Sp8K48
         LC+XiA4kHil1qn/lqeoCNb6/s20F5jiDdikoyd4yhqOhxUBtk2P59LBX//9ls6b4E2cR
         pLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763339126; x=1763943926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/H7XSBOw7BlW+9nCrBS/pF+jzg/15IlEfGhcGHidks=;
        b=De9deRGCMoHCMtgH1hOQSAC3vV5aOLZFayXU9DgcIadbdNL/HsTCIeRY7kIGyFOpry
         kOwEFcUUS4Jmh2FE0VlHNk7dWL5zMenNK29Ip0q32+pZPeQ4b8U76v8IVXC/FXP2vslU
         5QPhC4ytxVv/MzF4bQInU4kJhtF54KLBYX+doDRuwGcnI3RYsA6nrdltJi3227gfB3Sf
         ArT8kFo6nEmsjAz7Ywonv8CBl6ENVHDfMKiuhze2uBXUNRgmgnLHFVr6zzpqa+qnSrHP
         jVz3xKs92e+X3xz/DzhbaKZ5zSBRU5ES3JExbmQdo4bBns1jmIFJ4p6hEGPPRuxJZttP
         Bbqw==
X-Forwarded-Encrypted: i=1; AJvYcCVzM00zqiV/FIvAngGKyyG6H46FYUbx6gXJ8du8v5xauSzBWMwWclLmPiNabGsCYEqH6XWmExCTJ4BTgf//bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qKRFoo8n3bXUDsWY3xsKhNxkrwIAI8Raf7Udu0vXI4NtqbqD
	8wE67r9phVmdHPQZF2HeRASwdGYTEnHXOpDGkKfLZamplCpKYlfdc80q
X-Gm-Gg: ASbGnctLwViPMUCh1HlVgp+xNyFUO/8i7QtEa6BvtLJQrPQU/P02+4TImYpAqD2f8BM
	8A07T5K0GNmR4lwiuGnhyel5qHedtqq7LoB9QV+cRefuREezVtdlFLv9UHQYDmihKgD3bcDhBzh
	oQz0WLl6Uf5dcSXvQt9MLDs9uBA1aIi1dh4HDC+ONQpfvCSy07N3TKB2Y8ml4wVqXOupdQJ3ls4
	01jQ5ZacCNAOvJ8bbqMPfdJNRvCtQFfgPLa6T+rJNyuel/hsQ3G7t+wb7Ciq2FiOy88AFwOrITR
	npTmRTdAiavsoCE9Fx3CkbzdulNNVr9SXX80jqPtW1xEX0QOCYnckjW6Ciq6yXnoWNnrxTVyzzL
	w8Kgb1vjtf8QLFf9CmZE16iqRpH1YTJCwnXgxPKzlOFt1oF1yZnOISzx9ZkbBxPtjclxLhXx/3X
	Gt0cgLxLRCthRgh8uq/C3aRIuTdsbRbwejCPliX2NWpbldsPcC
X-Google-Smtp-Source: AGHT+IF/Hph4B1pxDJL+qngKgk1Ch2ExtXPonbpdYLwxhgV31jUMwuax+6yHHjNz6yIddijMIvANHw==
X-Received: by 2002:a17:902:d58a:b0:296:3f23:b909 with SMTP id d9443c01a7336-2986a72cabbmr131384855ad.39.1763339125764;
        Sun, 16 Nov 2025 16:25:25 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c249908sm118263105ad.45.2025.11.16.16.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:25:24 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	boqun.feng@gmail.com
Cc: bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v3 1/2] rust: Add support for calling a function exactly once
Date: Mon, 17 Nov 2025 09:24:51 +0900
Message-ID: <20251117002452.4068692-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
would be possible to implement the feature entirely as a Rust macro,
the functionality that can be implemented as regular functions has
been extracted and implemented as the `OnceLite` struct for better
code maintainability.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/print.rs | 83 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2d743d78d220..af32054be5a2 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -11,6 +11,11 @@
     fmt,
     prelude::*,
     str::RawFormatter,
+    sync::atomic::{
+        Atomic,
+        AtomicType,
+        Relaxed, //
+    },
 };
 
 // Called from `vsprintf` with format specifier `%pA`.
@@ -423,3 +428,81 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// A lightweight `call_once` primitive.
+///
+/// This structure provides the Rust equivalent of the kernel's `DO_ONCE_LITE` macro.
+/// While it would be possible to implement the feature entirely as a Rust macro,
+/// the functionality that can be implemented as regular functions has been
+/// extracted and implemented as the `OnceLite` struct for better code maintainability.
+pub struct OnceLite(Atomic<State>);
+
+#[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(i32)]
+enum State {
+    Incomplete = 0,
+    Complete = 1,
+}
+
+// SAFETY: `State` and `i32` has the same size and alignment, and it's round-trip
+// transmutable to `i32`.
+unsafe impl AtomicType for State {
+    type Repr = i32;
+}
+
+impl OnceLite {
+    /// Creates a new [`OnceLite`] in the incomplete state.
+    #[inline(always)]
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        OnceLite(Atomic::new(State::Incomplete))
+    }
+
+    /// Calls the provided function exactly once.
+    ///
+    /// There is no other synchronization between two `call_once()`s
+    /// except that only one will execute `f`, in other words, callers
+    /// should not use a failed `call_once()` as a proof that another
+    /// `call_once()` has already finished and the effect is observable
+    /// to this thread.
+    pub fn call_once<F>(&self, f: F) -> bool
+    where
+        F: FnOnce(),
+    {
+        // Avoid expensive cmpxchg if already completed.
+        // ORDERING: `Relaxed` is used here since no synchronization is required.
+        let old = self.0.load(Relaxed);
+        if old == State::Complete {
+            return false;
+        }
+
+        // ORDERING: `Relaxed` is used here since no synchronization is required.
+        let old = self.0.xchg(State::Complete, Relaxed);
+        if old == State::Complete {
+            return false;
+        }
+
+        f();
+        true
+    }
+}
+
+/// Run the given function exactly once.
+///
+/// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
+///
+/// # Examples
+///
+/// ```
+/// kernel::do_once_lite! {
+///     kernel::pr_info!("This will be printed only once\n");
+/// };
+/// ```
+#[macro_export]
+macro_rules! do_once_lite {
+    { $($e:tt)* } => {{
+        #[link_section = ".data..once"]
+        static ONCE: $crate::print::OnceLite = $crate::print::OnceLite::new();
+        ONCE.call_once(|| { $($e)* });
+    }};
+}
-- 
2.43.0

