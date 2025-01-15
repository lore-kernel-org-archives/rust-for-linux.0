Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972E24169F;
	Wed, 15 Jan 2025 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939039; cv=none; b=LFuXG9GKTUgpd3Fq+su0SfIhMdjDzDbvjlahuAPw7xGXnKv6R71xQydebT1P6ZAh+IN3vV6t7/wxXU1+d1t77S2kc01iMTjtJzDLws3oorYBKkk9maRPR674HxwOoeLknfbOYndxCiLVnDWkZFn7hVxGgXa9uavXapBVHr7h+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939039; c=relaxed/simple;
	bh=HT6Tr5w3lKUkyN60NnsHJuAiQZUj0Z/T33fxTbCHbdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J4/sFbSCa/XpWaOn5dA/jmBwX6VUSzFYYo8AmhbmVYaio7yPn0ThpwMmi/lPuUoA82LGwBFXJfRN1kzz6n/8nN77ZLTNz9PBZPB7AfNBlB5zNH+KIkE4DUPXm9YZknqaJsb/xATGhsDE1kTL4hV5SWm2Xm4I3BZ4MA8sz8bBU0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLdvckn5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLdvckn5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFC9C4CEE1;
	Wed, 15 Jan 2025 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736939039;
	bh=HT6Tr5w3lKUkyN60NnsHJuAiQZUj0Z/T33fxTbCHbdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nLdvckn5Qd9IA4Oz0fC6n82GRqe6GVCHXkQaPDLSTzWXoVSsxP6kPvA1tY7AHYCEG
	 vGWzBaicGl9BH3EOErGsH63zMwHaUs6sTebqmae4vz7eeFXYXaUgPzUkQ+YEQVSnx6
	 7uEux6b89dDqEFV5ksOMWpMJ5Q07GEY/t1x1fzcXfylIshhXwAPHzaCPXsn9ZKCNop
	 4i7sT1ju79s+pZwttATOkKZEW92NnGC3i3ZHoS8KRXK3cE4xayBGctQXI8duAsp0bO
	 9e4PMZC9wwy+LoCdnrdmskTZWL+CkSfWKD5J+EZvbw3mdE8zS6d+uJGhQwbEAOIE9u
	 B7kvtP8liCdZA==
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
Subject: Re: [PATCH v11 3/8] mm: rust: add vm_insert_page
In-Reply-To: <CAH5fLgjHhzRZnatgornai84iOVi2S07tosoKUVTGqWQ9-ggENQ@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 13 Jan 2025 11:02:24 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<k0kNBzmNg_c8GHIFyjlyJfEpyRNoAIZZVM1n3zK2kVT1pScUOUpkePSltcN-CfRI2UpS0OIvEG7FBvkHhXYrAQ==@protonmail.internalid>
	<20241211-vma-v11-3-466640428fc3@google.com> <87o71bbys7.fsf@kernel.org>
	<YrnLu0lq6eVEpwqhXt2dAoU-oX7MWU81lbB2N3GDBPpHKtO6hJ6QIfnaJXrUaSVf8Qde9JgwjzaphSeiMFGgtg==@protonmail.internalid>
	<CAH5fLgjHhzRZnatgornai84iOVi2S07tosoKUVTGqWQ9-ggENQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 10:33:08 +0100
Message-ID: <8734hkfmln.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
>> > flag, so we introduce a new type to keep track of such vmas.
>> >
>> > The approach used in this patch assumes that we will not need to encode
>> > many flag combinations in the type. I don't think we need to encode mo=
re
>> > than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
>> > becomes necessary, using generic parameters in a single type would sca=
le
>> > better as the number of flags increases.
>> >
>> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  rust/kernel/mm/virt.rs | 71 +++++++++++++++++++++++++++++++++++++++++=
++++++++-
>> >  1 file changed, 70 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
>> > index 68c763169cf0..3a23854e14f4 100644
>> > --- a/rust/kernel/mm/virt.rs
>> > +++ b/rust/kernel/mm/virt.rs
>> > @@ -4,7 +4,15 @@
>> >
>> >  //! Virtual memory.
>> >
>> > -use crate::{bindings, mm::MmWithUser, types::Opaque};
>> > +use crate::{
>> > +    bindings,
>> > +    error::{to_result, Result},
>> > +    mm::MmWithUser,
>> > +    page::Page,
>> > +    types::Opaque,
>> > +};
>> > +
>> > +use core::ops::Deref;
>> >
>> >  /// A wrapper for the kernel's `struct vm_area_struct` with read acce=
ss.
>> >  ///
>> > @@ -100,6 +108,67 @@ pub fn zap_page_range_single(&self, address: usiz=
e, size: usize) {
>> >              )
>> >          };
>> >      }
>> > +
>> > +    /// Check whether the `VM_MIXEDMAP` flag is set.
>>
>> Perhaps "Check whether the `VM_MIXEDMAP` flag is set. If so, return
>> `Some`, otherwise `None` ?
>
> How about
>
> If the `VM_MIXEDMAP` flag is set, returns a `VmAreaMixedMap` to this
> VMA, otherwise returns `None`.
>
> This follows the example of slice::as_ascii

Sounds good =F0=9F=91=8D


Best regards,
Andreas Hindborg


