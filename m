Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A793A59BA;
	Mon, 10 Aug 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354221; cv=none; b=cYd61ALBK++T+sktE9FHMyGUi/e9veUQ4cEJdwcnvUK9UTNjjZ0LPxXUPgLrfWmcNteez5JEyn9YUfl+IIxZwwvgOkkum7oqbbenerqyq5WRGCttwzf8Islfxi/EPouDBNxzzX0OXFTCcd5sDz5+vRObumLysQhp2ESbrNhozdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354221; c=relaxed/simple;
	bh=oJ1yWHrIjA9cdMYTk9qMg5xUu1hvvhxATqm8cMwdX+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQgKkhNMD6gI7nDDqq0nA53jmQjueJSd8r3Myr6csSPMT7DC0c4Wvb39cd6fcUUJ1kh0pOGNX3UNIojw/g7gm0BIhy2AY2Tgrk3OlgUWU8afli4p5+jKRlFgZGbLzWJZb0Syx1P+vtI0Q5WZOeIc9M1ALicOLffZm0qZyuythCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uA5Hfkyx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uA5Hfkyx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7z4Zlti3rBPasHah8K7wv7L6B/h8Je5q3CKA4TbLo9Q=; b=uA5Hfkyx5pmXkVRh+V5k1yVPE4
	wPz5n5vdHWChdNFd0M7rhRsf1rTc/r7FLjQx56H3f12K7XbACH/0LL0lFpOJYpmMCK4EFhehovCQF
	FxkkRM8oNy53coPT+RXMX04ECzDGqwQO9keEarkn4GqO4YbDIscanFJXEbuXniWyk9oA33r3sSvyQ
	CXYZpkikmUuAGw92x6qjn8ySnmLOC42kCMVH9tc6aEpa9Bn6rBL7BBnTDTVj2T0Ipzc2P5pH0kggR
	qa/9OhCngL1DLYPfDU+iR5cvqlisAQOD9V/HkICAR6uzocTsfnyD1Ij9Xn4E8c/aYxcrqrna4rrwk
	fpgL7D3w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMKi-0000000Aj76-2iPQ;
	Mon, 10 Aug 2026 09:30:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D25093030AD; Mon, 10 Aug 2026 11:30:06 +0200 (CEST)
Date: Mon, 10 Aug 2026 11:30:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v5 00/18] Refcounted interrupt disable and SpinLockIrq
 for Rust
Message-ID: <20260810093006.GN49529@noisy.programming.kicks-ass.net>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260810085355.GM49529@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810085355.GM49529@noisy.programming.kicks-ass.net>

On Mon, Aug 10, 2026 at 10:53:55AM +0200, Peter Zijlstra wrote:
> On Mon, Aug 10, 2026 at 10:52:55AM +0200, Peter Zijlstra wrote:
> > On Fri, Aug 07, 2026 at 12:01:57AM -0700, Boqun Feng wrote:
> > 
> > > * Added underflow/overflow checking for interrupt disabling counter as
> > >   suggested by Shrikanth.
> > > * Added a max nesting level per suggestion from Shrikanth.
> > > * Document/comment updates.
> > 
> > Can I get those as separate patches? I had already queued and tested the
> > previous version.
> > 
> > (although as it turns out, I lost one SoB fixup somehow, so I'm applying
> > them again with just that Changelog ammended)
> 
> I'll grab the rust patches from this set I suppose. I had not yet looked
> at those, since I don't normally build rust crud and I need to figure
> out how to do that again :-(

So on tip/master + tip/locking/core (its fresh, so not in master yet).

I have debian experimental rustc, which is build against clang-23, so I
do:

$ make O=defconfig-build/ LLVM=-23 defconfig rust.config
$ make O=defconfig-build/ LLVM=-23 -j64

and that gets me a wild amount of build fail :/

error[E0560]: struct `blk_mq_tag_set` has no field named `ops`
  --> ../rust/kernel/block/mq/tag_set.rs:46:21
   |
46 |                     ops: OperationsVTable::<T>::build(),
   |                     ^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`

error[E0560]: struct `blk_mq_tag_set` has no field named `nr_hw_queues`
  --> ../rust/kernel/block/mq/tag_set.rs:47:21
   |
47 |                     nr_hw_queues,
   |                     ^^^^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`

... this goes on for a fair while.


And this is *before* I've applied any of the rust patches from this
series.

Why can't stuff just ever work :-(
