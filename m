Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86162DB7BD
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393254; cv=none; b=tEpqDIy2l+P/ElhTcklNW5kwpq0frL+qB9cs8G1OyNI28m3I8SosPHTSGbZK4cMhcSGr1iRsooA80dzqxkxSLgJoFreU1YGmQrg7r3A0I/m57SKOaXYr4O0MnhJynZmveFsqSYW6DZRR2i6QMG08nqSO8Ff54zYZ5kki7fReBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393254; c=relaxed/simple;
	bh=CYS4rw1bXYyrm8MMXbVB/DRHjhCbVA4/2BprubkQJkQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wem4zBMq3lYPMDwZVCIWYFbfjJ/n4FFI5sVwFdWfZii+narLAH4iDGGNPVZ1D5hvn0K46ZGCd35p1QE4NdeJjCDpBDRiaAoRV3N/HjaPWU2n2IP0b6gocxCWfr4VDLLwMLpu2qWsSj8envHkC8b23GlM8xUkcKqJp8ri/mJDZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y4VS3ipT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y4VS3ipT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806cfffca6so30278405e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770393252; x=1770998052; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hal6PjPvOpNNha6OrWCmkRD5rZzaVkVcwVhH0GcBRys=;
        b=Y4VS3ipTbhLsUtKafxyCPhOjjMj+dM2LG12Zgjf8STUr1rMLaNBhktSnIeoaREyups
         M9xyN324gFYWUFgsliYxrRV3CiwPcK//Ojz08j+WcQPBJnIpHKcDFzMq4Itoa4K6G+/w
         rAwS54JLZs9RAoJCEiUQl38H1TtN/XEKZIYzEJlZokFp6DNXJHShkAnsebIjnKCQXPoh
         feWUEvh+w6roJyTsZpfrDjX0vTQBDyfmAMNMotliXVA47bbtku9sijm2hSrGnKXaG+on
         fYwuOhzdkbN9+C0YejkjWBG4vafXARReC3Y5KK3KwoeiWDNhEWA967sZCxBVSfHthjK8
         z2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770393252; x=1770998052;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hal6PjPvOpNNha6OrWCmkRD5rZzaVkVcwVhH0GcBRys=;
        b=f9rTnx82TdG9kULxrqsttI7Xn6sqC5mHU/j6tZ+1GtvBDP4c0WOYPhxi7qqg6TILCp
         CwbJOoeHE2nJxSDEwqZ1kiJzpFiM55yo4ih/mQirJHKqNVw4owDp+m6QX8lpUC18ETIk
         fyP8yjCTMa6xFZrDy9ZWwQ0FbrV1lrwTeIE+dqhC4Ju0/nECT2g60y6CVJKMMde+qF38
         pH9d1bMThFPpWzhZ69oUbJCl+wCFOLrwOuA2N5/UpdH5tPOKrukxvh1PzBb/0n8fY8FB
         ro/r2PHxv8d5fCzetn5ILoIdvrBjEzU64QGdAHW3tjNZZF16aVHU+dooS5+0oJnL1usf
         U4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVNQfu10qdwLFcInnVxSD2EU/XV3zCTvDyLMRry+agNMTzs05Hs0xxFpDtMqAMlnXmtniR6Ye2rnMfTNvCgJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgP9+3FdwWnuNtQsop/IgDwEf3OW2pA8JjZnrhrxRkCkuhVHi6
	n4l+erltvhJXkBN0r1LyyJSn/n+DFOMQ7dNwxOkzj+Pe6wQD6F+urGADb6kCkDg6QWQJUlbOF7E
	QoO9fXtBs2l490WCnOQ==
X-Received: from wmkz20.prod.google.com ([2002:a7b:c7d4:0:b0:480:6c79:b533])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d96:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-4832021eaa9mr50165555e9.25.1770393252414;
 Fri, 06 Feb 2026 07:54:12 -0800 (PST)
Date: Fri, 6 Feb 2026 15:54:11 +0000
In-Reply-To: <20260205222529.91465-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205222529.91465-1-dakr@kernel.org>
Message-ID: <aYYOoyD8QAHEsWTp@google.com>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
	Markus Probst <markus.probst@posteo.de>
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 11:25:15PM +0100, Danilo Krummrich wrote:
> Commit f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc") did
> attempt to optimize away the internal reference count of Devres.
> 
> However, without an internal reference count, we can't support cases
> where Devres is indirectly nested, resulting into a deadlock.
> 
> Such indirect nesting easily happens in the following way:
> 
> A registration object (which is guarded by devres) hold a reference
> count of an object that holds a device resource guarded by devres
> itself.
> 
> For instance a drm::Registration holds a reference of a drm::Device. The
> drm::Device itself holds a device resource in its private data.
> 
> When the drm::Registration is dropped by devres, and it happens that it
> did hold the last reference count of the drm::Device, it also drops the
> device resource, which is guarded by devres itself.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        // Take additional reference count for `devm_add_action()`.
> +        core::mem::forget(data.clone());

I'd feel better if you called .clone() prior to devm_add_action(). That
way, even if devm somehow runs the callback before we get to this call
to clone, the refcount has already been incremented.

I know it's not really a problem because of the &Device<Bound> argument.

Alice
