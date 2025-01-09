Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA4D215791;
	Thu,  9 Jan 2025 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416230; cv=none; b=FMFa3eQnM6gFzIoSMBiQkIzqKwSQehfg3Fdu0VPrV16l8/+cGIhan0JsQ1l6yp3Al0CWz71BFOZws4vj4D99lvFK/8fiO6gYV7rd/olneR8MOpf0zHOGSNAiupKbKVUS9lASdnbD1AHtaxNsCXVyox+jmDPVQHmDdceYTm4lkhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416230; c=relaxed/simple;
	bh=OTmSpk8FgQtdGzsBLCapjkB10EVINFX+b6VXc1DcaII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ijb1BcbP8LAtPwiecIvGwfqrH8sFIHaBpM1z9AZx9jYN6iTQ9zAKxEHwO1txjPfNPw9oEKsF4Kr/kTKzYLWK7823FfejdJhtqWCUd7fU298RkL1tE44BepMe1NuYvaM7oFNCiRt61UElHQX3iRI1A4ITe5GSaxlHETAgndCH8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCFYhm2H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCFYhm2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EF6C4CEE3;
	Thu,  9 Jan 2025 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736416228;
	bh=OTmSpk8FgQtdGzsBLCapjkB10EVINFX+b6VXc1DcaII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KCFYhm2HAlgySDT+VDj7M7/hEOT7/f8m6lRANiIi0yf6cvrbkvUllkmlDD/6NPhWd
	 Srq4DwwmLepLl5xDfb3d7XEZkB+HvnPTD+pGCvs5n4ai6LZFQebDyf+Inv5cmmX8eO
	 08BI2G9umgJDu54D87WXproEllZuBmS/2yGaE2EyWhmUrKmudf7+9lnWqJ31cKM3Qi
	 ilAunlKUd72eq4/T0rdDmz8VXruZOWiW4Hlhij0SlDGN04n3Po55Ax2itg5n8dhcIz
	 OEoONJ63RL/ygTgorac3pq0tQEI1y1MFC9Ye7NTvSQdt1pnfxZ8TqWa9OC4G1+KSOl
	 lWF01p11kqGHA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Matthew Wilcox" <willy@infradead.org>,  "Vlastimil Babka"
 <vbabka@suse.cz>,  "John Hubbard" <jhubbard@nvidia.com>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
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
In-Reply-To: <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local> (Lorenzo
	Stoakes's message of "Thu, 09 Jan 2025 08:19:53 +0000")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<RiN4oxf3FtqzOa42iVF50yHiC7LgOLlBneneq5PqKrMSQTHph5qY1Vfm3lCY4BUyz_SqqRNWoibFUVuSfEPR3Q==@protonmail.internalid>
	<20241211-vma-v11-2-466640428fc3@google.com> <874j33ddxt.fsf@kernel.org>
	<51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
	<CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
	<87frlsbekc.fsf@kernel.org>
	<vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
	<18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 10:50:13 +0100
Message-ID: <87msg09uzu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:

> On Thu, Jan 09, 2025 at 09:02:11AM +0100, Andreas Hindborg wrote:
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >>
>> >> > +
>> >> > +    /// Zap pages in the given page range.
>> >> > +    ///
>> >> > +    /// This clears page table mappings for the range at the leaf =
level, leaving all other page
>> >> > +    /// tables intact,
>> >>
>> >> I don't fully understand this docstring. Is it correct that the funct=
ion
>> >> will unmap the address range given by `start` and `size`, _and_ free =
the
>> >> pages used to hold the mappings at the leaf level of the page table?
>> >
>> > If the vma owns a refcount on those pages, then the refcounts are drop=
ped.
>>
>> Maybe drop the "at the leaf level leaving all other page tables intact".
>> It confuses me, since when would this not be the case?
>
> I don't understand your objection. The whole nature of a zap is to traver=
se
> leaf level page table mappings, clearing the entries, leaving the other
> page table entries intact.

As someone not deeply familiar with this function and it's use, I became
uncertain of my understanding when I read this sentence. As I asked
above: When would you not clear mappings at the leaf level and leave all
other mappings alone?

Imagine you have a collection structure backed by a tree and the
`remove_item` function has the sentence "remove item at the leaf level
but leave all other items in the collection alone". That would be over
specifying. It is enough information in the user facing documentation
that the item is removed. You don't need to state that a remove
operation on an item does not remove other items. Does this example
transfer to this function, or am I missing something?

> That is, precisely what is written here. In fact I think this
> characterisation is derived from discussions had with us in mm, and it is
> one with which I am happy.
>
> Why is it problematic to accurately describe what this does?

Again, it might be that I don't properly understand what the function
actually does, but if it is just removing the entries described by the
range - write that. Don't add irrelevant details or specify what the
function does not do. It slows down the user when reading documentation.

>
> For a series at v11 where there is broad agreement with maintainers within
> the subsystem which it wraps, perhaps the priority should be to try to ha=
ve
> the series merged unless there is significant technical objection from the
> rust side?
>
>>
>> How about this:
>>
>> This clears the virtual memory map for the range given by `start` and
>> `size`, dropping refcounts to memory held by the mappings in this range.=
 That
>> is, anonymous memory is completely freed, file-backed memory has its
>> reference count on page cache folio's dropped, any dirty data will still
>> be written back to disk as usual.
>
> Sorry I object to this, 'clears the virtual memory map' is really
> vague. What is already there is better.

Would you like the proposed paragraph if we replaced "virtual memory
map" with "page table mappings", or do you object to the entirety of the
new suggestion?

>
>>
>> >
>> >> > and freeing any memory referenced by the VMA in this range. That is,
>> >> > +    /// anonymous memory is completely freed, file-backed memory h=
as its reference count on page
>> >> > +    /// cache folio's dropped, any dirty data will still be writte=
n back to disk as usual.
>> >> > +    #[inline]
>> >> > +    pub fn zap_page_range_single(&self, address: usize, size: usiz=
e) {
>>
>>
>> Best regards,
>> Andreas Hindborg
>>
>>
>
> Let's please get this series merged. I think Alice has demonstrated
> remarkable patience already, and modulo significant technical pushback on
> the rust side (on which I defer entirely to the expertise of rust people),
> I want to see this go in.

I am sensing that you don't feel my comments are relevant at the current
stage of this series (v11). Alice asked for reviews of the series. These ar=
e my
comments. Feel free do whatever you want with them.


Best regards,
Andreas Hindborg

