Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2920E3164A9;
	Tue, 17 Feb 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321525; cv=none; b=gEaXUv35WtItAFn+7c/9ZOy73AQStGsZeAJEa2fYSR8Jb43ft+Fv6O88PFTH/LMnOaxgSSsgxFMnClLzrHPa+n9xm3u0sbXQMVrk6Ow8HFkXR5c4/lib0jKyLCouRXP+00UiDeWe66MHUj8qzjXsbVbVGYj74Q+auPqLZmKxnoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321525; c=relaxed/simple;
	bh=KMOj0kXaaJ7XQlo88qNIOCWTG497ErL0i+WyEix5Uzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br4+djMiP/PxAVoS27LNAAQldUTWj3Mr59wKiybClJBg6EtX88Zg2BI/UlT5cq3xxwB8VzzAWfk8d+I+ceSt2kLyh5GqiTvHCAWWzoVnalSM6IEJh422T3uxg57sci4NNRi0ln3fMWVNjSYNMbA3R2cnclIMMvSzPfUkSWyjtLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vfzdEU8P; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vfzdEU8P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xMgRdiAJqb3usCRSJ8lylhuVSY2ZK9m0DpJKEZWPmIo=; b=vfzdEU8PS31YLqCBPPTsHJKK6M
	Bu2Aofe2rrCYLrsMhtOAqEHczqxe7Uz5Cvtfe+RbqNdNUEY5oF35CfDenGMxMwUP+pKT4U44q7ks+
	eeMq/TdZAd6W6g7FApjOV71LMTLvBRRMqeYQiCqvhNI4vrmp5R7FG0wIbfRzuPtITLQIn2FyBo+lT
	BzmjmiiFOvEg39fwySDUix3tCYxaeq82I0qSJHITsZCmiJCbkdfrEIfC2Nf9kw03brqHIG3KODg14
	a2YrqiE04fHzgZXffdN7VAwlWi5pSI0eufTeiotNfINjXXmwJjXuwg697TeAcRADOJBoSy185DLvG
	f5fyFHpw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHds-00000004Evt-1Xf8;
	Tue, 17 Feb 2026 09:45:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3A261300CDE; Tue, 17 Feb 2026 10:45:15 +0100 (CET)
Date: Tue, 17 Feb 2026 10:45:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
References: <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZQ19FEeGgigdwz9@google.com>

On Tue, Feb 17, 2026 at 09:33:40AM +0000, Alice Ryhl wrote:
> On Tue, Feb 17, 2026 at 10:13:48AM +0100, Peter Zijlstra wrote:
> > On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> > > Well, in standard C, technically memcpy() has the same problem as Rust's
> > > `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> > > are vulnerable to data races. Our in-kernel memcpy() on the other hand
> > > doesn't have this problem. Why? Because it's volatile byte-wise atomic
> > > per the implementation.
> > 
> > Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
> > byte-wise.
> 
> movq is a valid implementation of 8 byte-wise copies.
> 
> > Also, not a single atomic operation in sight.
> 
> Relaxed atomics are just mov ops.

They are not atomics at all.

Somewhere along the line 'atomic' seems to have lost any and all meaning
:-(

It must be this C committee and their weasel speak for fear of reality
that has infected everyone or somesuch.

Anyway, all you really want is a normal memcpy and somehow Rust cannot
provide? WTF?!
