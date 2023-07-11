Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C075EB64DC
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Jul 2023 09:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjGKJ4w (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Jul 2023 05:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGKJ4u (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Jul 2023 05:56:50 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30520A8
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 02:56:49 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57320c10635so61215697b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 02:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689069408; x=1691661408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVqEtgaoR84mlWb1xo2bD1CrEq4VPJW4ZXsIrXT2SxY=;
        b=JiS7r4oSjpoYeZAQokPiDZbRIRNXbzoWPZL7NF+5rzbH6mH2Rcy5+beBc9ND3C54Cz
         Aus5Cg913qXuDxwKJCGdRWmHr05KJU0rJAHeg88AZD7kauK/bKXdTeDKY4hHqsiAXQQL
         giwWgikoRtreQUO/DBn4FxwrAoqmcTXpHQalZUi4p2Udagcl0C2V8fzJ4YAZqbRHjs39
         J4t57iEQpS8/MHp0zwe9jwefzUlWJejQ8XzKTLzsg3oq45gSz8Ajf7nQvIF4XLItT28/
         qIgL6zZDPEwioH0kLhbOCQCI7+NjZMZFYtDBdbaMW78mZpZzOwkCwthKHdajV8J2epzt
         5zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689069408; x=1691661408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVqEtgaoR84mlWb1xo2bD1CrEq4VPJW4ZXsIrXT2SxY=;
        b=GtGLbSrXoRbSFjaLmpqOzs3P6z0ibVIgtOhj5a8qgdsGlyVQ13a1y75g3ZOVkT7x7D
         rTyaOkYPGgpPjBfx+t9U9qxPGAye9MzKEVJ7gy+DM1XlhHTrG0JOMDESytBAos2mie4+
         9ONbV4BpZqhLsA1cdXJKJJEz/zO+nTe8ie3awYVIOdesMcCC6QSUqXcNgo3BTFIKuSUI
         eXOg22wJoEBT9Nl7rJL6JlflLaald68CZQnXQrjKO7Hc2Oodcl7na2lP3LeGpvJ2qXTT
         m3dzxzLbuhv8xcZVRQKF4YH31AzdkH8GIUhbHzKIZ8HV6g3AIUOZCLMmMpF9yUCvUz7l
         3WFQ==
X-Gm-Message-State: ABy/qLYY+u0v8ZbQd1/+SS1QE71bEkCH69nOTELTmIzY8IDlcVuNkLwY
        b0MnosdF5X1ugZs0BCyuPqGJhSylhZB5b43jXCDz5HeowKWxT7pNf8Nm8Jtyx/eep4D6Fy/2q1D
        /cKgAvqQ/ZaJNnQDZxUvlkWMc1y7/xcqFUHmKEg0LLdGRokDlZU+AtAh7USjBPtfEwh8h7n/Nio
        5fyVcl
X-Google-Smtp-Source: APBJJlFwdJ2E18U3JX8SbmAFB8eni9sLplKZ6ovLgHTWvsced2a62emZj0SesAoyMkw4Bdoxegyik2qJMVn43mc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:764f:0:b0:57a:141f:b4f5 with SMTP id
 j15-20020a81764f000000b0057a141fb4f5mr139132ywk.7.1689069408101; Tue, 11 Jul
 2023 02:56:48 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:33:03 +0000
In-Reply-To: <20230711093303.1433770-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230711093303.1433770-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230711093303.1433770-10-aliceryhl@google.com>
Subject: [PATCH v3 9/9] rust: workqueue: add examples
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     Lai Jiangshan <jiangshanlai@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        Andreas Hindborg <nmi@metaspace.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This adds two examples of how to use the workqueue. The first example
shows how to use it when you only have one `work_struct` field, and the
second example shows how to use it when you have multiple `work_struct`
fields.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg (Samsung) <nmi@metaspace.dk>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
---
v2 -> v3:
 * Use LockClassKey in constructors in examples.
 * Add Reviewed-by from Martin, Gary, Andreas, Benno.

 rust/kernel/workqueue.rs | 104 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 3a3a8b52bfd9..482d3eeae7d8 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -26,6 +26,110 @@
 //!  * The `WorkItemPointer` trait is implemented for the pointer type that points at a something
 //!    that implements `WorkItem`.
 //!
+//! ## Example
+//!
+//! This example defines a struct that holds an integer and can be scheduled on the workqueue. When
+//! the struct is executed, it will print the integer. Since there is only one `work_struct` field,
+//! we do not need to specify ids for the fields.
+//!
+//! ```
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//! use kernel::workqueue::{self, Work, WorkItem};
+//!
+//! #[pin_data]
+//! struct MyStruct {
+//!     value: i32,
+//!     #[pin]
+//!     work: Work<MyStruct>,
+//! }
+//!
+//! impl_has_work! {
+//!     impl HasWork<Self> for MyStruct { self.work }
+//! }
+//!
+//! impl MyStruct {
+//!     fn new(value: i32) -> Result<Arc<Self>> {
+//!         Arc::pin_init(pin_init!(MyStruct {
+//!             value,
+//!             work <- Work::new(kernel::static_lock_class!()),
+//!         }))
+//!     }
+//! }
+//!
+//! impl WorkItem for MyStruct {
+//!     type Pointer = Arc<MyStruct>;
+//!
+//!     fn run(this: Arc<MyStruct>) {
+//!         pr_info!("The value is: {}", this.value);
+//!     }
+//! }
+//!
+//! /// This method will enqueue the struct for execution on the system workqueue, where its value
+//! /// will be printed.
+//! fn print_later(val: Arc<MyStruct>) {
+//!     let _ = workqueue::system().enqueue(val);
+//! }
+//! ```
+//!
+//! The following example shows how multiple `work_struct` fields can be used:
+//!
+//! ```
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//! use kernel::workqueue::{self, Work, WorkItem};
+//!
+//! #[pin_data]
+//! struct MyStruct {
+//!     value_1: i32,
+//!     value_2: i32,
+//!     #[pin]
+//!     work_1: Work<MyStruct, 1>,
+//!     #[pin]
+//!     work_2: Work<MyStruct, 2>,
+//! }
+//!
+//! impl_has_work! {
+//!     impl HasWork<Self, 1> for MyStruct { self.work_1 }
+//!     impl HasWork<Self, 2> for MyStruct { self.work_2 }
+//! }
+//!
+//! impl MyStruct {
+//!     fn new(value_1: i32, value_2: i32) -> Result<Arc<Self>> {
+//!         Arc::pin_init(pin_init!(MyStruct {
+//!             value_1,
+//!             value_2,
+//!             work_1 <- Work::new(kernel::static_lock_class!()),
+//!             work_2 <- Work::new(kernel::static_lock_class!()),
+//!         }))
+//!     }
+//! }
+//!
+//! impl WorkItem<1> for MyStruct {
+//!     type Pointer = Arc<MyStruct>;
+//!
+//!     fn run(this: Arc<MyStruct>) {
+//!         pr_info!("The value is: {}", this.value_1);
+//!     }
+//! }
+//!
+//! impl WorkItem<2> for MyStruct {
+//!     type Pointer = Arc<MyStruct>;
+//!
+//!     fn run(this: Arc<MyStruct>) {
+//!         pr_info!("The second value is: {}", this.value_2);
+//!     }
+//! }
+//!
+//! fn print_1_later(val: Arc<MyStruct>) {
+//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 1>(val);
+//! }
+//!
+//! fn print_2_later(val: Arc<MyStruct>) {
+//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
+//! }
+//! ```
+//!
 //! C header: [`include/linux/workqueue.h`](../../../../include/linux/workqueue.h)
 
 use crate::{bindings, prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
-- 
2.41.0.255.g8b1d071c50-goog

