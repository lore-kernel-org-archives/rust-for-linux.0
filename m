Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747F15B971
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231727; cv=none; b=ecUzi5X1uM8wBhPdpEX883Cs7MntRs7CBLwWMi2BnMn9yfftLD63JioatRfioRIy1YihTs4iFHndiS0GabATQEVCFyGFegC0eY2/aAN71GFzogdXourBxw9gR0wsxlD8ycTTD6o1afDUOblA1qYfXOBmAryTvmzm41PO1QPBLgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231727; c=relaxed/simple;
	bh=r9Er4jRBIPtew/bgT7ovEHgwL9mrxO4Zty80eV5vxbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=seopiKIIurg5qtklsAL9K48l9vDRA87GgRwCcEqp9PAQ90TVaHQ7ufx5UM/wjWEPXfHXdVMYOYvZEPejFDqAtaCGK3h03ZOlQhl1xbE8Usv5x4qYFr05fs04g9ZXOLP1EpDWmO9kMSBetpRnOSz2sJp3XKSyPfdpqr7DIv/qhKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trRAFSIy; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trRAFSIy"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-437681ecd32so2489375f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231725; x=1771836525; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=giujmDKKRSBKpyYtDZgeWurVeUo8sMxl5dMSo8TDoOA=;
        b=trRAFSIyVIzNcokPY5V+uU2JBXcyHb4Cm7QjBYRv68Aehx586g/1peLYucxfE3GhXr
         vESY7F0RoPGilUEDwx1A+ExBBmOKmySqSjID+aLfEyDafqkO4ZUR7+xID/nJhbJ69a79
         6q7r2rB2CKGaJK8ibPQqeQuSSIjSEK5sQQauss8tXo2rpHLX1DxSmc/3rHSPi5hzla/T
         vrKZRTliLe4mNb+sf0/uHuU610kEE4FMUZP0SLDnSvXy6ECvLnuFIvB73vBeo0kMwsem
         wJ0ul2d+7NowvDyvSfw5vXBygCvcYgb511QPKaVZckvW+5thQqwtKSQfG2RVJKkInRd7
         iKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231725; x=1771836525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=giujmDKKRSBKpyYtDZgeWurVeUo8sMxl5dMSo8TDoOA=;
        b=Jk0w/kgskmnVqxPMp54c1mGNkhYR6MVw9IbojVu4hXf3C0qcCV3ntqApWzhrS1mV4q
         4qMh3MA9rvupA0VFuzAr0Ps6kCLnw9PxbFxdwGHS4Xi3Yhzscbu2NrAs7hybBz0jOs49
         VjA3B5wqPxwvM6n671bhpQ8T7xubKFyYAMpDuEgS01phvtR/7VBw14AL1qr60XmuujOh
         sk/B+eTbbefb5GwdTl4lp9OEbYJONJBnjUf7/93tGd8oYtrYHlJckHKJtXeZBVrp+GfD
         7lpgUhSS2lO9T05D76pbKK087AK5f5iW73nPD1stymth/pjwmSG0FI7HLu1YzqGc535Y
         UFjg==
X-Forwarded-Encrypted: i=1; AJvYcCUHCLFkhid+tSnwQDy6qG9F83mSdtmjffq+viy44v3sUotQMFusWD1qqdTDvXKFjUJhgWxAvH2yxfpTb/ANIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXREzLs7wseqat2l/ItvLsmcF+mQrOlWrAR5Om4D3C1IeDJ8lY
	cb7uErPqbuttxhfFqwHhZLgcPeHixTZ8/Kd/sMjg+6GEnqFD3MIfChGWY9XrLKI/yzEI143mZE0
	e4bklxXbQKmBr4VzjhA==
X-Received: from wmjs4.prod.google.com ([2002:a7b:c384:0:b0:483:fe4:5332])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5308:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-48379bf78f1mr113161055e9.27.1771231724550;
 Mon, 16 Feb 2026 00:48:44 -0800 (PST)
Date: Mon, 16 Feb 2026 08:48:43 +0000
In-Reply-To: <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
 <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org> <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>
 <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>
Message-ID: <aZLZ69umB8rA2La2@google.com>
Subject: Re: [PATCH] rust: alloc: allow different error types in `KBox::pin_slice`
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Feb 14, 2026 at 03:56:43PM +0100, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 3:40 PM CET, Benno Lossin wrote:
> > On Sat Feb 14, 2026 at 3:17 PM CET, Danilo Krummrich wrote:
> >> On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
> >>> @@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
> >>>      /// assert_eq!(s[3].d.lock().a, 20);
> >>>      /// # Ok::<(), Error>(())
> >>>      /// ```
> >>> -    pub fn pin_slice<Func, Item, E>(
> >>> +    pub fn pin_slice<Func, Item, E, E2>(
> >>>          mut init: Func,
> >>>          len: usize,
> >>>          flags: Flags,
> >>>      ) -> Result<Pin<Box<[T], A>>, E>
> >>>      where
> >>>          Func: FnMut(usize) -> Item,
> >>> -        Item: PinInit<T, E>,
> >>> -        E: From<AllocError>,
> >>
> >> I think we should keep this bound and just add:
> >
> > The `Into` trait bounds are the idiomatic ones for functions consuming
> > things. See https://doc.rust-lang.org/std/convert/trait.Into.html:
> >
> >     Prefer using Into over From when specifying trait bounds on a
> >     generic function to ensure that types that only implement Into can
> >     be used as well.
> 
> Yeah, but isn't this only because of [1], which does not apply to the kernel
> because our minimum compiler version is 1.78 anyways?
> 
> I.e. are there any cases where we can't implement From in the kernel and have to
> fall back to Into?

Probably not, but it's still best practice to use Into over From when
specifying trait bounds.

Alice
