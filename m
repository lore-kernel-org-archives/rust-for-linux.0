Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04322D7BE
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658798; cv=none; b=tNmPLxIzHz21aL2LSrmGmaOGQk05ANJ9ypTWnry1uLR6G9OaI51Aj8jHgLvYPd8rEw2IZ8j7sOg/0CT7ooDuEbp19jbd+gollYOU5YUKZ7nHfOGpqmLlEkkPlxCeM2dq0na9XoefgClTr9c4y9/Jxzekrozy+y8ujISMx6yYmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658798; c=relaxed/simple;
	bh=u7MGhynBrW4XzL2BBEX+Qn/6dYTwxzMNVdpH0lUcAp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbgQgJUq/0aDcep8mtD9KSAoYYeH9AI4W3+Fz1bZMR63odw8zCOv8W5juv7a1oFg+xcEBnbCJOda8Sb714VdaL+snSVSJMazdtaiPpPGxgU69PMuPhv647trWUYemCf120jP3Tm6x41GXG5OWb6ze0b3kTARYCI2QTqSdTXaHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oFVha0SR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oFVha0SR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f1e8efe84so312839f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 04:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740658795; x=1741263595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4K8UiwVopP53xOklWDCrKpSnqZT0eqEWjR2XgfhARY=;
        b=oFVha0SRj1OPMM2EymezsVg/qqoXpdUY9WNMdBVAw9ZMuoLTFlVO+IqK8fUvajsZOR
         b5Ay7Rnc361j2hTPlnN4kPyKC5kZ3XIQZh3I4deWOVuVpdmiff8U5Y6ewUuveK/vmD3j
         ba4aKtrQy9qmt2F1HUIX1b2Kv8TIGOU58MNeDbMJFiNbE4a8VvJZAaaV+H9Sh0rfUTEQ
         jyV0OQnkMWXQEuMrunjL8ZL+aHD1aGE16TYgf9xD0etfoN7nPh8Cd+MLeBW2/37zNmYJ
         HatvnrDEpSf6yqJhs7oMcQjuhOlLDnPvEqovwxiUS5KxtlNor0xbeh5/bpp4dFX8MrT7
         hX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658795; x=1741263595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4K8UiwVopP53xOklWDCrKpSnqZT0eqEWjR2XgfhARY=;
        b=IdiKiip3EYjA4WgZgjF0B3WpYauROp8reSfwBszjvddyG8vKlkAllpdHWyWynNrOCX
         7i1eWVOb3uOHZpw0UdtY6AWEUmQjVvDzzJCHwhAF0TqcIT9qByG39eu1jiAcpIPffg1m
         aFg5Ukj4wtk50Y+eZC4GqU/Dg4fQT74TPaLxBJ+SKUN335uw5CHBQ903nsuxklV8sI69
         fiZg9/CD/UYDJj54jIBN17cnpiaOakPJ/ZWteVxydwgK3z89JvZt6HMx8bzsaRNXhykY
         qjfSbYkoU5MDUEF2lhMYWzeqby3EYOF+A4B4uKdP08fVzE3YHQ6ebqD+6naX8vhxbpwf
         bh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCgLQ5c1mGE0qXCBdrYeEA5BjBHH81mhieA4v2bdWH7oW9GEuboy6ekfCBL47EWyEQTHZSJ2WwzlU9yJ2ARQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgCpn00Iwj8z6gh6+p2Cdv1krPydOKQ3CS+K5BlOkXKvfh1ei/
	GQUl6mA2o0mBGKA21k+pWEe2VtyirkBLutZxNCux0SRAGRkGNDCxNX0utv+Y6G7a1lfs6aYt4cE
	SaFuG9zVkBeFFzQah4ujKbvDvnrhPigKu/raW
X-Gm-Gg: ASbGncuIWcf0UZq+TU/RLMzKO0JJih5QDsf0Ce++MvMa6aB47yaHd3S6rxdOf9M8k9l
	gLVjcBgkrOCZw0gscrtJ5ElRjLKZQyJ+8+yqOi5v/oxT11BhVFico/awrHdKHvtazbUM4mJYgKB
	wPZJywc00tEFnEBssym1OvTOh7Jx0zBXTqYvWk7w==
X-Google-Smtp-Source: AGHT+IEKZwk8Kq2mq+sCggG9tt199/S5gDLDG+iTeZ1Eo+AMAi7QqJSIE9qQ+X+XF1Rpkj8qlzEAsa7zDuZuHXBR2wQ=
X-Received: by 2002:a5d:5985:0:b0:38f:3ee5:fd36 with SMTP id
 ffacd0b85a97d-38f6f0af903mr23070702f8f.53.1740658795362; Thu, 27 Feb 2025
 04:19:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLggyEXyyaFNnmBCPOSX051TiFyAp0B8GfahbPg=+LrtUWA@mail.gmail.com>
 <20250225180223.763026-1-aliceryhl@google.com> <20250227104640.sa6vqdz7j5hwjigs@vireshk-i7>
In-Reply-To: <20250227104640.sa6vqdz7j5hwjigs@vireshk-i7>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Feb 2025 13:19:43 +0100
X-Gm-Features: AQ5f1JqWf30os7GawawS5Uk4aefwZr9l8Qmlesu4YIZqX8gdGJlMfcQv-exzF4E
Message-ID: <CAH5fLgg8PvCEEks81Dy_3eRBkVG4P0a7usB2cfP2pbcSw495FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@redhat.com, 
	gary@garyguo.net, linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	vincent.guittot@linaro.org, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 11:46=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 25-02-25, 18:02, Alice Ryhl wrote:
> > diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> > +/// This corresponds to the C type alias `cpumask_var_t`.
> > +pub struct CpumaskBox {
> > +    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
> > +    ptr: NonNull<Cpumask>,
> > +    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> > +    mask: Cpumask,
> > +}
> >
> > +impl CpumaskBox {
> > +    pub fn new(_flags: Flags) -> Result<Self, AllocError> {
> > +        Ok(Self {
> > +            #[cfg(CONFIG_CPUMASK_OFFSTACK)]
> > +            ptr: {
> > +                let mut ptr: *mut bindings::cpumask =3D ptr::null_mut(=
);
> > +                unsafe { bindings::zalloc_cpumask_var(&mut ptr, _flags=
.as_raw()) };
> > +                NonNull::new(ptr.cast()).ok_or(AllocError)?
> > +            },
> >              #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> > -            // SAFETY: The pointer was earlier initialized from the re=
sult of `KBox::into_raw()`.
> > -            unsafe {
> > -                drop(KBox::from_raw(self.ptr))
> > -            };
> > -        }
> > +            mask: unsafe { core::mem::zeroed() },
>
> This will work correctly, yes, but I wasn't sure if the Rust code
> should do this or depend on the C API and call zalloc_cpumask_var().
> The implementation of struct cpumask allows this to work right now,
> but any change where some internal state management is done, for
> example, within the structure may break the Rust side.
>
> I am okay with this way of doing it if that looks okay to you.
>
> I have made following changes over your diff.
>
> Thanks for your help in simplifying the code.
>
> --
> viresh
>
> -------------------------8<-------------------------
>
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> index f82dafbc4e61..d56f7dc9d762 100644
> --- a/rust/kernel/cpumask.rs
> +++ b/rust/kernel/cpumask.rs
> @@ -13,20 +13,28 @@
>  #[cfg(CONFIG_CPUMASK_OFFSTACK)]
>  use core::ptr::{self, NonNull};
>
> +#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> +use core::mem::MaybeUninit;
> +
> +use core::ops::{Deref, DerefMut};
> +
>  /// This corresponds to the C type `struct cpumask`.
>  #[repr(transparent)]
> -pub struct Cpumask {
> -    mask: Opaque<bindings::cpumask>,
> -}
> +pub struct Cpumask(Opaque<bindings::cpumask>);
>
>  impl Cpumask {
> -    /// Creates a reference to an existing `struct cpumask` pointer.
> +    /// Creates a mutable reference to an existing `struct cpumask` poin=
ter.
>      ///
>      /// # Safety
>      ///
>      /// The caller must ensure that `ptr` is valid for writing and remai=
ns valid for the lifetime
>      /// of the returned reference.
> -    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a m=
ut Self {
> +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask_var_t) ->=
 &'a mut Self {

Why?

Perhaps put this on the CpumaskBox and keep the `struct cpumask` one here?

Alice
