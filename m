Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627DD172BD5
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722516548; cv=none; b=Gza4k+rAWsuvgKLQMF0LoEA9YHg1uzVzv++49qQ4c79w3BKZX8C1nheZndSI5Lpdc7Oy0ddOQtgqSnikdpRGG+nT/VIDCxaKIfSyvLsnmyi9e3T72oxO87zkoHaaIlUr0nkIZgM6rGGl3O0hbIGB3WvvknRb/qgqC45Fyd9w0co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722516548; c=relaxed/simple;
	bh=yCTTXbRTR9vcCIO49PvqbkjFhy2jjGQvDbjsg/TiMys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sugNu34LoGQgPItUBqUsYUrdDOQ6aE8vsgdK2FWhvpGa1u9aK402yyzeKTSH7nG0ps2KHJYblcmesPPjcnQhztb+NorWgOP2A4hLrni1TGPo0RkPeH7S2zvf+UuvsXWOLxCXucxD5GH4h5t7MM0G0v+3pqqyPxXmKxvclYtRxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cn69r+ue; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cn69r+ue"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so2736015f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722516545; x=1723121345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivf0dedh/kNlaxhUOXBBVCs+HsDrPdQjzUTbZCof2Q8=;
        b=cn69r+ueC1vQz3yev2U+dIp4RaJZiE0HwKwPE7IMNQasVrHaRkV3bpwjrIa7pEl3bc
         zJeEKUeVbNRDUFPQ2l6reTMBD5uL+1/H/YE0rkeUG1eKwTwEGFBN2RJfbrHmueOsOKJW
         TPkxThJReGgMaFIaAD62BygBMb3TthkKbeqxOW53JuefmySesXRH643ZJ1ymOXv1cqib
         ftVbUcdYRrF4E+nkhu/6POfYpZVj06uDYl3U1hzsCW1mRMpco16t0z8yCtWyYEOmuQo6
         SHeDAuTsZlpHfr/0/eXpVDdL318enREGeMW4noFUVEEmAxOaO+P96sr+wztWyrEnyPlf
         ewmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516545; x=1723121345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivf0dedh/kNlaxhUOXBBVCs+HsDrPdQjzUTbZCof2Q8=;
        b=ArK1XeZkPkasXfXiFd5GJukAfHdo5xmiXOFA/4y5PufhfDvqwo2Cm4v0NkYtGExAMO
         zezdllF59guhMiBFWxv1zbQbLCydbRouZjhyjE9Dww0kDtJ/pjykRU7qexra6U+6mrOc
         X5qtCKr9DO1dpoeUGqc6YMKk3icm5SvN1PTgs4ocWTHVzO0Mzf5tgiyVkdaPJ5cg6W/D
         uyrMRwzTgaD1Bv5noL5vdRNqhT6EJJuIrC7R46V7aASGwBdt5BtMPBFXPX7Sp6IW5sbh
         ykM/3j1CFsxaFobdWtyv+QPgtVDvrGoGxMLko9grjwGJR/QwmbSeKauPHWmfCCkTGi0a
         YMTg==
X-Forwarded-Encrypted: i=1; AJvYcCUR4WNowGSge4hk/L9pW50ERojLVUpimG9SDR4LLamXjpAnPSmtSNTUq1v/yT/N50XMd2GBi0Wwmd2xK7ZvXolznYSQOjcbN3KHuy2JBFk=
X-Gm-Message-State: AOJu0YxL6JpBam+V+GX6pmHoirpfv77zO6USC7OvgH7Hi1WykaVxIWIN
	YJwsWdfxmfMc8K8P2EpbCqsWLRAIj8o/v1BC7MAAVR6WUB764TTRs7j9cqPO8kft4e11v3+OO0w
	WWJxY8fPeK6NxrGt4OBDolUmNXBl3718oDUCy
X-Google-Smtp-Source: AGHT+IH0DKRMGpWhTdEr+rzxMTKBlJSpQK2F/2LMQbeMHgE0zIl7LV+JvtbFFFJCC7Ib7AhMBAhLQOsWxxgbuG3YEis=
X-Received: by 2002:a5d:5f45:0:b0:368:3b1f:fe40 with SMTP id
 ffacd0b85a97d-36baacd2ef4mr2084012f8f.20.1722516544235; Thu, 01 Aug 2024
 05:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-10-dakr@kernel.org>
 <CAH5fLggjs8t2c1GVFdQu6gULjG_oYx7299m4NedQFS+hOgFfTw@mail.gmail.com> <ZquDcoPg2CzlPbpU@pollux>
In-Reply-To: <ZquDcoPg2CzlPbpU@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 14:48:52 +0200
Message-ID: <CAH5fLghhgrM_EyCkmHSZ=VpQZSvg3Co+HHYyAU9+gssMkKGNhA@mail.gmail.com>
Subject: Re: [PATCH v3 09/25] rust: alloc: implement kernel `Box`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:45=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Aug 01, 2024 at 10:55:51AM +0200, Alice Ryhl wrote:
> > On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > > +    /// Converts a `Box<T>` into a `Pin<Box<T>>`.
> > > +    #[inline]
> > > +    pub fn into_pin(b: Self) -> Pin<Self>
> > > +    where
> > > +        A: 'static,
> > > +    {
> > > +        // SAFETY: It's not possible to move or replace the insides =
of a `Pin<Box<T>>` when
> > > +        // `T: !Unpin`, so it's safe to pin it directly without any =
additional requirements.
> > > +        unsafe { Pin::new_unchecked(b) }
> > > +    }
> >
> > In the standard library, this functionality is provided using the From
> > trait rather than an inherent method. I think it makes sense to match
> > std here.
>
> I already provide `impl<T, A> From<Box<T, A>> for Pin<Box<T, A>>` in this=
 patch,
> which just calls `Box::into_pin`.

Ah, ok, I might drop into_pin and only have From, but I'm ok either way.

> > > +impl<T: 'static, A> ForeignOwnable for crate::alloc::Box<T, A>
> > > +where
> > > +    A: Allocator,
> > > +{
> > > +    type Borrowed<'a> =3D &'a T;
> > > +
> > > +    fn into_foreign(self) -> *const core::ffi::c_void {
> > > +        crate::alloc::Box::into_raw(self) as _
> > > +    }
> > > +
> > > +    unsafe fn borrow<'a>(ptr: *const core::ffi::c_void) -> &'a T {
> > > +        // SAFETY: The safety requirements for this function ensure =
that the object is still alive,
> > > +        // so it is safe to dereference the raw pointer.
> > > +        // The safety requirements of `from_foreign` also ensure tha=
t the object remains alive for
> > > +        // the lifetime of the returned value.
> > > +        unsafe { &*ptr.cast() }
> > > +    }
> > > +
> > > +    unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self {
> > > +        // SAFETY: The safety requirements of this function ensure t=
hat `ptr` comes from a previous
> > > +        // call to `Self::into_foreign`.
> > > +        unsafe { crate::alloc::Box::from_raw(ptr as _) }
> > > +    }
> > > +}
> >
> > You may want to also implement ForeignOwnable for Pin<Box<T>>. See:
> > https://lore.kernel.org/all/20240730-foreign-ownable-pin-box-v1-1-b1d70=
cdae541@google.com/
>
> Yeah, I think I've also seen another patch that it about to add a functio=
n to
> convert a `Box` back into uninit state.
>
> Depending how fast you need ForeignOwnable for Pin<Box<T>>, do you prefer=
 to
> contribute a corresponding patch to this series?

It's easiest for me if you just add it to this patch of your series. I
don't care about credit in this particular case.

Alice
