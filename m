Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B43C77B72
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Apr 2023 22:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjDEWJN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Apr 2023 18:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbjDEWJL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Apr 2023 18:09:11 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156305267
        for <rust-for-linux@vger.kernel.org>; Wed,  5 Apr 2023 15:09:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id h8so144751364ede.8
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Apr 2023 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680732547;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=9VV/LEg+1K/+PzJjj4wMMq87FxzLFqVRxIlDeAN3GtQ=;
        b=1OjuUgQrRjuJT9p80ONTyaXNz4s8PdY39mhrpx1gJY02/lXWHqqaflfvLOguOuEzH7
         cPhLjlOxFRb7b7qltgegR11aTNy7Sys/kbjFgBnzr2MAdq2RJWLTtmuRsci2bGGEpS6t
         cXh9aub7rqGGoZuCbbAYlrVe4ewXmV8Z75h79fzHAQOxwG+VmJ/R5BixX0dhLoKzX1BS
         rb56SXDcdA6VOPi6nXtexynwSPCn3zz+AoluEz6HQtfPk6Jmzfos4JE2V3xyv0UU+zqx
         nuYZGbVSnOlQzMgvf7mWlqtt8EIJmVsVU/SAy8TtxajrGH2HESEauYOFGu1KxT4Crpo2
         xpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680732547;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VV/LEg+1K/+PzJjj4wMMq87FxzLFqVRxIlDeAN3GtQ=;
        b=WXDpNCjj75VsAOrmyfbx7eIRowRqS2/d2ucO9DcP35QMo1wk6ecUFQjB8K7s3n5Aoz
         CKm97sxvuXbs91ZMzjUrTju7laOA3FfehX3AtMMcIsgmfQYo+VWJFBwEdxtjbu5ErCCa
         0CW1c7icI0PMAmHXQz4LNgvXjYrP3j77UhevWBY1eGcwM453zW5vZQB7QU5co8B+nMwz
         jDxaTSWHxwO4QkuupaUhZwhuxj8fW3LYWkqr0NjUqmPfH1Dg7v2LhB16OlGHKrgl5Z8V
         5kRszCY84+a+swmTzxTJnEiJiTziT8gbyM0bVV6w+3kFoZNqoCL3UGe/o0OAAUv7vOGv
         wgTw==
X-Gm-Message-State: AAQBX9c1v4eBNzQZg+4U0WvmNz0e37YwMFMF3+3lWH+pp6DtslG00ye4
        IBs8Nodu92u5S42EKlMcgoD3dg==
X-Google-Smtp-Source: AKy350azv/xLBkCkm2mvVLhiJp6U1GdlEgzaCLm9Kt7kGlOU75AEdYl3sQWgGoRITWe4CvJfMRL0iQ==
X-Received: by 2002:a17:906:4d08:b0:8bf:e95c:467b with SMTP id r8-20020a1709064d0800b008bfe95c467bmr4368186eju.63.1680732547550;
        Wed, 05 Apr 2023 15:09:07 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id i12-20020a1709064ecc00b008e8e975e185sm7857506ejv.32.2023.04.05.15.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:09:07 -0700 (PDT)
References: <20230405193445.745024-1-y86-dev@protonmail.com>
 <20230405193445.745024-12-y86-dev@protonmail.com>
User-agent: mu4e 1.10.1; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Benno Lossin <y86-dev@protonmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Alice Ryhl <alice@ryhl.io>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v6 11/15] rust: init: add `Zeroable` trait and
 `init::zeroed` function
Date:   Thu, 06 Apr 2023 00:08:28 +0200
In-reply-to: <20230405193445.745024-12-y86-dev@protonmail.com>
Message-ID: <87lej6rngc.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Benno Lossin <y86-dev@protonmail.com> writes:

> Add the `Zeroable` trait which marks types that can be initialized by
> writing `0x00` to every byte of the type. Also add the `init::zeroed`
> function that creates an initializer for a `Zeroable` type that writes
> `0x00` to every byte.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Cc: Andreas Hindborg <a.hindborg@samsung.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/init.rs | 97 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> index 99751375e7c8..ffd539e2f5ef 100644
> --- a/rust/kernel/init.rs
> +++ b/rust/kernel/init.rs
> @@ -195,8 +195,14 @@ use crate::{
>  };
>  use alloc::boxed::Box;
>  use core::{
> -    alloc::AllocError, cell::Cell, convert::Infallible, marker::PhantomData, mem::MaybeUninit,
> -    pin::Pin, ptr,
> +    alloc::AllocError,
> +    cell::Cell,
> +    convert::Infallible,
> +    marker::PhantomData,
> +    mem::MaybeUninit,
> +    num::*,
> +    pin::Pin,
> +    ptr::{self, NonNull},
>  };
>
>  #[doc(hidden)]
> @@ -1323,3 +1329,90 @@ pub unsafe trait PinnedDrop: __internal::HasPinData {
>      /// automatically.
>      fn drop(self: Pin<&mut Self>, only_call_from_drop: __internal::OnlyCallFromDrop);
>  }
> +
> +/// Marker trait for types that can be initialized by writing just zeroes.
> +///
> +/// # Safety
> +///
> +/// The bit pattern consisting of only zeroes is a valid bit pattern for this type. In other words,
> +/// this is not UB:
> +///
> +/// ```rust,ignore
> +/// let val: Self = unsafe { core::mem::zeroed() };
> +/// ```
> +pub unsafe trait Zeroable {}
> +
> +/// Create a new zeroed T.
> +///
> +/// The returned initializer will write `0x00` to every byte of the given `slot`.
> +#[inline]
> +pub fn zeroed<T: Zeroable>() -> impl Init<T> {
> +    // SAFETY: Because `T: Zeroable`, all bytes zero is a valid bit pattern for `T`
> +    // and because we write all zeroes, the memory is initialized.
> +    unsafe {
> +        init_from_closure(|slot: *mut T| {
> +            slot.write_bytes(0, 1);
> +            Ok(())
> +        })
> +    }
> +}
> +
> +macro_rules! impl_zeroable {
> +    ($($({$($generics:tt)*})? $t:ty, )*) => {
> +        $(unsafe impl$($($generics)*)? Zeroable for $t {})*
> +    };
> +}
> +
> +impl_zeroable! {
> +    // SAFETY: All primitives that are allowed to be zero.
> +    bool,
> +    char,
> +    u8, u16, u32, u64, u128, usize,
> +    i8, i16, i32, i64, i128, isize,
> +    f32, f64,
> +
> +    // SAFETY: These are ZSTs, there is nothing to zero.
> +    {<T: ?Sized>} PhantomData<T>, core::marker::PhantomPinned, Infallible, (),
> +
> +    // SAFETY: Type is allowed to take any value, including all zeros.
> +    {<T>} MaybeUninit<T>,
> +
> +    // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee).
> +    Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<NonZeroU64>,
> +    Option<NonZeroU128>, Option<NonZeroUsize>,
> +    Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<NonZeroI64>,
> +    Option<NonZeroI128>, Option<NonZeroIsize>,
> +
> +    // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee).
> +    //
> +    // In this case we are allowed to use `T: ?Sized`, since all zeros is the `None` variant.
> +    {<T: ?Sized>} Option<NonNull<T>>,
> +    {<T: ?Sized>} Option<Box<T>>,
> +
> +    // SAFETY: `null` pointer is valid.
> +    //
> +    // We cannot use `T: ?Sized`, since the VTABLE pointer part of fat pointers is not allowed to be
> +    // null.
> +    //
> +    // When `Pointee` gets stabilized, we could use
> +    // `T: ?Sized where <T as Pointee>::Metadata: Zeroable`
> +    {<T>} *mut T, {<T>} *const T,
> +
> +    // SAFETY: `null` pointer is valid and the metadata part of these fat pointers is allowed to be
> +    // zero.
> +    {<T>} *mut [T], {<T>} *const [T], *mut str, *const str,
> +
> +    // SAFETY: `T` is `Zeroable`.
> +    {<const N: usize, T: Zeroable>} [T; N], {<T: Zeroable>} Wrapping<T>,
> +}
> +
> +macro_rules! impl_tuple_zeroable {
> +    ($(,)?) => {};
> +    ($first:ident, $($t:ident),* $(,)?) => {
> +        // SAFETY: All elements are zeroable and padding can be zero.
> +        unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*) {}
> +        impl_tuple_zeroable!($($t),* ,);
> +    }
> +}
> +
> +impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);

