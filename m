Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCD1C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 13:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbjEWNM1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 09:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbjEWNM0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 09:12:26 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0DEFF
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 06:12:25 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-510d8ead2f1so1352109a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1684847542; x=1687439542;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=0q0Er/yr0XbigUrMhIwfZk39HhWZ+8VHyfxFw7/ahKc=;
        b=btePMZYW9idGfunVyuEfePLLz8XFXxwvMARByuGFiKJWjj5EKcyKTR618MPirBd/gK
         wEgg+AoHOL+7Iiv/Pk+PPhMhowKFvg+ke1NhKOHsLC730ldjYzBbb002338TVhfOB7pS
         cjTyLFddx2V/LfwE/betWSuWcu0lzkTYAZNcy0ciGG1bDeVSaWIDmlE+f94jz/hVWCRd
         l8ghP/Ffa2G6J+qivDbjHv3GoRs6mzWxvoGuf/fWYefB5XPCLrGxTL+FfMg2BbrygpGT
         NgE6ph5VZl3J1/D+ZMiLSk4TPxBFkfwLHrFDCNKDT4OW6llxobDUEzNpRAOs0vGkdu6D
         YFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684847542; x=1687439542;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0q0Er/yr0XbigUrMhIwfZk39HhWZ+8VHyfxFw7/ahKc=;
        b=bKAcmtMC+EjqzgQAtEBxBOTr6LkQUoSWlWrwvzj36gRLAgbXTYAhoDFUuGuBIUKg5r
         6phwenSaJffpYgABKm0Np7Opy4xtxsXa2+iG/KyAdbLtBX14StwiLjGEUYjFOiaZFng3
         7+4yYcCHWSpXOTad9yfI6eQsjBm6quKRzVp5U6gQiCi4biXc9Nt57xrY6B7EQYW61AEw
         og8vER0gedcver3gvt4KmtTgvYg2KczjHI3qluiVVbGMTyJdRYIEn6R88FTlniGdnXDd
         5QXAzXzaOs0vd65nX3PLUao9uRiANmUi2vjOylFFPDkWRF5v2YjEEcMiWR9wzERPHsem
         1syA==
X-Gm-Message-State: AC+VfDyGF0Y4oSVRmVxM2qMbIZLn7hYClZQmh5HNRUKCjWORlXpGM/6W
        wFDPUSWmJy2R2vSvOdlgVeSbmg==
X-Google-Smtp-Source: ACHHUZ5kRj4YI64xMUrX7IZ9VgWw2yKzW1DREBH8Y6Ov4ig+VK1Ktgn02UEEIY6ytj+sVlzxsFYwMA==
X-Received: by 2002:a05:6402:1217:b0:50b:faa1:e1d5 with SMTP id c23-20020a056402121700b0050bfaa1e1d5mr10125374edw.39.1684847542525;
        Tue, 23 May 2023 06:12:22 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id a36-20020a509ea7000000b0050bd2f16ef5sm4241224edf.84.2023.05.23.06.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:12:22 -0700 (PDT)
References: <20230517095905.3548100-1-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: Re: [PATCH v1 1/2] rust: specify when `ARef` is thread safe
Date:   Tue, 23 May 2023 15:11:13 +0200
In-reply-to: <20230517095905.3548100-1-aliceryhl@google.com>
Message-ID: <87y1lfdwei.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> An `ARef` behaves just like the `Arc` when it comes to thread safety, so
> we can reuse the thread safety comments from `Arc` here.
>
> This is necessary because without this change, the Rust compiler will
> assume that things are not thread safe even though they are.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/types.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 29db59d6119a..9c8d94c04deb 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -321,6 +321,17 @@ pub struct ARef<T: AlwaysRefCounted> {
>      _p: PhantomData<T>,
>  }
>  
> +// SAFETY: It is safe to send `ARef<T>` to another thread when the underlying `T` is `Sync` because
> +// it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
> +// `T` to be `Send` because any thread that has an `ARef<T>` may ultimately access `T` directly, for
> +// example, when the reference count reaches zero and `T` is dropped.
> +unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
> +
> +// SAFETY: It is safe to send `&ARef<T>` to another thread when the underlying `T` is `Sync` for the
> +// same reason as above. `T` needs to be `Send` as well because a thread can clone an `&ARef<T>`
> +// into an `ARef<T>`, which may lead to `T` being accessed by the same reasoning as above.
> +unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}

Nit: I would prefer repeating the safety comment details, in case the
two drift apart in the future.


BR Andreas

> +
>  impl<T: AlwaysRefCounted> ARef<T> {
>      /// Creates a new instance of [`ARef`].
>      ///
>
> base-commit: ac9a78681b921877518763ba0e89202254349d1b

