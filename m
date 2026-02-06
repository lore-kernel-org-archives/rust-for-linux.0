Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67934CFA7;
	Fri,  6 Feb 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770367393; cv=none; b=I1ky231ZaRcLOEqMBt06njE+0v2NphgQ+6MqO3WT92+zYhIqvN/xB1jd5cUEwBBEY5pBBJbmk5mqJjMsNBjrUF2h7A6i4LKqUxzUvzbVs/J4uJrFrTO2OKnTsgWHCaCTXGhI6HzpcaFZYPeCcQMX1lQt0JNt6hCorlMvaH/PjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770367393; c=relaxed/simple;
	bh=aVkVFbpBHuweFBR+QK/0GwjGenduai58ydNn8RqFKHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsU/2wU7AZq0+DmuwdiaU850teoGukOyKDHYT3XKIJ6JUOHy2PH7eNLzDZo8Ioq5XImoyljL/r8kFDgSkvkd+8tdNOyncvQz65EY2X0RzIoCx6Lkusix8Whmpv4siAa8pbjYBEAQSrUYLN5j5OZQ937fcNhc1UHsZ7d8PFk4BQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l83W0Gp4; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l83W0Gp4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VpPg21vAhreDcZaU+61r4auXUZvlgqN6fCq719sJ/UU=; b=l83W0Gp4ZLavHeHFBLB6++hquS
	Vpcmnncfe9xQ2T0hd6gmZD2RUnEurDqtBw4jhQndWUq0upw/th0/bx4cXOdok/3TsC0Yc3UDOLMll
	uKEhvamNbIlERr53XsVYzaiqE6tifwGkHH5eW4Rv1Rwg8woyEH41qyWStRikH3xlmpCAR5s1KY5v/
	xztLKRhKLgfhFxZybwNE0Vcd5hru5c3x0/2S59rUGIGQsO7WxKKQaQRy+RjCKkoaHoUKqRdnLzZL2
	HyFVArUF/oB1UY8INyMHSR7bKZosKs7lH9y+v1yFm/ea/uMvfTMXp/3fkGdJBNM1t5TqT2tVmIt1D
	R0ZKZzzg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHQa-00000004uWd-1gtO;
	Fri, 06 Feb 2026 08:43:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 146C5302DA9; Fri, 06 Feb 2026 09:42:58 +0100 (CET)
Date: Fri, 6 Feb 2026 09:42:58 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <20260206084258.GO1282955@noisy.programming.kicks-ass.net>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUOME2XV_ZmRk3F@tardis.local>
 <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
 <44507281-87bc-4548-b542-addf3477921c@nvidia.com>
 <aYVAYq1oM78glL7w@tardis.local>
 <52c1f833-0967-4692-8275-6d448a104350@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52c1f833-0967-4692-8275-6d448a104350@nvidia.com>

On Thu, Feb 05, 2026 at 08:24:40PM -0500, Joel Fernandes wrote:

> > I guess Peter was trying to say it's not a slow path if you consider
> > perf event interrupts on x86? [1]
> 
> How are we handling this performance issue then on 32-bit x86 architecture with
> perf? Or are we saying we don't care about performance on 32-bit?

Yeah, in general I don't consider any 32bit architecture performance
critical at this point. Its pure legacy code, to be removed at some
point.

To x86_32 in particular, we make it limp along. It sorta builds and
sorta boots but meh. It doesn't even have most of the speculation fixes.
You really, as in *REALLY* should not be running a x86_32 kernel.

I mean, if you still want to run Linux on your museum grade Pentium-II
processor, don't let me stop you. Just don't expect miracles.
