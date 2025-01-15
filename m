Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2822F82E;
	Wed, 15 Jan 2025 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939028; cv=none; b=MeJDhpYp2Fjj3syr8F4qKPqhcRJwP0DCz5ZwFI5nA+TEuC6Zo7zNw7rFWYx0i4U/ALVybVGXGLObbmuWKBs1tz8grdYWlX8d9etiiGu3wMJ1QtEXqCEVd2SixCjoz3g5LMCvpo+XcMHFZP8MzIoCiMPiRSHn/qHPqWISQ262KG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939028; c=relaxed/simple;
	bh=2mzV9xftHa8ZCv5+6EBT2YCEpW+sOtYrUsyHCKAgMmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GieYyV0aoapwCrK1dGx6wF9454cXi5eON7jIcYQ0o362TzNJDZa8mD5FUIz2x3yT8LbXpT98B8ik+W9NxCgNOJNLP+JmYmpWuzd5t4RXBr3FPv5kusK0DIuVRlnSsk1IttYQYFtrppN7Qc7pAg0v8kEQE+7zMfPcaiTWzLYtvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj9C7rCH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj9C7rCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CC9C4CEE2;
	Wed, 15 Jan 2025 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736939027;
	bh=2mzV9xftHa8ZCv5+6EBT2YCEpW+sOtYrUsyHCKAgMmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bj9C7rCHFl7bq3lQ/xaW5rt9NKgWlFNFsAwRoUKPsBCRiusHcjlU/9zF5D1HuLkt7
	 rKJe85U+AO3EJwMj/P69Wl68hNqXbN33EsYbzS3wAOMv8LFU76sbqT/NSqXChiA9lx
	 +GXxhzipCwDL5DOLbQ34SdHZNjZ/vbK7vCOp86SZjxQJeJfUHDVH2UkxCWfr38mKJj
	 7ClbOqXvYw0b6u5bTHMXcpFAQYU1vQwXWWLTLDYnDlaU++2+WeRJEFzn9AAw2cOiOc
	 jQ2WEvcHffEvfhF6HlqrqzEcB3FSs4dUgdF2v6jCvvZ3FIc1WueRzAl9/WrmI7Ssnd
	 gSWvtkW6rOUhQ==
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
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
In-Reply-To: <CAH5fLgiFzFyVPNSjAkEBvK5Uk-OgaOHDujdXHBeLRZBVaf=Fhg@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 13 Jan 2025 11:17:06 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
	<20241211-vma-v11-6-466640428fc3@google.com> <87o71bagpf.fsf@kernel.org>
	<vdoUDPvED_7e_bvzaMNFhBpC-6TLpsrA9cfX8LWc-w69rv1whT7EnYLMtUn_MNlJ2R-e3LrKOfHNnacUsHivFg==@protonmail.internalid>
	<CAH5fLgh8g3d+v-am=VRdExZug6hTJf-3CWPoxxYCZLpyiXnKdg@mail.gmail.com>
	<87a5c0bdr0.fsf@kernel.org>
	<xEcmxFvFInZYyvtRiUX7xYv4-xhX23j6JPWfqONth_GfFU8eTub-bBK61vTLtxTwKTkiK78RuXhNrvdMAC6eGA==@protonmail.internalid>
	<CAH5fLgiFzFyVPNSjAkEBvK5Uk-OgaOHDujdXHBeLRZBVaf=Fhg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 10:57:49 +0100
Message-ID: <87o708e6w2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Thu, Jan 9, 2025 at 9:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >> "Alice Ryhl" <aliceryhl@google.com> writes:
>> >>
>> >> > This type will be used when setting up a new vma in an f_ops->mmap()
>> >> > hook. Using a separate type from VmAreaRef allows us to have a sepa=
rate
>> >> > set of operations that you are only able to use during the mmap() h=
ook.
>> >> > For example, the VM_MIXEDMAP flag must not be changed after the ini=
tial
>> >> > setup that happens during the f_ops->mmap() hook.
>> >> >
>> >> > To avoid setting invalid flag values, the methods for clearing
>> >> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an =
error
>> >> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without chec=
king
>> >> > the return value results in a compilation error because the `Result`
>> >> > type is marked #[must_use].
>> >> >
>> >> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. W=
hen
>> >> > we add a VM_PFNMAP method, we will need some way to prevent you from
>> >> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
>> >> >
>> >> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
>> >> > Reviewed-by: Jann Horn <jannh@google.com>
>> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> >> > ---
>> >> >  rust/kernel/mm/virt.rs | 181 +++++++++++++++++++++++++++++++++++++=
+++++++++++-
>> >> >  1 file changed, 180 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
>> >> > index 3a23854e14f4..6d9ba56d4f95 100644
>> >> > --- a/rust/kernel/mm/virt.rs
>> >> > +++ b/rust/kernel/mm/virt.rs
>> >> > @@ -6,7 +6,7 @@
>> >> >
>> >> >  use crate::{
>> >> >      bindings,
>> >> > -    error::{to_result, Result},
>> >> > +    error::{code::EINVAL, to_result, Result},
>> >> >      mm::MmWithUser,
>> >> >      page::Page,
>> >> >      types::Opaque,
>> >> > @@ -171,6 +171,185 @@ pub fn vm_insert_page(&self, address: usize, =
page: &Page) -> Result {
>> >> >      }
>> >> >  }
>> >> >
>> >> > +/// A builder for setting up a vma in an `f_ops->mmap()` hook.
>> >>
>> >> Reading this line, I would expect to be able to chain update methods =
as
>> >> in `Builder::new().prop_a().prop_b().build()`. Could/should this type
>> >> accommodate a proper builder pattern? Or is "builder" not the right w=
ord
>> >> to use here?
>> >
>> > You cannot create values of this type yourself. Only the C
>> > infrastructure can do so.
>> >
>> > What would you call it if not "builder"?
>>
>> It looks more like a newtype with a bunch of setters and getters. It
>> also does not have a method to instantiate (`build()` or similar). So
>> how about newtype?
>
> I don't think newtype is helpful. Ultimately, the f_ops->mmap() hook
> is a *constructor* for a VMA, and the VmAreaNew type represents a VMA
> whose constructor is currently running. The "method to instantiate" is
> called "return".
>
> fn mmap(new_vma: &VmAreaNew) -> Result {
>     // VMAs for this driver must not be mapped as executable
>     new_vma.try_clear_may_exec()?;
>
>     // we are done constructing the vma, so return
>     Ok(())
> }
>
> Alice

Right. Let's update the docs for the `mmap` hook then:

+    /// Handle for mmap.
+    fn mmap(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _vma: &VmAreaNew,
+    ) -> Result {
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
+    }
+

```
Handle for mmap.

This function is invoked when a user space process invokes the `mmap`
system call on `_file`. The function is a callback that is part of the
VMA initializer. The kernel will do initial setup of the VMA before
calling this function. The function can then interact with the VMA
initialization by calling methods of `_vma`. If the function does not
return an error, the kernel will complete intialization of the VMA
according to the properties of `_vma`.
```

But I still do not think "builder" is the right term. `VmAreaNew` is
more like a configuration object to pass initialization properties of
the VMA back to the kernel.

How about "configuration object"?


Best regards,
Andreas Hindborg


