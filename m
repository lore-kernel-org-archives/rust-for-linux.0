Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EBB28DC7
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588623; cv=none; b=mM0u1DmNnqgIFwOpKH50jNTmdTYHBuIZlcmCgkE0Wp6hphCg0Q3tAovpROYmd4V7WvOthf1ddi3rTEcslK70ZYHR8fwN0zXVYrWuQPgKW03D9jGZdtjF1Hz+7qvv2fiz0Yjy+ZatALKOckzUuLQufcFKksMPJYHAxjBDj7QQ+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588623; c=relaxed/simple;
	bh=CsfuAls1TL2YV7CMFadTLsxtXkXtmg2JI5t9uRUkTZc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Date:
	 In-Reply-To:Mime-Version:References:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=GCXThJ8QbGeRorHol+ggP9YESEqxOTHPU0oNcvlUXvSMN73MXn6yT5/iZvXz7WbxZMFfe9+7X/z98ocnSJpj6DtWYKC8k11Aj9SqcaFh09e+Jn2x/p7jJICcOJBsGzMJzJ0S/djxMLDaqOELAOSjfEq+oWnvQ34U/TMYfz84TRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYtXRFKX; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYtXRFKX"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc2358dce6bso3130880276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705588621; x=1706193421; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmgH0qa3XVbjpGQhdkp6BesDtjCOSEZUBkhyiBWTkXg=;
        b=bYtXRFKX20WqqUNCOdLv5Q7Y/17bqb57fPhKDwLlTsgI34LY35PbHoUruVForWiowk
         eofZOhLD4xhjsNG63qJJjCx4i2p3elFlhoqE4Yao/RInjoeo6LJjv+TTIGThGzTsNRaa
         P96a7ew20nUND5yS2kcgv0ruHDzD/i4KO8kxS7ep1dNl+ww4c/FNQMabptsE3JAJxwxr
         xkjqW7VfxO62MFisgLAflhUfTgu3Q5WCfwj6PNDl5pmr5X8+JT/tS3SJMYqCq5JA9k7j
         OIETocJUxgEarAJbM4o67KJIS8k6XwB1mhH5qKHkpNXWyKaEBwGRsRnDGksd3yGn8JKm
         6FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705588621; x=1706193421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmgH0qa3XVbjpGQhdkp6BesDtjCOSEZUBkhyiBWTkXg=;
        b=YTn2G1WYlxh5O4RGEKyKaGddpjZLf/Ax/5zIbfLeB+sMqpZPGPR9LMVU5SjIbpB5sR
         Qkbk475MV7jM19K/81iQh0K5386SBWTXJ0jMfZ1eV1fLGfuDIO3zpTpHtOpvbXI9bnYR
         7IBM2Zl+esbJOVRHmQeuknCViTz5D8ghtrZA5ojdqqLZPDJVOd52OHJExblvR4Lc5YOT
         BI5nySBbhmrZbr2+C+SGOZ889pMt+C3QtKJpOjOw6MU7/im0RHMkN3kSlyUV1AAPpS43
         a8zshrQUr8G1WvRTW2DPfnpKtj51FDJgUBKS8aUxvEuWRHeqSzbq7yWyXXJp7CSFk/wt
         KD9g==
X-Gm-Message-State: AOJu0Yzhnbm1GhuX+b+O4O4djh0961lls2sWKIlAvvG7XB6+gBowBTRI
	5no0Nmokf40dWZCKob7aJ+cL6oEeiuJhxcaC8ws8kdTY4KMM01AjeWj0P8fGDSqynncvZLfnUl7
	1D/XjeM/7MXBFhw==
X-Google-Smtp-Source: AGHT+IFd5eF/+SwwUwTSFoJfRfKoNCQo/Wqsubanc6Pqgaxi4zooiLcuzZ1H4VgynAyCaBiNh7B5/8OxqsLC2/Y=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a25:d7cb:0:b0:dc2:4cca:7577 with SMTP id
 o194-20020a25d7cb000000b00dc24cca7577mr42715ybg.8.1705588620910; Thu, 18 Jan
 2024 06:37:00 -0800 (PST)
Date: Thu, 18 Jan 2024 14:36:44 +0000
In-Reply-To: <20240118-alice-file-v3-0-9694b6f9580c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240118-alice-file-v3-0-9694b6f9580c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6255; i=aliceryhl@google.com;
 h=from:subject; bh=CsfuAls1TL2YV7CMFadTLsxtXkXtmg2JI5t9uRUkTZc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBlqTHPjVUL1zehP8gc1SMJfGp9FtGF+NYrfZ3D8
 /AoIuEsBTyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZakxzwAKCRAEWL7uWMY5
 Ro02D/9kTb/8CRLZRUrxFSKqM82brI9ojK0ut4bbufbYBgISSYjp0boAOwrdi+OADA/EKJioacU
 B77Grno1bpyVpGB7WkixKv7QAwQcZGBLLrKvVWe1oBKpBaRuztogNZte3dFMT2yh+i8aZfEIKj7
 ixn0Km3PaEzkGYeMx925pyHL17H3LWgLDImSgTuorrnbxnDl0B9NlKHeMBihWFDwYBQQVmupw+Z
 61+Q3pKi0aXK+w8AcVQjo06N/DLgCQSHlgc8K+8vq3ClFu9XaSmyTFXq8ktEo201F+x3pRUdtUe
 QQFii/m01ASttjeQWXfMG7WEw0t8CUVu8itN5TFqsjk/puZTEYZALPJshFJREtCeMnYYrsoFa3w
 asFMeQ7TywEAzRHbKaLF8IMwRJVEijCsr+pJdZABZDUgDyH90SIVsu86AwerEG7CdC+Ju0dJ5eZ
 DHT/V8Agt8PZ+Qyj/ScctUUEyogo8AhYOHe1d/T3Hu5wtt17mFhGrt5b23oJlduzqJrThcyz5oS
 XrMbFQyssebdKpmE8ajDgl5wLRyY+CZf4+LCOjOXd2pwCsDwaIxDl485d0Rpr9aRrXUWK6xgyLG
 Fp20oqVvA1cJ9WkfnqxN71VF3ULdKgQgAZXfuvF/4+ti/GcNzwxQkbSYXRdurIMb1Lp+f7836dG U7qBuzoDTrJAueA==
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Message-ID: <20240118-alice-file-v3-3-9694b6f9580c@google.com>
Subject: [PATCH v3 3/9] rust: security: add abstraction for secctx
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Adds an abstraction for viewing the string representation of a security
context.

This is needed by Rust Binder because it has feature where a process can
view the string representation of the security context for incoming
transactions. The process can use that to authenticate incoming
transactions, and since the feature is provided by the kernel, the
process can trust that the security context is legitimate.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  | 21 ++++++++++
 rust/kernel/cred.rs             |  8 ++++
 rust/kernel/lib.rs              |  1 +
 rust/kernel/security.rs         | 71 +++++++++++++++++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 rust/kernel/security.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fb7d4b0b0554..0e2a9b46459a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/errname.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/security.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
 #include <linux/wait.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 10ed69f76424..fd633d9db79a 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -30,6 +30,7 @@
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
+#include <linux/security.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
@@ -177,6 +178,26 @@ void rust_helper_put_cred(const struct cred *cred)
 }
 EXPORT_SYMBOL_GPL(rust_helper_put_cred);
 
+#ifndef CONFIG_SECURITY
+void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid)
+{
+	security_cred_getsecid(c, secid);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_cred_getsecid);
+
+int rust_helper_security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+{
+	return security_secid_to_secctx(secid, secdata, seclen);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_secid_to_secctx);
+
+void rust_helper_security_release_secctx(char *secdata, u32 seclen)
+{
+	security_release_secctx(secdata, seclen);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_release_secctx);
+#endif
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indices.
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
index ccec77242dfd..8017525cf329 100644
--- a/rust/kernel/cred.rs
+++ b/rust/kernel/cred.rs
@@ -43,6 +43,14 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::cred) -> &'a Credential {
         unsafe { &*ptr.cast() }
     }
 
+    /// Get the id for this security context.
+    pub fn get_secid(&self) -> u32 {
+        let mut secid = 0;
+        // SAFETY: The invariants of this type ensures that the pointer is valid.
+        unsafe { bindings::security_cred_getsecid(self.0.get(), &mut secid) };
+        secid
+    }
+
     /// Returns the effective UID of the given credential.
     pub fn euid(&self) -> bindings::kuid_t {
         // SAFETY: By the type invariant, we know that `self.0` is valid.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 097fe9bb93ed..342cb02c495a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -42,6 +42,7 @@
 pub mod kunit;
 pub mod prelude;
 pub mod print;
+pub mod security;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
new file mode 100644
index 000000000000..e3cbbab6405a
--- /dev/null
+++ b/rust/kernel/security.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Linux Security Modules (LSM).
+//!
+//! C header: [`include/linux/security.h`](../../../../include/linux/security.h).
+
+use crate::{
+    bindings,
+    error::{to_result, Result},
+};
+
+/// A security context string.
+///
+/// # Invariants
+///
+/// The `secdata` and `seclen` fields correspond to a valid security context as returned by a
+/// successful call to `security_secid_to_secctx`, that has not yet been destroyed by calling
+/// `security_release_secctx`.
+pub struct SecurityCtx {
+    secdata: *mut core::ffi::c_char,
+    seclen: usize,
+}
+
+impl SecurityCtx {
+    /// Get the security context given its id.
+    pub fn from_secid(secid: u32) -> Result<Self> {
+        let mut secdata = core::ptr::null_mut();
+        let mut seclen = 0u32;
+        // SAFETY: Just a C FFI call. The pointers are valid for writes.
+        to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen) })?;
+
+        // INVARIANT: If the above call did not fail, then we have a valid security context.
+        Ok(Self {
+            secdata,
+            seclen: seclen as usize,
+        })
+    }
+
+    /// Returns whether the security context is empty.
+    pub fn is_empty(&self) -> bool {
+        self.seclen == 0
+    }
+
+    /// Returns the length of this security context.
+    pub fn len(&self) -> usize {
+        self.seclen
+    }
+
+    /// Returns the bytes for this security context.
+    pub fn as_bytes(&self) -> &[u8] {
+        let ptr = self.secdata;
+        if ptr.is_null() {
+            debug_assert_eq!(self.seclen, 0);
+            // We can't pass a null pointer to `slice::from_raw_parts` even if the length is zero.
+            return &[];
+        }
+
+        // SAFETY: The call to `security_secid_to_secctx` guarantees that the pointer is valid for
+        // `seclen` bytes. Furthermore, if the length is zero, then we have ensured that the
+        // pointer is not null.
+        unsafe { core::slice::from_raw_parts(ptr.cast(), self.seclen) }
+    }
+}
+
+impl Drop for SecurityCtx {
+    fn drop(&mut self) {
+        // SAFETY: This frees a pointer that came from a successful call to
+        // `security_secid_to_secctx` and has not yet been destroyed by `security_release_secctx`.
+        unsafe { bindings::security_release_secctx(self.secdata, self.seclen as u32) };
+    }
+}
-- 
2.43.0.381.gb435a96ce8-goog

