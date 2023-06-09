Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3464C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238520AbjFIGy3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238532AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991913584
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=8474; q=dns/txt; s=iport;
  t=1686293653; x=1687503253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hvmcYLLQwyj2fVUyo+C5N4srEGMGuktJBQxn7Rx7rHE=;
  b=DbsNk5jyNoTCdD4Xu8wAyBNKTHLBcCd5wRWoHzqhPzKSRmHx4jnf/zb/
   8DwawWl03htDp4JUO8NNWW0CreOCacD3tkSvfFPTZbGqQnfn6FpsupCFS
   JOY6+gomV8/jj+KE1vFS+tTuYKF18wnbwF+Yrb6Mo/N97vtFdO/LsGPPv
   4=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857698"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:40 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID8055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:40 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 14/80] rust: kernel: Rename from_pointer to from_foreing and into_pointer to into_foreign
Date:   Fri,  9 Jun 2023 09:30:12 +0300
Message-Id: <20230609063118.24852-15-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/kernel/file.rs | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 44086d398731..586c0b386b5b 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -330,7 +330,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
             let fileref = unsafe { File::from_ptr(file) };
             // SAFETY: `arg` was previously returned by `A::convert` and must
             // be a valid non-null pointer.
-            let ptr = T::open(unsafe { &*arg }, fileref)?.into_pointer();
+            let ptr = T::open(unsafe { &*arg }, fileref)?.into_foreign();
             // SAFETY: The C contract guarantees that `private_data` is available
             // for implementers of the file operations (no other C code accesses
             // it), so we know that there are no concurrent threads/CPUs accessing
@@ -349,7 +349,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
         from_kernel_result! {
             let mut data = unsafe { UserSlicePtr::new(buf as *mut core::ffi::c_void, len).writer() };
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -376,7 +376,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
             let file = unsafe { (*iocb).ki_filp };
             let offset = unsafe { (*iocb).ki_pos };
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -397,7 +397,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
         from_kernel_result! {
             let mut data = unsafe { UserSlicePtr::new(buf as *mut core::ffi::c_void, len).reader() };
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -424,7 +424,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
             let file = unsafe { (*iocb).ki_filp };
             let offset = unsafe { (*iocb).ki_pos };
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -441,7 +441,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
         file: *mut bindings::file,
     ) -> core::ffi::c_int {
         let ptr = mem::replace(unsafe { &mut (*file).private_data }, ptr::null_mut());
-        T::release(unsafe { T::Data::from_pointer(ptr as _) }, unsafe {
+        T::release(unsafe { T::Data::from_foreign(ptr as _) }, unsafe {
             File::from_ptr(file)
         });
         0
@@ -460,7 +460,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
                 _ => return Err(EINVAL),
             };
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -477,7 +477,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
     ) -> core::ffi::c_long {
         from_kernel_result! {
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -495,7 +495,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
     ) -> core::ffi::c_long {
         from_kernel_result! {
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -512,7 +512,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
     ) -> core::ffi::c_int {
         from_kernel_result! {
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -540,7 +540,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
             let end = end.try_into()?;
             let datasync = datasync != 0;
             // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the
             // `release` callback, which the C API guarantees that will be called only when all
             // references to `file` have been released, so we know it can't be called while this
             // function is running.
@@ -555,7 +555,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
         wait: *mut bindings::poll_table_struct,
     ) -> bindings::__poll_t {
         // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
-        // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the `release`
+        // `T::Data::into_foreign`. `T::Data::from_foreign` is only called by the `release`
         // callback, which the C API guarantees that will be called only when all references to
         // `file` have been released, so we know it can't be called while this function is running.
         let f = unsafe { T::Data::borrow((*file).private_data) };
-- 
2.40.1

