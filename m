Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1BDC77B7E
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Jun 2023 13:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbjFAN4Q (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Jun 2023 09:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbjFAN4P (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Jun 2023 09:56:15 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E488518C
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Jun 2023 06:56:13 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-568fd72993cso36868777b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jun 2023 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685627773; x=1688219773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TyRNG5KT1C+kxxh+8DvNZVfySdIBr+c+luuNQvW24B8=;
        b=rqoKpkOtbw5E7aZUP5vKjWc3Rud11Cj869FSLBYeNDUpqqAOXnkZIPl7lj5T2v5p7s
         DmMa94afp5CNZFk1ywR4ew+ffsOd7nOjrFz827+LCZEp8XI49xI9Wdw9RtCEvPkuo8im
         TbhBhsVdo138vg3Nl4AMaccmsNOCCPZENyu59Kaii+poHD6Mc9UdWgsN3jNMxvyt2W4I
         y2/H0+6GzKgtGlccHAiV83rBObv6Oqk4nXU9rcSvjnEk0GniwrycnB1qvh3JpmxgcBKs
         vNmUwJcJLMtZRaxTJ5rpjwixRZNRXubZmOhOpkg300KRq2lF92feTXVc6m+zgHMAsqIc
         FyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685627773; x=1688219773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyRNG5KT1C+kxxh+8DvNZVfySdIBr+c+luuNQvW24B8=;
        b=fMNH9IecERT4b03pvOVcDIsT5zWa1Y0Q/KcECrU4QQXDc8mGPrKHEgC2+dfRsn01Mv
         SMUw9inhQBjSY0McgWsrZgNUikqBheCftPm7lqxiGtNXTDMoGo+sivECmBCEA9i+Bf3e
         cwkKnaD3ptUMKRXLlAyF2tXYQ7QDhHum7FpggpdOMkE0791U7gv321jpFDc6iI+DNKKc
         PTMeeVphMGMatT13atFBbMVx/42yfFAEzfAGz6UXAhb2UrxDnx890PotVgb4GxBjluuq
         e5bV+fJvlDxF9J3qkJmHlaRBGrwmPyu82TWlJSe+ENtk2V3x09ymB17q1htnDNrS/r5Z
         S6uQ==
X-Gm-Message-State: AC+VfDzD+SWLAkEuYXwHzrEiOsb8USzem6b2cPO8gDdgdK0SE59TKoEJ
        PiblO+TMTgRCiV4Qpoxiu+ETJmddVpbhSd1ujCK8A4IzIStFJQ5ziuurAvC4sh1MasJYHwSMN8k
        dc5AZNgI/XjuViv0bcKzR/Nz+T9EklLPIkeUnyB6fBLPSllS9Exp7TpF8KjvD9Q+6z95lSDvUs0
        h8rdxM
X-Google-Smtp-Source: ACHHUZ5aHph4tvkKB0c6QYrmRqC0Hw9+Se7T+ePGC68o9O2DFJVKozkWFG8onb0G18ETbUursPX9HxukD6gKR/M=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:7813:0:b0:561:ec3e:62fd with SMTP id
 t19-20020a817813000000b00561ec3e62fdmr1402978ywc.5.1685627773081; Thu, 01 Jun
 2023 06:56:13 -0700 (PDT)
Date:   Thu,  1 Jun 2023 13:49:44 +0000
In-Reply-To: <20230601134946.3887870-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230601134946.3887870-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230601134946.3887870-7-aliceryhl@google.com>
Subject: [PATCH v2 6/8] rust: workqueue: implement `WorkItemPointer` for
 pointer types
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
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This implements the `WorkItemPointer` trait for the pointer types that
you are likely to use the workqueue with. The `Arc` type is for
reference counted objects, and the `Pin<Box<T>>` type is for objects
where the caller has exclusive ownership of the object.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 97 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index dbf0aab29a85..f06a2f036d8b 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -28,8 +28,10 @@
 //!
 //! C header: [`include/linux/workqueue.h`](../../../../include/linux/workqueue.h)
 
-use crate::{bindings, prelude::*, types::Opaque};
+use crate::{bindings, prelude::*, sync::Arc, types::Opaque};
+use alloc::boxed::Box;
 use core::marker::{PhantomData, PhantomPinned};
+use core::pin::Pin;
 
 /// A kernel work queue.
 ///
@@ -323,6 +325,99 @@ unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workqueue::Work<$work_typ
     )*};
 }
 
+unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        // SAFETY: The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
+        let ptr = ptr as *mut Work<T, ID>;
+        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        let ptr = unsafe { T::work_container_of(ptr) };
+        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        let arc = unsafe { Arc::from_raw(ptr) };
+
+        T::run(arc)
+    }
+}
+
+unsafe impl<T, const ID: u64> RawWorkItem<ID> for Arc<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    type EnqueueOutput = Result<(), Self>;
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        // Casting between const and mut is not a problem as long as the pointer is a raw pointer.
+        let ptr = Arc::into_raw(self) as *mut T;
+
+        // SAFETY: Pointers into an `Arc` point at a valid value.
+        let work_ptr = unsafe { T::raw_get_work(ptr) };
+        // SAFETY: `raw_get_work` returns a pointer to a valid value.
+        let work_ptr = unsafe { Work::raw_get(work_ptr) };
+
+        if queue_work_on(work_ptr) {
+            Ok(())
+        } else {
+            // SAFETY: The work queue has not taken ownership of the pointer.
+            Err(unsafe { Arc::from_raw(ptr) })
+        }
+    }
+}
+
+unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<Box<T>>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        // SAFETY: The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
+        let ptr = ptr as *mut Work<T, ID>;
+        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        let ptr = unsafe { T::work_container_of(ptr) };
+        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        let boxed = unsafe { Box::from_raw(ptr) };
+        // SAFETY: The box was already pinned when it was enqueued.
+        let pinned = unsafe { Pin::new_unchecked(boxed) };
+
+        T::run(pinned)
+    }
+}
+
+unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<Box<T>>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    type EnqueueOutput = ();
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        // SAFETY: We're not going to move `self` or any of its fields, so its okay to temporarily
+        // remove the `Pin` wrapper.
+        let boxed = unsafe { Pin::into_inner_unchecked(self) };
+        let ptr = Box::into_raw(boxed);
+
+        // SAFETY: Pointers into a `Box` point at a valid value.
+        let work_ptr = unsafe { T::raw_get_work(ptr) };
+        // SAFETY: `raw_get_work` returns a pointer to a valid value.
+        let work_ptr = unsafe { Work::raw_get(work_ptr) };
+
+        if !queue_work_on(work_ptr) {
+            // SAFETY: This method requires exclusive ownership of the box, so it cannot be in a
+            // workqueue.
+            unsafe { ::core::hint::unreachable_unchecked() }
+        }
+    }
+}
+
 /// Returns the system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
-- 
2.41.0.rc0.172.g3f132b7071-goog

