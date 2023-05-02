Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413CDC77B7E
	for <rust-for-linux@archiver.kernel.org>; Tue,  2 May 2023 12:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbjEBMxj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 2 May 2023 08:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbjEBMxi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 2 May 2023 08:53:38 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977B6E4D
        for <rust-for-linux@vger.kernel.org>; Tue,  2 May 2023 05:53:37 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-b9a7df507c5so7498224276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 May 2023 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683032017; x=1685624017;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yD3RHOmw2YonU9lq/qLKI0ISZtFJQuh0JdGUDdx5IQ4=;
        b=Nd8aPNd3NegOIXfFnsIObxs6yMD8V4tXgHyCuXTTN/BZDFLwElKICS86m6HIeGPcJo
         sa21trMsksNhMFTJpnRHFOxe6gNFa2PqBhWUMgMEqBNGYcOmhcrg8ei2+afLGBQtW/1I
         YIMFA+EfZnd6QWWaANQ6O85meD1Xgamv1yPKfhukbtXAhHP9s5JJiBaZJQdgAi8CTqMJ
         Qw+6goOIKN8vyJJALi4cHybsIVUi6VKK1rXv+P7sExw7GiS2FJJRPFi1pw8zKYjxwhbK
         Ccmy/M8HU8QnaK9dBM6FoQA3CxY0dQgSjB+fxgTqTuEnRE+Rb8jAuL2v7MM0U9luLK2k
         Agjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683032017; x=1685624017;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yD3RHOmw2YonU9lq/qLKI0ISZtFJQuh0JdGUDdx5IQ4=;
        b=THc1etcvW3I+AObKD5rqvX9lp2OGCiVbx0kNmlZOGokxS3AM/r+4Q1cV24idgX68wa
         Fy+LEPSzttpoub2NYKYYGoTAUjWPa/KYniqo8M1AsJTooNb5nURDEjYwHJG5Zc1t39fK
         mnPFZHgHMJKm+ZVjQL5W2a4BaJ+AAGP+BHruIXEcdfHOP+R68y+zfwsn8QCtOFL2osfL
         cfOs+vulg0drisrBe20SiT/twj+iW8tV4wYuXNCQBggxgvHC3QvxBRI6hJI7+QALWcc3
         68Ip4nS62MgQhE4w5aTy6mBbQbg/jAt+MgUQC5LPoA64Pu5lLDCW1RlFJqbp3l11eqJi
         16lQ==
X-Gm-Message-State: AC+VfDw3CyQiAYspWN7HW4Bc6SjEsnjdTFTjnRoseAbkpXFtXii/H/GH
        gfme+oMup1E0pHdm1//LqjUewv3pHWWh0j4=
X-Google-Smtp-Source: ACHHUZ5gPH29sQUYLHBCrXjx3vdTmEARKf1rg93iTFELyjd4V+wNVN9mwS0ZUXmZdt8eM/8Fc88lx09nESpYrVE=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:100e:b0:b8f:47c4:58ed with SMTP
 id w14-20020a056902100e00b00b8f47c458edmr10400410ybt.9.1683032016822; Tue, 02
 May 2023 05:53:36 -0700 (PDT)
Date:   Tue,  2 May 2023 12:53:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230502125306.358283-1-aliceryhl@google.com>
Subject: [PATCH] rust: str: add conversion from `CStr` to `CString`
From:   Alice Ryhl <aliceryhl@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

These methods can be used to copy the data in a temporary c string into
a separate allocation, so that it can be accessed later even if the
original is deallocated.

The API in this file mirrors the standard library API for the `&str` and
`String` types. The `ToOwned` trait is not implemented because it
assumes that allocations are infallible.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/str.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index b771310fa4a4..54935ff3a610 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -2,6 +2,7 @@
 
 //! String representations.
 
+use alloc::collections::TryReserveError;
 use alloc::vec::Vec;
 use core::fmt::{self, Write};
 use core::ops::{self, Deref, Index};
@@ -199,6 +200,12 @@ impl CStr {
     pub unsafe fn as_str_unchecked(&self) -> &str {
         unsafe { core::str::from_utf8_unchecked(self.as_bytes()) }
     }
+
+    /// Convert this [`CStr`] into a [`CString`] by allocating memory and
+    /// copying over the string data.
+    pub fn to_cstring(&self) -> Result<CString, TryReserveError> {
+        CString::try_from(self)
+    }
 }
 
 impl fmt::Display for CStr {
@@ -584,6 +591,20 @@ impl Deref for CString {
     }
 }
 
+impl<'a> TryFrom<&'a CStr> for CString {
+    type Error = TryReserveError;
+
+    fn try_from(cstr: &'a CStr) -> Result<CString, TryReserveError> {
+        let len = cstr.len_with_nul();
+        let mut buf = Vec::try_with_capacity(len)?;
+        buf.try_extend_from_slice(cstr.as_bytes_with_nul())?;
+
+        // INVARIANT: The CStr and CString types have the same invariants for
+        // the string data, and we copied it over without changes.
+        Ok(CString { buf })
+    }
+}
+
 /// A convenience alias for [`core::format_args`].
 #[macro_export]
 macro_rules! fmt {

base-commit: ea76e08f4d901a450619831a255e9e0a4c0ed162
-- 
2.40.1.495.gc816e09b53d-goog

