Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75223847B
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Mar 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305694; cv=none; b=vB96KjNq67V4QB7890rK+vy3BXrJ92d2Zae1alP2xnoRACS2ENrOx9iT0511uQ7kYy47kgipMo+1w6NUBlx5LLNMeuaDrODd19Glh4t0gxZQORBqCQ4bfR5REy3+Lii7K10MhCmlgIldeBuFw1gujGnn8pjet6nQcDLhbRHV68k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305694; c=relaxed/simple;
	bh=Pi1AAX8k15caN6QA8JY82zl5bbVvjN700PEWndcmB0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GA9n0ybyI3xfPNenNwKBE66agahsbgX25yrIYGe4L9TckmaF4XP2oJi2RHCz4tnYtMRL8VOEmb+LdhCsZaBqANvN9vL2g42Mcirf7UTs1+nUcr+YoGR8UIeCW1x3AFin4S5ZXYWiYT+rnkxnyF1ajrebKQYKN36PoWRhUs00PMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5ZCEwyz; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5ZCEwyz"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c04df48a5bso120685485a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Mar 2025 16:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741305691; x=1741910491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EChL4MhIvN0vOv+OyV9ty9Bp3e4mVGVuzwxHmc0N4I=;
        b=l5ZCEwyzFShE9CYIpLpdHIQihy2GE+I7Bal05Dk/L0ErEuCCUiaX3OXLU83bwx57SB
         oKPgVw0bhCfdDzLMKH4CE61uQFlktNHzU5Ir7zZNCkKu1d3UzSKLwj1ypX8rHttUIGO4
         /rGzLG2Yg+t3GsD9P4Reu8TPQdh2TvhaAkHYA1IZbbceURje0Vwc+OSP6XzHBZUrW69j
         1igafY5UFDi6tvIVnw1Aij2S39o1QRHH1cdou8rmNBtqFV+fWRSaAH5uijJvJoDbB3uG
         5EyCAzwWY4ociHDwjIZsG5pWKpnfqnM2O9LlmYNPCDJe2uiTYk4uwTPTwZdKud4BtO4A
         A/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741305691; x=1741910491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EChL4MhIvN0vOv+OyV9ty9Bp3e4mVGVuzwxHmc0N4I=;
        b=c4iNipfDhRomWnfOY43aXwI3LPEOTxy+dKbiQMEVfwiuvrY0s8vDT+JQ+hDF4lIESk
         rMK02F0PesbP1vXAA/ViGmK3GL82NWj27he4X5lMaoyUgWjypbDa4CdGSgYcghJvJiek
         qVa3kdOVPmTLEQm5Ro2Vw5hE0A+pZk2qRTxC1QL9d9AySvHgHINP3Cko3RA1/xuBt3rS
         sG2r78pyhbOLLq/J8Rbjs4jU+fRy38RvK4twy17UrOysg44Yu0101SSD9eLh3PK9gEGu
         EOMB8ns5XZcXAexLIg5hEvpD+/ItcxqDJQf+thfc7EXAEcHhdNiNVSPFwUTikSF29enS
         144Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnjdb/VQzFBP+UvuWcKV62rWA977zsGORhkMhq2Rvy8dW5/fJspKMXyyZv9yrAJaA/CB4gFn871CS5Z7CCGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1gcCm4jwNxb0bjqflIYLAUhOEgeAEyEr6uJSuYNQBpG0Linpq
	tAK0uwLkS7mAW1QDQAWH4L/rY5AHzaJK7fSgQQgqK/L0FeFxeUGw
X-Gm-Gg: ASbGncuIk9oV5LqKjKiyLyZ28CxOY0hLzQIsHmYWXnUNnSdqQj4DItKrL16kfoNuAvS
	36eFo4EznoyDAkl87P6Spf96tigQ2ZfHvyJCEizzrNSfD35ZCQd3U18mvjbiNAIvY6f5alGzicR
	91qBhQ2dwniFHuXzH4i36ufZjJildqTSPQPiuPpKTsQUssagA5ozOyskubZ8tBQbhBlLA22F0rT
	7k+EekQVzXdgmXe21cQu3zJSjUHHfy/lDzbxBsPYp5qMSMRmBVvm3xPQuuzD/If/zTspo1+Va1/
	JsAfQngtE4gIj8373rR0LzPJWbNpVMQA+D5YUaRLiEUj2JRfpAkFdEuoLAuTrYpP/SnwhamwRYz
	+SxS32zGniSgUOH3VYXfj8WTTsmKAu6R/zUc=
X-Google-Smtp-Source: AGHT+IE/WlT5dXja4GJMqoGovVSbnDapWOx1zVMMtDj204nUqdIFHYfkCEaqSq4i9XbfqtQrKEytHw==
X-Received: by 2002:a05:620a:6084:b0:7c0:b0d4:e133 with SMTP id af79cd13be357-7c4e6104de2mr244494885a.25.1741305691170;
        Thu, 06 Mar 2025 16:01:31 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a0b1sm156763785a.10.2025.03.06.16.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 16:01:30 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 28E941200043;
	Thu,  6 Mar 2025 19:01:30 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 06 Mar 2025 19:01:30 -0500
X-ME-Sender: <xms:WjfKZzHv5bE34RcD4kC4i8YniC8sX9aOe0YYCFKaJy7_woF_xN585w>
    <xme:WjfKZwX67prsJUxrGEfnym3dviOcAZt3MRPhsOIl3kw1udaWAcHAiG6KU-MCDBQRC
    0g3NsW3Kn2MuNa2qw>
X-ME-Received: <xmr:WjfKZ1JKXXb-d_RPJahCeoi3Agf6FOHQ9gVSL7FVanR-KNBH_qn19YVm7YU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeludegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
    rhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhf
    gvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgv
    rhhnpeekjefgudefhfeigffghfdtheeggfdtuddvkeejleffheeufeffteetvefgfeeuje
    enucffohhmrghinhepghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrsh
    honhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghn
    gheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepud
    dtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsvghnnhhordhlohhsshhinhes
    phhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepughirhhkrdgsvghhmhgvseguvgdrsghoshgthhdrtghomhdp
    rhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegu
    rghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhope
    hgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrhihhhhlsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:WjfKZxG9-RppdYQ_OQ6UBPOTRbgBlq10ModQnZY9UEsaaNU2Ro0XjQ>
    <xmx:WjfKZ5WKIiIA_zmJSuNfsQTWDxH-Q10s9w8tFx1KqpWacmiQkW530g>
    <xmx:WjfKZ8N7eQm-S0yxKdaFU9xLR7g3jT7zRzPWhw7HieZ6kEuJIjntCQ>
    <xmx:WjfKZ411TNL0QxanHH1athbCGu9QdTKMGapI9yMuGycVwcpf54_hkA>
    <xmx:WjfKZ-WH1-hh35hfAzzYbTMVALog4pwOdlsqZbEZbGji4kMh2Y9guAMI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Mar 2025 19:01:29 -0500 (EST)
Date: Thu, 6 Mar 2025 16:00:20 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	daniel.almeida@collabora.com, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
Message-ID: <Z8o3FMfUh-qoeaQf@boqun-archlinux>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <Z8hwGGn9huDjyDWN@tardis>
 <87v7sn759g.fsf@kernel.org>
 <n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
 <Z8icwtIpZ3PO9YcZ@boqun-archlinux>
 <87zfhz5gq2.fsf@kernel.org>
 <DJwmmXRi4oxEM1aRRHh2SekW5eo0beS5JIfsvphgxDldFDRtXNG_2GDvuV5u5Yxj0Tfi4wau55m44VjbhTTCyw==@protonmail.internalid>
 <Z8k6J-rLXUp9y-o1@tardis>
 <87o6ye5wbs.fsf@kernel.org>
 <D894EPDF6Q5H.38KZS9M7T6HEI@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D894EPDF6Q5H.38KZS9M7T6HEI@proton.me>

On Thu, Mar 06, 2025 at 10:45:00AM +0000, Benno Lossin wrote:
> On Thu Mar 6, 2025 at 10:42 AM CET, Andreas Hindborg wrote:
> > "Boqun Feng" <boqun.feng@gmail.com> writes:
> >
> >> On Wed, Mar 05, 2025 at 10:07:33PM +0100, Andreas Hindborg wrote:
> >>> "Boqun Feng" <boqun.feng@gmail.com> writes:
> >>>
> >> [...]
> >>> >> >> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
> >>> >> >> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >>> >> >> >
> >>> >> >> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >>> >> >> > index af30e9c0ebccb..f370cdb48a648 100644
> >>> >> >> > --- a/rust/kernel/types.rs
> >>> >> >> > +++ b/rust/kernel/types.rs
> >>> >> >> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
> >>> >> >> >
> >>> >> >> >  /// Stores an opaque value.
> >>> >> >> >  ///
> >>> >> >> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
> >>> >> >> > +/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
> >>> >> >> > +/// by using [`UnsafeCell`]:
> >>> >> >> >  ///
> >>> >> >> > -/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
> >>> >> >> > -/// It gets rid of all the usual assumptions that Rust has for a value:
> >>> >> >> > +/// * Initialization invariant - the contained value is allowed to be uninitialized and
> >>> >> >> > +///   contain invalid bit patterns.
> >>> >> >> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
> >>> >> >> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.
> >>> >> >>
> >>> >> >> This last one is wrong (I know it's probably my fault, sorry). It should be:
> >>> >> >>
> >>> >> >>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive** references.
> >>> >> >>
> >>> >> >
> >>> >> > Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
> >>> >> > noalias" here? If so I feel the wording might be confusing. I would
> >>> >> > suggest we don't use "uniqueness" here. Maybe something like:
> >>> >> >
> >>> >> > * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily a
> >>> >> >   unique pointer, and thus the compiler cannot just make aliasing
> >>> >> >   assumptions.
> >>> >> >
> >>> >> > (I use the wording from UnsafePinned[1], maybe there could be better
> >>> >> > wording)
> >>> >> >
> >>> >> > [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary
> >>> >>
> >>> >> I like my wording better. It says the same with fewer words, and we have
> >>> >> a more wordy section below anyway. We could combine:
> >>> >>
> >>> >>  * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive**
> >>> >>    references. That is, `&mut` [`Opaque<T>`] is not necessarily a unique
> >>> >>    pointer.
> >>> >>
> >>> >>
> >>> >> How is that?
> >>> >>
> >>> >
> >>> > I think my biggest problem is the word "allows", the phrase "allows
> >>> > aliasing" sounds like Opaque<T> provide something *optional*, however,
> >>> > as I understand it, Opaque<T> here just disallows certain optimization
> >>> > from compiler, in other words, programmers want to use `Opaque<T>` to
> >>> > forbid something, hence "allows" may not be the good word to use here?
> >>> >
> >>> > How about:
> >>> >
> >>> >   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
> >>> >     made by compiler on an *exclusive* references.
> >>>
> >>> I don't object, but I feel like we should be able to define this within
> >>> the context of the Rust language, without going into details about
> >>> compiler internals.
> >>>
> >>> Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
> >>> it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
> >>> understanding.
> >>>
> >>
> >> Oh, I see. That's why you used "allows", however, allow me to explain
> >> why it looks confusing to me. For `&mut T`, we can still have an
> >> aliasing pointer (a pointer that points to the same variable as the
> >> mutable reference):
> >>
> >> 	let mut x = ...;
> >>
> >> 	let mut_ref = &mut x;
> >> 	let aliased_ptr = mut_ref as *mut _;
> >>
> >> it's just that if we dereference the pointer while the `&mut T` exists,
> >> it's UB, e.g.
> >>
> >> 	unsafe { *aliased_ptr = ... };
> >
> > Right.
> >
> >>
> >> and `Opaque<T>` allows above to be not a UB (there still are rules like
> >> we cannot have data races, violating these rules would still be UB).
> >
> > Yes.
> >
> >> So to me "aliasing" can mean "having an aliasing pointer", and that as
> >> shown above can be provided by both non-Opaque and Opaque cases. I
> >> wonder whether "allow aliased/aliasing accesses" is better than "allow
> >> aliasing" here.
> 
> I disagree, to me "aliasing pointer" means having two pointers that
> point to the same value and that you can use in an interleaved fashion
> for writes and reads.
> 
> > Yes, I think that would be better.
> >
> > I had another thing in mind when I wrote the text, and I am wondering if
> > it is incorrect. As far as I know it is normally illegal to have more
> > than one `&mut T` to the same `T`, even if no access occur through these
> > references.
> 
> The rules aren't completely set and IIRC you *can* create multiple
> references as long as the value they point to is not read or written to
> while they exist. But I wouldn't bet anything on that...
> 
> > With `Opaque<T>`, is it still illegal to have two `&mut Opaque<T>` to
> > the same `T` in existence? I thought it was not illegal in this case.
> 
> Yes it is legal to have multiple `&mut Opaque<T>` pointing to the same
> value (and writing/reading through the `get` method or directly by
> having another `Opaque<T>` value).
> 
> > At any rate, your wording is probably the most accurate:
> >
> >   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
> >     made by compiler on an *exclusive* references.
> >
> > Alternatively, if we do not want to refer to compiler assumptions:
> >
> >   * Uniqueness invariant - [`Opaque<T>`] makes aliasing accesses to the
> >     underlying `T` well defined.
> 
> This wording doesn't sound right to me, since it's still illegal to have
> multiple `&mut T` that point to a value inside of an `Opaque<T>`.
> 

Which wording proposed so far would sound right to you? Or you have a
proposal that could describe this rigorously?

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
