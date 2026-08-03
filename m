Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A43E168C;
	Mon,  3 Aug 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749370; cv=none; b=pp7AaXcGB5SfO6bwtnAvC0365cjGgFdKEUFx6C+rsJnk8p7bhnQYsI0CK4C0i02mtWYjMxRnSkhgAYSaugGFT7ue3eKjJoGG7+GYrE9OW8aVql98pf6Mi4TtacaH4zxvRFHQnvAjfCFPcwt0hNQL9TGeE3uE6BJjX4gTrTu5iVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749370; c=relaxed/simple;
	bh=7R2/EjA8DXD4kkDv0o4cwULljH5ArJX8+4nbJSc8Wro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2m7DdcKRVVVpf0MHsXMW517HqzSqK6IGzQViAh7nw65cZPzrq7fNdy3CQuSz6JdHMTTNgSjCg5usndEUlxrlpp0OGFSjgTUOjIYF8b6s8rDq1DvEESLnl7prkRedqdlkyK7t89vU5jt9mcNNYU27xXeQGj83zqd7duSKqStQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QFNGJnng; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QFNGJnng"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AXdD55ihhzFhIQbGydvLcY+UF7qTFnYqJQ5zPa4wpGY=; b=QFNGJnngE/Nz+E3Y0VL40YOLgo
	dPvsYp4h23cQn1KheZZZhW1Q6JdPp30nVVq+32RKt2OMBIyKksEm0gKSXUUgHwvCRYkMYJcC2eDR4
	OWsEsiF72fJmu/54oSbD9n+GdqT/m/SkOQL6NPiZVymqxWZsMtehnPVUQ55rD8MSfY6pB/yyXpP7x
	miV2RYRutTggafKPnxOgxiI5LwnOzdh5PNAB1CeQaFNa2XcXFbTa8+42CCdLfjKYX+k7yHTXDhZLj
	m9OzRYm3rsblGZniB87wkjmlzKNFw9vZeYhPs1CwdbzjmXYj1sxaOS9YadkYgTeT2yMyqimLbHO5B
	wp/54ekQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqoyt-00000008qjd-3g10;
	Mon, 03 Aug 2026 09:29:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C73183012AB; Mon, 03 Aug 2026 11:29:10 +0200 (CEST)
Date: Mon, 3 Aug 2026 11:29:10 +0200
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
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20260803092910.GD49951@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-6-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> +++ b/include/linux/interrupt_rc.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> + * management.
> + *
> + * Since the implementation of this API currently depends on
> + * local_irq_save()/local_irq_restore(), we split this into it's own header to
> + * make it easier to include without hitting circular header dependencies.
> + */
> +
> +#ifndef __LINUX_INTERRUPT_RC_H
> +#define __LINUX_INTERRUPT_RC_H
> +
> +#include <linux/irqflags.h>
> +#include <asm/processor.h>
> +#ifdef CONFIG_SMP
> +#include <asm/smp.h>
> +#endif
> +
> +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> +struct interrupt_disable_state {
> +	unsigned long flags;
> +};
> +
> +DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);

I'm a bit confused by the need for this struct; afaict there aren't any
additional members in the rest of the series. So at this point this is
pointless wrappery, no?

Having this variable exported is unfortunate.
