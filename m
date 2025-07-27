Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D797E0FF
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753601598; cv=none; b=IAFsiANUPgr8ByCV/4zxkGR7lL+W8PwWPaQbtxE4ror+HgqlKl1eliGKc8B4MF8a/iNgMZ4DFo99uYbAVu3zeY+RD7UK5grd3VnC2JYyLG+SnU7tL7yMCrDCnYTfH7sso6MxcO8zHaugWDtGyFSomBHQgnTLLtdBMybvbM4EAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753601598; c=relaxed/simple;
	bh=xNXAN5OC8QovG17c6hDzmGpifBFd1oX8XYR6z/b/R0I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XDA9DstBNieUZ/oMNrNvoYMUjuaR69+Y3JpPma9jM7ztyuh6kB9qP6n9rNHr/nQz4UMfw5qw7a0Hhb7RyiNYBxEDUm9tUkC2Iu+JOxXL97OrRfJl1DsGGLxbisWYupEu3U5eLcBT7NsHe1eYDvnYXNjtqULVWy919sO1fJdVPos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ioo/jTLj; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ioo/jTLj"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ae3b2630529so354416366b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753601595; x=1754206395; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYEn9n4wbY++FfZAv8qg2eI1fEk6Vh6uQZs/oAqAxtQ=;
        b=Ioo/jTLja08sR2beXygQdhABt7qyBUaUeFddb5hT0ed2N/6E9XWeOGax9sdONGZ86w
         W6JQBuAGQjYP4LwqTuYdRO15Lx0Yl+G02kxGPwa3Km2JfW53WLEbpWymgUTvzZjqdZCb
         UJZvRyg0r4cN14B53AGXXAMlZXieRe3HMIAKDNF5FZUxXQKu2Alr5BJZRF7g6pvJLO2Q
         t0Gzr24wy8HEeZmknkMFRPS7bcthi/5CriZ5U9SzY5Li6ZfAONlYGm5JGbhrK15VIz6J
         ny0/MpYpVs9APQ/LTmWSb1biJTZB1RYIRSo9Xd59ptS/xBiIdRLskKEfIUa9Py7hW8+i
         WMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753601595; x=1754206395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYEn9n4wbY++FfZAv8qg2eI1fEk6Vh6uQZs/oAqAxtQ=;
        b=rsyiba6g799PXLFdBeR/VevyemsyTni8HTpmvlgYQxHOVfY45ky+mvdlWJlf0opDZx
         W5Wu70BmXuMKlX2n2bTlB1T/BAChR/EVAEpEmSF2uCGm7GjeT8WHtX15ru9ZRfcce9rg
         jyzKLaNoOK2bUphzhm5denVzG5QDygR6hrOWeaJ09faWshMbmGfVuiKui4cSqhJLW9zZ
         3lpzw1qbJKvUyNNJJqF6pNJuzLAV1iSQzNHHJMMkzwtT1WgerT95voT86xy9Ldr8iBi3
         FouJYhRBfN36aeICE58wwuXx+BjNK/04JkShP3hNLVfuiJtbt+BKDK4iiRaWZyxbxDSY
         Co9w==
X-Gm-Message-State: AOJu0YwHWtHNMZnHLplfmiVt+z6MEj7m1YC2ciOS1tKF5fGwDWZ+N2GA
	GTyQIytA8NvejPgoTlD3WuojvJ0Ar4RMjGGUkP0YskpaF0Gwdj6QD1inxiv8Bz+CRAfondMNI2f
	NAVH0s88/lRNJt3q8VQ==
X-Google-Smtp-Source: AGHT+IHJuP57hLADqtVsQty+/0f+0R1qq/T6WDOD6QMkMTz/X2EQnn2t1TjcFe/W5l7/3jJIOxYQ8lRHpppR1Vg=
X-Received: from ejcth17.prod.google.com ([2002:a17:907:8e11:b0:ae3:5cde:6220])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7946:b0:ae0:a813:1bc0 with SMTP id a640c23a62f3a-af61eb1244bmr877981866b.53.1753601594842;
 Sun, 27 Jul 2025 00:33:14 -0700 (PDT)
Date: Sun, 27 Jul 2025 07:33:14 +0000
In-Reply-To: <20250724185700.557505-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250724185700.557505-1-lyude@redhat.com> <20250724185700.557505-2-lyude@redhat.com>
Message-ID: <aIXWOgTWdSODz7EH@google.com>
Subject: Re: [PATCH 1/2] rust: time: Implement Add<Delta>/Sub<Delta> for Instant
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 24, 2025 at 02:54:06PM -0400, Lyude Paul wrote:
> In order to maintain the invariants of Instant, we use saturating
> addition/subtraction that is clamped to the valid value range for a
> non-negative Ktime.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> +impl<T: ClockSource> ops::Add<Delta> for Instant<T> {
> +    type Output = Self;
> +
> +    #[inline]
> +    fn add(self, rhs: Delta) -> Self::Output {
> +        // INVARIANT: We clamp the resulting value to be between `0` and `KTIME_MAX`.
> +        Self {
> +            inner: self.inner.saturating_add(rhs.nanos).clamp(0, i64::MAX),
> +            _c: PhantomData,
> +        }
> +    }
> +}
> +
> +impl<T: ClockSource> ops::Sub<Delta> for Instant<T> {
> +    type Output = Self;
> +
> +    #[inline]
> +    fn sub(self, rhs: Delta) -> Self::Output {
> +        // INVARIANT: We clamp the resulting value to be between `0` and `KTIME_MAX`.
> +        Self {
> +            inner: self.inner.saturating_sub(rhs.nanos).clamp(0, i64::MAX),
> +            _c: PhantomData,
> +        }
> +    }
> +}

I'm not so sure what to think about this clamp logic. Maybe it is the
best way to go ...

Alice
