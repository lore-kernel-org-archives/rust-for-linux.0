Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1B264F9F
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614027; cv=none; b=Y9yZwbZCUZH4esZm1S3gCSipNGSoeVy9kjj3lZ46cPUXLksS3D3/abVDHzqiPi9JRNxENw4UTyS9zki09OtUsj/oLFuBTszjyA0L9r/i9t95PeGMGGOIjta0FNGu0knh3xH+qHFHOipDnUKsnXWqAX1WMyaEHL4FqTip7tjcgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614027; c=relaxed/simple;
	bh=3trx5R/M+xWnf5beGTQUOyrsUzJZN+ahmPugh1Rixvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGRaOdH9++pSfFptlIGuoJ/1AJbf2PJZUuSlaphkajZL7Eq3S4fh605AEwVSdkjXs74CctppCBoCXCYAXg9QMqv0lNZ9At+buh2v0mmOWDcWFOusc+sVXl7UrlKSPvkqPIZMhgL7uGhW0SOqDPfBb+V9U/VZP1sEDQp+nIuw8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9O76gvE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9O76gvE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-618660b684fso10842a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755614024; x=1756218824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6mV5AzvcCMM7XNoyhp4OiFgEpigZ/RdhxdDY6qvzhY=;
        b=i9O76gvE2+xmG8BbtvRXd8jbLaCFU2EujJc/qwHtfIn4nqlnNreXm4mRNLVzBjzZUb
         6dGo0uRuyq/eaiPGMP1Fkdj/mYbFHYhO+v6N9iWQ7cXoPOrXuAdte77KgOxHyvadHKC+
         6ZYzZ2gVFkNkg2M2ixP5H/ppZ+GiAb6/t9DM1KwCKzIdrtpOLqO/+mWWp0vfQ8XogEWC
         Nki4OYrY2W8fL22zmu8G/HUnOojaIZx6qLfGj42CTt3R/ptoAINJDV2Qy0hRrfgmtI6P
         AVJbETKvGapmkxjaQWvduFwf3BqHNO8jNEWBmOFXRV4rM/I40zcSQKMkpMY+CKgptSzu
         Wx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755614024; x=1756218824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6mV5AzvcCMM7XNoyhp4OiFgEpigZ/RdhxdDY6qvzhY=;
        b=SkQ9ghNAQa6hpuJ1Y+Ks0mBBXwU/oN88Pq7lddNChZhPS5nOAcnMehJz4SjS63g3bX
         pbKiOjLyplF3150eu/1knh7nK1gbyNIJUva+rR+81I54qer41ZAVlBvmTiqS+Drz4z9n
         SKr1dBBzCrv0NUFDWlW6CO3Okq7h1XPVfjcsYnqEXT6tLp7WDWvoFvGtwqwoT7kgc0gL
         8FQD3SEg5BiA5kRD+VFHPcfnRDgjEvTa4Ana8MZ14Ka5mF/fUG3rlMOUuxJ3y5zFhwLO
         dCqBiYWBnq7pyOMoEM2nUeHllcX98wEeKQfizcc+cUyElHxIq/4x5A1UfhrXmI+dLDPd
         ZEyA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ31MiY14KpmA+C9MxHMvq2txn2H3925HkQ741PUj27HFoXwCUrBsEZZFHPWY3n1ukSUY47rTfUE7b1nvkHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62aJgbBwJaeVUiBWRrGskAkzDEReHby5+8Z3o7W28lLr50pi8
	U/dIzbhbRDOotwDg0Jcn5Kf9tmBux3Zi1DiTgn7yQMA5JtFnzxHzSXzEXQeYcdBY5QREGjKZ2nZ
	+HOtHnjnVad6UwfrdSghNebWorlswg+bpt3xUoM/R
X-Gm-Gg: ASbGncuvu2s6hx562k508HlyJAdTyQfDWvPkxnSyZyx8ExJ9VUu5LpK2jE+XKjDfe7T
	3H0Om15Yt3s7ZijGW0Pf9IPtDOPuVH1kLmdMk6nzGjOUxAiG1h1CDY2KSXyG6/kWYl9imKgjpbl
	DuEldG0/7tzTS2TZzvN8ncTZDehhwWPHwqOd2xXZLNHd063feqlIuPPVMGZ8WNL0P6PPIFY4I+I
	UwXtp/i3Pjf4v57FSFezAjvzGNedFg/V5cABeEg0L8wZOgmoTy8+kS4Ag==
X-Google-Smtp-Source: AGHT+IGQ5V8zUBRhj0rx9eKVoi+ex/LE30Go+uwXVC6L2jeGAkVhf+x3rBW4AlEnkeL8Q0nOYVwu36AEz7alQMcSmVU=
X-Received: by 2002:a05:6402:2901:b0:618:8198:de66 with SMTP id
 4fb4d7f45d1cf-61a7d151236mr72750a12.2.1755614023461; Tue, 19 Aug 2025
 07:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-debugfs-rust-v9-0-92b9eab5a951@google.com>
 <20250709-debugfs-rust-v9-3-92b9eab5a951@google.com> <2a0f2965-af37-4ffe-8806-3bb469361b1d@de.bosch.com>
In-Reply-To: <2a0f2965-af37-4ffe-8806-3bb469361b1d@de.bosch.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 19 Aug 2025 07:33:31 -0700
X-Gm-Features: Ac12FXwb3Ek8VNk4FhyQsTKgV5xyVNRTu-rsKAalBG2DsQvuWh5YSlNVSLXS-aA
Message-ID: <CAGSQo03meaA2fmoHqxdcVSXrKdE7yTTK0JfWH28mHZ=0kWoTzA@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] rust: debugfs: Support `PinInit` backing for `File`s.
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:51=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.co=
m> wrote:
>
> Hi Matthew,
>
> On 09/07/2025 21:09, Matthew Maurer wrote:
> > This allows `File`s to own their data, allowing DebugFS files to be
> > managed in sync with the data that backs them. Because DebugFS files ar=
e
> > intended to actually own data and provide access, `File`s still maintai=
n
> > the same lifecycle for provided data when `CONFIG_DEBUG_FS` is disabled=
.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/kernel/debugfs.rs | 149 ++++++++++++++++++++++++++++++++++++++---=
--------
> >  1 file changed, 117 insertions(+), 32 deletions(-)
> >
> > diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> > index e5b6497d1deb67671d22ffd90cd5baa855bb9257..a1a84dd309216f455ae8fe3=
d3c0fd00f957f82a9 100644
> > --- a/rust/kernel/debugfs.rs
> > +++ b/rust/kernel/debugfs.rs
> > @@ -5,12 +5,13 @@
> >  //!
> >  //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugf=
s.h)
> >
> > -#[cfg(CONFIG_DEBUG_FS)]
> > -use crate::prelude::GFP_KERNEL;
> > +use crate::prelude::*;
> >  use crate::str::CStr;
> >  #[cfg(CONFIG_DEBUG_FS)]
> >  use crate::sync::Arc;
> >  use core::fmt::Display;
> > +use core::marker::PhantomPinned;
> > +use core::ops::Deref;
> >
> >  #[cfg(CONFIG_DEBUG_FS)]
> >  mod display_file;
> > @@ -63,40 +64,78 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> S=
elf {
> >      }
> >
> >      #[cfg(CONFIG_DEBUG_FS)]
> > -    fn create_file<T: Display + Sized + Sync>(&self, name: &CStr, data=
: &'static T) -> File {
> > -        let Some(parent) =3D &self.0 else {
> > -            return File {
> > +    /// Creates a DebugFS file which will own the data produced by the=
 initializer provided in
> > +    /// `data`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The provided vtable must be appropriate for implementing a seq=
_file if provided
> > +    /// with a private data pointer which provides shared access to a =
`T`.
> > +    unsafe fn create_file<'a, T: Sync, E, TI: PinInit<T, E>>(
> > +        &self,
> > +        name: &'a CStr,
> > +        data: TI,
> > +        vtable: &'static bindings::file_operations,
> > +    ) -> impl PinInit<File<T>, E> + use<'_, 'a, T, E, TI> {
>
> Rebasing my test code from an older version of this series to this v9
> (this is the most recent one?) here in rust/kernel/debugfs.rs and in
> samples/rust/rust_debugfs.rs I get errors for each place where
> 'use<...>' is used:
>
> error[E0658]: precise captures on `impl Trait` are experimental
>   --> rust/kernel/debugfs.rs:81:37
>    |
> 81 |     ) -> impl PinInit<File<T>, E> + use<'_, 'a, T, E, TI> {
>    |                                     ^^^
>    |
>    =3D note: see issue #123432
> <https://github.com/rust-lang/rust/issues/123432> for more information
>    =3D help: add `#![feature(precise_capturing)]` to the crate attributes
> to enable
>    =3D note: this compiler was built on 2024-09-04; consider upgrading it
> if it is out of date
>
> rustc is
>
> rustc 1.81.0 (eeb90cda1 2024-09-04)
>
The easy way to resolve this is to use `rustc` 1.82.0 or newer (you're
only one revision behind!), but that's past the MSRV for the kernel at
the moment of 1.79.0. I intend to send up a new patch today, so I
suppose I'll need to put that behind a flag similar to
`RUSTC_HAS_DERIVE_COERCE_POINTEE`.
>
> I tried to work around this by adding
>
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -36,6 +36,9 @@
>  //
>  // To be determined.
>  #![feature(used_with_arg)]
> +
> +#![feature(precise_capturing)]
> +
>
> This seems to help for rust/kernel/debugfs.rs but not for
> samples/rust/rust_debugfs.rs.
Did you add `#![feature(precise_capturing)]` to
`samples/rust/rust_debugfs.rs` as well? It is its own crate, so it has
its own set of features.
>
>
> Any hint?
>
> Best regards
>
> Dirk
>
