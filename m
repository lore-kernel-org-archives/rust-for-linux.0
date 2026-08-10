Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A23A960E;
	Mon, 10 Aug 2026 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359014; cv=none; b=FHqN7wWtSZlrphdLEd4i5uPfq5fBbT0wqqbuRr0/gceUaDekvpBfyt+M80h2xvfOWSgMU3imlFrQN8Y1XcTV1zwvqq8j8iNx4gqJe/7v+vyRKA46BUrnDAGKJkyQkSL/5E/6Ta62OVnz3v2nCAiNZtYTPlho6V3b2DV+Mqi/+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359014; c=relaxed/simple;
	bh=q/oV+KaqXEmBLdYAgtQqKeiuLjoznzBw6ID8vrBojyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdRcENveWIGj5ilpaOspirICq04vdAjegHz4ceOjqGpEx2aVftNwaV09DxH+XI/OpjS6hIMN1EiG0w5sw1SaG8K9uGW36tSPYQXhzImTdXYWPgXaTsaApwUWsTudNH7//Pcr/EnkYYczhZiy71sZLkefiEqy4PTmEmaaBAbDP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OE0/9IeV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OE0/9IeV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4MEY1k5kU9DnvojypAXcei+M4KcFovFmu/+tWbKQork=; b=OE0/9IeV+wmPHjNVzXUVFpk2BP
	i6T3ILRbXa2rdyKuQHLXQxFSUrvRsP+88wHpuFPPePt4MOFHKgB+fUtEbl1QL8r5VLbWem9p5SmE9
	qdHIrT4euzbi/ofjBJywkFH18eTc6ssxxYjjv61utIiJH4gjkCxlsfFV6O/z+eLkLRQJadF8lQLuc
	3nydIGH35+PXYZuih2ESiMRg5p7Hy0A7ZHtfU6c4EkvXzg8mOl4YBWcdl4/BRhjXp72ZGqZoE4hoc
	4KXIiV/qjD42d7o30np+j+JHlTQ/T58IplcL7hcD1MB3dn5mlCZ5h7YQdsLY+xr2c1CSI/3rZLN6M
	NEpsVDTA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNZO-0000000AqQd-30nn;
	Mon, 10 Aug 2026 10:49:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0507E303111; Mon, 10 Aug 2026 12:49:23 +0200 (CEST)
Date: Mon, 10 Aug 2026 12:49:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
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
Message-ID: <20260810104922.GI1642880@noisy.programming.kicks-ass.net>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260810085355.GM49529@noisy.programming.kicks-ass.net>
 <20260810093006.GN49529@noisy.programming.kicks-ass.net>
 <DKL760LRQDG3.2HMCBRNTECXYD@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKL760LRQDG3.2HMCBRNTECXYD@garyguo.net>

On Mon, Aug 10, 2026 at 11:38:17AM +0100, Gary Guo wrote:
> On Mon Aug 10, 2026 at 10:30 AM BST, Peter Zijlstra wrote:
> > On Mon, Aug 10, 2026 at 10:53:55AM +0200, Peter Zijlstra wrote:
> >> On Mon, Aug 10, 2026 at 10:52:55AM +0200, Peter Zijlstra wrote:
> >> > On Fri, Aug 07, 2026 at 12:01:57AM -0700, Boqun Feng wrote:
> >> > 
> >> > > * Added underflow/overflow checking for interrupt disabling counter as
> >> > >   suggested by Shrikanth.
> >> > > * Added a max nesting level per suggestion from Shrikanth.
> >> > > * Document/comment updates.
> >> > 
> >> > Can I get those as separate patches? I had already queued and tested the
> >> > previous version.
> >> > 
> >> > (although as it turns out, I lost one SoB fixup somehow, so I'm applying
> >> > them again with just that Changelog ammended)
> >> 
> >> I'll grab the rust patches from this set I suppose. I had not yet looked
> >> at those, since I don't normally build rust crud and I need to figure
> >> out how to do that again :-(
> >
> > So on tip/master + tip/locking/core (its fresh, so not in master yet).
> >
> > I have debian experimental rustc, which is build against clang-23, so I
> > do:
> >
> > $ make O=defconfig-build/ LLVM=-23 defconfig rust.config
> > $ make O=defconfig-build/ LLVM=-23 -j64
> >
> > and that gets me a wild amount of build fail :/
> >
> > error[E0560]: struct `blk_mq_tag_set` has no field named `ops`
> >   --> ../rust/kernel/block/mq/tag_set.rs:46:21
> >    |
> > 46 |                     ops: OperationsVTable::<T>::build(),
> >    |                     ^^^ `blk_mq_tag_set` does not have this field
> >    |
> >    = note: available fields are: `_address`
> >
> > error[E0560]: struct `blk_mq_tag_set` has no field named `nr_hw_queues`
> >   --> ../rust/kernel/block/mq/tag_set.rs:47:21
> >    |
> > 47 |                     nr_hw_queues,
> >    |                     ^^^^^^^^^^^^ `blk_mq_tag_set` does not have this field
> >    |
> >    = note: available fields are: `_address`
> >
> > ... this goes on for a fair while.
> 
> There was a change in clang 22 that breaks bindgen. You'd need the latest
> bindgen, see
> https://lore.kernel.org/rust-for-linux/CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com/.
> 
> If you're using debian unstable clang/rustc then you should also get bindgen
> from there too. Debian sid has the bindgen version that works with latest clang.

I 'upgraded' to bindgen/unstable, and found that Kbuild does not have a
dependency on the bindgen version so it didn't rebuild and insta
exploded with the same fails. A make clean fixed that.

Build seems happier now. Let me go apply these here locking patches.
