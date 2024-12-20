Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982E21CA06;
	Fri, 20 Dec 2024 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734719352; cv=none; b=NGMxp8tx5Or7Xq7ebL73C2JaoFnue72up0f3ndl7bOkH2NEfwXK34dU4iiC+Tg03La9gFFnWq/9zIE5NKluOgbPqxot9S6Af7dNT42SLMcHYDdI4fyFvWbl9G7WFa2Ze10USWtJHsZVJg9WoM4U1ZbofrhImPZ5KIpP2TXjrZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734719352; c=relaxed/simple;
	bh=ZfBNVpuqUHRg/2o9ie1II+m3jSRmmrhBDzV+TTJwtQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gaQQjJt3tmRnW43hJQzcJ+h4sSXtoS/HxHm6S7PTVoQgko3MDFRMaLtJzK4wH6bgUkX/n1eyn0G+xI+lffnEVanBwJz6fowTMTExLAPPBg2wHdRhnX+QA8s6KIrv31aVB6j6mK55+DtFQvzeIi3tEq0io4eiIA1g5ftGBptyfbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=kTFg+5+j; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="kTFg+5+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1734717414;
	bh=ZfBNVpuqUHRg/2o9ie1II+m3jSRmmrhBDzV+TTJwtQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kTFg+5+jojiLnNj9qfRUdIC8ZkN8sDT61aiJit78jNHQ6e8xfbvrj2Xbp+SlvytJ/
	 1QBg2ZmTy0ZT6taZTSFn43awDHK+pB8y9jN/Y8g5T5UnZKmdVDs8EXVOEBrJmz5c/4
	 0VdjlOQQ8cWEoNsnlswCxCoTpV6sJeMOqKvYfHdY=
Received: by gentwo.org (Postfix, from userid 1003)
	id 9756040737; Fri, 20 Dec 2024 09:56:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 964CC401E6;
	Fri, 20 Dec 2024 09:56:54 -0800 (PST)
Date: Fri, 20 Dec 2024 09:56:54 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Mitchell Levy <levymitchell0@gmail.com>
cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <benno.lossin@proton.me>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
    rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH RFC 3/3] rust: percpu: add a rust per-CPU variable test
In-Reply-To: <20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
Message-ID: <5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org>
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com> <20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Dec 2024, Mitchell Levy wrote:

> +        let mut native: i64 = 0;
> +        let mut pcpu: PerCpuRef<i64> = unsafe { unsafe_get_per_cpu_ref!(PERCPU, CpuGuard::new()) };

A bit complex.

> +        native += -1;
> +        *pcpu += -1;
> +        assert!(native == *pcpu && native == -1);
> +
> +        native += 1;
> +        *pcpu += 1;
> +        assert!(native == *pcpu && native == 0);
> +

That's pretty straightforward..... But is there no symbolic access to the
per cpu namespace? How would you access the kernel per cpu variables
defined in C?

How do you go about using per cpu atomics like

this_cpu_inc(nr_dentry_unused);

