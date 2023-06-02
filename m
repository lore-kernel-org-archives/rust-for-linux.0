Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2561DC7EE24
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Jun 2023 12:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbjFBMuR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Jun 2023 08:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbjFBMuQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Jun 2023 08:50:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C19613D
        for <rust-for-linux@vger.kernel.org>; Fri,  2 Jun 2023 05:50:14 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso20407935e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jun 2023 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1685710212; x=1688302212;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=l33Mq2VLUGQR/koZvPq7lsDjiaNP/SIkfRE+ek2eSvQ=;
        b=NISTed40EId931VyOZ5ZoWYUuozj6cTmL+NqvggB6r8sYZqVOipD8/ukAhSMrHGAjH
         YlQdPwvM1WkDdFs1bOKMvdXX6MZFhG29jJdaJzbijHkwh82uo2Ps+pnSKCYt02THMQDI
         fLBL3IrhuTazSNz7fIcBHBp1ih/sntCIg2jpjrP425+IJ6ALY2st+hanWJK43slO2RQh
         HZiFaiqtZyTmAZrAmgoFFR/rgMyWBWJvfBdY4ynuEvvhfp+7rWg2BOnvBHP+5vMCw1nU
         aSEr5+XoDe4aPyE87xm++YKd45IyOYjQdsczmCQqdFT/ydZEk0uT9bd7pqVvUR88ak2E
         SoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685710212; x=1688302212;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l33Mq2VLUGQR/koZvPq7lsDjiaNP/SIkfRE+ek2eSvQ=;
        b=RMknXdPqSfSWfkTTm86MoSEcA2Cr6JHbPuqsijVNLU36TQOyn+dXL3OtFS6KaXt2SU
         OptZIcSKMlT8nJS14hpNGpp+FDeY/F1a/162/yv4fq9JW8fLdiAJXDQBjtI1gFNnAv2a
         v1zaiTLhVjyO8R+LEoeUJ2mHf3v1QwE7Il+atzs0adQ7w/g7osBM9KWfwhqS7wsy+agR
         MVxOfTz48FIoqL6M5GJUmBq34Y8XaFZb443v1m28dYnPoM7+/ZbTz5I31jACcLpwgotq
         AMdF8HARZyILLBcC45O8mflhPNfmOswWj5kKWIB2s51JR6u81Muv1x2bSWjxci3eDSU4
         cp5g==
X-Gm-Message-State: AC+VfDxKVhZ/fIDKQUBjwhw79HCHZsYyfD1jAmaobGN3Wo+lBkR7npKG
        CrWinBBmPS3yxrwPo6r12PrdIg==
X-Google-Smtp-Source: ACHHUZ6+ROJycD3hc3Yf8pRS/8ZIlARghzMBnLq5Yzy4wK17X1EAcUz+sw8rfuKjqFugjWkxi/eHXw==
X-Received: by 2002:a5d:5047:0:b0:30a:dee9:1332 with SMTP id h7-20020a5d5047000000b0030adee91332mr4239459wrt.67.1685710212456;
        Fri, 02 Jun 2023 05:50:12 -0700 (PDT)
Received: from localhost ([147.161.155.113])
        by smtp.gmail.com with ESMTPSA id t3-20020a1c7703000000b003f603b8eb5asm1914645wmi.7.2023.06.02.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 05:50:11 -0700 (PDT)
References: <20230601134946.3887870-1-aliceryhl@google.com>
 <20230601134946.3887870-4-aliceryhl@google.com>
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
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: Re: [PATCH v2 3/8] rust: sync: add `Arc::{from_raw, into_raw}`
Date:   Fri, 02 Jun 2023 12:51:08 +0200
In-reply-to: <20230601134946.3887870-4-aliceryhl@google.com>
Message-ID: <87v8g61119.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> These methods can be used to turn an `Arc` into a raw pointer and back,
> in a way that preserves the metadata for fat pointers.
>
> This is done using the unstable ptr_metadata feature [1]. However, it
> could also be done using the unstable pointer_byte_offsets feature [2],
> which is likely to have a shorter path to stabilization than
> ptr_metadata.
>
> Link: https://github.com/rust-lang/rust/issues/81513 [1]
> Link: https://github.com/rust-lang/rust/issues/96283 [2]
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> ---
>  rust/kernel/lib.rs      |  1 +
>  rust/kernel/sync/arc.rs | 42 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7ea777b731e6..ad9142928fb1 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -17,6 +17,7 @@
>  #![feature(const_refs_to_cell)]
>  #![feature(dispatch_from_dyn)]
>  #![feature(new_uninit)]
> +#![feature(ptr_metadata)]
>  #![feature(receiver_trait)]
>  #![feature(unsize)]
>  
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index a89843cacaad..684be9f73aca 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -24,7 +24,7 @@
>  };
>  use alloc::boxed::Box;
>  use core::{
> -    alloc::AllocError,
> +    alloc::{AllocError, Layout},
>      fmt,
>      marker::{PhantomData, Unsize},
>      mem::{ManuallyDrop, MaybeUninit},
> @@ -212,6 +212,46 @@ unsafe fn from_inner(inner: NonNull<ArcInner<T>>) -> Self {
>          }
>      }
>  
> +    /// Convert the [`Arc`] into a raw pointer.
> +    ///
> +    /// The raw pointer has ownership of the refcount that this Arc object owned.
> +    pub fn into_raw(self) -> *const T {
> +        let ptr = self.ptr.as_ptr();
> +        core::mem::forget(self);
> +        // SAFETY: The pointer is valid.
> +        unsafe { core::ptr::addr_of!((*ptr).data) }
> +    }
> +
> +    /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].
> +    ///
> +    /// This code relies on the `repr(C)` layout of structs as described in
> +    /// <https://doc.rust-lang.org/reference/type-layout.html#reprc-structs>.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must have been returned by a previous call to [`Arc::into_raw`]. Additionally, it
> +    /// can only be called once for each previous call to [`Arc::into_raw`].
> +    pub unsafe fn from_raw(ptr: *const T) -> Self {
> +        let refcount_layout = Layout::new::<bindings::refcount_t>();
> +        // SAFETY: The caller guarantees that the pointer is valid.
> +        let val_layout = unsafe { Layout::for_value(&*ptr) };
> +        // SAFETY: We're computing the layout of a real struct that existed when compiling this
> +        // binary, so its layout is not so large that it can trigger arithmetic overflow.
> +        let val_offset = unsafe { refcount_layout.extend(val_layout).unwrap_unchecked().1 };
> +
> +        // This preserves the metadata in the pointer, if any.
> +        //
> +        // Note that `*const T` and `*const ArcInner<T>` have the same metadata as documented at
> +        // <https://doc.rust-lang.org/std/ptr/trait.Pointee.html>.
> +        let metadata = core::ptr::metadata(ptr as *const ArcInner<T>);

Thanks for updating the comment with the link. I looked into this and I
find that what we are doing here, even though it works, does not feel
right at all. We should be able to do this:

        let metadata = core::ptr::metadata(ptr);
        let ptr = (ptr as *mut u8).wrapping_sub(val_offset) as *mut ();
        let ptr = core::ptr::from_raw_parts_mut(ptr, metadata);

but the way `Pointee::Metadata` is defined will not allow this, even
though we know it is valid. I would suggest the following instead:

        let metadata = core::ptr::metadata(ptr);
        // Convert <T as Pointee>::Metadata to <ArcInner<T> as
        // Pointee>::Metadata. We know they have identical representation and thus this is OK.
        let metadata: <ArcInner<T> as Pointee>::Metadata = *unsafe {
            &*((&metadata as *const <T as Pointee>::Metadata as *const ())
                as *const <ArcInner<T> as Pointee>::Metadata)
        };
        let ptr = (ptr as *mut u8).wrapping_sub(val_offset) as *mut ();
        let ptr = core::ptr::from_raw_parts_mut(ptr, metadata);

Even though it is a bit more complex, it captures what we are trying to
do better.

Best regards,
Andreas

> +        let ptr = (ptr as *mut u8).wrapping_sub(val_offset) as *mut ();
> +        let ptr = core::ptr::from_raw_parts_mut(ptr, metadata);
> +
> +        // SAFETY: By the safety requirements we know that `ptr` came from `Arc::into_raw`, so the
> +        // reference count held then will be owned by the new `Arc` object.
> +        unsafe { Self::from_inner(NonNull::new_unchecked(ptr)) }
> +    }
> +
>      /// Returns an [`ArcBorrow`] from the given [`Arc`].
>      ///
>      /// This is useful when the argument of a function call is an [`ArcBorrow`] (e.g., in a method

