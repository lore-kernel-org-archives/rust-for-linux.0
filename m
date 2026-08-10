Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9F39FCDC;
	Mon, 10 Aug 2026 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352047; cv=none; b=Jgd0vQPoJbL/y1ZOOogmXmLvpxXWLPiXsh6OF3WvtRsZdAQUo7/XU5dde9V2eFr7F/c2G0LTYnUOHPjElj0TJO0MHuZd/O/MtsJuaFvVh4mt7CFe/+71ese81Oh5ZG3Uyg3mUR7nSYmGzi37iavDMpHXEfSS1HMXO4JL/y2hS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352047; c=relaxed/simple;
	bh=XQ4R6JaoVzsEPJQHHPufPxFATr2zt+DSLuLR2Rl+MrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERdpkff2BtGaiNcse6rntcBXHQfzRGMhgA6giUXO0T+v5GKifDyJSWLdvj4utBNnTP7k3llhFkpc7S60gnCdz4tZic5saLyLXaXUCVkXUFwxfNhNMG9NHtFvDOXzwRQuYRaAWVWrnbZGPnDlfrdmQDsUKTy0+fRYHc72Cve/yj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FfwPvLVY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FfwPvLVY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7y06gWolS4NkYkqAycx28z+RNBitMicU4e6cMK/EPus=; b=FfwPvLVYuIUPFfTz4igY6qPoOG
	SHpgYIIddI1tvVusk0T5VCi2C8gxMe9AI1fYv7ycgOtgmCNNLHNB6D4GRCDzBV2t/TPF/I/Qh3T6O
	NY7OdeOEAUKmjkq1PwO+HwPwfhSa+jjPniz07hVPSUYaV9NGsAqf253IJyRAROo+vg3VTfocCBBrm
	BGmfF+WkHnuFpsEJt8plvf05m/nnh5mPp68RS0c+cDYkYfETtotcVn+X7lHTWHA6YK4VkaJERjQzj
	WexghbAoik7+avPyDh32nV6F88H5BjVr4+LyxI0ytpUEJ/O/Zgrig3aPoTBbSFCSUCc69L1HCxo1p
	JEj/bh+g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtLle-0000000Ddrp-00eM;
	Mon, 10 Aug 2026 08:53:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A498B3030AD; Mon, 10 Aug 2026 10:53:55 +0200 (CEST)
Date: Mon, 10 Aug 2026 10:53:55 +0200
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
Message-ID: <20260810085355.GM49529@noisy.programming.kicks-ass.net>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>

On Mon, Aug 10, 2026 at 10:52:55AM +0200, Peter Zijlstra wrote:
> On Fri, Aug 07, 2026 at 12:01:57AM -0700, Boqun Feng wrote:
> 
> > * Added underflow/overflow checking for interrupt disabling counter as
> >   suggested by Shrikanth.
> > * Added a max nesting level per suggestion from Shrikanth.
> > * Document/comment updates.
> 
> Can I get those as separate patches? I had already queued and tested the
> previous version.
> 
> (although as it turns out, I lost one SoB fixup somehow, so I'm applying
> them again with just that Changelog ammended)

I'll grab the rust patches from this set I suppose. I had not yet looked
at those, since I don't normally build rust crud and I need to figure
out how to do that again :-(
