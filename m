Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75D344D8C;
	Thu,  6 Aug 2026 05:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995550; cv=none; b=sMDnjq9UakE79TnOlFDWQQBbXt7Iwkv8HtDgR+odaWdTh5GekYkGQUcSh5G+jOJOjpOZqm4LQi4A0Jh7IIphyRzl2kD6wD7YEEoSZfph0bLI8etcDCDn9m0EntmhP2ofbO39gTDQ+xJ8W9msBQLMJ2IRwkvMJ3YjFNJv33XRy5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995550; c=relaxed/simple;
	bh=B4Q49MV2oxYDlIScKgtBHV01axw+STZVEGPu9VuN4XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL+5giJXVvRcUz9n4pDVUMTQImEfUFLeat4Kqxi1V0HTPev60laIk0yRsIW/8No/EfoqCn05yt/ItdAzPCkddBTeVLIqEhHw6NmAC1Vcsgq0phxxCzYKeO6VVEvAEOkLzfeje0XOnZiX/r7MfB2IhoUg66KiFZ0sGmMDq9xLpi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIfyyRDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIfyyRDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F341F000E9;
	Thu,  6 Aug 2026 05:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785995549;
	bh=554sNPfuHcR1Bkq2y9SrgHxmggPTwv4NEYX575dvhdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GIfyyRDjCOOoMGRG4WgFrH0hTiYXek1GG9sebLVO8ijTWltfqIp5L2zDXD3XeyAZ4
	 T6kkYkqA4j7xPJUqV5XNTFswarCjw0xhiRWrzvb3lH52Uwt8gwj8m+1nMFZ57BJIYX
	 NAJ1eHfcV1MBFnvnamg9H5KbAyc+0wn5yB2YJyl7+6zNeQhEVaLNSSVTPlK87tWpSy
	 FK64mVrmPHilh29HWSXb1qs6tVbwL/nZTsoUm3B9sTC67uNXQVJNhucih3Zv1DyvLL
	 O4JnAiZCrcOFfe4Q6SZ79xTstgvfD5FHFRPXb79mnQR5QXDTWrBlzR1Zmp8EAp1oGr
	 Wuhb73QFn5diw==
Date: Thu, 6 Aug 2026 05:52:26 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: rust compile failure in next-20260730
Message-ID: <anQftbfg8EWMmxZc@dev>
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162>
 <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
 <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
 <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org>
 <DKG2TQ94TGLB.3EO7ZNVKB50KY@garyguo.net>
 <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>

On Tue, Aug 04, 2026 at 12:35:42PM +0200, Vlastimil Babka (SUSE) wrote:
> On 8/4/26 12:10, Gary Guo wrote:
> > On Mon Aug 3, 2026 at 10:04 PM BST, Vlastimil Babka (SUSE) wrote:
> >> On 8/3/26 17:32, Gary Guo wrote:
> >>> On Mon Aug 3, 2026 at 4:10 PM BST, Vlastimil Babka (SUSE) wrote:
> >>>> On 8/3/26 16:23, Boqun Feng wrote:
> >>>>> On Mon, Aug 03, 2026 at 02:57:49PM +0100, Gary Guo wrote:
> >>>>>> 
> >>>>>> We could also unconditionally use `kvfree_rcu_head` here, and
> >>>>>> add
> >>>>>> 
> >>>>>>     #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
> >>>>>>     pub type kvfree_rcu_head = callback_head;
> >>>>>> 
> >>>>>> to bindings.rs?
> >>>>>> 
> >>>>> 
> >>>>> This option is currently not maintainable unless it becomes a
> >>>>> maintainer-aware way to handle things like this.
> >>>>> 
> >>>>>> (Or even better, changing `#define` to `typedef` so bindgen takes care of
> >>>>>> everything).
> >>>>>> 
> >>>>> 
> >>>>> Yes, this is better IMO, but it's up to slab maintainers. :-)
> >>>>
> >>>> Can you elaborate a bit please, how would that look like?
> >>> 
> >>> I was thinking of doing `typedef struct rcu_head kvfree_rcu_head;` but of course
> >>> that didn't work because you can't use typedef to create `kvfree_rcu_head` :)
> >>> 
> >>> However, something like this could work?
> >>> 
> >>>     #ifdef CONFIG_KVFREE_RCU_BATCHED
> >>>     ...
> >>>     #else
> >>>     struct kvfree_rcu_head {
> >>>         struct rcu_head head;
> >>>     };
> >>>     #endif
> >>> 
> >>> and everywhere add a cast everywhere that expects kvfree_rcu_head == rcu_head.
> >>> 
> >>> but this would indeed be more complex :(
> >>
> >> So you mean like this? Doesn't seem so complex and seems to compile here
> >> with CONFIG_KVFREE_RCU_BATCHED both disabled and enabled.
> > 
> > I thought that a lot more places have to be updated, but it looks from your diff
> > below that this is simple enough.
> 
> Thanks. The slab/for-next branch now includes the slab changes.

The slab changes looks good to me, thanks!

-- 
Cheers,
Harry / Hyeonggon
