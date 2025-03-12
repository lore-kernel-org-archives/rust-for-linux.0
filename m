Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5AA1E7C19
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Mar 2025 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763119; cv=none; b=KzRvHKnVFWliwb7ypHw3LaLCbv8TxCT6ZT1QubC78ie3eBl0z9I91NwdcITRhEJsDpkrYrm6Rj5+RTAP+r1/vbqnaSmsmqmh2cjW0+8BWRTAgjYxzmXDkJe/bx9lyz5lKh9X1N9A/fPBsaKXnwY0mh5remwHNLJIXeL/CyXWvok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763119; c=relaxed/simple;
	bh=FEbOfK0ey8liI08NuyrWFEw0OniKYYGH/Dmyspp9NK0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eCekHggdL/z+UgSpymBc/Elb6EMprmOkGRt3IKrX2JSZvWqpMomB3nsMLh00jBOErnOgkNRsESSfMT5No76/LAAzE/iRlT+Em8zwImHDSTpLzwwXOY4Eqmb2NIstYiQJs5Sw13U9N/T4zTuZ40CLhKrMytslnbNvqCz3hG+bjS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sm+nUs7C; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sm+nUs7C"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-438da39bb69so44504495e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Mar 2025 00:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741763116; x=1742367916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BN7/p/kplLMFpVggVcZWXKc7X2r0rN1QbraxZm9iOA=;
        b=Sm+nUs7C9bvjtcgqCePQxVmqXIj/dbrZRMzxDsmCBFUVQC9FWsu1TBnO7meGex8Qdc
         Oy5rexENJBiPS7AW+EjdwgRvG3Jq7dCdlueQoCG+/WVf9CMRrsSpWP83W18qhcz/MbsY
         nwTCiXDH/xogdQqLG4M9F13Z5jqf7/7SmUeewVX0H1EOJzYUCdKXRCsJFQmgALw4cZzP
         7CNAJxvpqRIipLPuHuWddDhhpJGT5YsM6Si8ukHiXkzCSi5b78sF2FHy2mUcmaLDP7Lq
         tH9CGsrN3caWSgIGntkHpbkMjB88tE3PXCEb4Mk3E+IDl+v3ONcnMBg9SWYRAxGxAbsx
         Y9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741763116; x=1742367916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BN7/p/kplLMFpVggVcZWXKc7X2r0rN1QbraxZm9iOA=;
        b=l4kUxTcmu9OrPtS4jxtfQ0blNDRRvR3OqlB5WaDYcx3OqXcodUoflKMv4D6JJtJD25
         lW6amFWxIpmqa3Nmrq0WzuZGJ+ddDQCKkEZUiIMQzsqswNg7IQUBQwRDlxKV2y9SZuQu
         YtGE1W60VNt8PENedB0h+8wd7YdKGdAp2JVaqk2l17G7rjoYL+DvikzmPS77HDWYWWSF
         j1Y6VisMBacx422qH49vQhPf6w/7mcy4xE/oH9NByeXDzymFEVoE7c0ztPIsXHQ2/023
         L2LLbsxgrvG0xf503nmuM0Lu/XiQpYXdsNGvMX5QI7suL2CR7gjZ+4KEXUnpWVtFBKzm
         JgBA==
X-Forwarded-Encrypted: i=1; AJvYcCUnNoFKHDweGXoL7GtoH9yTNiBPKgxilBxR59jaz6KMmWp99/dSF1BAHXBFcQcoGDk6qGFp91TE3mjAczHKdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWy4Vv/CDzenhzdV1AGrlXpjExldAOwTWM5sXGMJJ6l+uMdXhg
	OsM3QQHEx/m5jNw4Q5blF9if2aHgFZjuVMg3M1fly9bUEwMPlEwx3ZJfyHo/WXf8EMWxcF5gaWu
	5TYf6+WvZoNvAfw==
X-Google-Smtp-Source: AGHT+IE1Ndoas0phFTS9IKILHjYozDjJaUSr/37ugbBFiqmfz/CZUAbv+FfIm2JiPMaXQyasqJT6X/8dogmc6jE=
X-Received: from wmbbe15.prod.google.com ([2002:a05:600c:1e8f:b0:43b:d6ca:6dd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43cfceb0aedmr110482365e9.11.1741763116368;
 Wed, 12 Mar 2025 00:05:16 -0700 (PDT)
Date: Wed, 12 Mar 2025 07:05:14 +0000
In-Reply-To: <Z9BLc7P2FKiJAo2p@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311-iov-iter-v1-0-f6c9134ea824@google.com>
 <20250311-iov-iter-v1-4-f6c9134ea824@google.com> <Z9BLc7P2FKiJAo2p@cassiopeiae>
Message-ID: <Z9EyKgrlMVwBagfu@google.com>
Subject: Re: [PATCH 4/5] rust: alloc: add Vec::clear
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 11, 2025 at 03:40:51PM +0100, Danilo Krummrich wrote:
> On Tue, Mar 11, 2025 at 02:25:15PM +0000, Alice Ryhl wrote:
> > Our custom Vec type is missing the stdlib method `clear`, thus add it.
> > It will be used in the miscdevice sample.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index ae9d072741cedbb34bed0be0c20cc75472aa53be..2d213ede2873cef87116a5527e8e24008c970a58 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -395,6 +395,33 @@ pub fn into_raw_parts(self) -> (*mut T, usize, usize) {
> >          (ptr, len, capacity)
> >      }
> >  
> > +    /// Clears the vector, removing all values.
> > +    ///
> > +    /// Note that this method has no effect on the allocated capacity
> > +    /// of the vector.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = kernel::kvec![1, 2, 3]?;
> > +    ///
> > +    /// v.clear();
> > +    ///
> > +    /// assert!(v.is_empty());
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    #[inline]
> > +    pub fn clear(&mut self) {
> > +        let elems: *mut [T] = self.as_mut_slice();
> > +
> > +        // INVARIANT: This call changes the number of elements to zero.
> > +        self.len = 0;
> 
> Please use self.set_len() instead, such that we have to cover all safety
> requirements enforced by self.set_len().

Will do.

> With that,
> 
> 	Acked-by: Danilo Krummrich <dakr@kernel.org> # for char-misc
> 
> in case you want to take it through the char-misc tree.
> 
> Ironically, self.set_len() lacks your invariant comment and corresponding safety
> requirement, I will send a patch to fix this up, unless you want to. :-)

Go for it.

Alice
