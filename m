Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837C1474A9;
	Thu,  9 Jan 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736411029; cv=none; b=B+peGAiS/rORHl0ngAf8jwRJioTue9nJ1jHG1lmw/jsz0hqSJFLt6z5VWsbD3sBl4MGq/J7hHgnPw/Oton/fl/p04A+wPByPuja9aMaByjBuGCRJoxc9Cse0teMYVFvViRRq6XZ4QMW7ixcupNBDuqvYtpAw+Ebodhuo2L9zR9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736411029; c=relaxed/simple;
	bh=FxDDDDkB/SYXwPnu5cUURtGqipisK/QAyYs0CosyLts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbU1fpfpgY+D6tZ+rlI/PoXVgzSYml0FB75X6yrTvE851ouZ4uMYFvvIMEgZqeHU+vJVfOaKMoo5a/L+lQHaBQwk8B5GNEAIHwApe2uvORNvN6ryct2ShgxkldGa5nFGPNvqERFZxKzJNiQupfTw7KpVwhVvZXTiri1JbQO8bvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrrQFVip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrrQFVip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C4BC4CED2;
	Thu,  9 Jan 2025 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736411028;
	bh=FxDDDDkB/SYXwPnu5cUURtGqipisK/QAyYs0CosyLts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KrrQFVipw9WabjA9jLtkf0qaLC5OmmFGj+W1KWdKIaw1pLzidSuxMU3sjYehfWlQR
	 LaqUXtOH+QGa1bpTgS0wjGd4A7oy4AtzjkGzynB6Zd6vK/KdhTeRDyZnM/lfO4pRCz
	 mBfXc/TGgWFBkFGo9T0nDL+Ykp6uZNGKetK/FfEWug8e6px7kdYAH30ntOB7W6Y67m
	 wHN3Mk5z9je23wCcoF+j/4XU9QUP/UW4S0arybPtQTsHNkF4FeSamnfCcM5FXIO+k/
	 dbKYCk8ZlAXr6M3WfERb33hSmPl5tRSlQnl7B3Sw1o8ntbCIkE3PqOqgZxVzaDZ4yE
	 Z67M50BTq7ouQ==
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
In-Reply-To: <CAH5fLggSiiQ1xTcEKbAiux=r+3C_HqY7AMtZOC6fwQCR51crCA@mail.gmail.com>
 (Alice
	Ryhl's message of "Wed, 08 Jan 2025 13:24:08 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
	<20241211-vma-v11-6-466640428fc3@google.com> <87zfku8xm3.fsf@kernel.org>
	<pA6wMXsuufZYDAp8gFd3zk-NMh14PhUmFfNrteolm9tyjR2W8fCmaMzUhE3oG2Z_pWN_mju46C_fyDygXvRUmg==@protonmail.internalid>
	<CAH5fLggSiiQ1xTcEKbAiux=r+3C_HqY7AMtZOC6fwQCR51crCA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 09:23:33 +0100
Message-ID: <874j28bdkq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Tue, Dec 17, 2024 at 10:31=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
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
>>
>> [cut]
>>
>> > +    /// Returns whether `VM_READ` is set.
>> > +    ///
>> > +    /// This flag indicates whether userspace is mapping this vma as =
readable.
>> > +    #[inline]
>> > +    pub fn get_read(&self) -> bool {
>> > +        (self.flags() & flags::READ) !=3D 0
>> > +    }
>>
>> As an afterthought, should we name these getters according to RFC344 [1]
>> (remove get_ prefix)?
>
> Well, perhaps is_readable?

Why not just `readable() -> bool`? That would match the guidelines.


Best regards,
Andreas Hindborg



