Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC11FDA85
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762692; cv=none; b=LtCp3wAB9YCmxh4qlaS1aJSsDtXPamcQTBXwxgIWowoD/uULImRqFEnhEoCIOQ0+52YAo43fblj1FZt8hu33/Fh45BEah4aOowOLGN94UJ5rp25gP2+xl2/nZKcnlPHkOWwGc4GZDEKILg8qYXTqmxS6GGAcNr9u+KxSMauKx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762692; c=relaxed/simple;
	bh=sJI3UnXX5kgsySWkcy2qtVSHTvlFHUi0TkzIFtHOWSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5kWWi10HMOCSfeZi1J0I0llNn7vuku0fJpulyhcvf245tJ9TVAXl0pqKFW8501sBQMHxlZnbintIZ83HXjxFZjTFLPCmsOTCVC8eWGxEQsBoF/VQNHtF1jjUKWpmBHepKA57sM11rXAMkv1QYcT6mH5ZDVA3avi4H++U6pWJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jD0QfkGI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jD0QfkGI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4113444f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 02:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736762689; x=1737367489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTnHrkrCK9aVruiggOEjuJFURydlBondtCGki6zspaI=;
        b=jD0QfkGIg27HinDSRgn0+oBLPb00V/ta1PZmas3beAZ+jRRYqcWxlvc5Vjb9Q9hk81
         6Tb34JhCuKuCYrJpoWWeSLLtkWSrLhbd0fUJuPhTBY4DcbGYxtwCQyCEZqkqR3nU/b7F
         ZcqiwQCHpBWYMWjYqBoYke1ZKjPZSMklaceE5zL1wcWg+cgaChb4Cwrt1Rph3yJiKdHX
         SamPxlotb9DYNBdD5dZEPhRXGAYEXm9Y6nxhYF1B4Qduzx1qEz4yXgQdmpRDMT3vVD+g
         wkRJY4K17RoRmdqNf1y77bl/I3d3+jEPsOLmJwVdduqj973qvtv8djGvGosJRYBrcdVS
         jidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762689; x=1737367489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTnHrkrCK9aVruiggOEjuJFURydlBondtCGki6zspaI=;
        b=sbcGYXuvoYAzSdbjzdvLnuniR1XbwrDtzgT9+wJJpIUgX98TzMjmSoFCrJRut1xa3D
         tJRUeDQyPve368DS/ZaZ/1jtZME7V2QNWzBGTcoJc/U5QCUBcUW6dVYaKZy7o8H6Eztm
         4WCl9JLFmOUdkTQ2dltCYD4/bp/6yAbVpdxbdpQL7YxY9nc9P8ppL1r4ePn3fnS/uNlm
         Y8aFBsGq4OmrEUJxauhpQ5H2oioTOk27IojF2/9odPwd9kuKik531N5OgpAOUQmCZE8P
         /HoxL4r2tCN3+HOiFXkwZONiJ670keTwIE2tij0leG4Z0By7qSZjB2i4Dy2nEKLGLFP3
         9q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXphJyplLpZCO+i0OGukmw3LARM1aTB+ln+My/mZmLCEMIw9Z9HAvotqWNCvFblsS7AYTJuRuSCekpHCyXL1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtWMoH3pDNiTWm6fllBjM9LdUJLpCkfJS2DfyEQiG58V0tlon
	7rMTN/3obBDoCQIlEyC69QIwqlyO8DjypBXaMQfqYL8wgmK/4eMTXyU1EGEHYcqoIWKWICNdsp6
	yiYlg1kOP2hcXH7SoIgiAmBar+1NS3z/a/kqd
X-Gm-Gg: ASbGncsDV5kTevTbHCbxs+0xSSlrJR6ulWpwEWKLNgAaUx2QgCSJiANoVbM2IGd6CPp
	G9EhlCogWK3x7+1AGqE4EVpFDv34rj8czQ1zEnFVUP5lJu9RRJWybu4uTWvFhTZtgU8pr
X-Google-Smtp-Source: AGHT+IEb2/iBvWA25oOoS/cFn89nZ6lRBPbi7b/Zh2yp5GE/04Ymcj9QFQdZ3E/rVz9ACHhaVdJLRZA7ErZyMXViZ4k=
X-Received: by 2002:a5d:64c9:0:b0:385:e88a:7037 with SMTP id
 ffacd0b85a97d-38a872fc182mr16642759f8f.6.1736762688566; Mon, 13 Jan 2025
 02:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <zLgtayXoZAk9UcN1xyPVa-vRd7F8sqv12X8fKo4pIXbs0xFLULWuH5tBEbOiIuktvkf7o4PNsNvDli037vcxnQ==@protonmail.internalid>
 <20241211-vma-v11-4-466640428fc3@google.com> <87jzbzbxrk.fsf@kernel.org>
In-Reply-To: <87jzbzbxrk.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 11:04:36 +0100
X-Gm-Features: AbW1kvbm9xIsdtcFoxgdgDqzPKAGTDok7KbPejqS7tX7dbZZUZ1FP9FO-qibG3A
Message-ID: <CAH5fLghYSL7TWUKa+Nj5_wyBBJpfo=0AStHSbC=aDD9Hj6VEfQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] mm: rust: add lock_vma_under_rcu
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:50=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > Currently, the binder driver always uses the mmap lock to make changes
> > to its vma. Because the mmap lock is global to the process, this can
> > involve significant contention. However, the kernel has a feature calle=
d
> > per-vma locks, which can significantly reduce contention. For example,
> > you can take a vma lock in parallel with an mmap write lock. This is
> > important because contention on the mmap lock has been a long-term
> > recurring challenge for the Binder driver.
> >
> > This patch introduces support for using `lock_vma_under_rcu` from Rust.
> > The Rust Binder driver will be able to use this to reduce contention on
> > the mmap lock.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Reviewed-by: Jann Horn <jannh@google.com>
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
> > index ace8e7d57afe..425b73a9dfe6 100644
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
> > +    /// Attempt to access a vma using the vma read lock.
> > +    ///
> > +    /// This is an optimistic trylock operation, so it may fail if the=
re is contention. In that
> > +    /// case, you should fall back to taking the mmap read lock.
> > +    ///
> > +    /// When per-vma locks are disabled, this always returns `None`.
> > +    #[inline]
> > +    pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaRea=
dGuard<'_>> {
> > +        #[cfg(CONFIG_PER_VMA_LOCK)]
> > +        {
> > +            // SAFETY: Calling `bindings::lock_vma_under_rcu` is alway=
s okay given an mm where
> > +            // `mm_users` is non-zero.
> > +            let vma =3D unsafe { bindings::lock_vma_under_rcu(self.as_=
raw(), vma_addr as _) };
>
> Is `as _` the right approach here?

We can drop it once the FFI integer types are fixed. It's late in the
cycle, so this patch probably won't make it for 6.14. This means I can
remove the casts entirely before this is merged. Otherwise we can
remove them in a follow-up.

Alice
