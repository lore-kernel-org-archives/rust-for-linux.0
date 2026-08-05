Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC83E51D2
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917722; cv=none; b=A+buHiZ/noxbC5BBRVAowyzqczsSCjeQrD3XilWVc6vI8mSjttq3sZSHrZ5rxafLICdKfWWlZnv0kFn9xgYL56Q6a5JqRQZUr1EcsgzwUhDoS0fMct4n9myfiBt0JWhad1zNT1qFwwTjDatv6+AtrAdxe/vuDcbWR3WTltzeO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917722; c=relaxed/simple;
	bh=yjCptYEoQfuJBAAAwRVcabGT1SMf/wYpCTo4Ve1eaZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g77lrZmBo+I6U86EAI0S9POR+miRXpKK4o+CXYdROL+Akx4p64QHX2zp2GlljW5V0VSS+MD1Bq6KzEFBwjHywPiD+ZEOZ2onxSlRxOEZGImPDv3kfGVeb7As0x4EWlmok1bAIvan+qs/Pxr5SeIkDrf7Cp1cAgGPCGAHOBcDyt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kdpD82iT; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kdpD82iT"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496b61bd846so5159045e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785917717; x=1786522517; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v4jWToKUOQg0OjxRCleB3fiAQwuADNxaXSSgbLkDbI=;
        b=kdpD82iT/LvxseqIwFrDuSUXUU0Ree53nrZ2GZRI6wFqqhesITNICG2ZcJHoJZKvWO
         mvxPb5RmrF8aZK6C/W+xRnDIZXpUT2mnjc63Htwy3uZqrIxQZoBDcGifpO39aNAhDYLd
         b7DQWfpgRvH1SCZP7LCbr7Z0i1xco0k/Qt2CJ9JvL8JMcEAB+N8pdO6oNg4wVhmHzE1i
         KbjrMdSMG8snqsRxxF/KROmCw8t1SFvOxU2xy7Uo1k2K0/knFnT79Menbyvrm6ur9Tgq
         8sGSqvt3IYWUeswhKoDEg1gk9Q21NDVGNeWtq8vdhJtaisnRmsNxjBXARF8cn8ojEmKj
         3v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917717; x=1786522517;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/v4jWToKUOQg0OjxRCleB3fiAQwuADNxaXSSgbLkDbI=;
        b=lkP+LMQ/xLBuhccTXlPCcGWqdOdF/IyoeT2nwFGdw48yaoN4UcLMQs1kwKp2FoJBDB
         5frN+fHxCLK6j3Y9uOnlpdtAL8c3/zEPZeQCCbFwcG7977ZY3j5ymWK5SaTmazkkottG
         utmNnPtAbsBa+R0TilYAI8rEsnYttvs1cP1FXHXAAr/9n18bQ9WTrNL0R6YP3SAgvkzG
         KSekTLEHYEiaIhqI/LgaGvbDIqCsy+gpU+nvgJdhNRids1GWAEIsABtr5lNmuHSOEN0k
         4MW7ICqB2ptJhtmmDrru8LjdyPCcULiJKX8QXi81ro5EOzGZRVAxn8xzCmcFKqSONunJ
         lI+A==
X-Forwarded-Encrypted: i=1; AHgh+RoJapHnWIyNJzkW7ar93E0cmm239b4qwdrme/JFBzGCsKM+ADOr1dWSXEJCNHxQROqbL/GhvmNWh0mAa6rXaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLYAHxWs7nie1aNK+5NFbgrkick74rog7aWLRSQaDEO0mI8C2
	G/XbBWsX653NojqILNL1+1xwKjpfItHSzSUfof0h2g8vitwYi+93MuyayqabP+uvFfY1u/mB4fV
	XjzrhtRMRIUrOtJY5yQ==
X-Received: from wmom19.prod.google.com ([2002:a05:600c:4613:b0:490:b058:c623])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310f:b0:493:faf3:3ea5 with SMTP id 5b1f17b1804b1-4994e7432ecmr48825165e9.4.1785917716757;
 Wed, 05 Aug 2026 01:15:16 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:15:15 +0000
In-Reply-To: <20260706-hashedptr-v13-1-377a07f2f78d@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn> <20260706-hashedptr-v13-1-377a07f2f78d@kylinos.cn>
Message-ID: <anLxE2XD25qjv4iA@google.com>
Subject: Re: [PATCH RESEND v13 1/2] rust: fmt: fix {:p} printing stack addresses
From: Alice Ryhl <aliceryhl@google.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 01:18:43PM +0800, Ke Sun wrote:
> The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
> `Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
> to print the address of that temporary stack variable rather than the
> actual pointer.
> 
> Remove `Pointer` from the macro and provide a manual impl for
> `Adapter<&T>` that passes `self.0` directly.
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
