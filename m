Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C18C47088
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Dec 2022 16:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbiLBQRG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Dec 2022 11:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbiLBQQa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Dec 2022 11:16:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF9DE0741;
        Fri,  2 Dec 2022 08:16:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B1A06232F;
        Fri,  2 Dec 2022 16:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7045DC433D6;
        Fri,  2 Dec 2022 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669997763;
        bh=BWxOvrWLIfwcfu7Jhuioqwg9jJ3x2xImME+v7sDyUfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CiJAL/O5nYOueC3kMzcu/WJ9tWK+syLi//zvidOY+ZbCvng0QEwaqhkIBAOkYZ6tF
         YL7NSmDYhSNwX7NKIdzoWnnnLOayWhLxk5LTnuaailbdpw10e8uOH78PhaK2smqIS4
         5O6UYG3YS36WY07VHR5UNR+/9chYtNBmz1vcrQ1X5fnQHX+efxhXGZaXwp0Xw6Rt4h
         Axq2gozL7rgL2B48BeL/4z44odbI4wGlHRgvS34zlMaD6xYL98ph7cOV/awkD30FfK
         C828xpj1c+5fimCjg/KdsMZuiszP93w3mdSfsQFlXETPlLbcQiLxJ8sOJVbgPziFlH
         aFWxShjqHeZKQ==
From:   ojeda@kernel.org
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: [PATCH v2 12/28] rust: alloc: add `RawVec::try_with_capacity_in()` constructor
Date:   Fri,  2 Dec 2022 17:14:43 +0100
Message-Id: <20221202161502.385525-13-ojeda@kernel.org>
In-Reply-To: <20221202161502.385525-1-ojeda@kernel.org>
References: <20221202161502.385525-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Add the `RawVec::try_with_capacity_in()` constructor as the fallible
version of `RawVec::with_capacity_in()`.

The implementation follows the original.

The infallible constructor is implemented in terms of the private
`RawVec::allocate_in()` constructor, thus also add the private
`RawVec::try_allocate_in()` constructor following the other.

It will be used to implement `Vec::try_with_capacity{,_in}()` in
the next patch.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/alloc/raw_vec.rs | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/rust/alloc/raw_vec.rs b/rust/alloc/raw_vec.rs
index daf5f2da7168..c342f3843972 100644
--- a/rust/alloc/raw_vec.rs
+++ b/rust/alloc/raw_vec.rs
@@ -20,11 +20,11 @@ use crate::collections::TryReserveErrorKind::*;
 #[cfg(test)]
 mod tests;
 
-#[cfg(not(no_global_oom_handling))]
 enum AllocInit {
     /// The contents of the new memory are uninitialized.
     Uninitialized,
     /// The new memory is guaranteed to be zeroed.
+    #[allow(dead_code)]
     Zeroed,
 }
 
@@ -133,6 +133,14 @@ impl<T, A: Allocator> RawVec<T, A> {
         Self::allocate_in(capacity, AllocInit::Uninitialized, alloc)
     }
 
+    /// Like `try_with_capacity`, but parameterized over the choice of
+    /// allocator for the returned `RawVec`.
+    #[allow(dead_code)]
+    #[inline]
+    pub fn try_with_capacity_in(capacity: usize, alloc: A) -> Result<Self, TryReserveError> {
+        Self::try_allocate_in(capacity, AllocInit::Uninitialized, alloc)
+    }
+
     /// Like `with_capacity_zeroed`, but parameterized over the choice
     /// of allocator for the returned `RawVec`.
     #[cfg(not(no_global_oom_handling))]
@@ -203,6 +211,30 @@ impl<T, A: Allocator> RawVec<T, A> {
         }
     }
 
+    fn try_allocate_in(capacity: usize, init: AllocInit, alloc: A) -> Result<Self, TryReserveError> {
+        // Don't allocate here because `Drop` will not deallocate when `capacity` is 0.
+        if mem::size_of::<T>() == 0 || capacity == 0 {
+            return Ok(Self::new_in(alloc));
+        }
+
+        let layout = Layout::array::<T>(capacity).map_err(|_| CapacityOverflow)?;
+        alloc_guard(layout.size())?;
+        let result = match init {
+            AllocInit::Uninitialized => alloc.allocate(layout),
+            AllocInit::Zeroed => alloc.allocate_zeroed(layout),
+        };
+        let ptr = result.map_err(|_| AllocError { layout, non_exhaustive: () })?;
+
+        // Allocators currently return a `NonNull<[u8]>` whose length
+        // matches the size requested. If that ever changes, the capacity
+        // here should change to `ptr.len() / mem::size_of::<T>()`.
+        Ok(Self {
+            ptr: unsafe { Unique::new_unchecked(ptr.cast().as_ptr()) },
+            cap: capacity,
+            alloc,
+        })
+    }
+
     /// Reconstitutes a `RawVec` from a pointer, capacity, and allocator.
     ///
     /// # Safety
-- 
2.38.1

