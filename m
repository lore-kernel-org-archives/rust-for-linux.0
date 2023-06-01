Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B38C7EE23
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Jun 2023 13:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbjFANvS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Jun 2023 09:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbjFANvR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Jun 2023 09:51:17 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572D21AE
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Jun 2023 06:51:11 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-95847b4b4e7so70158766b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jun 2023 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685627470; x=1688219470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CFWZiTMzRcsx84Z5SYXbngPTfzR7GjN80EhCOaRTPas=;
        b=6U1LmEILAkXt1ykhx/Ehu4FX/iB1ojm/m3YZhZZkMXOJ1AUeWEH2jlJbqb665k/3Zl
         UyRA+zunWEjQTWb6+7BglNY3ssL/IdWy8mC00gdGNfPYWvpX92UeVIpgmBeIVWJ7dWlg
         zA9q4amy/WFWI5coaOYgwbUHvE17fLTDf3pxodr/okPUFMqLBlKBIn36kKRjcDOmY/tm
         mTIKZ8119pOSw08AkUN26fS9yvv4y6RVrmd22szoQMDHDN5qguhwAG5ZeSbKzcNoZ8tk
         +dVRxL08TvQCZ+aWANc8BUah0e4E0MRnbTZid/0ie+ioPBhISLnEadvuBGWRLZhe/nWc
         CmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685627470; x=1688219470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFWZiTMzRcsx84Z5SYXbngPTfzR7GjN80EhCOaRTPas=;
        b=JwHzGIE4Y0IIB6CYxj/u1slFyx7c9a/jYtDeXhD8zvtJ4n+7KzfSsCBQzFifrBqXzy
         5o758N3gzlrti04yRgbXoNhOYTCaBd2DoYAOUdsfFSadmMI3dTpaknj4BmVr4Mz2XILL
         1IgiYCmXcqAtksk08lMPTRf993trWGtWJtVUSxEsZldfgn6jVygPKT++4TFtaimU0gKM
         +MeNVFVjDyeNx1F1c5Ime9/fpZZxwVH3/7tdM2mUMQG+6ITO0b13FsB5BWVl4KhQkUJk
         BOaRWzTgsGyDSANRqdkaDmDras4v3rc1I1fl/+cmwjoC+wvOeRH4pjHozZq84gPKBrBs
         laeA==
X-Gm-Message-State: AC+VfDwMwAn50YPRR3M7eUMOd4M5peNaUvvRRhiY9kf8GHWRSw58i26i
        cZrbueTS77A2jV6ZG1mDaXbAC2ODgGR5w5/o4ccN838KwhtI9GeXbD9BRiy3OZsAHdGimUGLtFu
        lVRHY+UT7urvG8ehmSwnjoViEUivNOV2L0QDEj9jBjcV5il5La6c2gSKO8vWNmR8hITxMW3pNj1
        Cat3zs
X-Google-Smtp-Source: ACHHUZ7ST9mZi4kYui3d3gUljsAefg4w47aEs4JF/TBbtRVokn5rwijE56vtX4t1Q6J90rRBY+JFA2F75r1jcsw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:9bc3:b0:947:f975:cc09 with SMTP
 id de3-20020a1709069bc300b00947f975cc09mr2209092ejc.1.1685627469897; Thu, 01
 Jun 2023 06:51:09 -0700 (PDT)
Date:   Thu,  1 Jun 2023 13:49:40 +0000
In-Reply-To: <20230601134946.3887870-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230601134946.3887870-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230601134946.3887870-3-aliceryhl@google.com>
Subject: [PATCH v2 2/8] rust: add offset_of! macro
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Wedson Almeida Filho <walmeida@microsoft.com>

This macro is used to compute the offset of a field in a struct.

This commit enables an unstable feature that is necessary for using
the macro in a constant. However, this is not a problem as the macro
will become available from the Rust standard library soon [1]. The
unstable feature can be disabled again once that happens.

The macro in this patch does not support sub-fields. That is, you cannot
write `offset_of!(MyStruct, field.sub_field)` to get the offset of
`sub_field` with `field`'s type being a struct with a field called
`sub_field`. This is because `field` might be a `Box<SubStruct>`, which
means that you would be trying to compute the offset to something in an
entirely different allocation. There's no easy way to fix the current
macro to support subfields, but the version being added to the standard
library should support it, so the limitation is temporary and not a big
deal.

Link: https://github.com/rust-lang/rust/issues/106655 [1]
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
---
 rust/kernel/lib.rs     | 35 +++++++++++++++++++++++++++++++++++
 scripts/Makefile.build |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index eaded02ffb01..7ea777b731e6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -14,6 +14,7 @@
 #![no_std]
 #![feature(allocator_api)]
 #![feature(coerce_unsized)]
+#![feature(const_refs_to_cell)]
 #![feature(dispatch_from_dyn)]
 #![feature(new_uninit)]
 #![feature(receiver_trait)]
@@ -98,3 +99,37 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
     // instead of `!`. See <https://github.com/rust-lang/rust-bindgen/issues/2094>.
     loop {}
 }
+
+/// Calculates the offset of a field from the beginning of the struct it belongs to.
+///
+/// # Examples
+///
+/// ```
+/// #[repr(C)]
+/// struct Test {
+///     a: u64,
+///     b: u32,
+/// }
+///
+/// assert_eq!(kernel::offset_of!(Test, b), 8);
+/// ```
+#[macro_export]
+macro_rules! offset_of {
+    ($type:path, $field:ident) => {{
+        let $type { $field: _, .. };
+        let tmp = ::core::mem::MaybeUninit::<$type>::uninit();
+        let outer = tmp.as_ptr();
+        // To avoid warnings when nesting `unsafe` blocks.
+        #[allow(unused_unsafe)]
+        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
+        // we don't actually read from `outer` (which would be UB) nor create an intermediate
+        // reference.
+        let inner = unsafe { ::core::ptr::addr_of!((*outer).$field) } as *const u8;
+        // To avoid warnings when nesting `unsafe` blocks.
+        #[allow(unused_unsafe)]
+        // SAFETY: The two pointers are within the same allocation block.
+        unsafe {
+            inner.offset_from(outer as *const u8) as usize
+        }
+    }};
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 78175231c969..819510694769 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := const_refs_to_cell,new_uninit
 
 rust_common_cmd = \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
-- 
2.41.0.rc0.172.g3f132b7071-goog

