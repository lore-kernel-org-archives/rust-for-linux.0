Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870924225A;
	Wed, 15 Jan 2025 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939044; cv=none; b=imWQbSxXb3CzEqonM6+9ICv7xEZbHcgedopq8DzhpHH/scpsidDTODbD+U2xwgYQuSPS/IO8oytO4VJMUmRORCs9/z/TPAiWlM+8baUIWdOqATUY4qrGsqXK33+VxpapKtMQIPsyppJVZn9pEtbQlW4QTrBeyVZZFUv6CaSmD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939044; c=relaxed/simple;
	bh=yvllrWEnteI3wxvUxsEtwU29GRVsf9tYU28D6ya1s2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g3+SDsKfb/cZaCMQJnatHitDafspTaoknxhe9//YPJYe6m2CpOg2euR7ezYgFUbV9WGAayjUtpfnGz7o16jRNJernLnQpZjAOS4H6NJ13El86Q+cJ33Y/uCSEiu7sPXWC6fHmyx7eFuK0Vl5RtMkestqk4yoLgqThxg+6yRL4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/5SLi4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/5SLi4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC32AC4CEDF;
	Wed, 15 Jan 2025 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736939044;
	bh=yvllrWEnteI3wxvUxsEtwU29GRVsf9tYU28D6ya1s2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G/5SLi4zUtDk82qW5kEd1XbZNtCB3cnoks7gzB4KyAxTLMOq+jz4aZn6leHXk5EEL
	 hArAAEVUuESVZQd7Zih4KLlceL8+M8TjF44J1KQahwISHGZQ7zNLVcHKG0fHLxMPfe
	 pB2tqAiWnT+Yv8Hgvtr0YawZjSxOs9+8JhVMQTsnsddBCLz/BER3nZOZ/cd/a4HYBs
	 A9Nn+yLnPigMQJeGrP5a5EjeaKj8ZyMRX2EuachEsjCsDbrd2rqUJauyqViXhDIXFU
	 VPfZ9DtszuSmQbT3RDSfmdBMEJHjU+98mM8GsXuk+TZA+MUvgR1z03yHvi9ohouLIA
	 9NhBvmKTEs1ww==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Matthew Wilcox" <willy@infradead.org>,  "Vlastimil
 Babka" <vbabka@suse.cz>,  "John Hubbard" <jhubbard@nvidia.com>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Arnd Bergmann" <arnd@arndb.de>,
  "Christian Brauner" <brauner@kernel.org>,  "Jann Horn"
 <jannh@google.com>,  "Suren Baghdasaryan" <surenb@google.com>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
In-Reply-To: <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 13 Jan 2025 10:53:33 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<ZzO0HNA5jlZZgU1ib_SP36HWHny8QNidES3cXM_ogVTtqArMPzPfDlQCFslPrZAVESJzfzFOVfOkoZHKiG-ivQ==@protonmail.internalid>
	<20241211-vma-v11-1-466640428fc3@google.com> <878qsfdftg.fsf@kernel.org>
	<ArX-UzegU4cf4AOS9ENB7MdrYE35c_oYLBa1Q5kq7S0e3nQt06TDKyZblbuXYY89G-qbqo444gu7uEhGzr4r9Q==@protonmail.internalid>
	<CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 11:36:56 +0100
Message-ID: <87a5bse52v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, Dec 16, 2024 at 3:50=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > These abstractions allow you to reference a `struct mm_struct` using
>> > both mmgrab and mmget refcounts. This is done using two Rust types:
>> >
>> > * Mm - represents an mm_struct where you don't know anything about the
>> >   value of mm_users.
>> > * MmWithUser - represents an mm_struct where you know at compile time
>> >   that mm_users is non-zero.
>> >
>> > This allows us to encode in the type system whether a method requires
>> > that mm_users is non-zero or not. For instance, you can always call
>> > `mmget_not_zero` but you can only call `mmap_read_lock` when mm_users =
is
>> > non-zero.
>> >
>> > It's possible to access current->mm without a refcount increment, but
>> > that is added in a later patch of this series.
>> >
>> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  rust/helpers/helpers.c |   1 +
>> >  rust/helpers/mm.c      |  39 +++++++++
>> >  rust/kernel/lib.rs     |   1 +
>> >  rust/kernel/mm.rs      | 219 ++++++++++++++++++++++++++++++++++++++++=
+++++++++
>> >  4 files changed, 260 insertions(+)
>> >
>> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
>> > new file mode 100644
>> > index 000000000000..84cba581edaa
>> > --- /dev/null
>> > +++ b/rust/kernel/mm.rs
>> > @@ -0,0 +1,219 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +// Copyright (C) 2024 Google LLC.
>> > +
>> > +//! Memory management.
>>
>> Could you add a little more context here?
>
> How about this?
>
> //! Memory management.
> //!
> //! This module deals with managing the address space of userspace
> processes. Each process has an
> //! instance of [`Mm`], which keeps track of multiple VMAs (virtual
> memory areas). Each VMA
> //! corresponds to a region of memory that the userspace process can
> access, and the VMA lets you
> //! control what happens when userspace reads or writes to that region
> of memory.
> //!
> //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)

Nice =F0=9F=91=8D

>
>> > +//!
>> > +//! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
>> > +
>> > +use crate::{
>> > +    bindings,
>> > +    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
>> > +};
>> > +use core::{ops::Deref, ptr::NonNull};
>> > +
>> > +/// A wrapper for the kernel's `struct mm_struct`.
>>
>> Could you elaborate the data structure use case? When do I need it, what
>> does it do?
>
> How about this?
>
> /// A wrapper for the kernel's `struct mm_struct`.
> ///
> /// This represents the address space of a userspace process, so each
> process has one `Mm`
> /// instance. It may hold many VMAs internally.
> ///
> /// There is a counter called `mm_users` that counts the users of the
> address space; this includes
> /// the userspace process itself, but can also include kernel threads
> accessing the address space.
> /// Once `mm_users` reaches zero, this indicates that the address
> space can be destroyed. To access
> /// the address space, you must prevent `mm_users` from reaching zero
> while you are accessing it.
> /// The [`MmWithUser`] type represents an address space where this is
> guaranteed, and you can
> /// create one using [`mmget_not_zero`].
> ///
> /// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its
> destructor may sleep.

Cool =F0=9F=91=8D

>
>> > +///
>> > +/// Since `mm_users` may be zero, the associated address space may no=
t exist anymore. You can use
>> > +/// [`mmget_not_zero`] to be able to access the address space.
>> > +///
>> > +/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its dest=
ructor may sleep.
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// Values of this type are always refcounted using `mmgrab`.
>> > +///
>> > +/// [`mmget_not_zero`]: Mm::mmget_not_zero
>> > +#[repr(transparent)]
>> > +pub struct Mm {
>>
>> Could we come up with a better name? `MemoryMap` or `MemoryMapping`?. You
>> use `MMapReadGuard` later.
>
> Those names seem really confusing to me. The mmap syscall creates a
> new VMA, but MemoryMap sounds like it's the thing that mmap creates.
>
> Lorenzo, what do you think? I'm inclined to just call it Mm since
> that's what C calls it.

Well I guess there is value in using same names as C. The additional
docs you sent help a lot so I guess it is fine.

If we were writing from scratch I would have held hard on `AddressSpace`
or `MemoryMap` over `Mm`. `Mm` has got to be one of the least
descriptive names we can come up with.


Best regards,
Andreas Hindborg


