Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5F39D6E8
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785258639; cv=none; b=bsek9ffF6rbS9ALI5yBNEygkprma+VovEN8vAnVDHuCm9bYLSONuzZMDsaQBS65OR5H8Zg7L90HZH4bQyl8vtolohU8TTr1dK2JRwPCtbkSyFzBmW0KizrbfJgLVlCPKUVOOQWPgz9hYVEeFi8ojMG734gweCKcPrYxYhdZC2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785258639; c=relaxed/simple;
	bh=aiAcjvqBDo/hZ57/7zDsAt4TmRAIXblduf55Q62ap74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcreQQMY4qh1CIhr/aKxSaTDf4TpDVBfGDMVlsr9uunnhwLFNImybg7fepwVRrGJDcd53FnwmV9t7LDL02Osh0UiHsNNxgTXG2S9H+ZQoqBqwj6HFTYKuw6nDTsCe5I7NbFr2GJdPRfsfkLLHcpm6gTxj+xTVOVAr7Kng8Pg9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ufb5oBd7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ufb5oBd7"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccdf36f63dso4835ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785258638; x=1785863438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rtso/6MrMFRHVOUOKPRhobi5Os1VnnvXLg5WxwaI43c=;
        b=ufb5oBd7ALRhPkjDZYBVj8fYT+BX1qsCkdfpBqYwGYqGp7LL5XO/sLY5SgRQZ6d8bR
         ffs/6Wn4lLZOio4zBWw7kbaPozfi44st30pvCflVokll5WEBCpxCv5ml/zJw/k/bJXCw
         qk8Cj+Jck9rkTIsapU+SEkVuDE/zFUxJQK5D/v21NBjYQ9ySKjzKhF3TWIMsVLY3Dih2
         f1Gly/skhXHxa/E6os1RQ4lzb/u9ZsapHxv2oi6bJ5bhBn4XAIRXZzIXkceJSApKT7f8
         7+1wpMrQ3Ma/G8/ejbqPjXHZDrXHDzumqhz0v2yxwLaUC53AvRh4Bjv/IkI1kMPqy49B
         QiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258638; x=1785863438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rtso/6MrMFRHVOUOKPRhobi5Os1VnnvXLg5WxwaI43c=;
        b=hPIBq2h1EUuoapKaBxmvkst1bJEEiMhd886if0zA2uE7VbuL/0u/PEaM3uIRI1wOqS
         WN+AmzAmD5y8XIxe2ywYQMd497enhgxb4cGlFV1IfShjAQsD7TG4H3fXJ+JbeqrHJVfc
         hb/cBsgx8ZB4K7E/HoWee4X1flNbTTeKvHbpe94LpZT4YgYCrPb4H2T1lHONkBopZo4f
         YslJX9WXPxeJrdGMDdHdaz/AhT+Sz5zeAoudez5TA+0/EWSiKKqvYFn7uIogfwK0OIw3
         Y+bZT34TSvM2CtC/qEerAGF4crtjOBsy46D0fII78boKkzWfAApIJgHKrFiRfs2p9irk
         3LvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpgoje6GOXBxQkVjPHZRrO9sRTZeCdS4SXZ9kBc6mXX1MY3oERnMBCSrd6tgL8uFjPBuQYhbPgY1l5TkaYKzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbGN5zVD/JW2S3AvXnftpmeNEjfUfj1lLf8GQYkinPFikWyRo
	3xjVIPugTREM8B9qXRJc6DzVlosO8tsn660tbSNEDvCdKeoBXLADaHhqmtFofE0wPA==
X-Gm-Gg: AR+sD13erG3imxV9wlajF3Iep7GujXR+tOoEOqSm7nYh+6LVS+uXqCq61SeQfHf7kvt
	tny0e64lTOtDb2Y77gg8BsG5cOhaRv/eBUkq6n4npjO2KSE7JRKLsl85FsyamuWqH2GIxO1qceL
	lt7o+AjCTUVFXIe9DJpSiCBKqOgWtqRO7N1DqF/XPMP69Ilzn8qvSvR4i0AlHgzFlDvwU9p0uND
	X4VZiQ9C1VgZdZKyiEvX/gYs7GmaeFu1OrfXtjXaNXMztfvDizr7j9oHX96HkJA3OaPLeZgMe2M
	YxTljbrC94dk6FbxwrYvOzXMx5iM+DMierNZmYQJHEVPVQWbBubkEBLlHOzPjLdmKFrzzEStkmB
	0C0lsT18EeQEEC8sYWrMeOrchD9XfSwHY83t2fGdOhBHn3KBKcWrZtOhq4qareymgvQcKPNnAmI
	xOrCsaPeoGwAOh1iJnLl9/fVt9ohXWvRjHqSbasm3jjGYdILyhOWZeJ2zskYe4pzuTrKvWKxmCY
	qNJvg1yC0hEfRn5Q1JTXre43w==
X-Received: by 2002:a17:902:fd87:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2cfdb73e6cfmr7608015ad.8.1785258636718;
        Tue, 28 Jul 2026 10:10:36 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcb3sm55463025ad.82.2026.07.28.10.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:10:36 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:10:31 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 4/5] rust_binder: consolidate transaction failure
 prints
Message-ID: <amjih6MHfDIAk0QA@google.com>
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <20260728-pr-ratelimited-v4-4-435f8d6e9605@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-pr-ratelimited-v4-4-435f8d6e9605@google.com>

On Tue, Jul 28, 2026 at 09:32:54AM +0000, Alice Ryhl wrote:
> When a transaction fails, it currently hits multiple print statements
> meaning that a single failure can result in several lines in the kernel
> log. This is unnecessary, so consolidate them into one print used for
> all transaction failures.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Thanks,
Acked-by: Carlos Llamas <cmllamas@google.com>
