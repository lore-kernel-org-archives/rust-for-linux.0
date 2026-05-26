Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3B2E228D
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802685; cv=none; b=KJYlz8QTI7b0s9PXA0UG0wt4Q9g/PHTouxo9LJcAvdq1O1JzHOCxzDaguxV4/d3250ZJBRh+xzFaZEGEkOtRvv1U2AqRReeYSXCV/1p4lP0XOUvpYJeNBYEAm1gebXkzuuby8ioSlrD+8Gc2wF3TbaCH/rJwYPH9MCTFhLkhdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802685; c=relaxed/simple;
	bh=qmNUqOqXlNHGubpid/VSpfW7eoqe4hIo8ENbjNZrBkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTHxcWdmxoaXM9KEFD85mBBDUzblXONYRGiDOw0YHzlWZ83fbE8DWxnAiUR6OqY5bQTGT48kWCDp9O8FKKDebg74h10hDBrsdXbc2+moMLub2ZShQuZpU50WIjpmjyBpB032f1MSUGfHRm1k/q2+EgcJbJARpxkUUyFE6bRw1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X87xOrg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X87xOrg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860721F00A3D
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779802684;
	bh=sK40+37juR/G3sWj9xl1mFOGJ/0geZZXcWwluujmNxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X87xOrg83m1HesV5PGa8jEWNV14Wfg5y4MEEMOGcHC4rxJYrRMo2qV55uOfQN5hJl
	 0/mnUdA6Q6P8Mmv2IU67Q1uCS9m09fRAfCwJUaqaQ87EsIMTGk8KPD5iRkA+EYaoYA
	 CnJyPITpfDmbgLb8011+xckk56sFHXLm5E3DOPPzk7LqogOUnY4TOohbtcpMm1blY3
	 yUnSxeM7Wmna3ikXiMCnwf/hANYZrrgWZUbbmOCu3uFnxGIO3ZBSh/hhloIguez8d2
	 FHsj/dGGsIya0OaAIt2/0ZV1uc08YEXpcgIkP+8vVMjTNXfmbFVQNxfjAnS2YFgRXM
	 kNLF4iCm9trQQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393da8f389bso90008671fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89My3/piNnlnNaAWNHaADpNYbY1G9i3lgGdw93y4d7S2mM1xjhe1al+bta8dEsem0zVFVCANFtqsYNz9nbVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8YybQWvhyaIX97dBMIUGatZ7oRGT3PwFunsBw2PKWG4sbY04
	/SVqwpcVui9J2jEt7wxa3fbmxbdhvorpEBEaI56GVmGpXaMEllcIbA5TcGmSIHaarAXbu5z7cOh
	P0UArWgm8NsnJFHLPudijgInc1ZOgmxw=
X-Received: by 2002:a05:651c:907:b0:396:c3c:d27e with SMTP id
 38308e7fff4ca-3960c3cd3femr30611241fa.12.1779802683236; Tue, 26 May 2026
 06:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-4-3d6e9406e864@kernel.org> <ahWWE_zdHnzjhUpY@google.com>
In-Reply-To: <ahWWE_zdHnzjhUpY@google.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 15:37:26 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9m96pd3OyA9H_p-c7KWiV9dm6WS21FKAHQrYekJo3JRMg@mail.gmail.com>
X-Gm-Features: AVHnY4K9rqS4zfeaMCzDnMblh38ef2FNde3oL78VSX58k_OkrVs_laNLYI1AZfc
Message-ID: <CAJ-ks9m96pd3OyA9H_p-c7KWiV9dm6WS21FKAHQrYekJo3JRMg@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: binder: enable `clippy::ref_as_ptr` lint
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 8:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Fri, May 22, 2026 at 07:12:49PM +0200, Tamir Duberstein wrote:
> > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> >
> > > Using `as` casts may result in silently changing mutability or type.
> >
> > While this does not eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize. It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the chang=
es
> > and enable the lint in the Binder Rust driver -- no functional change
> > intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_=
ptr [1]
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> >  drivers/android/binder/node.rs             | 2 +-
> >  drivers/android/binder/page_range.rs       | 4 ++--
> >  drivers/android/binder/rust_binder_main.rs | 2 +-
> >  drivers/android/binder/trace.rs            | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/no=
de.rs
> > index d710940c3c8f..a4a3ddda6ac9 100644
> > --- a/drivers/android/binder/node.rs
> > +++ b/drivers/android/binder/node.rs
> > @@ -321,7 +321,7 @@ pub(crate) unsafe fn remove_node_info(
> >      /// An id that is unique across all binder nodes on the system. Us=
ed as the key in the
> >      /// `by_node` map.
> >      pub(crate) fn global_id(&self) -> usize {
> > -        (self as *const Node).addr()
> > +        core::ptr::from_ref(self).addr()
>
> Can we please import core::ptr?

Of course, will do.

> >      }
> >
> >      pub(crate) fn get_id(&self) -> (u64, u64) {
> > diff --git a/drivers/android/binder/page_range.rs b/drivers/android/bin=
der/page_range.rs
> > index 927b0802e80d..93e79c08b89a 100644
> > --- a/drivers/android/binder/page_range.rs
> > +++ b/drivers/android/binder/page_range.rs
> > @@ -312,7 +312,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::=
VmaNew) -> Result<usize> {
> >
> >          // SAFETY: This just initializes the pages array.
> >          unsafe {
> > -            let self_ptr =3D self as *const ShrinkablePageRange;
> > +            let self_ptr =3D core::ptr::from_ref(self);
> >              for i in 0..num_pages {
> >                  let info =3D pages.as_mut_ptr().add(i);
> >                  (&raw mut (*info).range).write(self_ptr);
> > @@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset=
: usize, obj: &T) -> Result {
> >          unsafe {
> >              self.iterate(offset, size_of_val(obj), |page, offset, to_c=
opy| {
> >                  // SAFETY: The sum of `offset` and `to_copy` is bounde=
d by the size of T.
> > -                let obj_ptr =3D (obj as *const T).cast::<u8>().add(obj=
_offset);
> > +                let obj_ptr =3D core::ptr::from_ref(obj).cast::<u8>().=
add(obj_offset);
> >                  // SAFETY: We have a reference to the object, so the p=
ointer is valid.
> >                  page.write_raw(obj_ptr, offset, to_copy)?;
> >                  obj_offset +=3D to_copy;
> > diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/andro=
id/binder/rust_binder_main.rs
> > index fa28697982d3..88da29413e16 100644
> > --- a/drivers/android/binder/rust_binder_main.rs
> > +++ b/drivers/android/binder/rust_binder_main.rs
> > @@ -6,7 +6,7 @@
> >
> >  #![crate_name =3D "rust_binder"]
> >  #![recursion_limit =3D "256"]
> > -#![allow(clippy::as_underscore, clippy::ref_as_ptr, clippy::cast_lossl=
ess)]
> > +#![allow(clippy::as_underscore, clippy::cast_lossless)]
> >
> >  use kernel::{
> >      bindings::{self, seq_file},
> > diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/t=
race.rs
> > index 5539672d7285..b6cae57801fc 100644
> > --- a/drivers/android/binder/trace.rs
> > +++ b/drivers/android/binder/trace.rs
> > @@ -26,7 +26,7 @@
> >
> >  #[inline]
> >  fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
> > -    t as *const Transaction as rust_binder_transaction
> > +    core::ptr::from_ref(t).cast_mut().cast()
>
> This just removes the type annotations I had. I'm not sure it's
> cleaner.

Would you prefer to locally disable the lint? Personally I don't find
the prior type mentions helpful: the pointer type is just the coerced
reference and the final type is the function return type, so all the
information is still plainly in view, but I don't feel strongly enough
to die on this hill; I would just like to remove the top-level lint
disablement.
