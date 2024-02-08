Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE876404
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399987; cv=none; b=pOYzlbdd3lkBWEaA4LIx7BMyGUw1j+N/XGY/SYhIo0qYyWXEDG//4lTJcNJfgqq/ifSGtJVijlzCJUbH0az950D826NWy1a/W3DcDaqJB272PUyqCQE9lVY3apQe2e3NiET21PQJ2zq07vXtOn04vCjQ/QsI4rnUtC3c34HtAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399987; c=relaxed/simple;
	bh=AEbXhg3T6HNGjfKXM2h23pbz2O2nvCxM+3CfPHIHfJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5c84tBBKc1fCZxgabESbi8EBbopPnUMnaNKkHb5Sxr7gIzfJ6hkQG0sLrIKwNDNKwX7KJWAxCSgieP3F/AlVKUhi7ttnZ4vXCurdqQ5YhuJuzemFN6tk9GYbg0ddlTQ6gzmvWfEk0kj3Lmx5KFzmu6ME3I6Kwa26NTiq4rSvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L2X4+hb/; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L2X4+hb/"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57b9so827326241.3
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Feb 2024 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707399984; x=1708004784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L3VaVUJ969KRlxpqnrPaWtJ6K8FEE+/sV80j/XwhUA=;
        b=L2X4+hb/qw/PkjJGmSX8kNijUEK3sYyAkROM39Xu/QVUdk6OcaxTkieMV8opXa3FKE
         mb5YGLSGjNCMLQi/UQpa1V7iun77xTL2nzXgMQ3qqB+nKaohYc0/JCuf7zPn4NTJZGHN
         wBrKkPi0dVeLTV189VHjXIWyZHCJEH9ZWwv3UMIAl8yq1NjYLiAHPUTx5R8pVRAltslc
         vCmgXSuA/SBZWDBwdW066zzBoW3WqsiNtr8YM/xFInkJGeqpdpjnLqpLLkRTJSm7DXRx
         s0qTXOfamAQ31j1OiiH0d/TwTn5wGCjX7J4g2iTl+8v3bhWo90SE7fye19mhza+LQnSI
         vTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399984; x=1708004784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L3VaVUJ969KRlxpqnrPaWtJ6K8FEE+/sV80j/XwhUA=;
        b=EnJGIIiVWjD15WH9Uz6kJB2NiDCoBZcW6EcglK0/fc/pwbEcoOV+MVUJ7ooiWJRdva
         7o8ZgISR3u/P2bU+OxJq0TM/V/mfWVRD6TfFHTQoj3cbXLZ63P8Yt9rhgRL8l0I9he7V
         ydxFJYbzj2U4Z0zzdI5bVv2xrGEFwxAjxY8qJMLYrerR5QHB9rzxW1kNneGApKGgl5Cd
         i1fNGJFbA3B1ORDEVOEpJzmdpHgxlkegMybQn0528oKMPctmtlWJU7jvrEmloZY8rw+O
         QMy+MkZP1AfYf1pHJq/lgkMCLT5VJFCyYAbsMB90bXV6njmgKv1XkCoqEUn9gol/AEPk
         mGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjtwam1YMMBPX/3O1c7Ms+qUvl+RHDGUxHdGs5pPGzJoQTCcow+QIKFWS0hIU04DOHBSSGoYOaLxcaCQ5L+Foc1XJ+k2zwWXIzWsRg9HM=
X-Gm-Message-State: AOJu0Yyr716YpZ6QJgCqIM4aJQnAwxW/piQbivlyeBvDcRQZ2WI0zGmC
	63U1oomz80XUo7ewmw+nXiYrCbEmiSx/xCQoXa+38U0A+wyPmAZJchz1426OBXj57Vk0AwEWz5K
	2l+cfxPX6ziPX04+ZgvHt2yU4aSX23KG8V+Uv
X-Google-Smtp-Source: AGHT+IH6287k1PPBR4BUh12Zj7QCoeDvAPd2j0KqozKpvxtJQ61zdQBdx/BUaxVAT8L4YQHLbT9e6QxMKbfrbXZy9C4=
X-Received: by 2002:a67:f508:0:b0:46d:6339:b9b0 with SMTP id
 u8-20020a67f508000000b0046d6339b9b0mr1204693vsn.1.1707399984309; Thu, 08 Feb
 2024 05:46:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124-alice-mm-v1-0-d1abcec83c44@google.com>
 <20240124-alice-mm-v1-3-d1abcec83c44@google.com> <CALNs47uPgvYXxEDmwb6GKa+cw597_rDD1zaSPDa9k9D-6_qZxQ@mail.gmail.com>
In-Reply-To: <CALNs47uPgvYXxEDmwb6GKa+cw597_rDD1zaSPDa9k9D-6_qZxQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Feb 2024 14:46:13 +0100
Message-ID: <CAH5fLgi_iU3nDE-gJ56s8CPznWvC0T4P5M0dVx1zO61kmVGNgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add abstraction for `struct page`
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 7:02=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wro=
te:
>
> On Wed, Jan 24, 2024 at 6:22=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > +/// A pointer to a page that owns the page allocation.
> > +///
> > +/// # Invariants
> > +///
> > +/// The pointer points at a page, and has ownership over the page.
> > +pub struct Page {
> > +    page: NonNull<bindings::page>,
> > +}
>
> Shouldn't this be UnsafeCell / Opaque? Since `struct page` contains locks=
.

That only matters when we use a reference. Here, it's behind a raw pointer.

> > +// SAFETY: It is safe to transfer page allocations between threads.
> > +unsafe impl Send for Page {}
> > +
> > +// SAFETY: Calling `&self` methods on this type in parallel is safe. I=
t might
> > +// allow you to perform a data race on bytes stored in the page, but w=
e treat
> > +// this like data races on user pointers.
> > +unsafe impl Sync for Page {}
>
> These races should probably be in the Page docs, rather than pointing
> to user pointers.

New safety comment:

SAFETY: As long as the safety requirements for `&self` methods on this
type are followed, there is no problem with calling them in parallel.

> > +impl Page {
> > +    /// Allocates a new set of contiguous pages.
>
> "set of contiguous page" -> "page"?

Thanks, done.

> > +    pub fn new() -> Result<Self, AllocError> {
> > +        // SAFETY: These are the correct arguments to allocate a singl=
e page.
> > +        let page =3D unsafe {
> > +            bindings::alloc_pages(
> > +                bindings::GFP_KERNEL | bindings::__GFP_ZERO | bindings=
::__GFP_HIGHMEM,
> > +                0,
> > +            )
> > +        };
> > +
> > +        match NonNull::new(page) {
> > +            // INVARIANT: We checked that the allocation above succeed=
ed.
> > +            Some(page) =3D> Ok(Self { page }),
> > +            None =3D> Err(AllocError),
> > +        }
>
> Optionally:
>
>     let page =3D NonNull::new(page).ok_or(AllocError)?;
>     Ok(Self { page })

Done.

> > +    }
> > +
> > +    /// Returns a raw pointer to the page.
>
> Maybe add ", valid for PAGE_SIZE" or similar to make this obvious.

This is a pointer to the `struct page`, not the actual page data.

> > +    pub fn as_ptr(&self) -> *mut bindings::page {
> > +        self.page.as_ptr()
> > +    }
> > +
> > +    /// Runs a piece of code with this page mapped to an address.
>
> Maybe ", then immediately unmaps the page" to make the entire operation c=
lear.

Ok.

> > +    /// It is up to the caller to use the provided raw pointer correct=
ly.
> > +    pub fn with_page_mapped<T>(&self, f: impl FnOnce(*mut c_void) -> T=
) -> T {
>
> If there is exclusive access into the page, this signature could be:
>
>     FnOnce(&mut [u8; PAGE_SIZE]) -> T
>
> Otherwise possibly
>
>     FnOnce(*mut [u8; PAGE_SIZE]) -> T
>
> But based on the thread with Boqun it seems there is no synchronized
> access here. In this case, "use the provided raw pointer correctly" or
> the type level docs should clarify what you can and can't rely on with
> pointers into a page.
>
> E.g. if I'm understanding correctly, you can never construct a &T or
> &mut T anywhere in this page unless T is Sync.

We discussed this in the meeting and concluded that we should use *mut u8 h=
ere.

> > +    /// Runs a piece of code with a raw pointer to a slice of this pag=
e, with
> > +    /// bounds checking.
> > +    ///
> > +    /// If `f` is called, then it will be called with a pointer that p=
oints at
> > +    /// `off` bytes into the page, and the pointer will be valid for a=
t least
> > +    /// `len` bytes. The pointer is only valid on this task, as this m=
ethod uses
> > +    /// a local mapping./
> > +    ///
> > +    /// If `off` and `len` refers to a region outside of this page, th=
en this
> > +    /// method returns `EINVAL` and does not call `f`.
> > +    pub fn with_pointer_into_page<T>(
> > +        &self,
> > +        off: usize,
> > +        len: usize,
> > +        f: impl FnOnce(*mut u8) -> Result<T>,
> > +    ) -> Result<T> {
>
> Same question about exclusive access
>
>     impl FnOnce(&mut [u8]) -> Result<T>

We discussed this in the meeting. Slices raise all sorts of cans of
worms with uninit and exclusivity, so the raw methods won't use them.

> > +        let bounds_ok =3D off <=3D PAGE_SIZE && len <=3D PAGE_SIZE && =
(off + len) <=3D PAGE_SIZE;
> > +
> > +        if bounds_ok {
> > +            self.with_page_mapped(move |page_addr| {
> > +                // SAFETY: The `off` integer is at most `PAGE_SIZE`, s=
o this pointer offset will
> > +                // result in a pointer that is in bounds or one off th=
e end of the page.
> > +                f(unsafe { page_addr.cast::<u8>().add(off) })
> > +            })
> > +        } else {
> > +            Err(EINVAL)
> > +        }
> > +    }
> > +
> > +    /// Maps the page and reads from it into the given buffer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `dest` is valid for writing `len` byt=
es.
> > +    pub unsafe fn read(&self, dest: *mut u8, offset: usize, len: usize=
) -> Result {
>
> Is there a reason not to use a slice just for a destination to read into?

Ditto.

> > +        self.with_pointer_into_page(offset, len, move |from_ptr| {
>
> Nit: do the names from_ptr/to_ptr come from existing binder? src/dst
> seems more common (also dst vs. dest).

Renamed everything to use src/dst

> > +        self.with_pointer_into_page(offset, len, move |to_ptr| {
> > +            // SAFETY: If `with_pointer_into_page` calls into this clo=
sure, then
> > +            // it has performed a bounds check and guarantees that `to=
_ptr` is
> > +            // valid for `len` bytes.
> > +            unsafe { ptr::copy(src, to_ptr, len) };
> > +            Ok(())
> > +        })
> > +    }
> > +
> > +    /// Maps the page and zeroes the given slice.
>
> Mention that this will error with the same conditions as with_pointer_int=
o_page.

That method is private. I will add documentation for this that doesn't
reference with_pointer_into_page.

> > +    pub fn fill_zero(&self, offset: usize, len: usize) -> Result {
> > +        self.with_pointer_into_page(offset, len, move |to_ptr| {
> > +            // SAFETY: If `with_pointer_into_page` calls into this clo=
sure, then
> > +            // it has performed a bounds check and guarantees that `to=
_ptr` is
> > +            // valid for `len` bytes.
> > +            unsafe { ptr::write_bytes(to_ptr, 0u8, len) };
> > +            Ok(())
> > +        })
> > +    }
> > +
> > +    /// Copies data from userspace into this page.
> > +    pub fn copy_into_page(
> > +        &self,
> > +        reader: &mut UserSlicePtrReader,
> > +        offset: usize,
> > +        len: usize,
> > +    ) -> Result {
>
> Maybe copy_from_user_slice or something that includes "user", since
> as-is it sounds like copying a page into another page.
>
> Also, docs should point out the error condition.

Done.

Thanks,
Alice
