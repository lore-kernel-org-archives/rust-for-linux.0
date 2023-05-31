Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17EEC7EE24
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 17:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjEaRpX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 13:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjEaRpW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 13:45:22 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62DA126
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 10:45:16 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba8337ade1cso13422983276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685555116; x=1688147116;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ixsxZNXu/M3OVZiMitemEDxPF4LdK6ucQ3Y5NhAgzBo=;
        b=HjBJ1RwOD8NBFHeZ93p5PlWWp7idk+djRZgJNBaOG+S2ZxyefEOxXiRFp1l0IH1rkd
         b0/o0lKY/7GSD04VQgECi4ljdzajwT06ogTKbJUw4jLBMDM6TJRAe/IoQVIU6Sc8veyD
         LFIZgDpz8t7kq95Gepu51pYqs6GCg1QcV8+7R+xX0BOZUdgYSoG22JYBZt9XUGqfuudp
         UGrK4Jd/9Iocz9dtvQ3xokWhzqps07uuCSMjkqLGTgOrj7Moipl6HnPHl6SjWV2PmzJT
         ED5dpjDTw3DY61odABawGqoawr39ZGrhtwIMAyVXSZba/z0es+7FyXS5slqkBXQjyoZT
         nFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685555116; x=1688147116;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixsxZNXu/M3OVZiMitemEDxPF4LdK6ucQ3Y5NhAgzBo=;
        b=b8qVVF9x/6iWnqYU0bpPESdGX3cqpzDlWPxToh70+oFW5eOcVfH+kjiuYbjJA6hd0v
         rtOABiOxVIGUFkkb+6UNBzKTkf9DOPcxo5iLytAAJlGPY1soqKmUeZOjaP99kE2fgDHY
         HtgjkfDQFQVNRKev58RDj5hpkfeeE1LZ9nGbEUhcchOZa4cEdFT7eyCOHu5EBrFI/YHc
         G3aVyv/BlcWreO0wva9w4VEFgIrYhKxujkegJh2W82G2mrzNY37KZ45DkvYHgb2oAIme
         /T2GlClwKYQSd1ZnSeBn6Zr6zincTaWuI5UedSdnL+B3EWngO9Ex+dcMPlyA91Z20Vwl
         ZM0Q==
X-Gm-Message-State: AC+VfDxRnrc46ERDMqwj6aUFn0iR3e1TBUNfCVXxfaXgjhzs+dhJZCVY
        V137vP76YhSmSq9H9tsBj9xsBglTyrHNttEvXjEJz8C+TT6WLF/saH2yn2tMp8uO6wIKRzDVXNq
        zDPAnByKdubnQ2AX5fvIqA1BU3BSoBV7SETl6xaL1bYkqV24FE/qNebZ1UT+EN9mq3HqQKUecaJ
        dkJkzD
X-Google-Smtp-Source: ACHHUZ55IUaRfDCO8+rKTBtQpf8sLbbhlT/ndhaIvhehFzwS9X3QN3q38STkEwIQoSNhMK4QiwGPewfj8QtFwlQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:84d1:0:b0:ba8:3401:a466 with SMTP id
 x17-20020a2584d1000000b00ba83401a466mr2646176ybm.6.1685555116046; Wed, 31 May
 2023 10:45:16 -0700 (PDT)
Date:   Wed, 31 May 2023 17:44:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531174450.3733220-1-aliceryhl@google.com>
Subject: [PATCH v1] rust: error: integrate Rust error type with `errname`
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Sven Van Asbroeck <thesven73@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Gary Guo <gary@garyguo.net>

This integrates the `Error` type with the `errname` by making it
accessible via the `name` method or via the `Debug` trait.

Co-Developed-by: Wedson Almeida Filho <walmeida@microsoft.com>
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
Co-Developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/error.rs            | 39 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 50e7a76d5455..dc8691f83253 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/refcount.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
+#include <linux/errname.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 5f4114b30b94..59ff362028d0 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,12 +4,15 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](../../../include/uapi/asm-generic/errno-base.h)
 
+use crate::str::CStr;
+
 use alloc::{
     alloc::{AllocError, LayoutError},
     collections::TryReserveError,
 };
 
 use core::convert::From;
+use core::fmt;
 use core::num::TryFromIntError;
 use core::str::Utf8Error;
 
@@ -113,6 +116,42 @@ impl Error {
         // SAFETY: self.0 is a valid error due to its invariant.
         unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
     }
+
+    /// Returns a string representing the error, if one exists.
+    #[cfg(not(testlib))]
+    pub fn name(&self) -> Option<&'static CStr> {
+        // SAFETY: Just an FFI call, there are no extra safety requirements.
+        let ptr = unsafe { bindings::errname(-self.0) };
+        if ptr.is_null() {
+            None
+        } else {
+            // SAFETY: The string returned by `errname` is static and `NUL`-terminated.
+            Some(unsafe { CStr::from_char_ptr(ptr) })
+        }
+    }
+
+    /// Returns a string representing the error, if one exists.
+    ///
+    /// When `testlib` is configured, this always returns `None` to avoid the dependency on a
+    /// kernel function so that tests that use this (e.g., by calling [`Result::unwrap`]) can still
+    /// run in userspace.
+    #[cfg(testlib)]
+    pub fn name(&self) -> Option<&'static CStr> {
+        None
+    }
+}
+
+impl fmt::Debug for Error {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self.name() {
+            // Print out number if no name can be found.
+            None => f.debug_tuple("Error").field(&-self.0).finish(),
+            // SAFETY: These strings are ASCII-only.
+            Some(name) => f
+                .debug_tuple(unsafe { core::str::from_utf8_unchecked(name) })
+                .finish(),
+        }
+    }
 }
 
 impl From<AllocError> for Error {

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.41.0.rc0.172.g3f132b7071-goog

