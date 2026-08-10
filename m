Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB73A9622;
	Mon, 10 Aug 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352281; cv=none; b=ESiU6L6+aS/V3eyzDim2EeetXGm0EoXxXNoTKr5MJ4FFg+mY3AYYRyjBKahJZJpu5kQTLOCCuTh4YMO7y/95E904Q5k2kCTh3tmtJZblE7MVuATkckTb+jLpshReCCQfTsdX4BnoaPWqdM5mSEzJb7/i6dM3cuKhN0/V1/+DUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352281; c=relaxed/simple;
	bh=fV7ljk+6HSRGTIsVWwpI3wo7petsF2Ay35MvTOjHkjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrryhxzZHXQ2onwAimX2Iu+ho9+oFWvPNiUHp7iaXtDiF7EKlT98oeKNBHhpHZzgBg6ohV055IVNx1AwI/4303RfrR7BcTID4E474FFZzqq7EMTJOnUDGcmRiFrM3E3Dzhn/fc8KGMLv3arTZxxFj59jluIxiaVlZhPcVJMKhE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rWDzLZxh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rWDzLZxh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LhzxhkQvRW4UYfiPOGyAvNlp3Vq2+X6vWDJChx1QK1A=; b=rWDzLZxho4CQj9Q1b2dDubbXiU
	AmhehJdaqSYlHoPkezUoj/LFr2pNMfPB8wCBs4FwRUk3Mmhz5/Hk/CCrSW5hEdGFIs/53E1YsWvlB
	tL+0t6Dh1uscD8JKKGAG1Iidt7d2HdD5KTiirj6yI/8MJWcbuxuE7JyNNkJRWzVlHKk8IlOIyzuHI
	lr5/5dpwKMX184CXK0aptZrH7a4ekeAx/AjlrW26D1AVsiP4V4zcyeuL0nqMeecr0pOskv4Q6jKd/
	l3zOkes4C3zlUF+nu+2GgLCstnNOFIXdEm46uZcH6a5RX8zJxCNBVcQlL/qyz7DAC6wPPHyWQeaO9
	LyAYwZPA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLpR-0000000Afqf-2UgL;
	Mon, 10 Aug 2026 08:57:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2579630331D; Mon, 10 Aug 2026 10:57:53 +0200 (CEST)
Date: Mon, 10 Aug 2026 10:57:53 +0200
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [PATCH v5 14/18] rust: Introduce interrupt module
Message-ID: <20260810085753.GF1642880@noisy.programming.kicks-ass.net>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260807070218.27144-15-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807070218.27144-15-boqun@kernel.org>

On Fri, Aug 07, 2026 at 12:02:11AM -0700, Boqun Feng wrote:
> diff --git a/rust/helpers/interrupt.c b/rust/helpers/interrupt.c
> new file mode 100644
> index 000000000000..51b319bd4c00
> --- /dev/null
> +++ b/rust/helpers/interrupt.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/spinlock.h>
> +
> +__rust_helper void rust_helper_local_interrupt_disable(void)
> +{
> +	local_interrupt_disable();
> +}
> +
> +__rust_helper void rust_helper_local_interrupt_enable(void)
> +{
> +	local_interrupt_enable();
> +}
> +
> +__rust_helper bool rust_helper_irqs_disabled(void)
> +{
> +	return irqs_disabled();
> +}

This last one doesn't appear used in this patch; can I remove it?
