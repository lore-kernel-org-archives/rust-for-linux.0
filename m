Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE85C7EE2D
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 May 2023 13:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241361AbjEYNnt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 25 May 2023 09:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241356AbjEYNnq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 25 May 2023 09:43:46 -0400
X-Greylist: delayed 82405 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 May 2023 06:43:39 PDT
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA33819C
        for <rust-for-linux@vger.kernel.org>; Thu, 25 May 2023 06:43:39 -0700 (PDT)
Date:   Thu, 25 May 2023 13:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=wq3otvmqe5fvvgofqofhhhriqi.protonmail; t=1685022216; x=1685281416;
        bh=suh2qWobHv/e71oBswi/1P7jWTrjhoTP+ewfudh/9Oc=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=ZCLeyRdd2VTwzqWNtR9NipZcNJ2/P7pHt5uV0Fk06vLq6AV1HT0kUoFWQgljGmnvR
         fT0wBApE4KBEF9LXRzEScZXKZVvWyRZuD0/UZTD0ozCudmvdwTN0GQLEQoVse0gySO
         4iIKmIgsce5/Ag4igpncAH8Sx/dWMv+JI08hVHh57vPNx9Y31/le8zAoad4Bi4Medw
         CJjrANb64yiAveXxS/1VLHuOuAopV2V+X9hw7kyB1IlUWLClJbpKbNGv64rd5HEftG
         XhMFkIBHrKrO1TE+goj/nnXYjO9ku8M0ctVSaVi49TxAQ507WjpUY9qBjSWong5uIO
         zbPYdlX0qPmNA==
To:     Alice Ryhl <aliceryhl@google.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v2 2/4] rust: sync: reword the `Arc` safety comment for `Sync`
Message-ID: <F0gkF9HejdO2gD14caXUPZOZIvpFjmh9R2attDV5tuKmRyTw30QeqFZDcCoOmATvMatSqzZSyFix3FdaVylbTr96U25JbA4CLIsoxvDbDoY=@proton.me>
In-Reply-To: <20230523144418.1250547-3-aliceryhl@google.com>
References: <20230523144418.1250547-1-aliceryhl@google.com> <20230523144418.1250547-3-aliceryhl@google.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 5/23/23 16:44, Alice Ryhl wrote:
> The safety comment on `impl Sync for Arc` references the Send safety
> comment. This commit avoids that in case the two comments drift apart in
> the future.
>=20
> Suggested-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
>   rust/kernel/sync/arc.rs | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 87a4c9ed712b..4d10f9868d9e 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -150,9 +150,11 @@ impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::Di=
spatchFromDyn<Arc<U>> for Ar
>   // mutable reference, for example, when the reference count reaches zer=
o and `T` is dropped.
>   unsafe impl<T: ?Sized + Sync + Send> Send for Arc<T> {}
>=20
> -// SAFETY: It is safe to send `&Arc<T>` to another thread when the under=
lying `T` is `Sync` for the
> -// same reason as above. `T` needs to be `Send` as well because a thread=
 can clone an `&Arc<T>`
> -// into an `Arc<T>`, which may lead to `T` being accessed by the same re=
asoning as above.
> +// SAFETY: It is safe to send `&Arc<T>` to another thread when the under=
lying `T` is `Sync`
> +// because it effectively means sharing `&T` (which is safe because `T` =
is `Sync`); additionally,
> +// it needs `T` to be `Send` because any thread that has a `&Arc<T>` may=
 clone it and get an
> +// `Arc<T>` on that thread, so the thread may ultimately access `T` usin=
g a mutable reference, for
> +// example, when the reference count reaches zero and `T` is dropped.
>   unsafe impl<T: ?Sized + Sync + Send> Sync for Arc<T> {}
>=20
>   impl<T> Arc<T> {
> --
> 2.40.1.698.g37aff9b760-goog
>=20

--=20
Cheers,
Benno
