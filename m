Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70092B677;
	Thu,  9 Jan 2025 20:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736454781; cv=none; b=Wwbph59NPQK05hPRGafgz5CGURhCsgZuo/Pnz/wgBfe1iM7QhgSe//93wLrUsKVRu2DNK+PX0pXFjZAKoNKxqVUeTmICMa2t6EmZO6CjKsCv82C4WnoqFD/7FLHrAhO8XwqNtn/cIMeYQTNVaYQYxy2ULkAi7/5WXUy62TuRKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736454781; c=relaxed/simple;
	bh=ux8AdvBQRWc8x5GVq76mOl2ItrF9N8b+fdfFajokARk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YOdUvY+g7tvS22n0GkdJUvFOL6wNR3d5chqAZOX2kV8uOlgI8TcUl3rJ6zPeMPEejPCucZCfVBSKDhjBnslB8Fx2PZFMK46mj4LxvF0qz/mQXZ8H5o4IshRy+LPUWqwwearjZ0msdmAzRvE7/FG3q+rR+x6ibx/Nr2buAEGFCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOYiY66I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOYiY66I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FCAC4CED2;
	Thu,  9 Jan 2025 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736454780;
	bh=ux8AdvBQRWc8x5GVq76mOl2ItrF9N8b+fdfFajokARk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cOYiY66IWYKR7zk/Oa3TAcGrU/3Ks0vqdMSJ91RIpXSDdJzFWo7qv4dHM+J6uzzje
	 o+4+ivSfoXTq3f9WFL/DHwcZmqjQt0qIO3KJCkyYLn1JIlJc6/uL72sswLMh3FSe5B
	 TZ/kOlfPR+wfOieBaO8QnPXe9SSOan+hSphOIquRXIDj08tPcnXLP31RV9WgX6dw/y
	 vQ8wme07AGQ1dVwZ5aYevxBPhmZa0Yhxu684F6oBr2WPEpaysHEDgS/2kd/9+55fTb
	 Hb/pA6FH5AyiabMpUPYjZtZfL4OLD+TUOwT1wOYeAytekV0icvVv7vdOF1ufQlVXXm
	 bYrZxnWGT+CNw==
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
In-Reply-To: <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local> (Lorenzo
	Stoakes's message of "Thu, 09 Jan 2025 11:29:43 +0000")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<RiN4oxf3FtqzOa42iVF50yHiC7LgOLlBneneq5PqKrMSQTHph5qY1Vfm3lCY4BUyz_SqqRNWoibFUVuSfEPR3Q==@protonmail.internalid>
	<20241211-vma-v11-2-466640428fc3@google.com> <874j33ddxt.fsf@kernel.org>
	<51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
	<CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
	<87frlsbekc.fsf@kernel.org>
	<vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
	<18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
	<87msg09uzu.fsf@kernel.org>
	<qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
	<8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 16:32:13 +0100
Message-ID: <871pxcgg02.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:

> On Thu, Jan 09, 2025 at 10:50:13AM +0100, Andreas Hindborg wrote:
>> "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:
>>
>> > On Thu, Jan 09, 2025 at 09:02:11AM +0100, Andreas Hindborg wrote:
>> >> "Alice Ryhl" <aliceryhl@google.com> writes:
>> >>
>> >> > On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindbor=
g@kernel.org> wrote:
>> >> >>
>> >> >>
>> >> >> > +
>> >> >> > +    /// Zap pages in the given page range.
>> >> >> > +    ///
>> >> >> > +    /// This clears page table mappings for the range at the le=
af level, leaving all other page
>> >> >> > +    /// tables intact,
>> >> >>
>> >> >> I don't fully understand this docstring. Is it correct that the fu=
nction
>> >> >> will unmap the address range given by `start` and `size`, _and_ fr=
ee the
>> >> >> pages used to hold the mappings at the leaf level of the page tabl=
e?
>> >> >
>> >> > If the vma owns a refcount on those pages, then the refcounts are d=
ropped.
>> >>
>> >> Maybe drop the "at the leaf level leaving all other page tables intac=
t".
>> >> It confuses me, since when would this not be the case?
>> >
>> > I don't understand your objection. The whole nature of a zap is to tra=
verse
>> > leaf level page table mappings, clearing the entries, leaving the other
>> > page table entries intact.
>>
>> As someone not deeply familiar with this function and it's use, I became
>> uncertain of my understanding when I read this sentence. As I asked
>> above: When would you not clear mappings at the leaf level and leave all
>> other mappings alone?
>
> Because these are page tables and page tables can span multiple PTE
> tables. Correctly removing at the time of clearing would be expensive and
> require very careful handling.

What is the distinction between clearing a PTE and removing it?

I asked above if the leaf page holding the PTEs would be dropped if all
the PTEs it holds are cleared. Alice "If the vma owns a refcount on those p=
ages,
then the refcounts are dropped.". But from your message I am guessing
maybe not?

>
>>
>> Imagine you have a collection structure backed by a tree and the
>> `remove_item` function has the sentence "remove item at the leaf level
>> but leave all other items in the collection alone". That would be over
>> specifying. It is enough information in the user facing documentation
>> that the item is removed. You don't need to state that a remove
>> operation on an item does not remove other items. Does this example
>> transfer to this function, or am I missing something?
>
> No, because we're dealing with page tables and you are explicitly request=
ing a
> page table operation. Knowing what is touched is meaningful.

When would a page table operation to remove (clear?) the PTEs
corresponding to an address range touch PTEs corresponding to addresses
outside of the range?

>
>>
>> > That is, precisely what is written here. In fact I think this
>> > characterisation is derived from discussions had with us in mm, and it=
 is
>> > one with which I am happy.
>> >
>> > Why is it problematic to accurately describe what this does?
>>
>> Again, it might be that I don't properly understand what the function
>> actually does, but if it is just removing the entries described by the
>> range - write that. Don't add irrelevant details or specify what the
>> function does not do. It slows down the user when reading documentation.
>
> It is highly pertinent as mentioned above.
>
> I mean we can expand the comment to explicitly add some detail around this
> since obviously this is confusing (hey - a lot of mm is confusing - this =
is
> an ongonig problem and why I have gone to lengths to try to improve
> documentation and wrote a book about it :)

That would be nice :)

>
>>
>> >
>> > For a series at v11 where there is broad agreement with maintainers wi=
thin
>> > the subsystem which it wraps, perhaps the priority should be to try to=
 have
>> > the series merged unless there is significant technical objection from=
 the
>> > rust side?
>> >
>> >>
>> >> How about this:
>> >>
>> >> This clears the virtual memory map for the range given by `start` and
>> >> `size`, dropping refcounts to memory held by the mappings in this ran=
ge. That
>> >> is, anonymous memory is completely freed, file-backed memory has its
>> >> reference count on page cache folio's dropped, any dirty data will st=
ill
>> >> be written back to disk as usual.
>> >
>> > Sorry I object to this, 'clears the virtual memory map' is really
>> > vague. What is already there is better.
>>
>> Would you like the proposed paragraph if we replaced "virtual memory
>> map" with "page table mappings", or do you object to the entirety of the
>> new suggestion?
>
> I object to the suggestion in general. The description is fine as it is.

Ok. I'm raising a flag because I had more questions after reading the
docstring than before.

>
>>
>> >
>> >>
>> >> >
>> >> >> > and freeing any memory referenced by the VMA in this range. That=
 is,
>> >> >> > +    /// anonymous memory is completely freed, file-backed memor=
y has its reference count on page
>> >> >> > +    /// cache folio's dropped, any dirty data will still be wri=
tten back to disk as usual.
>> >> >> > +    #[inline]
>> >> >> > +    pub fn zap_page_range_single(&self, address: usize, size: u=
size) {
>> >>
>> >>
>> >> Best regards,
>> >> Andreas Hindborg
>> >>
>> >>
>> >
>> > Let's please get this series merged. I think Alice has demonstrated
>> > remarkable patience already, and modulo significant technical pushback=
 on
>> > the rust side (on which I defer entirely to the expertise of rust peop=
le),
>> > I want to see this go in.
>>
>> I am sensing that you don't feel my comments are relevant at the current
>> stage of this series (v11). Alice asked for reviews of the series. These=
 are my
>> comments. Feel free do whatever you want with them.
>
> I think you're getting the wrong end of the stick - you are making commen=
ts
> on something relevant to mm, as an mm maintainer I'm giving you my point =
of
> view.

I appreciate that.

>
> Your comments elsewhere seem highly useful, and review is always
> appreciated, if you read what I said above - I defer entirely to the rust
> community on things of which you are expert - so there is clearly no
> disrespect intended.

I did not read any disrespect in your message. I understand if you think
I am late at the party at v11. Normally I would not pick up review of a
series that late.

>
> I'd also ask you to respect that I have gone to great lengths to review
> this series from mm side, motivated by a strong desire to help the rust
> commnuity.

I absolutely appreciate that!

>
> So where I am coming from is nothing negative, quite the opposite, I simp=
ly
> feel _on this issue_ it is not worth holding up the series for.
>
> This is no way intended to do down, disrespect or seem ungrateful for your
> review or efforts. Apologies if it seemed that way, was not the intent.
>
> And to reiterate what I said above - I want to see this series merge :) so
> there is no ill will anywhere.

We can always merge this as is and then discuss the finer points of
documentation later - I am fine with that. But obviously I cannot put my
review tag on it, when I don't understand the semantics of the functions
from reading the documentation strings. Perhaps we have someone who is
more well versed in mm that can.

>
>>
>>
>> Best regards,
>> Andreas Hindborg
>>
>
> Perhaps the correct approach here, as alluded above, is for Alice to add =
an
> extra commentary pointing out the role of page tables here?

That would be nice. Perhaps a bit of module level documentation is also
a good addition.

>
> To complicate matters further (of course) there are recent series which
> actually _do_ unused clean up page tables, though not (I believe... I have
> to check...) on zap. But of course we in mm JUST LOVE to complicate
> everything... ;)

We should make sure to document that :)


Best regards,
Andreas Hindborg


