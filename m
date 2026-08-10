Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0C37DAAD;
	Mon, 10 Aug 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351990; cv=none; b=qTQXTUy+z4p07WcowV8qeYFnp/uQXlzI9vWBDYIh35HcTSnkX01RmfZBoONjJd2AgVBNiXZPnteegvmp/c7XM2XO7Mi30003bN8W4uvfHB+OiF7qe4mEffV3OfXl2OlWvHJ78pUnY1iyNwrVWNC1Ef9UgwLvyaMZKk3idR4RP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351990; c=relaxed/simple;
	bh=Qlgdm2u89mALdgfm0+lc0juGnI/qnSvoFs9Tk+6andM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uw2xKzYWyxkxjUttA+v1wTXZAAzxWY5UvHzlJzglY8x/hd5VskZ80UCTDanqc67d9izsSUtg829j7Bp7Wfze1dgGJkmfEG65wXHG8VdESH2mvi+ggRfY+nKY0pR8l2NcDtmxj4aPHnn2eetOiRHJ82TVc7lYvwZSjz0w2cCz064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X87aBP/O; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X87aBP/O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2oC1Focr5ZSEauWQQEexeLn7MhE05cmyXcdmC2BloJE=; b=X87aBP/Oo6BYDowoE+QmqZH3uB
	oeQOFdPEyp79K66PjS6z3hgGa6Pi7tFYiWv5qZ9kFJR2oN75f0gPSENqS2GYoWVxZgsBm43ZxpUVB
	1uyVBV8FvNToYS7+Vosauz1rKROXB059IlZn1Le/8TQZwA7DNEXJR2SVF5aY2cxiwe2mUXQuRc9MU
	yGdJtMaeRuAF31UjOtlRNCH2BMYJPoagXdFuJ5qqUzZll+daLlasTVCCDiYCTGIqOHuQA5E5UCM2j
	Sf5X3vyinWZp0X3UnScAz/yov1YZdOT2vmmhVM+iXywtiJFuIVeiZM/ZTGG6RcQdz42LlVSrlNquL
	0QMkB+/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLkf-0000000AfNb-3H4F;
	Mon, 10 Aug 2026 08:52:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C142B3030B3; Mon, 10 Aug 2026 10:52:55 +0200 (CEST)
Date: Mon, 10 Aug 2026 10:52:55 +0200
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
Message-ID: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
References: <20260807070218.27144-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>

On Fri, Aug 07, 2026 at 12:01:57AM -0700, Boqun Feng wrote:

> * Added underflow/overflow checking for interrupt disabling counter as
>   suggested by Shrikanth.
> * Added a max nesting level per suggestion from Shrikanth.
> * Document/comment updates.

Can I get those as separate patches? I had already queued and tested the
previous version.

(although as it turns out, I lost one SoB fixup somehow, so I'm applying
them again with just that Changelog ammended)
