Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C0235358
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113731; cv=none; b=fCKgaOheNl7FPqUgKAuwGF/JD3331indaNJCucKweBYXMhaygC/BErGy8NCufefPUdNo6XIY3P0pMw6AgjTmcJeWT7ei8ULvYhiv645Fc7kfshvIAI3h3V9svu4dqh4zmTDB+Ru86ERj7M7bGU02VN6db/M6NOLwLzAvmUHw6Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113731; c=relaxed/simple;
	bh=ThwhLGPnoQ5/e523Bc2w12fFBtg8JG25q+fpnigCt8E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qBAVQQvSCU9fX21Wbtr9fKdeBKNxBK2F50DGGS8LQt2f2PC2ZZdlBQZLTY94DrlfAvPxo/ykwmQGR/vhiUNJlb6CH3yplt/n9eYZ07ixCK4TUT0QkRzFkAHZtIBNcadwX+4CC6TD6Oiwsa6n50C4IyKZ0a/TZuuCiDuhA7POPVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j0ZxLZ3l; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j0ZxLZ3l"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477632ef599so14458235e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 01:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763113727; x=1763718527; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yYuugPZATqidJIxSjOI/bn0PzLcRgfB0TOo+4cGCGxk=;
        b=j0ZxLZ3lKdrMvysbF5C7WvndhcvTPWHBGm7nS+dO0VFmdTi39uLde2U1WxIMgw/VB7
         dBNm1/kqIw6iCkAmUiwzOJ/TYx1PKqrDbyN33/i+KnzhnvXJusOhN6D7P8xag6V3mr1X
         FLl+UbyV0POFvOpNs1MuVUks4vY2VGxKKegJwokrB4/oU/54DsIgCXGCxK18TN7KQptr
         Y7XnRx12WOqB2tbk+i8ZGWC5ysCGAJiO1m5SK9m9s4kqWcmMX9kNSju94J+BkhASnhHU
         fNYYcxHimZ+DsrirplQfsxqB4NMFVmCnaZIMnaovbfdDxOZuByCWAlA46MqMtMq8aHRj
         88bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113727; x=1763718527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYuugPZATqidJIxSjOI/bn0PzLcRgfB0TOo+4cGCGxk=;
        b=TCOLsYdZcb7m1BaRU1IVgIHFgaOgqFBJ0M0TTp8MuZtl4ei3vNTlMm6BDUS4Faj1z7
         meVT2gs3wfkx2RLRgvymq5TFT0cPl2AdC+m/ICUBm8vhhchtuQ5DHimdS3ygvZSlPqDJ
         Bcd7VNVZXQPa8fnGGaiBHTnSgPAgC9eNcgT0vtkpafDDlzu2IlsjLexnO7h1KM4CEnBr
         OWfIBs2IExTlaee8zBdBd07s0We1N9x3cJ+SVHZ4FwEyCgvueaNQXNnmzLhVzTZbNKMz
         eRjzGHkPBD059Jim595WpJqJbed2tqxVdGKiIUI85zM0mNGuvLmurwyDDEsZiHMK5E11
         TmRw==
X-Forwarded-Encrypted: i=1; AJvYcCWET0CxGBSxy+YOtrciVUg3n2Qixr3UCe6/M5t+GwntC7aPawKHfodcaeypYbI75tuIQmT/hPbc5CEJuhzKKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCg7TDlvGrl+kRoM6XiINNyLxScoEr97tUbDwaAdTkdM99l4qU
	df8CL8NmYhZ9ympUGi7poCf/oj87ibMkVFM52j764L5mCGStICnBrwNwHJd+z7/AC3nYNxxHOfl
	VfV4DvblN92bMigpHsA==
X-Google-Smtp-Source: AGHT+IEzJdTEDmhQFTZAdEOdDjne6kQ+QVfcofJeQl1tc4iTFOArXmY5jbKo0kdFzOXFiN0GwPdPeWKHZdRr//Y=
X-Received: from wmlu9.prod.google.com ([2002:a05:600c:2109:b0:477:3fdf:4c24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4c:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-4778fdb36acmr22188615e9.10.1763113727312;
 Fri, 14 Nov 2025 01:48:47 -0800 (PST)
Date: Fri, 14 Nov 2025 09:48:46 +0000
In-Reply-To: <aRaDjpYMPJtOfxPM@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aRXJuUTR1fnWiBQF@google.com> <20251114.094730.791355531242483716.fujita.tomonori@gmail.com>
 <aRZ-bsCDsoLZgglV@tardis.local> <20251114.101208.202243876104759244.fujita.tomonori@gmail.com>
 <aRaDjpYMPJtOfxPM@tardis.local>
Message-ID: <aRb6_v9BSpC6pVT_@google.com>
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org, a.hindborg@kernel.org, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 13, 2025 at 05:19:10PM -0800, Boqun Feng wrote:
> On Fri, Nov 14, 2025 at 10:12:08AM +0900, FUJITA Tomonori wrote:
> > On Thu, 13 Nov 2025 16:57:18 -0800
> > Boqun Feng <boqun.feng@gmail.com> wrote:
> > 
> > > On Fri, Nov 14, 2025 at 09:47:30AM +0900, FUJITA Tomonori wrote:
> > > [...]
> > >> >> Using u8 as atomic type instead of i32 would require a fair amount of
> > >> >> work, since at the moment only i32 and i64 are supported as atomic
> > >> >> types, right?
> > >> > 
> > >> > Supporting u8 atomics in general is tricky, but I think *specifically*
> > >> > load/store should not be a problem.
> > >> 
> > >> You meant using read_volatile/write_volatile? Since we only need
> > >> "Relaxed" order so something like the following?
> > >> 
> > >> #[repr(transparent)]
> > >> struct AtomicU8(UnsafeCell<u8>);
> > >> 
> > > 
> > > Please don't. Please make it work with Atomic<T>, also store release and
> > > load acquire should be introduced as well.
> > 
> > I wanted to confirm what kind of u8 load/store implementation Alice
> > has in mind, and whether it would be used only for OnceLite.
> > 
> > Of course. If we add something like that to kernel/sync, I agree that
> > it should be implemented in that way. If not, I'm not sure.
> > 
> 
> Yeah, I'm afraid that you want to implement something only for OneLite,
> and that'll introduce fragments for maintaining.
> 
> For Atomic<T>, supporting load/store/xchg/cmpxchg is definitely the
> plan, so appreciate if you could help while working on this pr_*_once().
> 
> Alternatively, we can start with i32, and improve that later.

I read over this discussion. Perhaps it's best that we go with i32 with
xchg after all to avoid adding new atomic types for this feature.

Still needs a load, though.

	/// Calls the provided function exactly once.
	pub fn call_once<F>(&self, f: F) -> bool
	where
	    F: FnOnce(),
	{
	    let old = self.0.load(Relaxed);
	    if old == State::Complete {
	        return false;
	    }

	    let old = self.0.xchg(State::Complete, Relaxed);
	    if old == State::Complete {
	        return false;
	    }
	
	    f();
	    true
	}

This ensures that we do not perform a write operation when we don't need
to.

Alice
