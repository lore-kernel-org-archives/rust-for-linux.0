Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801FA2D;
	Thu,  9 Jan 2025 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409744; cv=none; b=DmVmWyYR10fwDAN4AVtpI2flFUQFnlTKDSMVOQ0MBQb6yXJjK69ssN2VQ8c7SuyBL/jmmS7YTXlo3eu3eP9+TCvZS7yRGsp2pN+15Sbj5eD7Q0SJCcRb0m6LHzWqF9QIm20buq6/KcQk3BYD1vg6GLx+niCQKOHQ+XCjszsFDhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409744; c=relaxed/simple;
	bh=dQz3jHTNKJoNI+Qg4ogr4k2g+NK7sXWwPNda11HaDNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fz7kyocOExwPRWklWf+NuOe6C3tpYNW/Gwhr1zoI5N7uFkakDVfK83Xog5R1LFWrTFB9hiv3AJjHxv25H0XGNEVokO5VY5cBqBqU8u801zNQMqEbCBf47r4yGNsgG/tGpSMeioAsNxXNZ834wGDG1Byo/M49fJzQ0ezjHCX5MrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5RFercy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5RFercy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19AEC4CED2;
	Thu,  9 Jan 2025 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736409743;
	bh=dQz3jHTNKJoNI+Qg4ogr4k2g+NK7sXWwPNda11HaDNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g5RFercyAqU/mwGE8wT3Y2WadFb2203dmY0F8oTHugMk8vH/Cq7YWEfhDzOZqRIca
	 OQiBW2gTwOvQ5k0cDhCbP4ffO7ynIQ3gQNwUCiFUuDpn4XUJKMayRTFZTPydas2SlP
	 r0xjAqobBoEmCYWO933OppLYqujiHDzeIyh8Z07yLWg23Jtso1fo700HGSrbvL2YmP
	 XgXdgKIbswSYyZr93aOPBuY5U9nb20E4VTFKksnTZnqkRZVal/C/WBXPIRqd8d3Rqy
	 jkQBsrphbwE/Fs0Lyfd5z73Sd5rtc6yYO25PqxscJ6Maeybc/vpMQ4x0hCWu6RFVoo
	 ParRCkQbM8KEw==
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
Subject: Re: [PATCH v11 2/8] mm: rust: add vm_area_struct methods that
 require read access
In-Reply-To: <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 (Alice
	Ryhl's message of "Wed, 08 Jan 2025 13:21:08 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<RiN4oxf3FtqzOa42iVF50yHiC7LgOLlBneneq5PqKrMSQTHph5qY1Vfm3lCY4BUyz_SqqRNWoibFUVuSfEPR3Q==@protonmail.internalid>
	<20241211-vma-v11-2-466640428fc3@google.com> <874j33ddxt.fsf@kernel.org>
	<51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
	<CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 09:02:11 +0100
Message-ID: <87frlsbekc.fsf@kernel.org>
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
>>
>> > +
>> > +    /// Zap pages in the given page range.
>> > +    ///
>> > +    /// This clears page table mappings for the range at the leaf lev=
el, leaving all other page
>> > +    /// tables intact,
>>
>> I don't fully understand this docstring. Is it correct that the function
>> will unmap the address range given by `start` and `size`, _and_ free the
>> pages used to hold the mappings at the leaf level of the page table?
>
> If the vma owns a refcount on those pages, then the refcounts are dropped.

Maybe drop the "at the leaf level leaving all other page tables intact".
It confuses me, since when would this not be the case?

How about this:

This clears the virtual memory map for the range given by `start` and
`size`, dropping refcounts to memory held by the mappings in this range. Th=
at
is, anonymous memory is completely freed, file-backed memory has its
reference count on page cache folio's dropped, any dirty data will still
be written back to disk as usual.

>
>> > and freeing any memory referenced by the VMA in this range. That is,
>> > +    /// anonymous memory is completely freed, file-backed memory has =
its reference count on page
>> > +    /// cache folio's dropped, any dirty data will still be written b=
ack to disk as usual.
>> > +    #[inline]
>> > +    pub fn zap_page_range_single(&self, address: usize, size: usize) {


Best regards,
Andreas Hindborg


