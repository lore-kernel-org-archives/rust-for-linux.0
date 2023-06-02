Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273FCC77B7A
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Jun 2023 14:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbjFBOkk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Jun 2023 10:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235502AbjFBOkk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Jun 2023 10:40:40 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB0E1B1
        for <rust-for-linux@vger.kernel.org>; Fri,  2 Jun 2023 07:40:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30b023b0068so1672937f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jun 2023 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1685716832; x=1688308832;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=dd7s3Z3wE1FRuEKyebQLFIwrLmyQsduGsJm+S7BiDBA=;
        b=WbTcJBu7dkxQd6Xx/FdhcI+/W6kFAf+fOjnkbtuj7zwZ2Zaiz7RATDiV0A9TyiPZDX
         /9UbiI5tERB8SJ0XsVpCPyn757q28Wt9HzY5kMGLyi2rr0xEPHFYkQ7FMwoqqlBKa/rG
         T0NtUZJu2NarhxXvNXFTUmo8djZ/dWT6NvIZf4tF7hwLFlX038eumQC/oAE7YrY1wxo6
         Sx6Ps3Dcnkc6rz096/AvPzCwBqGaN7l0xOGfTCZq8daGKBb6nwVxKC2p/Qbpjb12Lgjs
         4x1b5psWDoiDnT41ltq0ZgoO/nNBh3+wZbhOJdeaHv335cmrVv/qUV41Yyvbuh2j9T3c
         /axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685716832; x=1688308832;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd7s3Z3wE1FRuEKyebQLFIwrLmyQsduGsJm+S7BiDBA=;
        b=Cae9wl8+G0Pu+vczGVFLxqffKZqMUCq5QTeLDLVRma3yphz7Qb/LHyf6hPTzbkFq2I
         pgwWDR0xGC0kdFbPMnftdDzMdZbIHjA0r/HC+OkaQJ18ct3ELBruIqWd4duE2HQKiq93
         LdR2jHqbnCCyxPA+DZJBVwwN6QIc4byUF49Q/qbhJe8W99iYoAz6VLktjDTY5KGWOu8p
         7Yhb8UM3TdEn158D5Qa4M/vkMurw718vCHtfW1hAq6Pal0zYDWLS2XjlwRNRA+tK2pqX
         vIF/mPps4FfL/foW7ju8h5qzzuU5BiqmsLCbTaGGjoUASi+fgqC8ul1cbhT3Vx8SSR6K
         dRqw==
X-Gm-Message-State: AC+VfDw5hH/UkLGZN16pBE+tJ/Us1jzwfXi6JSxoM8+q8T6+/W+oa3Xx
        griiAp/QP2ZofjNVL/IpJyaq5Q==
X-Google-Smtp-Source: ACHHUZ5plGOHiofUtGd1wr0/17WzX3lFPrk17UetRP4zhL9gwB5+dLNKk+DiK+EIzimgC1GyyD/rSA==
X-Received: by 2002:adf:f606:0:b0:30a:d944:b765 with SMTP id t6-20020adff606000000b0030ad944b765mr57873wrp.15.1685716832593;
        Fri, 02 Jun 2023 07:40:32 -0700 (PDT)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id k16-20020a056000005000b003079986fd71sm1898268wrx.88.2023.06.02.07.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:40:32 -0700 (PDT)
References: <20230601134946.3887870-1-aliceryhl@google.com>
 <20230601134946.3887870-2-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 1/8] rust: workqueue: add low-level workqueue bindings
Date:   Fri, 02 Jun 2023 16:39:00 +0200
In-reply-to: <20230601134946.3887870-2-aliceryhl@google.com>
Message-ID: <87o7ly0vxc.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> Define basic low-level bindings to a kernel workqueue. The API defined
> here can only be used unsafely. Later commits will provide safe
> wrappers.
>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg (Samsung) <nmi@metaspace.dk>

> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   1 +
>  rust/kernel/workqueue.rs        | 107 ++++++++++++++++++++++++++++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 rust/kernel/workqueue.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 50e7a76d5455..ae2e8f018268 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -10,6 +10,7 @@
>  #include <linux/refcount.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
> +#include <linux/workqueue.h>
>  
>  /* `bindgen` gets confused at certain things. */
>  const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 85b261209977..eaded02ffb01 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -43,6 +43,7 @@
>  pub mod sync;
>  pub mod task;
>  pub mod types;
> +pub mod workqueue;
>  
>  #[doc(hidden)]
>  pub use bindings;
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> new file mode 100644
> index 000000000000..9c630840039b
> --- /dev/null
> +++ b/rust/kernel/workqueue.rs
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Work queues.
> +//!
> +//! C header: [`include/linux/workqueue.h`](../../../../include/linux/workqueue.h)
> +
> +use crate::{bindings, types::Opaque};
> +
> +/// A kernel work queue.
> +///
> +/// Wraps the kernel's C `struct workqueue_struct`.
> +///
> +/// It allows work items to be queued to run on thread pools managed by the kernel. Several are
> +/// always available, for example, `system`, `system_highpri`, `system_long`, etc.
> +#[repr(transparent)]
> +pub struct Queue(Opaque<bindings::workqueue_struct>);
> +
> +// SAFETY: Kernel workqueues are usable from any thread.
> +unsafe impl Send for Queue {}
> +unsafe impl Sync for Queue {}
> +
> +impl Queue {
> +    /// Use the provided `struct workqueue_struct` with Rust.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the provided raw pointer is not dangling, that it points at a
> +    /// valid workqueue, and that it remains valid until the end of 'a.
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue {
> +        // SAFETY: The `Queue` type is `#[repr(transparent)]`, so the pointer cast is valid. The
> +        // caller promises that the pointer is not dangling.
> +        unsafe { &*(ptr as *const Queue) }
> +    }
> +
> +    /// Enqueues a work item.
> +    ///
> +    /// This may fail if the work item is already enqueued in a workqueue.
> +    ///
> +    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> +    pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
> +    where
> +        W: RawWorkItem<ID> + Send + 'static,
> +    {
> +        let queue_ptr = self.0.get();
> +
> +        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
> +        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
> +        //
> +        // The call to `bindings::queue_work_on` will dereference the provided raw pointer, which
> +        // is ok because `__enqueue` guarantees that the pointer is valid for the duration of this
> +        // closure.
> +        //
> +        // Furthermore, if the C workqueue code accesses the pointer after this call to
> +        // `__enqueue`, then the work item was successfully enqueued, and `bindings::queue_work_on`
> +        // will have returned true. In this case, `__enqueue` promises that the raw pointer will
> +        // stay valid until we call the function pointer in the `work_struct`, so the access is ok.
> +        unsafe {
> +            w.__enqueue(move |work_ptr| {
> +                bindings::queue_work_on(bindings::WORK_CPU_UNBOUND as _, queue_ptr, work_ptr)
> +            })
> +        }
> +    }
> +}
> +
> +/// A raw work item.
> +///
> +/// This is the low-level trait that is designed for being as general as possible.
> +///
> +/// The `ID` parameter to this trait exists so that a single type can provide multiple
> +/// implementations of this trait. For example, if a struct has multiple `work_struct` fields, then
> +/// you will implement this trait once for each field, using a different id for each field. The
> +/// actual value of the id is not important as long as you use different ids for different fields
> +/// of the same struct. (Fields of different structs need not use different ids.)
> +///
> +/// Note that the id is used only to select the right method to call during compilation. It wont be
> +/// part of the final executable.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that any pointers passed to a `queue_work_on` closure by `__enqueue`
> +/// remain valid for the duration specified in the documentation for `__enqueue`.
> +pub unsafe trait RawWorkItem<const ID: u64> {
> +    /// The return type of [`Queue::enqueue`].
> +    type EnqueueOutput;
> +
> +    /// Enqueues this work item on a queue using the provided `queue_work_on` method.
> +    ///
> +    /// # Guarantees
> +    ///
> +    /// If this method calls the provided closure, then the raw pointer is guaranteed to point at a
> +    /// valid `work_struct` for the duration of the call to the closure. If the closure returns
> +    /// true, then it is further guaranteed that the pointer remains valid until someone calls the
> +    /// function pointer stored in the `work_struct`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The provided closure may only return `false` if the `work_struct` is already in a workqueue.
> +    ///
> +    /// If the work item type is annotated with any lifetimes, then you must not call the function
> +    /// pointer after any such lifetime expires. (Never calling the function pointer is okay.)
> +    ///
> +    /// If the work item type is not [`Send`], then the function pointer must be called on the same
> +    /// thread as the call to `__enqueue`.
> +    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
> +    where
> +        F: FnOnce(*mut bindings::work_struct) -> bool;
> +}

