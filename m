Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1025331A6A
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266703; cv=none; b=UgycdnDXBGsYTyKhtgL0MrRFWfBN0cH8s+hgVydmctxONoiOfVVX9Y3JnNuZkzMBns8Q5QM5fPX0BVv612MOv8AbRf9FhbM3yPK50+fwAny/UI4iJOiYgPsRuFPIPcSsr2/FQZWIvRcjtakXeE2eelbySLhnbuyHf8geGz69Y5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266703; c=relaxed/simple;
	bh=1EOw5Ggu9Wfi7pavgNrvx8ngRISY+tr2B/yldO4qq6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sUorBpaZSI0x0nxol51dtSLfcFWT9fM5Q9P2Sr0nD5HKC+bSohcY5Iw9Gq9jOVuV3Ip8I9sN8kPyJbBAkaQDmGwgSkH/7uqOfjA7KixRgwKZbwT77XP7H/EIBMWQCNjNvCJGnKVvsaQ+8Kn8BEr1+UJ3vUwThyXCMK+sENaClV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1KzjLST; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1KzjLST"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477563a0c75so4528955e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762266700; x=1762871500; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+u+uHpDluZwAzCROOSqwe0ZPAt+3jT3NnXVqiI61y2I=;
        b=v1KzjLST/S3qy5Fx+yBRp2oUSFBsuJyC0vIw6enT+pqVbdgYh5ZQymEG/QoTIvkLda
         oi1FYvna6xGkl+7mJCdXByEpVKs6nMWRkGmRwI0Yj1Cd1F7A/cajElAeVGrq9wxL8rVn
         uPAlRCmrWZiEOwR/hHtwIE6cx19MzqVYbQ0pTQm2iVc5QPEoDjpee9v4xIaoLrOyYFqg
         hcd6rU/AdDHRSDkOYQ8UVzr9wy1zCzXxbfC/ujZpu5sJVJaKWcir9vTd1BsAeymiSk89
         ftaHu2eTfv6JLv1y+HVzlphpPUltbpHmO1zQkUmPzAc8GzgsPDkN0PBNmp0VSGdZnXtS
         +LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266700; x=1762871500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u+uHpDluZwAzCROOSqwe0ZPAt+3jT3NnXVqiI61y2I=;
        b=r9+JeehNoMpjpvOjhp/rJj+hLF9nZmPnMI6dJLU+vd//f0ZoXIvpQgiGrdqpGVRksw
         /8YYK9sDB7ToNgmlmW6wutfrkPRbjc40Nh7RwB2vuYgVQua7q0M1a8jtRtow1eiWny2s
         2YWH1xUdvirMtAXe0idWPUyy+mOVgZSID4jwjDBc3aWxSHpeDXLgpnim+u1sHwqpCOTL
         ZMmLhU0A0E5jC2rx0mYtIkLLs/apJqSXw0EL/b44XqyI6GPg+magizv4BH5tpyRgAfTX
         fXXUdHRofdX4SMnArwIJOXwfvsI+nqtxCCLUewR1NZ5QNNYfgWTsRk/hAUgWUNFDRGpv
         qZyw==
X-Forwarded-Encrypted: i=1; AJvYcCWu6UrENO+1FbwesMbk9fWFGehLN2fDc+edwjhZmG6ain2sK0CYkQIgyouGDl4q0v5WTjoxpV3sdkmyz54EVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUWUKh+IOtKi0FMeW8bJP+QhSD6DoymBC8s6t/xEeEa4Y/ApH
	uB003q4oAYUKUZdMLbvgDuOxN6ubDRXIPnMprUZiCn/SLEKdtDFxpvEiTZknioeDgn54EhzG/Hx
	Z7m5Xe/v8ltf3D4VCsg==
X-Google-Smtp-Source: AGHT+IH444uSch2ikaOVfBB81IZHW2P0WVWlIryzOz4gV0Dg052q+cRf+mC65YrhMXO2gPNE1FtZYRi9P8e3Jqc=
X-Received: from wmpe35.prod.google.com ([2002:a05:600c:4ba3:b0:475:da86:519b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468e:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-477308b2222mr149902015e9.29.1762266700298;
 Tue, 04 Nov 2025 06:31:40 -0800 (PST)
Date: Tue, 4 Nov 2025 14:31:39 +0000
In-Reply-To: <ad2963c2-3d44-4b6d-b975-75a9ea96ba1c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103190655.2326191-1-dakr@kernel.org> <aQm7qLybSn6bOlCy@google.com>
 <ad2963c2-3d44-4b6d-b975-75a9ea96ba1c@kernel.org>
Message-ID: <aQoOS9MQ8PDBYKtk@google.com>
Subject: Re: [PATCH 1/2] rust: dma: make use of start_ptr() and start_ptr_mut()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 04, 2025 at 10:13:08AM +0100, Danilo Krummrich wrote:
> On 11/4/25 9:39 AM, Alice Ryhl wrote:
> > On Mon, Nov 03, 2025 at 08:06:49PM +0100, Danilo Krummrich wrote:
> >> Using start_ptr() and start_ptr_mut() has the advantage that we inherit
> >> the requirements the a mutable or immutable reference from those
> >> methods.
> >>
> >> Hence, use them instead of self.cpu_addr.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > 
> >>          // and we've just checked that the range and index is within bounds.
> >>          // - `offset` can't overflow since it is smaller than `self.count` and we've checked
> >>          // that `self.count` won't overflow early in the constructor.
> >> -        Ok(unsafe { self.cpu_addr.add(offset) })
> >> +        Ok(unsafe { self.start_ptr().cast_mut().add(offset) })
> > 
> > I guess this shows that the mutable/immutable requirements we inherit
> > aren't actually what we need?
> 
> item_from_index() is used for the dma_read!() and dma_write!() macros, hence
> this one is on purpose.

I guess it's more that you don't really need mutable access to call
start_ptr_mut() for this particular case?

Alice
