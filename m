Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCDF17555
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762387832; cv=none; b=UCPmo2dQkaa1iVv1xff6SC4OGnxKIRwu36frbN6FPngy2bP9Na/J2BxBITwIOthFA5X4ajtr/N2COOVzc4LEOAxLJ9zB219zTbMiPtfB2M8eHssYeTyXanTQ3vssyrWQilB5jFPqA4M8El1lHRCab1KGnqCbSveLFZpmlSKctvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762387832; c=relaxed/simple;
	bh=VZGvBBOY5n9aiSHLls0zUN0VQCgJkVL6n6j7eOSV6d8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=omhbqBtLB5NgBspwwJrK9YwuSzok1p1H766s9tx/y1eDzu2kaSA+Xc739S2r25zoN3wOOLr4829rSkaDZUb0k8RvZDGhlpb9INjADbdRYFPSIPFIzeNCT4G+fF6m7hPNxJZXxyd2AkUbmr3kdolU8kRMogUUes+aNr14pf3JVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3Hoa/Tw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3Hoa/Tw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34188ba567eso368220a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 16:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762387830; x=1762992630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmyP7uv9lwXmguCvliU9sYIEGeB3coEfrde/wup8vHk=;
        b=k3Hoa/Tw4MC6znYUwIQF3WF6CACUU7pneiKZ4vvB8104FAQQXt4Nt2Y1hNCOCAyQFZ
         lwzgQCOwDDQ6uOLujziABwBh/DZy+1JyRlGgcJ/JZ8nxMT1rLvH8k4FH5IlvHO61vVNN
         zc8PMg9WNtmPekUw/bZbmfMwv5CZqqPqdpfkwz0YMk76NxdNs8ozvHilxHPBV6wwaKAw
         x6g9aBlBjRYUTbapRdKsL091A3uSkRXpJV6e+/J/cwNOmTNM2xcRglNXrnZ+RylC41GG
         NzlPgXvShUTgabmahyaJ6ecv2fdQzd3mxy0gwxqgwX9cr3ms5aUNeuwKTGEu71CDZ2Hk
         klLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762387830; x=1762992630;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmyP7uv9lwXmguCvliU9sYIEGeB3coEfrde/wup8vHk=;
        b=PTgg4jQT0ODicyNP51PJKDo2MkSkDNUJ9AdMkstB56WwMrHUj9ZjhPCBVfev6Xhxws
         VJb7UZVbHl/bwMJjk6UUaLGQr8E2P4e9tTPr/JtlXSSOG5xZ+GEFQ25JMcrtFx7du8AS
         qZvMRMGaGlwqn8yTWIjmD0X0y/pYi2uB8BSpbC4UMeq41tP+cgnnpo2+XnTvXyYjmEqK
         JlkIkSnhsNVcUCDYtTzU7DkkV1WgqU5ZjO4Yfo+p/FPJ1yTl0ULjaEfcfecZZGdicGZT
         3go8l3+wLYOs+/nFi6dGQuMmfx1+XagZxNaWGkfBj5LPyzFz8b+HtCAqWpOZfZm/rWyR
         P/1g==
X-Forwarded-Encrypted: i=1; AJvYcCXBg+4VTrSMU1kjqo4HfcrSsVG/3uTjVJ2zlleTOu+yhL7W29CqIG5EYKi645wl2hQnjHtjBxP04GKcDc6T8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQE1YBC1VRsgJIzwLIMUw2SwImQKIkTgrjaZCcO2jyDy6JD0jF
	2Ysge2csKyIgkgnWTyL9FnBfk4HppKXFixnHaWvra8Q72uxvlwSachal
X-Gm-Gg: ASbGncvr/4J3WHPtT2S9JuItmJPuE11VNEEOZ8Zwq3geE7Vxm3hhNeJ5BURHUHi2s2e
	ivI+hJg5BktmtnTcXrmo7KWpb5gSKNQimgvUqQHfe1Lf7RyWlzYkaeSoGCDAwoVUftCTodVDd5F
	W4GUqNItyRz7GvfhdCb7dMMCt+nVxANiacJGc6J9sBfZv16nrVrmVfO7XcrF5/XIXNxXlUR1q7/
	Hj6pPoCsVwOBGTLGF9+g2N3SXhj21oNiFqQAtnKdBpORENhVdZS7t6weHqNmNU1/4P+MvNysY1U
	DUB3Os4o6JJ8CbVOi5jY0fHJKw33FDQb5DtGIvLFD/l4TzPmIAvWxGoz7QtUmpNDSPrJsE9J2OC
	0l/ZrO6sYBH8yQZTODohP9go0OcoptUMGxrDCq0VyuExHceWjWxFL02GA3XY/vQB00PMXg2/T3L
	03yhMGmS41Tl0pPmCfFHJfIEQkj2IfPQha8yjsg8oJfsfdlGyZUG9VWw==
X-Google-Smtp-Source: AGHT+IFmvM92IDkT9DM1JH3Q5kafzHsN4ud5a1RMECzitV/wZdDl9jI8XlRCnh2su9EQQ7Jz2YkUPg==
X-Received: by 2002:a17:90b:48ca:b0:340:f05a:3ecb with SMTP id 98e67ed59e1d1-341a6ded3a8mr6203653a91.28.1762387830099;
        Wed, 05 Nov 2025 16:10:30 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af82bf14d6sm615160b3a.66.2025.11.05.16.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 16:10:29 -0800 (PST)
Date: Thu, 06 Nov 2025 09:10:26 +0900 (JST)
Message-Id: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aQt5GR019t07U0Nk@tardis.local>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
	<20251105054731.3194118-2-fujita.tomonori@gmail.com>
	<aQt5GR019t07U0Nk@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 5 Nov 2025 08:19:37 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 3dd7bebe7888..19553eb8c188 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -110,6 +110,7 @@
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>>  pub mod of;
>> +pub mod once_lite;
> 
> Would it make more sense to put it the kernel::sync module?

I actually considered that as well. The OnceLite structure could
probably live under the sync module.

However, the do_once_lite macro places its data in the .data..once
section, which can be zero-cleared when a user writes to debugfs
clear_warn_once. In that case, there is no guarantee of any atomicity,
so it doesn't really fit the semantics expected for the sync module.

For now, OnceLite the only used by do_once_lite macro, so I didn't see
much benefit in splitting it into separate files.
Also, data placed in the .data..once section should ideally be of a
type whose zero-cleared state is clearly valid, which makes it
doubtful that OnceLite would be generally useful in the way that other
synchronization primitives in sync are.

From a Rust perspective, data that is shared with the C side and can
be zero-cleared at any time might ideally require some special
structures? However, what we actually want to achieve here is simply
something like "probably print only once", which is a very simple use
case. So I'm not sure it's worth introducing something complicated.


>> +impl OnceLite {
>> +    /// Creates a new [`OnceLite`] in the incomplete state.
>> +    #[inline(always)]
>> +    #[allow(clippy::new_without_default)]
>> +    pub const fn new() -> Self {
>> +        OnceLite(Atomic::new(State::Incomplete))
>> +    }
>> +
>> +    /// Calls the provided function exactly once.
> 
> I think a few more comments here won't hurt:
> 
>     /// There is no other synchronization between two `call_once()`s
>     /// except that only one will execute `f`, in other words, callers
>     /// should not use a failed `call_once()` as a proof that another
>     /// `call_once()` has already finished and the effect is observable
>     /// to this thread.
> 
> Thoughts?

I don't expect OnceLite to be used in cases where it matters whether
another thread has completed call_once(), but adding the above comment
wouldn't hurt, I think.


>> +    pub fn call_once<F>(&self, f: F) -> bool
>> +    where
>> +        F: FnOnce(),
>> +    {
>> +        let old = self.0.xchg(State::Complete, Relaxed);
> 
> And we probably want a // ORDERING: comment here to explain why
> `Relaxed` is used here (because of the semantics mentioned above in the
> comment).

What kind of comment do you think would be appropriate here?

