Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434C387363
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035710; cv=none; b=bbYUP5ar04mohFLjxZ76Vg9Jpjd6oINpSjzZ/C8iZWjtMRdQf851nJQJsPM/bnosF+UgfxC89l3XhxGqldZNlD/rYns5cjNT64K2CfdhboMaXm65ea5+/KwRHUzDnu19zF1zx9kkoc47uRZt58CJZ9veZc9JiqK3tc+oUPU8Dyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035710; c=relaxed/simple;
	bh=ISPBl2hPYxYLRmOyDnAxrE+2m7HALkbkm06EYEjDMgs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=im4eGX+VyWMXn4QatLaSnidncyFZ9DN4AzwOyFpywqmAh3gG3gApvcIHFaTmmaHMphEp0h5kZlBBh4iZ7i3ixTCFyeh4g24hmov6DhuDE+aeASg/uXtT+YJsyGEY14if2RAXkHtBOw5WnqH8Mpg3dI5AhaYNDR7PcrmyJ5yASMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=OZVTRyNw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MyT7mK4M; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="OZVTRyNw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MyT7mK4M"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 85FC8EC0226;
	Wed,  1 Apr 2026 05:28:26 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Wed, 01 Apr 2026 05:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775035706;
	 x=1775122106; bh=j0YCSy6/Y3tH+aziR3kSodnqO+WHxOPw4f6XJGvFDqE=; b=
	OZVTRyNwHmIR3AoeJdZyHQTRgiRJwmY8z53WWV2zwiFVUAkro0k3pJIU3whHz/47
	3GJsCeh9lG7mg+MBq9mnmP52P6JxM0Uf0p/WHFnQc+yp5DwWEUD4TbY/yPz+ldDZ
	j+PNiqrIch1p47oLjBw79V94y9xuuIuT+SDI23mrGsLsBEgBwZ5chM9D2LRwbmxM
	FsYiplbWAJ0b6IjR/FJdhiPx83GIyjsaKO9BTjyff7ONYLRQ2zytgGnU32Xcord8
	UhafLD0OFZDwItE0ZwVJ2R6DfLiv6uvgok3gexuP7Qp838ovq7Tc59j5duz/em/Y
	sbUWm+3A8s2+hrmuwiOtlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775035706; x=
	1775122106; bh=j0YCSy6/Y3tH+aziR3kSodnqO+WHxOPw4f6XJGvFDqE=; b=M
	yT7mK4M2FScb+86IO+l7JtCvLja0YhVFFOJdne6Z+haeIqpgZ0vJw2/MjHEAZqYw
	JDalPf/sQh0JIkQAa89uecM9JJgHvh2GJs/lNjMExZhgQnoghjk55OvRdu7vMFtA
	E4sQRWLsmNh/lcDU5eLMV6FEXrvcAbmeojytAWoBSy9cfKwlXhNyQps7d8ICRDWA
	k25azMUuK+t7HaUYr+88h7tdBiO6bWNaHOUOt2vs1dd/bMcVeofffuquWwI+6kSM
	hP356uAd2lc93TMZ9bjomAdyl2y3HlAjnkV3k3fjF6gyVUKeWdAfd8W/nUEkIE7Y
	fNg9oiIbUI7+SRZNd2yLg==
X-ME-Sender: <xms:OeXMabQyPLkTuavJSnxLT2BENvCog70P3oU7Iy-nWhGRVClw2hcs0w>
    <xme:OeXMaXkirqVp3CXaI0jpQdGimVV2EvXGSSEksG_uDJvb6z43olar7z7vU4zhI1jAb
    vy_q9CKzm4lMOoR8VweBMcpnljlrcDLycAaDGG8Arj-n1DZqls5PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrvhhiugcu
    tfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecugg
    ftrfgrthhtvghrnhepffelteevveetvddujeffieeiledthfeffeevhfetueekgffhtdeg
    teeltedttdetnecuffhomhgrihhnpehlvghnrdhmrghppdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgu
    sehrvggruggrhhgvrggurdgvuhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepthgvghesjhhklhhmrdhnohdprhgtphhtthhopegurghkrhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:OeXMaR7PkYT0TYVj2n6sii2guHJ0G7ChGRbO7RJ7HfGD1hIXGRZMyw>
    <xmx:OeXMacsx8j5ydGsS2uR9YJWezf3bUY8ArhKwSZbiW8LiNxCNhrnUuQ>
    <xmx:OeXMaS7LQAQkI1h-y5K9cgDfDnr4fmo2fYQlh-yLHSiFOmhSlLerlA>
    <xmx:OeXMaXUkIIfaYsJa4XACC0KxaQ7zdLWYcljlTAAWE0LA8darUFsW7A>
    <xmx:OuXMaXNNkd_RPGAeThNeF9SfWnCMBSA8MvHTNfRjJew6KTGhQS_2D6va>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2A4215C008F; Wed,  1 Apr 2026 05:28:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AoTMvZJLhhxZ
Date: Wed, 01 Apr 2026 11:28:04 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no,
 "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <8ae47788-55da-4ab7-9983-83a432b364f3@app.fastmail.com>
In-Reply-To: <DHHB5GGW1QOQ.2IXULYZWQX9MO@kernel.org>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-4-david@readahead.eu>
 <DHHB5GGW1QOQ.2IXULYZWQX9MO@kernel.org>
Subject: Re: [RFC 03/16] rust/alloc: add Vec::into_boxed_slice()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Wed, Apr 1, 2026, at 12:07 AM, Danilo Krummrich wrote:
> On Tue Mar 31, 2026 at 9:02 PM CEST, David Rheinsberg wrote:
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index ac8d6f763ae8..b8b0fa1a7505 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -733,6 +733,73 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
>>          }
>>          self.truncate(num_kept);
>>      }
>> +
>> +    fn shrink_to_fit(&mut self) -> Result<(), AllocError>  {
>> +        if Self::is_zst() {
>> +            // ZSTs always use maximum capacity.
>> +            return Ok(());
>> +        }
>> +
>> +        let layout = ArrayLayout::new(self.len()).map_err(|_| AllocError)?;
>> +
>> +        // SAFETY:
>> +        // - `ptr` is valid because it's either `None` or comes from a previous
>> +        //   call to `A::realloc`.
>> +        // - `self.layout` matches the `ArrayLayout` of the preceding
>> +        //   allocation.
>> +        let ptr = unsafe {
>> +            A::realloc(
>> +                Some(self.ptr.cast()),
>> +                layout.into(),
>> +                self.layout.into(),
>> +                crate::alloc::flags::GFP_NOWAIT,
>
> Why? This should be specified by the caller. Besides, I don't see how this could
> ever end up in memory reclaim in the first place.

For slub, this can end up in reclaim if alignment requirements change, or if a different numa node is requested (only with GFP_THISNODE). vmalloc refuses alignment changes, but has the same numa logic. Not sure whether we have any other allocators in rust right now.

My idea was to have a fixed call to realloc() that ensures it does no fail with any known allocators, but still be callable from atomic context.

But I can also take the flags in `into_boxed_slice()`. Yet, with current allocators, they will not have any effect as long as the layout and numa-node is not caller-controlled.

>> +                NumaNode::NO_NODE,
>> +            )?
>> +        };
>> +
>> +        // INVARIANT:
>> +        // - `layout` is some `ArrayLayout::<T>`,
>> +        // - `ptr` has been created by `A::realloc` from `layout`.
>> +        self.ptr = ptr.cast();
>> +        self.layout = layout;
>> +        Ok(())
>> +    }
>> +
>> +    /// Converts the vector into [`Box<[T], A>`].
>> +    ///
>> +    /// Excess capacity is retained in the allocation, but lost until the box
>> +    /// is dropped.
>> +    ///
>> +    /// This function is fallible, because kernel allocators do not guarantee
>> +    /// that shrinking reallocations are infallible, yet the Rust abstractions
>> +    /// strictly require that layouts are correct. Hence, the caller must be
>> +    /// ready to deal with reallocation failures.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// let mut v = KVec::<u16>::with_capacity(4, GFP_KERNEL)?;
>> +    /// for i in 0..4 {
>> +    ///     v.push(i, GFP_KERNEL);
>> +    /// }
>> +    /// let s: KBox<[u16]> = v.into_boxed_slice()?;
>> +    /// assert_eq!(s.len(), 4);
>> +    /// # Ok::<(), kernel::alloc::AllocError>(())
>> +    /// ```
>> +    pub fn into_boxed_slice(mut self) -> Result<Box<[T], A>, AllocError> {
>> +        self.shrink_to_fit()?;
>
> As mentioned in [1], I think into_boxed_slice() should call A::realloc()
> directly; at least use a separate internal helper. shrink_to_fit() will
> eventually be exposed to users and the actual semantics is yet to be defined.
> I.e. it may have additional logic.
>
> The requirement here is not to actually shrink the backing memory, but to
> satisfy the safety requirement of A::free(). And the best way to ensure this is
> to call A::realloc() with ArrayLayout::new(self.len()).
>
> IOW, please don't call the above method shrink_to_fit(), but maybe
> realloc_to_fit(). If shrink_to_fit() will just end up calling realloc_to_fit()
> that's fine.

`realloc_to_fit()` is fine with me.

>> +        let (buf, len, _cap) = self.into_raw_parts();
>> +        let slice = ptr::slice_from_raw_parts_mut(buf, len);
>> +
>> +        // SAFETY:
>> +        // - `slice` has been allocated with `A`
>> +        // - `slice` is suitably aligned
>> +        // - `slice` has an exact length of `len`
>> +        // - all elements within `slice` are initialized values of `T`
>> +        // - `len` does not exceed `isize::MAX`
>> +        // - `slice` was allocated for `Layout::for_value::<[T]>()`
>
> Thanks for adding this! Mind also sending a fix for Box::from_raw() which lacks
> the safety requirement?

Sure.

You want me to carry the patch in this series, or should I resend it separately?

Thanks
David

>> +        Ok(unsafe { Box::from_raw(slice) })
>> +    }
>>  }
>
> [1] https://lore.kernel.org/all/20260326095621.846840-1-david@readahead.eu/
