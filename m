Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F933122D;
	Tue,  3 Feb 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119111; cv=none; b=fgEOLBrfnnk9UtktsVPppFEE5Ep8CdWnZbyFSiR7TauCccvjpDSLRGS3avuw2R7mnXzxIiqcjdqyvU5ZKvcyM379F4xfbmQDLpaQ1jRRb6vejDf0N1QuWrqOEld3ohobOsZkdSXWNjbzVKYrpASdD9Wc4Wn9mUUMfQlItGvnNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119111; c=relaxed/simple;
	bh=RRyf2yCDek79sohIuA8Vw3sWxZzJLPToDHLuC5lva/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgl+fcSorHDV2EwpegO1IBFoEVdy2ACi8QusWRg/Gy64jbQlK6TF/y+pTWaXwt+HwAtv+JH/QcbPTbXOwsmY+7KsHXPpsRrf0wpDeim5LOQy3/kMfL0vYHQ4pt31Ihvz4NptRsocCgu+S2B+0tE9swwFtmkDoXj9gwLLsvwXnBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HvrBCtWW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HvrBCtWW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LR3HjUK84qfeoHheC7+8/wuZwv7pqiTfWIPpSHMUMiI=; b=HvrBCtWW14gJDUkTKXGbvjRCC/
	94i88ecKEsrwrtcJfmDZyqTXM2Uf+0q9rYxHqbU49ru7xFjE5piew/kYCrOCzCEIGqItIR0zClavX
	1QQO3hF0Swy8YIi9s6MtzAO5yoZRX/hDCbyE7qvPP4nYCDdvYUw5VCfRY338S+9lH9Ywe/hO9V1WI
	e9u+Zc4PE9inHbRm4CUr7F5/wgoj+4appc3TZdHohRhI6Qy0FtMyJVXD697cYiHouAHi0Se/nkI15
	anBVBxIKFZYJaKP1ZJkpOkuAKi562xpOzbKmMaUAeAFDy22LDWjgwA6EI77vN9pCnuI8nsQx/fm2D
	GEjWnHPw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEq0-0000000G9uK-109R;
	Tue, 03 Feb 2026 11:44:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 74AB5300FA6; Tue, 03 Feb 2026 12:44:54 +0100 (CET)
Date: Tue, 3 Feb 2026 12:44:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
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
	Waiman Long <longman@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <20260203114454.GM1282955@noisy.programming.kicks-ass.net>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223933.1568682-3-lyude@redhat.com>

On Wed, Jan 21, 2026 at 05:39:05PM -0500, Lyude Paul wrote:

> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 77198911b8dd4..af47ea23aba3b 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -88,6 +88,8 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
>  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
>  #endif
>  
> +DEFINE_PER_CPU(unsigned int, nmi_nesting);

What happened with putting this in the same line as preempt_count?
