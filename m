Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88462241691;
	Wed, 15 Jan 2025 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939050; cv=none; b=TPw+C/4OxiPJcjiRiseC0vrNgmJLdO+Ex2CwU3Jl8btEl/bo9elFPK9XvK9nk+S5iM6tPwUxyDTn+A0pJs9YocDKmPQfKz5KcdlBDOB/Na+oTUkkIOf43O+MLlKm5U1tCGzBPEDScJVVrqoep/7njK04iBwJy2k5/GUY+4gAemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939050; c=relaxed/simple;
	bh=hkRFo3uTdbREugXqIkyYEWEUEBU0dTtp3fPfcRlTA9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UeM0JD397ZRv7H5z7id891fuknexDHbkBoj2GTtOiTsrD/P5Ho3A+USuyHFlqggXZ3it5TWEUgJSuTBYT14HeVFgtbfg7UFBuqEozNWlOEbIf9bEOa+dirblrlg58x6JmtBZa7GcG9XncXb0pWr/4WHzg6Swq+QYFGnNJQcSzNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC2bhh+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC2bhh+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9F6C4CEE2;
	Wed, 15 Jan 2025 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736939050;
	bh=hkRFo3uTdbREugXqIkyYEWEUEBU0dTtp3fPfcRlTA9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VC2bhh+GY4NLpy+BWOvTA2yBwzQp6icpa5jKq0+VtFxmhergYso4CkZFYdP6A1I1D
	 brraymeP9XIFPCFzGCcuspw9flSaAcCGyXLkVsdaLXJ0C/fW0/bBkW2YP3KG883HtO
	 uwQn2zEWetjmlmbU91iRGZgOk6QX4Me6NFxZ0EMlCBZvdrCUsrsybRZcAJWqcATAw0
	 nSO1YArgUad8qvqATWgUzcJKCDEcKjKGWbz0cRsUvblYmN54yY+nC3uHwwubijGt6V
	 cUia+kyZIQzPPmBvIgSWKpkL874drTjMnkGOCl2atmZj9THHSr92kSBDlQhQCjdlfX
	 lOvZSbMptSO8w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Matthew Wilcox"
 <willy@infradead.org>,  "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
  "Vlastimil Babka" <vbabka@suse.cz>,  "John Hubbard"
 <jhubbard@nvidia.com>,  "Liam R. Howlett" <Liam.Howlett@oracle.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Arnd Bergmann" <arnd@arndb.de>,
  "Christian Brauner" <brauner@kernel.org>,  "Jann Horn"
 <jannh@google.com>,  "Suren Baghdasaryan" <surenb@google.com>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v11 4/8] mm: rust: add lock_vma_under_rcu
In-Reply-To: <CAH5fLghYSL7TWUKa+Nj5_wyBBJpfo=0AStHSbC=aDD9Hj6VEfQ@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 13 Jan 2025 11:04:36 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<zLgtayXoZAk9UcN1xyPVa-vRd7F8sqv12X8fKo4pIXbs0xFLULWuH5tBEbOiIuktvkf7o4PNsNvDli037vcxnQ==@protonmail.internalid>
	<20241211-vma-v11-4-466640428fc3@google.com> <87jzbzbxrk.fsf@kernel.org>
	<OZo8vZlKdHeseYL2zJkTA6pdliNtnmkYTxRCzRM7BsEGoGcsMf8L29x4KDfNVcrLey6jowuwYiwYGRtnRFwCrA==@protonmail.internalid>
	<CAH5fLghYSL7TWUKa+Nj5_wyBBJpfo=0AStHSbC=aDD9Hj6VEfQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 10:34:15 +0100
Message-ID: <87wmewe7zc.fsf@kernel.org>
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
>> > Currently, the binder driver always uses the mmap lock to make changes
>> > to its vma. Because the mmap lock is global to the process, this can
>> > involve significant contention. However, the kernel has a feature call=
ed
>> > per-vma locks, which can significantly reduce contention. For example,
>> > you can take a vma lock in parallel with an mmap write lock. This is
>> > important because contention on the mmap lock has been a long-term
>> > recurring challenge for the Binder driver.
>> >
>> > This patch introduces support for using `lock_vma_under_rcu` from Rust.
>> > The Rust Binder driver will be able to use this to reduce contention on
>> > the mmap lock.
>> >
>> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
>> > Reviewed-by: Jann Horn <jannh@google.com>
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  rust/helpers/mm.c |  5 +++++
>> >  rust/kernel/mm.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++
>> >  2 files changed, 61 insertions(+)
>> >
>> > diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
>> > index 7b72eb065a3e..81b510c96fd2 100644
>> > --- a/rust/helpers/mm.c
>> > +++ b/rust/helpers/mm.c
>> > @@ -43,3 +43,8 @@ struct vm_area_struct *rust_helper_vma_lookup(struct=
 mm_struct *mm,
>> >  {
>> >       return vma_lookup(mm, addr);
>> >  }
>> > +
>> > +void rust_helper_vma_end_read(struct vm_area_struct *vma)
>> > +{
>> > +     vma_end_read(vma);
>> > +}
>> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
>> > index ace8e7d57afe..425b73a9dfe6 100644
>> > --- a/rust/kernel/mm.rs
>> > +++ b/rust/kernel/mm.rs
>> > @@ -13,6 +13,7 @@
>> >  use core::{ops::Deref, ptr::NonNull};
>> >
>> >  pub mod virt;
>> > +use virt::VmAreaRef;
>> >
>> >  /// A wrapper for the kernel's `struct mm_struct`.
>> >  ///
>> > @@ -170,6 +171,32 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::=
mm_struct) -> &'a MmWithUser {
>> >          unsafe { &*ptr.cast() }
>> >      }
>> >
>> > +    /// Attempt to access a vma using the vma read lock.
>> > +    ///
>> > +    /// This is an optimistic trylock operation, so it may fail if th=
ere is contention. In that
>> > +    /// case, you should fall back to taking the mmap read lock.
>> > +    ///
>> > +    /// When per-vma locks are disabled, this always returns `None`.
>> > +    #[inline]
>> > +    pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaRe=
adGuard<'_>> {
>> > +        #[cfg(CONFIG_PER_VMA_LOCK)]
>> > +        {
>> > +            // SAFETY: Calling `bindings::lock_vma_under_rcu` is alwa=
ys okay given an mm where
>> > +            // `mm_users` is non-zero.
>> > +            let vma =3D unsafe { bindings::lock_vma_under_rcu(self.as=
_raw(), vma_addr as _) };
>>
>> Is `as _` the right approach here?
>
> We can drop it once the FFI integer types are fixed. It's late in the
> cycle, so this patch probably won't make it for 6.14. This means I can
> remove the casts entirely before this is merged. Otherwise we can
> remove them in a follow-up.

Sounds good to me =F0=9F=91=8D


Best regards,
Andreas Hindborg


