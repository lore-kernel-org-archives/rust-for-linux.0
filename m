Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A54A32;
	Tue, 17 Feb 2026 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344304; cv=none; b=cv9u7PZaifW0lBAHe+5dcxoBN8BVZex8U/k5ID10GwZvN1L4m+qa1rHkpKn2Sc5R3FADHN8BgjK9vbGbA501IoTX2sHXldUeoujl61i8lHx+tS7MtRGyaM68goaeQpKEE1kfHLYpP2wvbDGgn41yXXCwa7m53lKw/f3djRG9v+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344304; c=relaxed/simple;
	bh=C0X8fipbNQc7BJC76PKoPGVYAk6eQwXryX73Hrm6R4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbxUXxU1Bt5Ev6GJVHXjTyRVYdiw22x3jW8oU1y+NVazcjQoZgAsjS3Ehr9GyN1ukmhlu5Lt10RcSpH2FbjYX2FKEP/6ojf3xmZjy+KVEF/2GGNKV9Lsxi9Drmp0XynWZnJqZUdQ70q5QGV3tbH6RZzui8YrALTC1E6lsO4M0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R8wMBAJp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R8wMBAJp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+IdFW9z5sPzmCexebRSE2HsXqwv2gmAkUgD70T1ufAA=; b=R8wMBAJpLxB+84Dkt3GVtwn69Y
	OqOrWj8eJgW66DOV8ZsribtgtEX4Z9nCXd2RuWctYDZr8VLW8ObtNy0og4dQ4/1/lKBaUyjpt6R7o
	OpXLYUcmTn/2oF8l7pwVkEoZnOg4IRrh7P8OidYRoWLvHiYAQXpZ4VPF3nwBC3CGT5lTgRzYXuZfP
	bBGLUVUS8gxFUFUGBgUUWoE9uGomFvVPuDlSvWgxBBWzeWiyiuILJQNsJqRQc3/YeEgZAlAnynA23
	eBpKjmEgWe5l+3ClIBIKjd4mG/C6AUxY472ogaxeB9PNR36sAt0bnu9WFyCqio+U6VWpmffM24QVF
	pUoy1c7w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNZF-0000000G8nI-1cec;
	Tue, 17 Feb 2026 16:04:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F2A4D300CDE; Tue, 17 Feb 2026 17:04:51 +0100 (CET)
Date: Tue, 17 Feb 2026 17:04:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
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
Message-ID: <20260217160451.GA2995752@noisy.programming.kicks-ass.net>
References: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <kkmXYWYC07oImDD0FJFVCCWl45alQdraRLHoLr7zowZfE0tMz0MmPIpuyEYQRSLjBQqrp_Ch0iR2Rix_g49lNg==@protonmail.internalid>
 <aZRWOIPThLfIZ1Ph@google.com>
 <87ecmjcw2v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecmjcw2v.fsf@kernel.org>

On Tue, Feb 17, 2026 at 02:56:40PM +0100, Andreas Hindborg wrote:

> I'm processing disk IO in the Rust null block driver. The pages backing
> the IO requests may be simultaneously mapped to user space, so there is
> no way to guarantee that there is no concurrent memory operation to/from
> the memory area. User space programs can do whatever.
> 
> I don't have any control flow depending on the data I copy. I just store
> it somewhere and return it if a read IO for the same sector arrive.

Right, so IIRC the old DIO code used to have this problem. We'd end up
writing whatever random state to disk if you did DIO of an mmap().

And if IIRC the current state of things is better in that we ensure the
mapping becomes RO and we have writes fault and wait until the writeback
is complete, ensuring things are somewhat more consistent.

But you'd better ask Jens or someone that has looked at the various IO
paths in the past 10 years or so :-)

> Let me add a bit of context as to why I sent this patch. I am not an
> expert on the finer details of this subject, so I rely on available
> expertise in our community. It is my understanding that copying the
> memory in the situation outlined above, without special consideration
> (in Rust) would be undefined behavior. Such are the rules of the
> language. Of course I don't want undefined behavior in the Rust null
> block driver. When asked how to solve this, the experts suggested
> defining this byte-wise atomic memory copy function, A function that
> would have well defined behavior in this particular situation.

Yeah, so being a C programmer, stepping in UB and tearing up the spec is
what you do on the daily. Its called reality :-)

In reality it is *really* hard to have memcpy() not be sane. And if the
Rust spec doesn't outlaw out-of-thin-air, then the Rust spec is wrong.
It really is that simple.

> That seems like a reasonable course of action to me. I don't understand
> why this is such a big deal, and I don't understand the need to use
> aggressive language and swearing.

Feh, there hardly was any o that :-) Call it cultural differences and
show how inclusive you are by being open to how other people have
different norms, whahaha :-)

I've heard it said that in Scottish 'fucking' is the mere announcement
of a noun.

> I would suggest that if we are failing to understand each other, or if
> we are miscommunicating, let's be curious instead of angry. It get's us
> to where we want to be, way faster. And it is a much more pleasant
> journey.

/me mumbles something and quickly drops the mic before the PC police get
here...
