Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1A2C0299
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241174; cv=none; b=h/6K15bFaX2XX6GpP5Zd1XZK6/zIatE/zgdEq2MS6cA2gm+2/KGGmt7EvgtVNNtmh97nBljRg8+d+RzGXbEyyz6F/AZde3BM1rNo2JkFk3iJqk49cXlk9p7oAPhrDo+Ynfsk6FKXyfAVU/m/Pt1JU1FZZmOMHMY0aWBG6UEIqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241174; c=relaxed/simple;
	bh=2fY95UUg/tePenE+HYC6jvdp1NVukK9WIF2RG5D26kA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OMK9LJVJfDDnpZ0ARzRRcHiBofO3PbhzCL+4YhsCeB+Rf0g1VRRLTkQ1ROVjCvZ3IIYyVtwwAgo+JES8UwXZSWVrnAZp6R2O+IFjjnzcxGWWcDs4PKd9157nRLQXifDH99s/m8VCFkRqmagO6fpZ7rIB5rz5ssp1fatc6oM/3Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pvjO8jQP; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pvjO8jQP"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso20140005e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 03:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771241172; x=1771845972; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGMbsyUuSVMTufVvZcwyil4vhH6NmOuJFN5COuJwEj4=;
        b=pvjO8jQPhHapmAASGv6VeT6JmSjAYCnEArLjuurgvdPUSVwbBRjoeSWywECcxAM0f5
         DQNbR9T008LUfC0nA6F5Kml/aO3cEHRPN2+V2HjRet4Bu2ADslFPJ9NnZ4xcpdBA9JNX
         HTKkJaqsd3VM+koR+U24zZaSCTo3ScG8nG1u7a6EZ2VNXIccJXUOPMbdePC4dhebryBa
         SFdczlIYBz2kQC0RSxcznhbn3IAxS6a7J4XOZF/a1NE2R9LHq/9EAXXJySmPhEEwz8eB
         rnrGbbsh6WDAc2AUk62O0e8F5F2jE/0EMrBzcM/vlG7MRBS8sycLdA17fLzDvH5DihpO
         5l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241172; x=1771845972;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGMbsyUuSVMTufVvZcwyil4vhH6NmOuJFN5COuJwEj4=;
        b=EaeS9u2wqtKaWbD6Myyx/DPHV1FLT2HLAblPSIX00cNZYqaWK13VnM4E3GzBRJeJkV
         O9rlYmjRRG9qgnFlTymXM4LsCczZ6l9Q+DYR9CPDQhLMx/1uL41poajwfdZBXzW0rhZo
         fOPf8r6frPeoDVpuNWulbPZzSUtW7YUSz7k/ztM62Yre8JycOoaPWJcICpKythFq4/uf
         bJweMOcHy2uwszijbTpRx8wMtuGAl2qwQNjAItS5o8YvmTAzvxQL/Ptzp21GNzEeJP1z
         pMVcjRsi0heDGdfwd6Z3o+bo1NekcemL5s8UhFPm2HmTHbpkIqFymqOteiSeY0P/EdQf
         uxIg==
X-Forwarded-Encrypted: i=1; AJvYcCWXHHZCyEbJMPXVdZLsIehQMYqOrYnnKVbFpP1kuNQP+hjmozhdycoSanQHM9YTnA7FnlX3ECrSOjg2fwKzYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyto1QEDXvN1mzlV6/KS+fNyTt/iWJTj2cBaifiHZY37B/MHyng
	FidLb1VZTuUBd22FW7QMsmmWlxoluIRIUGWVA+14T6RrTVpO+FAr8bEOUjDOyezgDYdopAj2eII
	5FF+XL80jBkLYdMibMw==
X-Received: from wmbdn10.prod.google.com ([2002:a05:600c:654a:b0:483:6c98:3d2f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e1d:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-48373a15f1bmr164805795e9.1.1771241172055;
 Mon, 16 Feb 2026 03:26:12 -0800 (PST)
Date: Mon, 16 Feb 2026 11:26:11 +0000
In-Reply-To: <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com> <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <aZL-09Wk-KrDrroy@google.com>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
> >> Add methods to get a reference to the contained value or populate the
> >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
> >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
> >> allowing for lazy initialization that may fail. Both methods spin-wait
> >> if another thread is concurrently initializing the container.
> >>
> >> Also add `populate_with` which takes a fallible closure and serves as
> >> the implementation basis for the other populate methods.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
> >> +    /// with the value returned by `callable` and return a reference to that
> >> +    /// object.
> >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
> >> +        if !self.populate_with(callable)? {
> >> +            while self.init.load(Acquire) != 2 {
> >> +                core::hint::spin_loop();
> >> +            }
> >
> > We should not be implementing our own spinlocks.
> 
> That is a great proverb. I'd be happy to receive a suggestion on an
> alternate approach for this particular context.

You can add a spinlock to SetOnce. Like I mentioned previously [1],
support for waiting will require the addition of extra fields.

I suppose we might be able to use include/linux/bit_spinlock.h here to
avoid taking up any additional space.

Alice

[1]: https://lore.kernel.org/all/CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=+14tuRH1aSuQVTA@mail.gmail.com/
