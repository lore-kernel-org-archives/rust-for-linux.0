Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408F4C61DA4
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Feb 2023 16:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjBBQur (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 2 Feb 2023 11:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbjBBQuq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 2 Feb 2023 11:50:46 -0500
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF946DFC3
        for <rust-for-linux@vger.kernel.org>; Thu,  2 Feb 2023 08:50:46 -0800 (PST)
Date:   Thu, 02 Feb 2023 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1675356641; x=1675615841;
        bh=zc8Xf3RXRdsIAaqhjQkYwskcgdvGA/T9bryOpfGnTVQ=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=EJqCJ+L7EuYM4Kl1GULeDZLcW5smcqxlvkiQ5w4IqRwcGzlE2e1y/nj8K+5KpzrgQ
         7YEm7nc7bo4kNLBWyuT9EAbtB1AUPnkfBbYLya5u4BR1j5n7byPFXSBtCVn5ZfqyjV
         VtSTovUQvLuBLT2cKop6f7RsqpdZdkAvBFCpwBNDCLFnHZso0TcKApBFKm2jhjUE/U
         6bfhtSBWvTrh05kqR/UUY73B671JRRp+WI+wu3kje+HtSrVAgJIbs8dKAugku1A3il
         FK4cTkNWKreZbuZXHrnuZes0nm5XTgOnoDg6SWrqVXTcCYiGTV5ww+tfrMRfG6N9+n
         IkdA41dgIv/mA==
To:     Boqun Feng <boqun.feng@gmail.com>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: Re: [RFC 1/5] rust: sync: impl Display for {Unique,}Arc
Message-ID: <RnbeX8ZDnE3RHPxTyuM2byWftZCmpUipzdPSCVX97YlKM_PH2aUyM6sATB7cjIMva0hK4jttJq2rLyMOMxMR4jzx-R7CzuWyjB2R9mrqF4E=@protonmail.com>
In-Reply-To: <20230201232244.212908-2-boqun.feng@gmail.com>
References: <20230201232244.212908-1-boqun.feng@gmail.com> <20230201232244.212908-2-boqun.feng@gmail.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thursday, February 2nd, 2023 at 00:22, Boqun Feng <boqun.feng@gmail.com>=
 wrote:

> This allows printing the inner data of `Arc` and its friends if the
> inner data implements `Display`. It's useful for logging and debugging
> purpose.
>=20
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>

>=20
> ---
>  rust/kernel/sync/arc.rs | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 519a6ec43644..fc680a4a795c 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -22,6 +22,7 @@ use crate::{
>  };
>  use alloc::boxed::Box;
>  use core::{
> +    fmt,
>      marker::{PhantomData, Unsize},
>      mem::{ManuallyDrop, MaybeUninit},
>      ops::{Deref, DerefMut},
> @@ -522,3 +523,15 @@ impl<T: ?Sized> DerefMut for UniqueArc<T> {
>          unsafe { &mut self.inner.ptr.as_mut().data }
>      }
>  }
> +
> +impl<T: fmt::Display + ?Sized> fmt::Display for UniqueArc<T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Display::fmt(self.deref(), f)
> +    }
> +}
> +
> +impl<T: fmt::Display + ?Sized> fmt::Display for Arc<T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Display::fmt(self.deref(), f)
> +    }
> +}
> --
> 2.39.1
