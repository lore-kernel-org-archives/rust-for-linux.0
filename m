Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759133ECBCB;
	Wed,  4 Feb 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210049; cv=none; b=tKmF0JyUar2ctO3KLYkmznMYqF1LS53KaVYQWMDnsOha2gZIlj2Sk+0ImsRnXhK+6/88tyPz30cFCyi+/CmCX0iDhw2VVKazX47yXoZqLkrGkRRhzQTV7/pPBJrGha8Y0FBEAKlSPP5saSTAazITIsXTNJZyHo5bLWZ7vC6iuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210049; c=relaxed/simple;
	bh=OyOuC6Yzj5lVusqEOT98nkDyezVQYt+krgKJDM9W2KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh6uv6Gvy+03tkf+ndO6c8FD4jlU0cjDuXAHPhnvMpAUbyKl++frNv8phD8kwW32ajzTOoUHsrmbxD+x1yOHEzScoThQtYUq8f9B1dPc9ESBfloAa74KYjWTT9jrOuaogWEVJdi6o+rcp4AcZohOHegyTfuqp+YSgNV9BS7gbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XuL5XZ9b; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XuL5XZ9b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z0nLVhSZZTw6JPIJc5KbjLPmcF9tsNisnhVbqYZoc04=; b=XuL5XZ9bOuukjWbVAsrYt26yzM
	k5/ZKmLJrIFNtwPLoo5rctW0YElqkppkZhbPzMfITyOTSxogNqD28LQRsU7UaNlcyWwmVvtQ5YyRf
	H3S9XvKHZ9tkGp0d3tXGH0DVixUcz9+apSL23Lb3Ig2Ia2NfwDPaEZeiyFEpKDXfbxxL+qocGBJLt
	hgQPdKKRVTroH/Mv6l99CsIvV/8ErmzZGZ29PlTewROOmMmz4EiYB8n6valb/dC0tetMWv6Na6n0W
	CtjFiRnmdAGsk1nWeBEqaNvJa67l/sTtbcv45FyxEqxNVkRN7i7UR/y8Z+MFEPE633++lmKRODWfE
	2WK/TdbQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncUf-0000000264S-0Hvn;
	Wed, 04 Feb 2026 13:00:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CC722300E8B; Wed, 04 Feb 2026 14:00:27 +0100 (CET)
Date: Wed, 4 Feb 2026 14:00:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <20260204130027.GE3016024@noisy.programming.kicks-ass.net>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <DG66HSCEA3XP.36DNV6A9HRNOK@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG66HSCEA3XP.36DNV6A9HRNOK@garyguo.net>

On Wed, Feb 04, 2026 at 12:32:45PM +0000, Gary Guo wrote:
> On Wed Feb 4, 2026 at 11:12 AM GMT, Peter Zijlstra wrote:
> > On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
> >> But I'm really somewhat sad that 64bit can't do better than this.
> >
> > Here, the below builds and boots (albeit with warnings because printf
> > format crap sucks).
> 
> Hi Peter,
> 
> I am not sure if it's worth the complexity to do this for the NMI code path.
> I don't think NMI code path is hot enough that this is necessary?

Perf uses NMI. Also, the 64bit code is actually simpler.
