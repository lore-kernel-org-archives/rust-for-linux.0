Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579391DD0F2
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495451; cv=none; b=ZotEYswtIcelRlRcNb6+r6ddX6KwDIfxRtUNW2x5T/woS1IlfFKQOnazYxNGJvxpZzDV+ylYQg+iYA9Qb5CvmehVy7qmpEqbqBZRZrijd5Lrr1TS1LDuf0XuJjruVmgdQ8Yl4tjffFK7tE/QxAjp9KxoUjA8TJPUZechpIG9hi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495451; c=relaxed/simple;
	bh=WgwTiED1fBpIzvfOQn7EkYxVe+MFtEl84pNZpKpzUI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=baaPlDguyXg/pSRkTg78fpyXzc0umKt5f06TvN9HvBHO8yfCQYVL11pW1nhD6xmE0O0VUp/E8ezTLhsoyopmzKyikgt0mg7UhZFbdkxCKty782nV1P9+0+4mTasWaKyRvRnr45JRczoiZNqZvoi/+4v48bxGJ+XRgooqiwNWDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/0+2Wfg; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/0+2Wfg"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39130f02631so324475f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495447; x=1746100247; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmGDbzBuoGsyvxYtKjfZh7IglzQtL8j26vfWqlh7BfE=;
        b=N/0+2WfgUNaOL7xaIEg+GCggTvyuPqzpMh9BfyX9Y9WDux3PdZgu8szchaCGe1/iFB
         NbEjFrG7DyB5Gtg6neXR7qvxd9N2CiDch3JBJAcJBNR05BHt1MH30zu8hGS7LtNW6Xa7
         YvYvo3fEdCiOE46wLH3z3t+lbbUDcBJRHMAuc+i5Eu1zRLAs2e/fMPOGg3AdhwCAUBbe
         1y9TibCgkkOdTZSxhetWQ4fyDBvSzJjGxapbKKk45zQ2T41/nL6kk4KGmRY3epoHBvYI
         JRu5vRVlTD8R5tcs6nuLEFagd/Rr1sCE70//IdnmjAxVyhSKcLEFhSxnAEbZL1A84jyn
         0Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495447; x=1746100247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmGDbzBuoGsyvxYtKjfZh7IglzQtL8j26vfWqlh7BfE=;
        b=cz+xigHOjaNieOWwowUnIwCUN4cvWbFmbteMJUsv5z8iElT/RhqAX28GX1zsi7X2ue
         Vb1tBpu8fdSJ/mx7dYoS7Lld4O33Ajjgqb/kq38OXvXr+MuXKwFKvKEqh8e4KnQgceeH
         HtpPBs7kCPKh+vKvUy7pKHCgQiwKgguDa8zS2oWAsLEKYN7rHSkrfCjeKIKOLM4RJkvK
         Z4uIrPCiNOaGd0n+iO+xfRXcfmDW7vDnLHRW1ASK61hLiIRu4dHlBygnrSP/2LORIYNd
         N1vLz9RSqLVmCWcjmGkDjUIShu9wOBsnx4wv4IeAPm2tq9kSkrKtbIU11Zi/q5IqrfNz
         2iVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfwWiGPYWXD2apnMA0nDMjBY1PY1aHJFMY1/I9Ju31b4uYyQ84GJxCy9X/aDMM59blTtl1kb1oFwm6weUAhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wcwPh2fZvPad2pMO3pFihkUtoZQNKmAsYdcniG1GVpCaPzHs
	k48PmrG3TnoFO3DptYGyjI7FjWDse4iw6zVo6YiU51IFiFklgN3jxfDJwaldPbj6QaX4iHOu2yu
	t+e/1rcKAkKiXWA==
X-Google-Smtp-Source: AGHT+IF+sylCddVFrJ9NxbevsWbbJTao6YayugEZT5VczAprArHNYn5HkNpyHxOXwMSiRv+eiT98bvuIw7uSFQ0=
X-Received: from wmqe15.prod.google.com ([2002:a05:600c:4e4f:b0:43d:1cde:6da0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:248a:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-3a06cf61389mr1957844f8f.24.1745495447723;
 Thu, 24 Apr 2025 04:50:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:50:45 +0000
In-Reply-To: <aAkPXBHNDugnXrhc@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux> <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com> <aAfL-e6qA9oBce5t@cassiopeiae>
 <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com> <aAiqCXB9sJe_v6Yc@google.com>
 <D9DX39CF2RB7.IM219BZLVMCY@nvidia.com> <aAkPXBHNDugnXrhc@Mac.home>
Message-ID: <aAollRd0-SnirG2a@google.com>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 09:03:40AM -0700, Boqun Feng wrote:
> On Wed, Apr 23, 2025 at 06:40:07PM +0900, Alexandre Courbot wrote:
> > On Wed Apr 23, 2025 at 5:51 PM JST, Alice Ryhl wrote:
> > > On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
> > > The stdlib alloc crate relies on specialization to speed up methods
> > > related to iterators. We can't use specialization, so losing these
> > > optimizations is simply a cost of not using the upstream alloc library
> > > that we have to accept.
> > 
> > Yeah I was surprised to see
> > 
> >   impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
> >   where
> >       I: Iterator<Item = T>
> > 
> > and
> > 
> >   impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
> >   where
> >       I: TrustedLen<Item = T>
> > 
> > in the standard library, which clearly looks like an overlap. Didn't
> > know it was relying on a non-standard feature.
> > 
> > That's going to limit what we can do in the kernel, but nonetheless if
> > we can support only the cases that can be optimized I think we would
> > have our bases covered.
> 
> I think if it's a critical path and we really need the performance, we
> can use a non-standard/non-stable feature or get that stabilized.

We should not expect that we can just stabilize even a minimum form of
specialization. It's a very non-trivial feature.

Alice
