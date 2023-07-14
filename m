Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96750EB64DA
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 10:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbjGNK2M (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 06:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbjGNK2J (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 06:28:09 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849F92D41
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 03:28:03 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57745160c1dso13947497b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689330483; x=1691922483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwV3kc3uzzq7RspJm+cMTqP6WI/iboonsRW9iz1lFPg=;
        b=ock6SYJOEyKZbBOXOC5zHDRe95nmTWdhr80kYHNWZsr9+4xkjgkWLavfD1ZCzGSojh
         ByglL6H89jZ1yg6kuTpwQCTjzg6KgNd7dmAlIQqeg8DPezK0LlTL0h0AiODIflM9lkA9
         MiJhiCirB4eZM74fOckiTc0SkPUxQNPJNPhp1EuV9HNIqdzhD4RUGtrz2v+qjmSt0Zz1
         NUnKf4w4Af4KBATnHu4DBv+i88LUDE81rj4pSnldkGb2vFJyb332PKaHRcXAN1+yN7v2
         UNd/lZVxSObqs3/oiDcEyxF1OPHRVlRcE85GcU11KfYWPSzKhtoouTcrFmfLq4z0gB6s
         UxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330483; x=1691922483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwV3kc3uzzq7RspJm+cMTqP6WI/iboonsRW9iz1lFPg=;
        b=RoyLwKqg8ObvxOFZRMVfrceO3tzQGlpOnUG5wiJwzmgjbGcfBqP/4WmbkU7MbOwlTH
         OtsmqBKD3MkGaBc5196lqlaf3OW2X7fu0iH1OLZxTirQGmYRrbqapYrTRAghUUIj1jwd
         or7SBbbi01dNNiQZA/AlmXkoE8ErOkj1FmoZmX1TEUVjIqcy+c5ot2EaXh84QW9WIJ2N
         CQ6GncpIwyGmMG419x+Yo//705DzVH8853Gzo1qRApPH8NM+GZqfmyRBBQNUs8D6VlSR
         mpIlOGjFU73cO8BT9FYBnajvjhlH1jM0N5X9ori9xlFdL2qz0UUD+/TeFyKjErhWn9n0
         iBKw==
X-Gm-Message-State: ABy/qLaKNXiL5ZDUa4gRxL7wabTKVIEBvtTyHrvuIV+43VTyp8C1hAGr
        tSlaPAoL79qD20j+s14F4DPnd9yJ3mwbGf8=
X-Google-Smtp-Source: APBJJlE0+jjHBRKgSzS1qjpf41U9NfxUPZOhJjB8LMC2qYcOhSSegwjuGwuc6lh5JVX+4Mj8BQIiTzSVNga2q+8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:ab70:0:b0:c60:63e7:efb4 with SMTP id
 u103-20020a25ab70000000b00c6063e7efb4mr22279ybi.9.1689330482859; Fri, 14 Jul
 2023 03:28:02 -0700 (PDT)
Date:   Fri, 14 Jul 2023 10:28:00 +0000
In-Reply-To: <ZK2UeFE1A4iRfePS@boqun-archlinux>
Mime-Version: 1.0
References: <ZK2UeFE1A4iRfePS@boqun-archlinux>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714102800.2196236-1-aliceryhl@google.com>
Subject: Re: [PATCH v1] rust: add improved version of `ForeignOwnable::borrow_mut`
From:   Alice Ryhl <aliceryhl@google.com>
To:     boqun.feng@gmail.com
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Boqun Feng <boqun.feng@gmail.com> writes:
> On Mon, Jul 10, 2023 at 07:46:42AM +0000, Alice Ryhl wrote:
>> Previously, the `ForeignOwnable` trait had a method called `borrow_mut`
>> that was intended to provide mutable access to the inner value. However,
>> the method accidentally made it possible to change the address of the
>> object being modified, which usually isn't what we want. (And when we
>> want that, it can be done by calling `from_foreign` and `into_foreign`,
>> like how the old `borrow_mut` was implemented.)
>> 
>> In this patch, we introduce an alternate definition of `borrow_mut` that
>> solves the previous problem. Conceptually, given a pointer type `P` that
>> implements `ForeignOwnable`, the `borrow_mut` method gives you the same
>> kind of access as an `&mut P` would, except that it does not let you
>> change the pointer `P` itself.
>> 
>> This is analogous to how the existing `borrow` method provides the same
>> kind of access to the inner value as an `&P`.
>> 
>> Note that for types like `Arc`, having an `&mut Arc<T>` only gives you
>> immutable access to the inner `T`. This is because mutable references
>> assume exclusive access, but there might be other handles to the same
>> reference counted value, so the access isn't exclusive. The `Arc` type
>> implements this by making `borrow_mut` return the same type as `borrow`.
>> 
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>> 
>> This patch depends on https://lore.kernel.org/all/20230706094615.3080784-1-aliceryhl@google.com/
>> 
>>  rust/kernel/sync/arc.rs | 31 +++++++++-----
>>  rust/kernel/types.rs    | 93 ++++++++++++++++++++++++++++++-----------
>>  2 files changed, 89 insertions(+), 35 deletions(-)
>>  
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index d479f8da8f38..1c2fb36906b6 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -20,66 +20,111 @@
>>  /// This trait is meant to be used in cases when Rust objects are stored in C objects and
>>  /// eventually "freed" back to Rust.
>>  pub trait ForeignOwnable: Sized {
>> -    /// Type of values borrowed between calls to [`ForeignOwnable::into_foreign`] and
>> -    /// [`ForeignOwnable::from_foreign`].
>> +    /// Type used to immutably borrow a value that is currently foreign-owned.
>>      type Borrowed<'a>;
>>  
>> +    /// Type used to mutably borrow a value that is currently foreign-owned.
>> +    type BorrowedMut<'a>;
>> +
> 
> I would probably want to say "if the `impl ForeignOwnable` doesn't have
> the exclusive ownership, `BorrowedMut` should be the same as `Borrowed`"
> for logical self-consistent,

I don't phrase it as a requirement, but I do already say something along
these lines.

> and even further make it as default as follow:
> 
> 	type BorrowedMut<'a> = Self::Borrowed<'a>;
> 
> 	unsafe fn borrow_mut<'a>(ptr: *const core::ffi::c_void) -> Self::BorrowedMut<'a> {
> 	    Self::borrow(ptr)
> 	}
> 
> but it might be over-engineering (and require associated_type_defaults
> and more)...

I don't think it makes sense to use defaults here. There are very few
implementers of this trait, and I'd like all of them to explicitly think
about whether `BorrowedMut` should be the same as `Borrowed`, or
different.

> Anyway,
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Regards,
> Boqun

Alice

