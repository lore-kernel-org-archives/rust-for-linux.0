Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67AD238171
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012268; cv=none; b=WAT4Q9a1SVyxwshUKJFbzpAQG6yDZ2IFoZIwyih0f4a+A4cm+xX8jY6rCOh5Xp4vVK+gQP7CaibUvBXtKu/h3FMBnD9CTJsRDNEWze6b2QBL9txqBa3HDwVXAVC45S3VxIdyr6Ay2Lu9kDvUKBcx3zIbM5awwB4yenl4gnum/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012268; c=relaxed/simple;
	bh=bZ9kSFAVhqilvJIaWIIW4kFg/TXFgNtCq3Cxyroer+A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rivhpsk9amtge2/XwNa5tifE/g0y1Z1w5Qpwo8l2dH1xgOLC/LoPzDzgEpV+tZKnV+bYt49yGunPPYdVbiQUkuLC6Ny+Mwo1uLDW1Xdbgy5huiCkNCZjZItigtekge5kqqIt1dmpF2p5C42NNhBvQhDdLaQXI2eXTabKxS00fd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BS5reHCn; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BS5reHCn"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so52224015e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746012265; x=1746617065; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGAQKQ/aFDiQw4O9FsIPSw4ATD056ucQ6toOWszUxRs=;
        b=BS5reHCnuqhD2WfC50evTyC4i8EXWu+HzQaTrTkW0VoNU+vkGywDo4+ZAi4T2FHbt3
         aQS7zprOi9BXIaI2YXDlppf967fDzqmsbHsi0iVsT2ZbG6vMamfulkur/PRcoEC28nZt
         QJJeY1J+08vBFzne2HkcBtaXiADRBjIDJ1YrgZTq1ED9q+P0vKbhjisMvCUqB9E5gN8R
         XdBUexfKY/RcGhl+dLlpbXwx0/dZc/zmQjUMnaRep9FvyexQfyxnnEpWMtY9kgig+Ck3
         5gMdIURySife6yn9g3JfHJNO8vDaNwL44KTM37/lkfaP/0DcQDYjvb6y+vtl0FQILqNH
         M74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746012265; x=1746617065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGAQKQ/aFDiQw4O9FsIPSw4ATD056ucQ6toOWszUxRs=;
        b=JxO0esf0QEsitS0578WYjDeoLar4hXlefjtgbjchoBxuewbZZfzmBWhXdV0Uk8CYIw
         RoqVQG/Q+mpXhDhunbQLnXcs49CEybx4kYLnKPDeU9jvxzmPokjxaaNIB1jT1/vvlIpX
         4ohUlX0kPnCu6UakRp1DCZook1ehpAbwxey14KqJTWHc9QkqUiTBUIDvQaOPrNjP5HvC
         ZOVNAalPWKbsc4Jbd7D/vqA2Kkj0M5UWNhMm8xfEeviuVrLnSCF4MErKaMKbc1bm6Ue8
         SEJ7hK7QAR6+UMMv4bBRuAW/KI2lBA1PQkfBo27GIJI5e/YwV7xBXDzwfKpIrrRHmLPy
         /hUg==
X-Forwarded-Encrypted: i=1; AJvYcCXJEGAq6nlN5v7lyOuclb+xTjXN4feHc4/R4q4Vf0SCt+R4iOewRqWwjPnwZu1+nm6KfupIw0HxGF45+OVmFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWwqabGpHYUXOkrZs4dbTNfnwe6Ez88WCy56SXBATbku8QPlf
	rj3SGpU4LOiXcNxtU8Imjnylx5XTSvpYi1LiAxq+9N8rmWd5iRZ6X6O08mz05ZQIl33gUK81qL7
	JP2F9UIwMnZ2QvA==
X-Google-Smtp-Source: AGHT+IFZHSdjjbSkHsQWG96/54Z9SMWj0Byc+ibvdGn0cXkoGVoUOZbYA7xLDo1rlzsYAJbkrQ/4Qd5WN7KPU6U=
X-Received: from wmbes26.prod.google.com ([2002:a05:600c:811a:b0:43c:fd99:1b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:500d:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-441b50210bemr2935555e9.3.1746012265231;
 Wed, 30 Apr 2025 04:24:25 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:24:23 +0000
In-Reply-To: <2025042925-kindly-squash-fa6f@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-7-dad4436ff82d@google.com> <2025042925-kindly-squash-fa6f@gregkh>
Message-ID: <aBIIZ64_Wsk1unB2@google.com>
Subject: Re: [PATCH v4 7/7] rust: alloc: add Vec::insert_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 29, 2025 at 05:30:06PM +0200, Greg KH wrote:
> On Tue, Apr 29, 2025 at 02:44:27PM +0000, Alice Ryhl wrote:
> > This adds a variant of Vec::insert that does not allocate memory. This
> > makes it safe to use this function while holding a spinlock. Rust Binder
> > uses it for the range allocator fast path.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 0682108951675cbee05faa130e5a9ce72fc343ba..998afdcde47bec94b2c9d990ba3afbb3488ea99e 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -355,6 +355,45 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
> >          unsafe { self.inc_len(1) };
> >      }
> >  
> > +    /// Inserts an element at the given index in the [`Vec`] instance.
> > +    ///
> > +    /// Fails if the vector does not have capacity for the new element. Panics if the index is out
> > +    /// of bounds.
> 
> Why panic and why not just return an error instead?

It's for consistency with stdlib. Illegal use is panic, expected error
conditions are errors.

Alice
