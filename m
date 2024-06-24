Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845D03EA7B
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Jun 2024 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218878; cv=none; b=eiV/gEgH0V7nZUJshWBMiL5PYfPBJwqxh1xwBeyZnx24aP+mcu49Xwuhy9xJZk70wCbdKW3dATLkYsuy7+vnK7kg8AkIkrCQ+MgK0taYqQmHE0KV4itrdVIUzlxx//izBeqNGJd8DXjTC1VycaEc8WKZD1FgzA5nZhBLG7lidVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218878; c=relaxed/simple;
	bh=i3kZDMLWLd96gDc9K4Y6EHHzzcKLPUDlc3MNH5wNmtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWpFsC1WMgfEboF4TyR9NBLp29v5eHhEpK3FuOpkJmp+gTzw9cHj/45PvqLo4ZIyrMh7T2ShU9LdvmmXkJxj5NZfSbxhTtZuVcODrNxd6Wc+Etu6T33xPWS5cAFcwHHWGSRhmS1mCZ68IsHyvOlfnXx5F/irWWp1NYZRqMJMg1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x66/RpTL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x66/RpTL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3620ee2cdf7so2577919f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Jun 2024 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719218875; x=1719823675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vELzHvwfYhfgaQfS4TW87Hdwhf+qF89/1wZ285PgAPE=;
        b=x66/RpTLtnZEYxHRs5gMA+kOCWSNEHg4AjtC9fmhbjLx6bFdctvioj09EH5xeI7E0y
         SJa2Zf/X9NGyS+A5qsAfxV7o6NJhZk7ixwe0Rr02miAo0is47o2PH/s5Y1NLsMc64jAT
         tqT7ZUkScQF0COHiQdh4rslyN03aaRgIkbVbgim/1phKZ9knqD65N1GdTzudW0fhqUYj
         jc9QtrbQBvnMgxhwWfShFAxKRSg5ElKVm24u3SHP1Wn7JAq9+IRq5dc8aOl6kBR79xnN
         OGBamLvgBQHQNbcywPKPfTQWDlN1QMAbX7mStns3uLHABUFzgLW0EiPYTjXI0IBylaSD
         ddeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719218875; x=1719823675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vELzHvwfYhfgaQfS4TW87Hdwhf+qF89/1wZ285PgAPE=;
        b=s28nBDCl3ElER3LmS8RF0IjvWvMoytGwm4YCwtTfYLXRcFSR2RQzTk4QS026LmrXBW
         KeBCdBzb7gqDIw87l/6VXn5Ga6NGojrPRVlm+qeJ4Mxi7YO/nhsumQhpzIOuBDAFQqrY
         +ot9pnTOLikUGKvg2h4CkJCqHiyKP1QbJ09gwx1rRnnvVydk5cRKW+J/aURNX4JsTSrF
         qhlt8dlM5LtZ20eisP0Vx4L3TnjsTVC1OgHR0PiNl1MOQuzlQYnUP4cWrfaiyV2EjYmR
         /TUp6ggJJm0JAziJ0ot1V+JFxsMFUc4Uq5yx4m08twOW0x4C2jJhHJtFaFw043Z/yryp
         3KsA==
X-Forwarded-Encrypted: i=1; AJvYcCXPDGrSdt2+DHPhSJbmIIeFE00S83ymPYOpLn++o8dDVlEGcu5cJgICFjaQH4MwZ5FSJxB+hcQdeXlhfs2RoXeXlYsqkSiSu7HPQTJijO4=
X-Gm-Message-State: AOJu0YyS/k9JOBdoR+gb3bMo54uGKE5XWZi4yzo1BFHGUXY1yLjGntAc
	jzjIJvR5oJnz+b7uZ2i9BA/iS8BKm6i8mMNr6YsKnf6YJBapKv75w6WyrJAGY/mW5b2oBPcmgpi
	9PmIrtIAJd7CydICQJAS2dqWA+G4Wn+MDphqV
X-Google-Smtp-Source: AGHT+IE9V99OcnVY2w5i3sRLtVONVJbuxlBrAVus/aJjTnXSg4b3TawmnAI8iMfxGKRXFJX0BoKOdvzCDWniQrAdAjY=
X-Received: by 2002:a5d:58fa:0:b0:35f:1b73:1d83 with SMTP id
 ffacd0b85a97d-366e7a08ba5mr3371333f8f.4.1719218874677; Mon, 24 Jun 2024
 01:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624030327.90301-1-ethan.twardy@gmail.com> <20240624030327.90301-5-ethan.twardy@gmail.com>
In-Reply-To: <20240624030327.90301-5-ethan.twardy@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 24 Jun 2024 10:47:43 +0200
Message-ID: <CAH5fLgjgMxZ5S-wLqu6pOz=HzrV6qJGe5N=2rrYNvo3uVPbVbA@mail.gmail.com>
Subject: Re: [PATCH 4/4] rust: macros: Enable the rest of the tests
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Aswin Unnikrishnan <aswinunni01@gmail.com>, "open list:RUST" <rust-for-linux@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 5:04=E2=80=AFAM Ethan D. Twardy <ethan.twardy@gmail=
.com> wrote:
>
> Now that the rusttest target for the macros crate is compiled with the
> kernel crate as a dependency, the rest of the rustdoc tests can be
> enabled.
>
> Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 8afed8facb21..6d764099563b 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -102,7 +102,9 @@ pub fn module(ts: TokenStream) -> TokenStream {
>  ///
>  /// # Examples
>  ///
> -/// ```ignore
> +/// ```rust
> +/// # #[macro_use] extern crate macros;
> +/// # #[macro_use] extern crate kernel;

You also added these lines in patch 2, but you did not make them hidden the=
re.

>  /// use kernel::error::VTABLE_DEFAULT_ERROR;
>  /// use kernel::prelude::*;
>  ///
> @@ -147,12 +149,28 @@ pub fn vtable(attr: TokenStream, ts: TokenStream) -=
> TokenStream {
>  ///
>  /// # Examples
>  ///
> -/// ```ignore
> -/// use kernel::macro::concat_idents;
> +/// ```rust
> +/// # const binder_driver_return_protocol_BR_OK: u32 =3D 0;
> +/// # const binder_driver_return_protocol_BR_ERROR: u32 =3D 1;
> +/// # const binder_driver_return_protocol_BR_TRANSACTION: u32 =3D 2;
> +/// # const binder_driver_return_protocol_BR_REPLY: u32 =3D 3;
> +/// # const binder_driver_return_protocol_BR_DEAD_REPLY: u32 =3D 4;
> +/// # const binder_driver_return_protocol_BR_TRANSACTION_COMPLETE: u32 =
=3D 5;
> +/// # const binder_driver_return_protocol_BR_INCREFS: u32 =3D 6;
> +/// # const binder_driver_return_protocol_BR_ACQUIRE: u32 =3D 7;
> +/// # const binder_driver_return_protocol_BR_RELEASE: u32 =3D 8;
> +/// # const binder_driver_return_protocol_BR_DECREFS: u32 =3D 9;
> +/// # const binder_driver_return_protocol_BR_NOOP: u32 =3D 10;
> +/// # const binder_driver_return_protocol_BR_SPAWN_LOOPER: u32 =3D 11;
> +/// # const binder_driver_return_protocol_BR_DEAD_BINDER: u32 =3D 12;
> +/// # const binder_driver_return_protocol_BR_CLEAR_DEATH_NOTIFICATION_DO=
NE: u32 =3D 13;
> +/// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 =3D 14;
> +///
> +/// use kernel::macros::concat_idents;

The empty line above this import should probably be removed to improve
how this is rendered.

>  ///
>  /// macro_rules! pub_no_prefix {
>  ///     ($prefix:ident, $($newname:ident),+) =3D> {
> -///         $(pub(crate) const $newname: u32 =3D kernel::macros::concat_=
idents!($prefix, $newname);)+
> +///         $(pub(crate) const $newname: u32 =3D concat_idents!($prefix,=
 $newname);)+
>  ///     };
>  /// }
>  ///
> @@ -198,8 +216,9 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream =
{
>  ///
>  /// # Examples
>  ///
> -/// ```rust,ignore
> -/// #[pin_data]
> +/// ```rust
> +/// # use std::{sync::Mutex, process::Command};
> +/// #[kernel::macros::pin_data]
>  /// struct DriverData {

I'm pretty sure `#[pin_data]` is in our prelude and doesn't need an
import in normal code. If it needs an import in the test, then please
add a hidden import rather than using the full path.

>  ///     #[pin]
>  ///     queue: Mutex<Vec<Command>>,
> @@ -207,7 +226,15 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream=
 {
>  /// }
>  /// ```
>  ///
> -/// ```rust,ignore
> +/// ```rust
> +/// # use std::{sync::Mutex, process::Command};
> +/// # use core::pin::Pin;
> +/// # pub struct Info;
> +/// # mod bindings {
> +/// #     pub unsafe fn destroy_info(_ptr: *mut super::Info) {}
> +/// # }
> +/// use kernel::macros::{pin_data, pinned_drop};
> +///
>  /// #[pin_data(PinnedDrop)]
>  /// struct DriverData {
>  ///     #[pin]
> @@ -222,6 +249,8 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream =
{
>  ///         unsafe { bindings::destroy_info(self.raw_info) };
>  ///     }
>  /// }
> +///
> +/// # fn main() {}
>  /// ```
>  ///
>  /// [`pin_init!`]: ../kernel/macro.pin_init.html
> @@ -237,13 +266,20 @@ pub fn pin_data(inner: TokenStream, item: TokenStre=
am) -> TokenStream {
>  ///
>  /// # Examples
>  ///
> -/// ```rust,ignore
> +/// ```rust
> +/// # use macros::{pin_data, pinned_drop};
> +/// # use std::{sync::Mutex, process::Command};
> +/// # use core::pin::Pin;
> +/// # mod bindings {
> +/// #     pub struct Info;
> +/// #     pub unsafe fn destroy_info(_ptr: *mut Info) {}
> +/// # }
>  /// #[pin_data(PinnedDrop)]
>  /// struct DriverData {
>  ///     #[pin]
>  ///     queue: Mutex<Vec<Command>>,
>  ///     buf: Box<[u8; 1024 * 1024]>,
> -///     raw_info: *mut Info,
> +///     raw_info: *mut bindings::Info,
>  /// }
>  ///
>  /// #[pinned_drop]
> @@ -408,7 +444,9 @@ pub fn paste(input: TokenStream) -> TokenStream {
>  ///
>  /// # Examples
>  ///
> -/// ```rust,ignore
> +/// ```rust
> +/// use kernel::macros::Zeroable;
> +///
>  /// #[derive(Zeroable)]
>  /// pub struct DriverData {
>  ///     id: i64,
> --
> 2.44.2
>
