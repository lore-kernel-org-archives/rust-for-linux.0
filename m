Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBCB3DDDDD;
	Wed,  5 Aug 2026 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911502; cv=none; b=hnAQ1D/h0xPeTRGgLL9nubZBcn3MZIDfyNlnx4sDs6054ko57FEtUagJHcgNpSVGTLhWZ1bNwZCHqhmxpxy7uRoziqUHBorpu26XY+Si+escVRDTrs+zoIWIJt1+7nSS+FuBmbfGU13X6ZYu0xQL8oSGWRzDw0op8cfcLMvl/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911502; c=relaxed/simple;
	bh=nFA0lF25Bq4nqR0D4ug8/xyF8GMJBvZM7N9vCwQBETU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvAdF1UoCCZko7UFYllr3S5E1QW2eoxY5QPW5Pcu+XKrDYcvV0KaXij1/40BQpSTmdXrUGip/vyC3LafizT/Lmn36BcBtqKY5p3B4TjbwNFXo9P6GyowrLT3hPQQlZhX/HGo1A90+4xNLRJTXRoFMd9mmnl9q10ywy5yBiV/10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YSyOnyhj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YSyOnyhj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u79e29ibJwDcQC9ryOmu0rFOSEkZQEOMLj/CW1MrGBg=; b=YSyOnyhjAF5ckM2lGNhe8rOcat
	mHTak8M/BswcFRtrZZQlZpHGC9t+8nMNaw1pVO9aOyziHcNsnmF+aYcjgZ6mxQIwnClIUG3O/Z63j
	E1NmWw3jJqZPdScHthKn21sCzDo+W83zSMHSeodfGLlyFqpb/mgh+3/KSQ1X1ruBl5IpI+3m6rlfA
	S/l+TxnPbcN5DKH0TBz+XOtfDD54YdFnG9L2eFLoPcx7EvUxjJUNSXGPFMn5vb5E/BgQcpFEvaWub
	eBswXW7k+NTnyr9e0HDGJNTUrFbdgvvZB/kK9rEWOCCiPZ5u0SjqYNBAS0dWsFYgs5o7beCRFe0bj
	DZI9FjeQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrVA1-0000000AV8Q-0gQz;
	Wed, 05 Aug 2026 06:31:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 320A43004C9; Wed, 05 Aug 2026 08:31:28 +0200 (CEST)
Date: Wed, 5 Aug 2026 08:31:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 02/17] preempt: Introduce HARDIRQ_DISABLE_BITS
Message-ID: <20260805063128.GN776954@noisy.programming.kicks-ass.net>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-3-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804161447.84806-3-boqun@kernel.org>

On Tue, Aug 04, 2026 at 09:14:24AM -0700, Boqun Feng wrote:
> In order to support preempt_disable()-like interrupt disabling, that is,
> using part of preempt_count() to track interrupt disabling nesting
> level, change the preempt_count() layout to contain 8-bit
> HARDIRQ_DISABLE count.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Boqun Feng <boqun@kernel.org>

This still isn't right. Either it needs a: 'From: Lyude ....' or so
Co-developed-by or however you spell that.

Since current from is Boqun, first SoB should be Boqun.
