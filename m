Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D5433A4
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742543692; cv=none; b=a7S2vaZFsekml3lXpI4oxDqLZmfNU+1pc4hERwxCdH7l0SRjoJFBuXX0MQY6YG90GfUDizJTJK5qTAfUL3/QxEIABg3PhcsAFdFzUS4FjURJxkAiWUJhjOjCQ5GZQGka6S1c/1ErTQF0Ly+h9ebNXDraUVDkwCkhqsNFj+j6HKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742543692; c=relaxed/simple;
	bh=IfxtfZC/DSyx9qgxArTfZTkcfTHSCvHiZx5BHh8a9Gg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JPNGEu0cMh15c1Hcio5D6mFLO/+DYduyTal3A21wgeKafscpALroRi2PW56tzUgmGI8qeGPfnpDMHuvyjNMixC92YoXcO/AE1QPkOAOgo2n168m7ggUQH2K2riSkv8Wtj47q2yWLFkYjrKqBIIhPx9v4pmfw1nfN6QRuqdqmsss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJLLqnCF; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJLLqnCF"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39131851046so713225f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742543688; x=1743148488; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+KRRdQFV3JbNEfysN8wjnaqcelmmd73dgVDwOPrsCM=;
        b=hJLLqnCFQ0T7iYYfJIesJMqlJqLI5CPluZy+xO+SEdCUx2/dV6W693ZQ50gS22zNav
         XnszD93N2sjZq+2WwCYzXCS3bkzfDEp+3V2Fb02+ne7iVkMWtbsfvunpACSUhSFwpDs8
         +5RWA51uUKVthSIsI0Vf8bv7g9WokQSApyQpTnSssbVoKpJSMQyyVM54TJFVUJh3idby
         SrSw7U/qxwvNYxJ8cO3HgxnOovIxoClz5bXz2MN+zaG6s5J40DkCNIoV0Sd2tvjMoTXo
         gNBQncTvG+h1KzCIqziwdp+NKnJPo9e/FBLFIHhFyCVStHtsXBz8l3M75I0yPdkXD+r6
         fzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742543688; x=1743148488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+KRRdQFV3JbNEfysN8wjnaqcelmmd73dgVDwOPrsCM=;
        b=UclIdcTPrDUhzyRKId6WiWReiY1aO2XK5eoCyt/NLFnsCYbDaaurt37kMbG44s73wt
         wD6Uv7bPPMEkG6BRcnF0yIHvebXf2P1nOa4oz/wLvUa8070ON/QeKyosuH7LL8ciFClQ
         Wxb3Jw+cmisYibL5ilM6I8jVAfEpByDH6Mrb/w4C+JY8HxaZEiUCF+DyP7++tJZq3DQs
         KoUtijAGAgpscKEUq5bxM6MoL2IgHceHgJZ7zviijnC9ps2PMQrEpdsRm3LBP/yJwrm6
         6f68Qrr/dT9NmGMfat4nKjtT6ZnV/Dp9IrE56ooOlSTcFAupUkihdnQKv/r55yAfxfNe
         87VA==
X-Forwarded-Encrypted: i=1; AJvYcCVAugJT9CNUlcedspT2IeWualunlBKt/mjAgovvDyZp6icRbUm86xB+Et5hyHJFeLjfCmuYuamGGNucr8Emqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVtjfFEjrCJmKJhKzX9D+V+g1AZeUYoCQeEM+Dv9k7FyGGSRat
	KtZWmM8bt/LZb0z7WPhoQIEdgx5t4R0iCZJiN05oBpIILAtMovyydf5PmS3/c59Oo46bTXcOtZg
	buJxYWMC8qBYN5Q==
X-Google-Smtp-Source: AGHT+IF/QwGTIDerBJ0F5n+udFZJ9M7eyBqfA3cx4U4QzPC2ePLBun9xUCeB/wsQ1CbCiUSMBc51JPPdWHb4Lfc=
X-Received: from wmbbd27.prod.google.com ([2002:a05:600c:1f1b:b0:43d:4055:98e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64ab:0:b0:391:487f:27e4 with SMTP id ffacd0b85a97d-3997f90d377mr2419066f8f.27.1742543688246;
 Fri, 21 Mar 2025 00:54:48 -0700 (PDT)
Date: Fri, 21 Mar 2025 07:54:46 +0000
In-Reply-To: <D8LFO0LQOPQJ.30AC77E0BOH3@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <D8LFO0LQOPQJ.30AC77E0BOH3@proton.me>
Message-ID: <Z90bRpdK7qZio80g@google.com>
Subject: Re: [PATCH 4/5] rust: alloc: add Vec::drain_all
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 20, 2025 at 10:06:18PM +0000, Benno Lossin wrote:
> On Thu Mar 20, 2025 at 2:52 PM CET, Alice Ryhl wrote:
> > This is like the stdlib method drain, except that it's hard-coded to use
> > the entire vector's range. Rust Binder uses it in the range allocator to
> > take ownership of everything in a vector in a case where reusing the
> > vector is desirable.
> 
> Is the reason for not implementing `drain` complexity?

Yes.

> > Implementing `DrainAll` in terms of `slice::IterMut` lets us reuse some
> > nice optimizations in core for the case where T is a ZST.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> The code is good, but I'd like to know the answer to the above question
> before giving my RB.
> 
> > ---
> >  rust/kernel/alloc/kvec.rs | 57 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index df930ff0d0b85b8b03c9b7932a2b31dfb62612ed..303198509885f5e24b74da5a92382b518de3e1c0 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -564,6 +564,30 @@ pub fn truncate(&mut self, len: usize) {
> >          //   len, therefore we have exclusive access to [`new_len`, `old_len`)
> >          unsafe { ptr::drop_in_place(ptr) };
> >      }
> > +
> > +    /// Takes ownership of all items in this vector without consuming the allocation.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = kernel::kvec![0, 1, 2, 3]?;
> > +    ///
> > +    /// for (i, j) in v.drain_all().enumerate() {
> > +    ///     assert_eq!(i, j);
> > +    /// }
> > +    ///
> > +    /// assert!(v.capacity() >= 4);
> > +    /// ```
> > +    pub fn drain_all(&mut self) -> DrainAll<'_, T> {
> > +        let len = self.len();
> > +        // INVARIANT: The first 0 elements are valid.
> > +        self.len = 0;
> 
> Why not `set_len`?

I can use set_len.

Alice
