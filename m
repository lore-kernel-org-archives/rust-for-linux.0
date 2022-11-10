Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA1EC43217
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Nov 2022 16:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiKJQpj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 10 Nov 2022 11:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbiKJQpN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 10 Nov 2022 11:45:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBA11EEF5;
        Thu, 10 Nov 2022 08:43:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 58B12B82248;
        Thu, 10 Nov 2022 16:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B66C433D6;
        Thu, 10 Nov 2022 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668098623;
        bh=YyjXthwblgrT88DPLFu+XIPGLqjTiZLg+Xpj0PN4MaE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QFqr9Y8X7Tigp18oliUFzjQmBK/C7AIWjnahKOX9XFUZZ5k9p85F+b9YrWQFAyT6R
         kiHrrN4NzdKIK6lQ+4RjaJYDQgUlMiv0QuklOB8XekHJQ6Ysoy0dS4dtNvmrqvQhdv
         l3dCz2qtsKyKXo7WA6yNgMjlYukM0Q1v076iwo2Jfao8Ae+HwmO5X4Wlx+yAcSb+dv
         +N81e4BkTfSkXnSlRCTkczSZujt3Pnqb4yGsIwqE8iRK4++IDcFS+IE8QltD74JVUl
         dDJnqLBcCYfVH1M8riwd/2iDGhBca/3oUv4BOxobeWiW/83LlxoWUiIwmTBA8QSC3p
         sIndo9vYAzXeQ==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: [PATCH v1 28/28] rust: types: add `Opaque` type
Date:   Thu, 10 Nov 2022 17:41:40 +0100
Message-Id: <20221110164152.26136-29-ojeda@kernel.org>
In-Reply-To: <20221110164152.26136-1-ojeda@kernel.org>
References: <20221110164152.26136-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add the `Opaque` type, which is meant to be used with FFI objects
that are never interpreted by Rust code, e.g.:

    struct Waiter {
        completion: Opaque<bindings::completion>,
        next: *mut Waiter,
    }

It has the advantage that the objects don't have to be
zero-initialised before calling their init functions, making
the code performance closer to C.

Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
[Reworded, adapted for upstream and applied latest changes]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/types.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 3b0c44769708..e84e51ec9716 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -2,6 +2,31 @@
 
 //! Kernel types.
 
+use core::{cell::UnsafeCell, mem::MaybeUninit};
+
+/// Stores an opaque value.
+///
+/// This is meant to be used with FFI objects that are never interpreted by Rust code.
+#[repr(transparent)]
+pub struct Opaque<T>(MaybeUninit<UnsafeCell<T>>);
+
+impl<T> Opaque<T> {
+    /// Creates a new opaque value.
+    pub const fn new(value: T) -> Self {
+        Self(MaybeUninit::new(UnsafeCell::new(value)))
+    }
+
+    /// Creates an uninitialised value.
+    pub const fn uninit() -> Self {
+        Self(MaybeUninit::uninit())
+    }
+
+    /// Returns a raw pointer to the opaque data.
+    pub fn get(&self) -> *mut T {
+        UnsafeCell::raw_get(self.0.as_ptr())
+    }
+}
+
 /// A sum type that always holds either a value of type `L` or `R`.
 pub enum Either<L, R> {
     /// Constructs an instance of [`Either`] containing a value of type `L`.
-- 
2.38.1

