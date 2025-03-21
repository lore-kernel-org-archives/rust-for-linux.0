Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C71E9906
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742543053; cv=none; b=FZhKyAVVRqbYl9bNQJV+4T35pEN2iDHkPWZAajUpiBnPSpR25WiDlG1A5kO4WYLbEjCONzl00xgzjWET503caGmXLUI/uf4BeA7zfNA+zAz2YGdkhf3E7DeyIq/tjZt/pKE44qddla5MhP+qH+Jonta77YXMWjDgdkhLfpsbBuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742543053; c=relaxed/simple;
	bh=BbW5J7bJ0F/6xzUhLBXbzsRHMWimzxpvWyckCSBAybc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=frMGhfNqH5vsaCyPr4Du2C3UIDKMyQO7v8hha3BGzf1ExxAodP1GIz6gKaWCwgLOi3+Xpk9znaA8L5GzEhb9gHlQWLviNFdSosicDKY3X2HKbg3sf/LYXxP9wklY9S7iM9yexR0d5YQWFSUSdfi7SJ0WpMlA15OH8BXE8UDSXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jIGI0wFR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jIGI0wFR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso9826045e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742543050; x=1743147850; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmkFRH9GaUbe55qgjxHC/Rqmku15Hvr0oI20CNeu9iU=;
        b=jIGI0wFRsZ4+E2Bx11Q4eidwSbuQO5QWMRDDNxhRTfbNCdbnFGJ+A0aVS9ayUM677N
         +Zk0EAhfqcf+3dnECR7/EIJxrWcNiXcriYBDrRfqPZ7MGNUyyruOF/GfVhlVEkBJFvde
         ucCLrjj/+GiKvkEBgp7pp3nvINoSnSB+f0BkD+VdG46Z6xfsC8ey/8DcYwwrXq6EWRs7
         Y/v5iV+c4GxFtcF+I+nGgNeBK+6CRbUrRDzCOxmaKPAm/d2h6umVNfTNCqJetTrC6V6i
         7m3cV5N/4cnPQOcd25FG06NgSv6Yzc/w6ecTFMi/WbqbiW9lJi0rLTSn7xmnHutg0+3Y
         0Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742543050; x=1743147850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmkFRH9GaUbe55qgjxHC/Rqmku15Hvr0oI20CNeu9iU=;
        b=XJmaYOUbJTVhc//TCkjAgaRgoa4HZcYdpWbCj9dZ3ttMmemMXWVQXkwS1tmNziJSAZ
         u7kJ87BamyFP639c1YerkEodfaH+bM/AWTyhL91RBuHJ/8rpLO7lqxsuahdC5uFXxq1H
         evrCcbPvmP3w+C+cVQ+/RnVV6EwjuviWJTaoIr2TX6MzL5cgMK7n7ZXMX0ixZnS0wJ/U
         a6vyglSghjI8oTThV3+DakE8HuMRdei4XReWpCXfDZAXGciXQ3ASACQ3lkNlRzdRfmbk
         q7nYTxaOhCqyjpHuf+tp+6NzzGNZEdgGbmB+fgpTIdI3XdGhJMsDWBgdSDOOKw2YWWMo
         uKcg==
X-Forwarded-Encrypted: i=1; AJvYcCXykug+H1G8/8OLlwayowrNREuARikvGWhthdsjp3S5057aXWYFJVDGNcZOyh3gTCz2phWKuU/AErPYL4cdcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+Ydf12tm7BHbtu4HjaqTer8Bk4JXhafxFDecW2CJc1Ea91q6
	HnfXOur1LlSuBbJptI9jK9giDRyOtHxLnv9zNJV7jhyAv7rtElfFQrMSKLTa8PNymgTPfBHu0VL
	fSkcD/3hPMJjRHQ==
X-Google-Smtp-Source: AGHT+IHusjLFbM5ugVtWBOs5d/FRmaSn72gmCX4kY3Tdaw8+WjbGKM+n4bBd7V+17bKoax+DIVEKZdNpfjdZGdw=
X-Received: from wmbgx13.prod.google.com ([2002:a05:600c:858d:b0:43d:8f:dd29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4693:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43d50a5237fmr14181765e9.31.1742543050715;
 Fri, 21 Mar 2025 00:44:10 -0700 (PDT)
Date: Fri, 21 Mar 2025 07:44:08 +0000
In-Reply-To: <D8LFRQ5IX33R.35U012LFZ06W0@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <D8LFRQ5IX33R.35U012LFZ06W0@proton.me>
Message-ID: <Z90YyLPhil2vBTc_@google.com>
Subject: Re: [PATCH 2/5] rust: alloc: add Vec::pop
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 20, 2025 at 10:11:09PM +0000, Benno Lossin wrote:
> On Thu Mar 20, 2025 at 2:52 PM CET, Alice Ryhl wrote:
> > This introduces a basic method that our custom Vec is missing. I expect
> > that it will be used in many places, but at the time of writing, Rust
> > Binder has six calls to Vec::pop.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 95e752ed27395fce72d372976b74fb1b0e957194..9943358c70aa63f5ad7ed9782cb8879d7a80a8fb 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -302,6 +302,37 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
> >          Ok(())
> >      }
> >  
> > +    /// Removes the last element from a vector and returns it, or `None` if it is empty.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = KVec::new();
> > +    /// v.push(1, GFP_KERNEL)?;
> > +    /// v.push(2, GFP_KERNEL)?;
> > +    /// assert_eq!(&v, &[1, 2]);
> > +    ///
> > +    /// assert_eq!(v.pop(), Some(2));
> > +    /// assert_eq!(v.pop(), Some(1));
> > +    /// assert_eq!(v.pop(), None);
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn pop(&mut self) -> Option<T> {
> > +        let Some(len_sub_1) = self.len.checked_sub(1) else {
> > +            return None;
> > +        };
> 
> Isn't it possible to do:?
>     
>     let len_sub_1 = self.len.checked_sub(1)?;

Yes, good catch.

> > +
> > +        // INVARIANT: If the first `len` elements are valid, then the first `len-1` elements are
> 
> Please add spaces around `-`.

I can do that, but does it really read better?

> > +        // valid.
> > +        self.len = len_sub_1;
> > +
> > +        // INVARIANT: This invalidates a value in this vector's allocation, but the Vec invariants
> > +        // do not require it to be valid because `self.len <= len_sub_1`.
> 
> I don't think this should be an `INVARIANT` comment. Maybe we don't even
> need it.

I can drop the INVARIANT: prefix.

Alice
