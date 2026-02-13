Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431493563C5;
	Fri, 13 Feb 2026 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993361; cv=none; b=Pdlpe6rlP2OQ+qhFrjSKYOrBjy08CTVX/QaIm5M96zi0/nyvSGQhoEA4SQQMSxUTRzZfSm+Vbw8eMFe0LFj4qiu5HpeWjtLj4hVAUcIG49kCIkwtVIeStwgRCsLn2QIre3frHl6BUk2awAoKQOK6VZBlqId36VyvNOdXXUJWDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993361; c=relaxed/simple;
	bh=U9APHk/mfy8Zp6K4nwH+yeZL8dVixXGuKNivooijtDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+G17PnlzU7Jcz389bBdMevkbsxEgbG7D62YXlGeyBDVYvuVlEn56EcjXGvsTSubDSy7oKa5fPYlB+iB/C3tLpwAdpoiwxr5HgS1YahkkJrh8j6aLZVzs+LLFn9NEWJYbgxOiLattuEvQZIqANI3f2HWFuSEjtFeF2SPlD90XNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SpgTSiou; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SpgTSiou"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NK+YgypWNu/fcoY8YLKG/o15be3Fp0W5wYo+Y4JNt2g=; b=SpgTSiou05sIQdsCcM8qJvwzLL
	YJ1gnl1i2b4HvgbsVmqUAf5wfX9B2ezKbQLOf3SEXOTjknPqdeKLAvm0uIRDX1ugN+8j4gvhDCbJJ
	C9K+bDlTg/iB3RrK+sObRnjxdn3eYnqQD36aUcQd/AQmxZz7qVfYNvjBMrpY1zZyiGeDykScXy6YO
	TcnMrmOlkfGDygHoeJELEx/emxZerUN3UJTkknEF7YnU5+/CGRYjowIVDnL8sOnOZ0ojZZBME0vSG
	5pTjO9AwOMDcfG2DQJjamxgsiKy4tZ6db2R37vXBeFK4rwH3Re+c1jgYNWLwPpHP3FJEo6X2LCXm9
	UC2t1aIw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquGu-0000000FqYz-1OEh;
	Fri, 13 Feb 2026 14:35:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A61CD300969; Fri, 13 Feb 2026 15:35:51 +0100 (CET)
Date: Fri, 13 Feb 2026 15:35:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260213143551.GW2995752@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <MJX-TLnHWp9yJ9t7suTC8ExghroIz2g2epZG9Rmp6l-9W7BylahrPTqXQBI3D0EUah4xdEt3UXh6ROBa4LdEDw==@protonmail.internalid>
 <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
 <87a4xcu80n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4xcu80n.fsf@kernel.org>

On Fri, Feb 13, 2026 at 01:45:28PM +0100, Andreas Hindborg wrote:

> > And same comment as for v2, none of this makes sense. Byte loads are not
> > magically atomic. And they don't actually fix anything.
> 
> I am curious about on what architectures byte loads can tear?

That's not the point. It's just a byte load, not an atomic byte load.

Unless you're thinking of using load-exclusive or something along those
lines; but that would be completely insane, nor actually solve the
problem.
