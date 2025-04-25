Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925BC230BC2
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Apr 2025 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574251; cv=none; b=pJKGz3wjQj23U/8rMsfRtOjM93w9SlnTidlW6RqWL89lHHoEyWiSM21g3JYmVVdnsskHYdkEIBUKeybFMY13R6leqjIklp4ox8aNhbTg7X4FyuS9nlsM62jlRpMfoNb+shoqj6lJf0dVDdXbEeAaMeLjN9BBwJ1Ujbwq/ret9es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574251; c=relaxed/simple;
	bh=fZew+jJus2gytW3cO+Y9jlJwrXmSiWRybqM6Di0D06Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C5FgcGhLPojowZmVJwpUor7ok3bg7OIoHFiGdZq3/WsfjtEPkEZpOUS673YmBhKuPReJVtbkC/GIgoSZRm8Nn+6cem6JJ1/s4m8nHZAAwWSuGP8BvqlOjj9VVYR6jKnirQR3cO6i3islmF+9uhfJ19E/8BMtEF+BxWfInXWuP2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gtLUs/Rl; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gtLUs/Rl"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so10087095e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 25 Apr 2025 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745574248; x=1746179048; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxQzKMDWRQrnwuVuAWGLjcmgtTd7unQZgRyK+RcAqRI=;
        b=gtLUs/Rlb8s5USgGxZPWAVhZKu9qHABT4ws3XQAjM+QDfIdyaYbm0E9dA+O6cpwBeq
         +qT/O92NcT5i9VI5rlEm3Dghh+INbAFNMRVKQocbua/YPQ6/UXE5/z+2cmzyfzWaMCZE
         u3V33v8FBW0FsU6evBrSWD6LBETV3tHqTfHXP5DAUnpoPHYZDAVjNmZyT3+49QokPqam
         zfjFpxiD2c8/SWJ6kRugOsXbRrT012HOERFxnxDYIQSi5qMScmWSaGKHuyo4xSrzQI5l
         whpAVbmwV0jFw+xu5K1q8k1q3F+8dKSO6p6PJggCJUO4z+7MRJ7i86YqXAVhEtOS+0F8
         F4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574248; x=1746179048;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxQzKMDWRQrnwuVuAWGLjcmgtTd7unQZgRyK+RcAqRI=;
        b=wM/ByQpy83rDz3hHxR+vXaGcaL8DNckPEkeSoPEPmKFCiTEadd6DJVouF1+Vwjjo0c
         tsnUa6gL3wpFcBRoZ6tDwGoDkey8UAc5E7bReXkaxLXZC82mITZDw5N95Horl/6Qplw+
         JxfDXaweKUcxdOt7siK3uZDsNU6iW7o8GY20fLvbHCURuPXbHYwOPcsz8MBWcYbn+C3y
         qp9UdooHy/er+s5g0FpEB+4JUaN7hvcwgWFL0CSWmAp59xub6Jwk2mcR9Pt3nT+vsKwx
         uHmYUwxWUe3Hjwgtsk/C+OCK6gMrcITDBrjSS8N5Hx5ajk2xElcXSM49TV2vjDamLSvB
         om8w==
X-Forwarded-Encrypted: i=1; AJvYcCURrWvYPNhIAekl7aRRZht8BPv7RWNS5JoPl9CSu34FfhHGMF5nK1k5sZ2OAUiUcDoXl14Dp5862BcKu8SJ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHVSBVuJRNKLfm6zauKvx6po+lwLg5YXU7BcCafu3rAKcL6mi
	pQpVQra7+mhtIujGwjs76XBfdeeSRZGofQqG6VjcEbeYgv9qcbzA6/vhgQU5+56tzsCy2xf9Tmo
	m+Mirn7Zctr4JvQ==
X-Google-Smtp-Source: AGHT+IF/8frHwqPrXc7xleUxAfzGag/PFxjNmE68ghh5UwGbcpWgHGnO+RWO40bmSM/2yXU1fB3jVE7TgpMshfo=
X-Received: from wmrs15.prod.google.com ([2002:a05:600c:384f:b0:43d:586a:9bcb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f52:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-440a65d2b2dmr13568465e9.9.1745574248106;
 Fri, 25 Apr 2025 02:44:08 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:44:06 +0000
In-Reply-To: <aApniKYrVaDsu60S@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com> <aApniKYrVaDsu60S@pollux>
Message-ID: <aAtZZgeF5GKdPcaB@google.com>
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 24, 2025 at 06:32:08PM +0200, Danilo Krummrich wrote:
> On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > 
> > +/// Reads a nul-terminated string into `buf` and returns the length.
> > +///
> > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > +/// then the buffer will not be nul-terminated.
> > +#[inline]
> > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> 
> Should probably be named strcpy_from_user() instead.

See my reply to Boqun.

> > +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> > +    let len = buf.len() as isize;
> > +
> > +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> > +    let res = unsafe {
> > +        bindings::strncpy_from_user(
> > +            buf.as_mut_ptr(),
> > +            ptr as *const u8,
> 
> kernel::ffi::c_char should always match u8, but should we use the FFI type
> regardless?

Hmm. Should we? I don't mind changing it, but I guess this could be an
interesting discussion point.

Alice
