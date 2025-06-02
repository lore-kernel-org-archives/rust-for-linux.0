Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E61FF61E
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861808; cv=none; b=uFzViH3C21qdIQZagIbEeHENXUE5nT/1P8s0i0RdOrh0UnU1vKfcc0NI365eFb3Um/aapKe3vs5Nm+4gklUlRceo7aQyqIF6rODu1pa4jBrcJiGZVVY5ihAHjqvJ4HOa+d3wKNS+mLh2zBs4YRfAkcSwjRuHXAsL0RwURjGn4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861808; c=relaxed/simple;
	bh=Bo1Dn3w37seMAP+bw5pDOhXBdEtsC55jIbo6qBxZVSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOX3nj2CDiva4FyyBVytyqkfGb2dzLlIpCLGCXaTvZ2WewXQA8hbp0SLFeyx9R7HM9RwUk5mmaLAE0BCizOZXW487EotrzrKmw8rT03qPsnQRtzXPzvFsKPel7hKTlkdxiWp+EmFcrtPdxP+Q7vCs8Jw8uKh6JmboYCYvyh2lkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4Oqv6GL; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4Oqv6GL"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-403407e998eso2536128b6e.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748861805; x=1749466605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo1Dn3w37seMAP+bw5pDOhXBdEtsC55jIbo6qBxZVSk=;
        b=R4Oqv6GLLaD6df16lbj1nmmT+HNq/u21bPhjUNsupTvST40J6CW+5zKSaPSzeyC2Yu
         ZsdR2J9lij8N8wkho0QRoRq3VB4GC4YfOuuoYeL6O9lA4oEWp1CVxuGWL4TpjBNoymTj
         MU/KwmeLTNVxMXcnjecAqlthiNOZGUh8RDX4ijL2FMLCHQZ9RaTibdElardGyIY7ljcC
         7xiG9kujalVxaMwMtNNC/LrGzOXcUZZgsTUtr4Ituce2hqnlSR4DZb2DpIntaL0QK7pJ
         8Ysum07gZdD3rDvjkDfBc600ymfBF0pfCgveOmy3khWy2eNL6BJO99Wms8XjvdyJHxl/
         gUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748861805; x=1749466605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo1Dn3w37seMAP+bw5pDOhXBdEtsC55jIbo6qBxZVSk=;
        b=flXG3FKb28huclWYgksV/RxR8EKRzBvNwQAWLgfVXUmIujpzP6kDde4W2XP0Ukg6vF
         CN60wJW6Yjc9HmFM0SF7oo90JxANiGpROqZXRxSN+Em+4SIjBSWAYNwTAwaocKyT1mFB
         QyOCVVApOwLkmpwjtBh+cKb01f6Wr51Bj+5/jFg0VNxZLeZNgEG9zwphKTqIvbX+DMtI
         kQcMBKqcN6fXQx+6upCcgsndm82AsJvjqMAQXka1kiD84uPnpWjMbFkcPCer+rGlVLrD
         ybZDvnjR/ZaoCF0h126fuIC81adtgWVBV4YLJ74MLGHodwpZwv5WT25UaZnq2j6wDwFO
         1vMA==
X-Forwarded-Encrypted: i=1; AJvYcCWW8fG76Z0tF24kamGzY09rQAEWSQJjKCAgexL68KrtJ646FNK7gkVw+CvffDqb4LETNoOneVSjiny/8sSHww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvaqr86yu8lqfnSDAYbNyZl1+6vIHVhaGAWJC0mbQMm6LzIOT5
	UlOHxED8jXM4F2r7OUeYxt0azluqhEWKX+aldqukgwuRLRxvRqfkgwU+Nlyy3M6Vkjy6D7jMmKr
	jDsh8TQulNp3Jq7aCHjKYT/DcBWAqOSxH73ZT8JlS
X-Gm-Gg: ASbGnctFddDZg64Cq/pNovqkIL4kwzXqSFzZxu0L1FVqHZpDia2RF/Effy3Sl5D0U2R
	yyZz6DtbxOIea1IzdPkptCJC9FckzZJsRxyuhgHevkPjOfOKSRXCfp7KkE/OvW4HqT7OyZuqR8w
	8ntuEDh6gawGzTeAM9+AmR8NPTnGed4qd2GbsZpATkgOfDDoHCB3wh7QdDIDEFfYNg9vwO1NtbB
	Q==
X-Google-Smtp-Source: AGHT+IGCwnRveAFrn3m1cHd75Jseg91XQxQvUPPL0lIKIgwRZ6smz4rU2A5lacSedSenmk+Jlg2FWjdBjazxr2GujXg=
X-Received: by 2002:a05:6870:818e:b0:2c1:6948:d57c with SMTP id
 586e51a60fabf-2e948cb5422mr4678788fac.28.1748861805503; Mon, 02 Jun 2025
 03:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526150141.3407433-1-bqe@google.com> <aDXPhs79tQGTNU9b@yury>
In-Reply-To: <aDXPhs79tQGTNU9b@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 2 Jun 2025 12:56:33 +0200
X-Gm-Features: AX0GCFsptb4AjM3AXX__0mElF1fRr3ofVuwEuTFh0eet1zbR-ixQIe0moGlg4S0
Message-ID: <CACQBu=Wtd=b+BwCGqXgw=pJdFexDH8GfVXHdnGVcOKD9seeo0A@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Carlos

On Tue, May 27, 2025 at 4:43=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Mon, May 26, 2025 at 03:01:29PM +0000, Burak Emir wrote:
> > We include set_bit_atomic and clear_bit_atomic operations. One has
> > to avoid races with non-atomic operations, which is ensure by the
> > Rust type system: either callers have shared references &bitmap in
> > which case the mutations are atomic operations. Or there is a
> > exclusive reference &mut bitmap, in which case there is no concurrent
> > access.
>
> Here I'm lost. In the other email you say:
>
> > You also commented on the API. The weirdness of the API is all due to
> > the separating "request to shrink/grow" from allocation.
> > Since allocation can happen while other threads may mess with the id
> > pool, one has to double check that the request to shrink/grow still
> > makes sense.
>
> And here you say:
>
> > there is a
> > exclusive reference &mut bitmap, in which case there is no concurrent
> > access
>
> So to me it sounds like if I want to resize, I just allocate a new bitmap=
,
> take this exclusive reference, copy IDs, swap the pointers in
> corresponding class, and that's it. What did I miss?

The two emails are about two related but different things:
1. the bitmap API which uses kmalloc with GFP_KERNEL, and what you
suggest could be done with &mut references
2. the id_pool and its fine-grained API that permits controlling the
time of allocation, which is used in binder which relies on a
spinlock.

My limited understanding is that calling kmalloc w/ GFP_KERNEL while
holding a spinlock is not good, since the kmalloc may sleep.
You can see this "first unlock, then alloc, then lock again" pattern
in binder code here:
https://github.com/torvalds/linux/blob/15d9da3f818cae676f822a04407d3c17b533=
57d2/drivers/android/binder.c#L1099

cheers,
- Burak
