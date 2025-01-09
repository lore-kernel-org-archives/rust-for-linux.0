Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5A1FC11F;
	Thu,  9 Jan 2025 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736410797; cv=none; b=JmGGhkUyUTcnKs24jpccuiuQBByhPHmUmcVvxbSwbpXPeLtuy2qTS7S5D4+hyBtNGLeh5OLMbOozc25JdebKwMW1RVwcFywz6BNgttIXFHtS+2OaEgIaJBO/sZ+g5zY7UQ9S6Geus1aZkqNYaHOy1EVciTwDjImkih0adrSgszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736410797; c=relaxed/simple;
	bh=Md+mNVPfVwVeK8yUZS5LLyfhVUilsz8vzI6QSleGKTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f8h9Gmb/zigk3bG/p2rhHSLdcODyh2kwsnGQ5CA639oXSjghghOOEoq6UPmA+PZuxSwuEFSIF4pU3ssXvlGzyk3Koy3VAPsa6opA6OSCT4DQXVx38JPRMB8LmuADX1dpVVEca/W12azhqI64RBB2xzU3FF501mPTOGKhoQn09rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVl7MpYQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVl7MpYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67926C4CED2;
	Thu,  9 Jan 2025 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736410797;
	bh=Md+mNVPfVwVeK8yUZS5LLyfhVUilsz8vzI6QSleGKTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NVl7MpYQ8jRj9UzUHSSqZNRzUMguqKZ+nE8YMkwV5sx1i/fIXUzdPaL2nm6q3hy7i
	 5RmFwUWLn/J1r867x/8Q1K7fjvWREtW4Yl+T0sh4mh1vK/lp25NKVSaHUxCXLYIO2r
	 DE3fx6IUz5Hgt1kDZRnitOHfH0MxnQGcjKS/uBujrm73qLKT5UQiOo/x6VpHLBBf9S
	 LpDBNESuyw/GnG62U6PuJ393lKZaE8+n9N6Hvzj+bxayLLje64fUziXTr2PXqXQX+E
	 VOEWKqtFSuJrOWyEQ03AnofjtDpn8ou0owzEQlX+ux9Biu72fTP1BLvSIQZMhdH2w0
	 1Ywgyj+rL9hnQ==
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
In-Reply-To: <CAH5fLgh8g3d+v-am=VRdExZug6hTJf-3CWPoxxYCZLpyiXnKdg@mail.gmail.com>
 (Alice
	Ryhl's message of "Wed, 08 Jan 2025 13:23:40 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
	<20241211-vma-v11-6-466640428fc3@google.com> <87o71bagpf.fsf@kernel.org>
	<vdoUDPvED_7e_bvzaMNFhBpC-6TLpsrA9cfX8LWc-w69rv1whT7EnYLMtUn_MNlJ2R-e3LrKOfHNnacUsHivFg==@protonmail.internalid>
	<CAH5fLgh8g3d+v-am=VRdExZug6hTJf-3CWPoxxYCZLpyiXnKdg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 09:19:47 +0100
Message-ID: <87a5c0bdr0.fsf@kernel.org>
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
>> > This type will be used when setting up a new vma in an f_ops->mmap()
>> > hook. Using a separate type from VmAreaRef allows us to have a separate
>> > set of operations that you are only able to use during the mmap() hook.
>> > For example, the VM_MIXEDMAP flag must not be changed after the initial
>> > setup that happens during the f_ops->mmap() hook.
>> >
>> > To avoid setting invalid flag values, the methods for clearing
>> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an err=
or
>> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
>> > the return value results in a compilation error because the `Result`
>> > type is marked #[must_use].
>> >
>> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
>> > we add a VM_PFNMAP method, we will need some way to prevent you from
>> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
>> >
>> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
>> > Reviewed-by: Jann Horn <jannh@google.com>
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  rust/kernel/mm/virt.rs | 181 ++++++++++++++++++++++++++++++++++++++++=
++++++++-
>> >  1 file changed, 180 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
>> > index 3a23854e14f4..6d9ba56d4f95 100644
>> > --- a/rust/kernel/mm/virt.rs
>> > +++ b/rust/kernel/mm/virt.rs
>> > @@ -6,7 +6,7 @@
>> >
>> >  use crate::{
>> >      bindings,
>> > -    error::{to_result, Result},
>> > +    error::{code::EINVAL, to_result, Result},
>> >      mm::MmWithUser,
>> >      page::Page,
>> >      types::Opaque,
>> > @@ -171,6 +171,185 @@ pub fn vm_insert_page(&self, address: usize, pag=
e: &Page) -> Result {
>> >      }
>> >  }
>> >
>> > +/// A builder for setting up a vma in an `f_ops->mmap()` hook.
>>
>> Reading this line, I would expect to be able to chain update methods as
>> in `Builder::new().prop_a().prop_b().build()`. Could/should this type
>> accommodate a proper builder pattern? Or is "builder" not the right word
>> to use here?
>
> You cannot create values of this type yourself. Only the C
> infrastructure can do so.
>
> What would you call it if not "builder"?

It looks more like a newtype with a bunch of setters and getters. It
also does not have a method to instantiate (`build()` or similar). So
how about newtype?


Best regards,
Andreas Hindborg


