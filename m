Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B819D095
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773648; cv=none; b=Uz+Ys/UMq7yhTv4XLnGJo/h/eKpacKH3o3L1J+Ndz8luTk1mW7xguuWkDe6iqhkWErGaExxEi4FFD9I4ehP1pe8LLjGl2DEjLXDTuDMC0xtob1/7LM3uO1r0n+CdSDpXsS2uHnn+Bh+gkgNZ9fUUmJADULIp2E8Q1J1e7V2QXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773648; c=relaxed/simple;
	bh=U/0i22kNrA1tDzRJKeF4+zviF/lA9MFw9WKnRtiuR2o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gFaKaH2RIGxhqmg5+gpBxuAQCbDhb8bGEnbcTuJJ78EXcAMqVLgsO0KnF4ImcrpNXO2CHCT8WVrNCCFxOHgdYkMSaNZJN2PwiaVTUSoHum4SkqtBAFfhgvJ4LOByfn9DcMGao/wKKqqNrDzrgDcHNFQTlXsPqI+FwRk22dlVmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SecvBdft; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SecvBdft"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e0082c1dd0so104230137b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727773645; x=1728378445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yoKDQi0r8wbYcqAYza+qd9SS3eEkfqLLzK4aTuWZSMA=;
        b=SecvBdftSPd4/uq6/t6coXtbEWpDw8hsrsaHqsLKAMiwSyEjKNugCNNBhfClkxroXi
         /l18GRNHTaBRUBlvfKynCZW+kUb0QQsMBq/Xmx9xa40dtM+wmHTD1CWsd7sGvY0ucUSN
         mwkhI5WgXIuJd1osnnkcC+lji8FpAEPspVTV2auiiuKsP1DwKEVWtvxsQlU9wYddUbcG
         7+JZ6xyaEhYDHii0zcvpPz142pUpwE6X07BzYHJm2gHrmGJfIJq4vxXfNPs1z6KtXY78
         9SwL8WwVizUe/2PreFdc/n7itN3NiZqpUHUMnsrVqdJ+PM2B9Rrt9siGeB04vWzvx97d
         caMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773645; x=1728378445;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoKDQi0r8wbYcqAYza+qd9SS3eEkfqLLzK4aTuWZSMA=;
        b=rmZ2tt+9m93yCP6mWMdyX7ULxhzDE4+u46XadoSAMQb6620Xt2E70DnJM7Lx8C7G4Z
         Vugs6gNNFJb9sgftDNPRyO7JoWLxg3dBMXOkc4bW8WqxO4HSscPaikh9XwYc0Lg9KlSU
         XuiOVrTKHjwEev8ONnPsxs466TTUqUh6ci16sj4pT3ckWdsUauKKP8Cz5VieYQN54Ave
         RRJLu1v1QEiC/bAqjQd9I3NPXnrLGhkzCylpntXBGcYoe23ffIjaDoyWqfeM/A7He4yZ
         zmgfPjVJqlixLNXt/prReDZ8ovtguHEmG0/Zdl48Z7rh7mWtnbKHzScjgxWLLZ67NHwY
         dT3w==
X-Forwarded-Encrypted: i=1; AJvYcCUcDH2aO/qovf7m4jmZc/ddshmt3vS5d3J//B8jIdEqMs4fEdZCIvkeoQ4PhEsKSMY/TUwqZ3LzbDVePgT39Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KtwLIDAcq77gHIu9JDUrmLMKddUvzQpzHNQ5VjulgHKI00qJ
	ShY9MznAoS52GmBYiw44dX4gWSXsiC2w9mo4sCW1mLEWQWgbfwnl5QtjMQjio/SCwQDq3JWT4lu
	7j5G0qIA6xZGcLg==
X-Google-Smtp-Source: AGHT+IFKluXh5UbQs3Dh59WxAVP5LkVfvSvhj/dQ8vpSnI8/rLgur9z8Ejs4MoaNSbJe+XASrpKhjwBFxhyWRW0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4285:b0:6db:54ae:fd0f with SMTP
 id 00721157ae682-6e2475d5026mr1045187b3.7.1727773645312; Tue, 01 Oct 2024
 02:07:25 -0700 (PDT)
Date: Tue, 01 Oct 2024 09:07:02 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALW7+2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwND3eLUwrTMnFRdS8MUIyMT4ySLVEtLJaDqgqLUtMwKsEnRsbW1ACw xhgFZAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4109; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=U/0i22kNrA1tDzRJKeF4+zviF/lA9MFw9WKnRtiuR2o=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+7u6teqEnvzUE5GDG9wow47s78hZyUSaWdMQ2
 SvDzUzFXOSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvu7ugAKCRAEWL7uWMY5
 RqXWD/925ORtPpCeovZgOyee0ZKqC3vWoRgO0exjTSeuuM9ZsMHNemXjPtNjTZN+vhsRXlOpugY
 eTsnbGZcjF5Cn7KzLt3ZjrT696/44xTAoegjE25E8y1Mn8phiZP1QG69UoD+2WAX3u00ZeX0UoV
 IKjYdQ6sHa+wRIu6SsVS0q3XnXHVKEMuOyJcIKz0218ty2dMS1BpaI8MkjG6zgL5yq3QjNVTo1N
 i2Vi9axRAZh2y5wytWwy+BBtIZgcaPvz3I9Xrx/A1Ak6BCZB8B2sUTUpXWzQoTSpq8OPrlxDeGR
 Nc3pwiGZkUtf21JRY4quQJiLHwXnHNydx/CJJt/kk8VICYkKhddacBHxNvfTwSnzjDPIUlzQ5nN
 68/LvQOJEUdkswssK1Jg9MSkJsWqkFodVbImbintgodQsaws5X2N97ER6EqkuLSBJZnQrr3V6Ec
 OLffj0k69nuaKs+Ev0vUjwY0bQH9+7dbwZOsrhiYD5mcY355Hu69vGLL91NBWcWEztZS166iUeN
 iQLVUlAxTHNU8i0oDBkzGat1PWC1ym6Xf9IPwcKlkspbne1loTId9IYFTCSOdACIvMbV3KNixaW
 erd4Ar5Sh5nsPwhMfG+83ds/sVDFhOV3ZNl9aE4o5Xy9jbgVBa7bgoI/eQrppClMMeZ2iMa93pe 67ONpvEwqaf9T5Q==
X-Mailer: b4 0.13.0
Message-ID: <20241001-seqfile-v1-1-dfcd0fc21e96@google.com>
Subject: [PATCH] rust: add seqfile abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a simple seq file abstraction that lets you print to a seq
file using ordinary Rust printing syntax.

An example user from Rust Binder:

    pub(crate) fn full_debug_print(
        &self,
        m: &SeqFile,
        owner_inner: &mut ProcessInner,
    ) -> Result<()> {
        let prio = self.node_prio();
        let inner = self.inner.access_mut(owner_inner);
        seq_print!(
            m,
            "  node {}: u{:016x} c{:016x} pri {}:{} hs {} hw {} cs {} cw {}",
            self.debug_id,
            self.ptr,
            self.cookie,
            prio.sched_policy,
            prio.prio,
            inner.strong.has_count,
            inner.weak.has_count,
            inner.strong.count,
            inner.weak.count,
        );
        if !inner.refs.is_empty() {
            seq_print!(m, " proc");
            for node_ref in &inner.refs {
                seq_print!(m, " {}", node_ref.process.task.pid());
            }
        }
        seq_print!(m, "\n");
        for t in &inner.oneway_todo {
            t.debug_print_inner(m, "    pending async transaction ");
        }
        Ok(())
    }

The `SeqFile` type is marked not thread safe so that `call_printf` can
be a `&self` method. The alternative is to use `self: Pin<&mut Self>`
which is inconvenient, or to have `SeqFile` wrap a pointer instead of
wrapping the C struct directly.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/lib.rs      |  1 +
 rust/kernel/seq_file.rs | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ff7d88022c57..bb6919c4e9bc 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -49,6 +49,7 @@
 pub mod sizes;
 pub mod rbtree;
 pub mod security;
+pub mod seq_file;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
new file mode 100644
index 000000000000..6ca29d576d02
--- /dev/null
+++ b/rust/kernel/seq_file.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Seq file bindings.
+//!
+//! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
+
+use crate::{bindings, c_str, types::NotThreadSafe, types::Opaque};
+
+/// A utility for generating the contents of a seq file.
+#[repr(transparent)]
+pub struct SeqFile {
+    inner: Opaque<bindings::seq_file>,
+    _not_send: NotThreadSafe,
+}
+
+impl SeqFile {
+    /// Creates a new [`SeqFile`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that for the duration of 'a the following is satisfied:
+    /// * The pointer points at a valid `struct seq_file`.
+    /// * The `struct seq_file` is not accessed from any other thread.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file) -> &'a SeqFile {
+        // SAFETY: The caller ensures that the reference is valid for 'a. There's no way to trigger
+        // a data race by using the `&SeqFile` since this is the only thread accessing the seq_file.
+        //
+        // CAST: The layout of `struct seq_file` and `SeqFile` is compatible.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Used by the [`seq_print`] macro.
+    pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
+        // SAFETY: Passing a void pointer to `Arguments` is valid for `%pA`.
+        unsafe {
+            bindings::seq_printf(
+                self.inner.get(),
+                c_str!("%pA").as_char_ptr(),
+                &args as *const _ as *const core::ffi::c_void,
+            );
+        }
+    }
+}
+
+/// Write to a [`SeqFile`] with the ordinary Rust formatting syntax.
+#[macro_export]
+macro_rules! seq_print {
+    ($m:expr, $($arg:tt)+) => (
+        $m.call_printf(format_args!($($arg)+))
+    );
+}
+pub use seq_print;

---
base-commit: e9980e40804730de33c1563d9ac74d5b51591ec0
change-id: 20241001-seqfile-91d2243b8e99

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

