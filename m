Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F11D0B83
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732185908; cv=none; b=Ps0zYKLWvB+2+cirtX/bZskAe4OZQH3dPvjrF49pe9nrnHuVRpioZlmMmBOpvWxQ1SdMyWuIoJsb7YDvSk4Luj+3BZElxfpG+LTPwRNttwinVd1HyIx25EUV3+VhIEaJ6mZO5ELv+T+umrhFB6JsNeDFFsirxPndKldgWZq3I70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732185908; c=relaxed/simple;
	bh=CwIShjUsfcnOqesiDbb35NKm4hTygyydM61hfALVz0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3hEraUsrd+FTzcz6WQKUrhqqLsdM0wScb79NJ4lVMNKwS9IlZRWv7t2uT4VNntKUt2/4QPBCbAWh2lznYkuv2aaK1/9zzHPa/OGYUCHJRYu2kCs5WHXMb4iyNjB0KOLlN4S0K3v8tH2MJa/uSLTpziAIDJqPIWuso5vVLUWyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xAVtialq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xAVtialq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so445402f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 02:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732185904; x=1732790704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK4Cfg9DlwufnPePVmxDaoaAvTYsonxko5dLjDtr1k8=;
        b=xAVtialqQzD68QZEOQHJDmZf3qmHqdQ8bp91F5fe9qhXoRabP9C70i6mCgXZKyXqOt
         ydh/Rg/x/4d0A1kbEJesdDir49SzkB6aYTqTek+xekz64Q4r7sgM+yFq5uKTV8gGXWXw
         xAswTAL09qpNQBqNc9DSBQHNiiHl1Dyckrpy7tShGYvLSb+uRlOZk+1zAb+ZmhTMnj2M
         /r4cM726rD6tkwMwI9sjR4C4wGGlSe9bzCGA6Lgye3hT3ejgq2clB8UjdrBN8rmo65KO
         /a37wCnbi+TkIr13jcF2vOZirZ+OqtYCKlOilCzL15IjMO9g9SCsEnq8XckO8H02wMBP
         gCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732185904; x=1732790704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK4Cfg9DlwufnPePVmxDaoaAvTYsonxko5dLjDtr1k8=;
        b=mdnINloQIrJ5MG+rpWdAUf6V172gWrmS6SqoAKpAkD7zZZncSELkxW3JVQYdIzuVaW
         bDz9+SVEBTBO8iSBMqTGJIi2X8j1qt1XvECCcW4jqq9ZB+qgKAvDc8LahOa99OihZmO4
         zJh1f/4IPioIqNncHUeZSQAzwVqBUu2P26zy8u8usW/ow6Z43xtVxxEnvE2WOFhGkqd2
         pnH+DGaSZCiIQuZlKg12AQMglVQfE2r/IhAHTCRZMP8OIkkaf5lwXiBDEasOCXP7UIyK
         bEMnAcMISn8JOtJRAlb6RXRdknR/Aov5Wpe+qVpPY4NKRNKFIQK3wIw+Xj2IUyuf3lqt
         jZAA==
X-Forwarded-Encrypted: i=1; AJvYcCVB9merw7NaIaf9N12XJXqB3a2rxSyVg1RD+WZViHM/1lJx/Pp8cAw4Em8/rZLnYCA68J8Gmof6arxJKCFBxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDcbbDWhrnlse1dVlZ5z8qa4Om92NqZVXeH44fxTUyhapfbBo
	snC3Y2y9My9MaMB0vVHS6VpujYAdYlURe0vlCjvyNGorVQX9/vAnfXsvwk/FqrrE3kaXhI9QRwk
	Jrswex3Ctb65z+5kwH4p0LEhiMlxKbjhVxmYt
X-Gm-Gg: ASbGncvl8nWwgf+Va229UZAQz0UcnhMEzCwfasrbDqfNI0b8h7+VC4d+CunHtftJ8lv
	1u0vBNcEKwzxJvtkCE5aXU520tXpbB0Jfn7Giv7OLK8/fga+E9PIPNnn3D0jKsQ==
X-Google-Smtp-Source: AGHT+IFNLFXfFTPNcf0Jy6eL0FhPoWe5bssVRl6BmWr16Rlaom5gN2QQBv1a2lad6azAjMDYL8YEC8lFmavr2ot49Tw=
X-Received: by 2002:a5d:5f86:0:b0:382:5393:43cf with SMTP id
 ffacd0b85a97d-38254af6394mr4794445f8f.13.1732185904176; Thu, 21 Nov 2024
 02:45:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com> <20241120-vma-v8-4-eb31425da66b@google.com>
 <40be19b0-4c32-4554-a01f-649c12f889da@lucifer.local>
In-Reply-To: <40be19b0-4c32-4554-a01f-649c12f889da@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Nov 2024 11:44:52 +0100
Message-ID: <CAH5fLggw4Ca59-AA+ArHYD0QrKH8cGd_i0EN83MnYYZK1bmTGQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] mm: rust: add lock_vma_under_rcu
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 8:29=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Nov 20, 2024 at 02:49:58PM +0000, Alice Ryhl wrote:
> > All of Rust Binder's existing calls to `vm_insert_page` could be
> > optimized to first attempt to use `lock_vma_under_rcu`. This patch
> > provides an abstraction to enable that.
>
> I think there should be a blurb about what the VMA locks are, how they av=
oid
> contention on the mmap read lock etc. before talking about a use case (th=
ough
> it's useful to mention the motivating reason!)
>
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/mm.c |  5 +++++
> >  rust/kernel/mm.rs | 56 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 61 insertions(+)
> >
> > diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
> > index 7b72eb065a3e..81b510c96fd2 100644
> > --- a/rust/helpers/mm.c
> > +++ b/rust/helpers/mm.c
> > @@ -43,3 +43,8 @@ struct vm_area_struct *rust_helper_vma_lookup(struct =
mm_struct *mm,
> >  {
> >       return vma_lookup(mm, addr);
> >  }
> > +
> > +void rust_helper_vma_end_read(struct vm_area_struct *vma)
> > +{
> > +     vma_end_read(vma);
> > +}
> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > index ace8e7d57afe..a15acb546f68 100644
> > --- a/rust/kernel/mm.rs
> > +++ b/rust/kernel/mm.rs
> > @@ -13,6 +13,7 @@
> >  use core::{ops::Deref, ptr::NonNull};
> >
> >  pub mod virt;
> > +use virt::VmAreaRef;
> >
> >  /// A wrapper for the kernel's `struct mm_struct`.
> >  ///
> > @@ -170,6 +171,32 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::m=
m_struct) -> &'a MmWithUser {
> >          unsafe { &*ptr.cast() }
> >      }
> >
> > +    /// Try to lock the vma read lock under rcu.
>
> This reads oddly, I'd say 'try to acquire the VMA read lock'. It's not re=
ally
> necessary to mention RCU here I'd say, as while lock_vma_under_rcu() acqu=
ires
> the RCU lock in order to try to get the VMA read lock, it releases it aft=
erwards
> and you hold the VMA read luck until you are done with it and don't need =
to hold
> an RCU lock.
>
> A reader might otherwise be confused and think an RCU read lock is requir=
ed to
> be held throughout too which isn't the case (this is maybe a critique of =
the
> name of the function too, sorry Suren :P).
>
> > +    /// If this operation fails, the vma may still exist. In that case=
, you should take the mmap
> > +    /// read lock and try to use `vma_lookup` instead.
>
> This also reads oddly, you're more likely (assuming you are not arbitrari=
ly
> trying to acquire a lock on an address likely to be unmapped soon) to hav=
e
> failed due to lock contention.
>
> So I'd say 'this is an optimistic try lock operation, so it may fail, in =
which
> case you should fall back to taking the mmap read lock'.
>
> I'm not sure it's necessary to reference vma_lookup() either, especially =
as in
> future versions of this code we might want to use a VMA iterator instead.

Thanks for the doc suggestions, they sound great.

> > +    ///
> > +    /// When per-vma locks are disabled, this always returns `None`.
> > +    #[inline]
> > +    pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaRea=
dGuard<'_>> {
>
> Ah I love having lock guards available... Something I miss from C++ :>)

I've heard that C is starting to get lock guards recently!

> > +        #[cfg(CONFIG_PER_VMA_LOCK)]
>
> Ah interesting, so we have an abstraction for kernel config operations!

Yeah, it's basically an #ifdef, but the block must still parse even if
the config is disabled.

Alice
