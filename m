Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DA33D6D2;
	Mon,  3 Aug 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748268; cv=none; b=GLURPedjv9SppCXR9kOvYS603E3Aq+i6b09qeC+RAtJp/0MpH3cKaMONgi5DmzqNxYEjAm3SaC/V6JlPuOQsHwCQ6mWQsBmspyjpqzQhEl/KciiqBy+briw3oSVEqC9RU/okEYaLbMSbFdNg2hNXX7swW+D52ocpKWUTn+p//I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748268; c=relaxed/simple;
	bh=snc0fEdD3O8NdWrb0toxRRjGXrAbKZnU383JRtQOd7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMDjBl9ttYhRrADAI9KRdVIOg6xobHQ2p48BWaFvsNnTMk05tYcaT/KammdQM8yNL3w1YzGJ0ZBmRcifkfgWLg495ibMvErD3bbBnN9ggp7IsmmihE4s5DzY8tVraT56xJE7I49EzRGhYDslUmjFIoc0BZMrDTC8RK0ipDPXdb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jS4hHyxp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jS4hHyxp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pEDkYYzctgHlL/8xCHkHkE3IAOcmuqj6+RSqVmeiJow=; b=jS4hHyxpjAQAPFpvBFGnyFihyY
	RAp3LVwN1mmpEaQSqFndnjdm29tcMBisQdYuVpGGtP70b406nBwWle8jGlxptOhpMxqCFWmWTiY3D
	gQHs4XbcDNTJlVXApVCvLiYCS6SXLBHi/3H8yWFlIhRaTmoCveK1Ddy+HgmEQP8ZaKIc6184v612k
	l5MFy/vmKzeF4FE5u4GP/zMV7SlymK9jxcvTEvyb4pFV3lQ+WeLOeNvJldPYiPg17TuyyFPmYSnPo
	RnLNJsm1a4TRjE/rSy2I4R28cCrVQLzvutdSL+VQkIiGJYf2cz2bmhTy1hpFbIdIDwqUICn7Xlt0h
	heesnT0Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqohF-00000008puV-4BOr;
	Mon, 03 Aug 2026 09:10:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 944A23012AB; Mon, 03 Aug 2026 11:10:56 +0200 (CEST)
Date: Mon, 3 Aug 2026 11:10:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 02/24] preempt: Introduce HARDIRQ_DISABLE_BITS
Message-ID: <20260803091056.GB49951@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-3-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-3-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:03PM -0700, Boqun Feng wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 
> In order to support preempt_disable()-like interrupt disabling, that is,
> using part of preempt_count() to track interrupt disabling nested level,
> change the preempt_count() layout to contain 8-bit HARDIRQ_DISABLE
> count.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> Link: https://patch.msgid.link/20260121223933.1568682-2-lyude@redhat.com

This is not a valid SoB chain.
