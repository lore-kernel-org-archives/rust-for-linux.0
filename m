Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A83B4EBB
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555788; cv=none; b=ejEbMTI4fu12xcvkE3jOU8SgnGwmqTBy7cxKxboCRU8H8PyEYprPvml5e0rP1oh+92QzFOaMzrLEScFBnoF5RTqXNiTyUiuIY2a9Ov0G7AtDRrj89qux0sfk1MSea4zCsk6YamcrR+6J8yy0PJ/Wm5iOso5kmkleT9znKwMVWx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555788; c=relaxed/simple;
	bh=ltc5SSjeq3+I8DMgibJUEjdPtlmha9geAJ1vAmZcPSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr5bHV8VNAbLQRty7doDE7qKL5VSZB4/+bLhueFdcFGKTZ/QB6lYs/y8soxiipEwWILg0vN0qqoqSopFk7za5z88onEzjkhA3zBBuwvpcZr06gww4OD4NRqHyLUyEWJkub3djSqVMY4GLwfI3/Om7sAcj7lcqyfsqRmSSKrYSI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YNA36oLz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YNA36oLz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0b1a48855so16515ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781555787; x=1782160587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmxxbxUXCSIDdZ9jQ00QtKo0WNMrpnmSvAUj0tBzqYQ=;
        b=YNA36oLzmGw8TA9c564MSRSJ0tAyEwcGS05R5Qr2KUK5ljHPwMoS5MdYNlqNPaUFOU
         OpyTVk0YMsph0dZ4LK1t2P89zteTmUEuwShYt+n5Eo5psHnSsXMNCmjKKwU45GksLwkX
         +h1bYwi/6NrIQd8pt8sMv6Qwzwx26V18uUUsFggyQhe2nUyn4X8JSfgmHFYcZsxkoY+R
         9tfnM7wojK0aSM/KFAaRflAMjE5zfvvdxErhTONLEmqh3J40ed7Mn/YDrUh4VHvIfcXB
         8hxGcNfG0NdtAyszEPMMquFZ7ilOQzjdwCTolHTEt41NOrPGwjk7/4xnuQosKQ428Lau
         3Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555787; x=1782160587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmxxbxUXCSIDdZ9jQ00QtKo0WNMrpnmSvAUj0tBzqYQ=;
        b=IN+Ddt0WH1QVnkYAxgle+hD9CwqJ76YpJJ56mleAo7MsTmjEkBfHP6vvwhAGMNkkHz
         2web3KmSmxnpqUU9EGoJ/rt9icBrtn0CCqWfAj+fP8Z0s2nd5uxSHP7IIQYe0cUdYUW+
         QpM7NB8SNE7X6rH+rKjQ554GTGog6Q864X7A9GbHVl7aqde7XNSFnZwYHkDASPfFPSuq
         zwxZUA2tb2meEpmjpmlKe1qqkc8h1T4sGQKGcJAVx6SRfNjgpJR1SRRkbB3ud/GoiIJx
         9B/rpNmsdPkFNIOODW36RbetJMyWtDAtppWR+A4Jl2YYCYOsfXJgeITTelpH/HBygpph
         VK4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/RvRr+PA1l8xmkgzV2PFV2qI+z2gsDV78tsL+XIQlQeElR2huJkoEtogDAqN0UxwdsXVV+sGDaS8c2+ySOUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3SVQ+Y4AOYOmmT0w8KE6BQ16Hj3WKOm8TIc3A6QrBqald9K1
	2mlmhbyuT9y9dMrxJKDTFAtt9RzgM9gJ5vG/HLmMUvNjCAidYUkemXZW6PhEH5lODA==
X-Gm-Gg: Acq92OGrWw1wft/pZq62V/nE4JmVCRPV01T5LgJBjJou96A/QIDX8Ld7RMNk5bJrbgF
	z79/pAXx5UdUgj4gxFIV3oi+BGknUxzkrER7WHATw79KJpnKlSME8g+5xOB8ahoO9BluSMT2kRf
	LGr/Iuid0rERGGnQIfpMcS3Nx0LcPX0Kr0JhLqmzcM+2FtRlJp+CZgHPzOElWekLbdVS7I5TYyd
	nrmc2mvH5HjRPe4K5D74/1zlYZ7O0nmCNlZM7UCtlpIUWuj2u1XY3rPRpOEeTyA7khjrm2F+g4V
	xZjVBpcjJXmIIah4blzN6cJBWVuHKt6wLm8Nezf7m0Y7gnF10c1k5Zhe2MBh6OoTQUV2Hk9emT2
	Qr1c+SheQv1r194JEJa9HoW68llAO/tIOsFIydKQuPjUieQJDaFd6NSSQcUiL1GNxNGoBG28Rz3
	EhJZ5WcZWnl//My2YS0eLWzd58IhLETbAl4tpXkUuDnhb0BVohq/xl0SDpRVBCS+Z90XD8M5nMS
	U9mSQjonpO2wP0QgVktLTGcgkXTisSt3H5gnCU1SqyDVg==
X-Received: by 2002:a17:903:1a0e:b0:2bd:a61:8536 with SMTP id d9443c01a7336-2c69a2c6d68mr634585ad.6.1781555786096;
        Mon, 15 Jun 2026 13:36:26 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0a36sm106621825ad.15.2026.06.15.13.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:36:25 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:36:20 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syncrain <iganschel@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: synchronize Rust Binder stats with freeze
 commands
Message-ID: <ajBiRJANx24mVNUW@google.com>
References: <20260615201737.262-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615201737.262-1-iganschel@gmail.com>

On Tue, Jun 16, 2026 at 01:47:37AM +0530, syncrain wrote:
> From: Keshav Verma <iganschel@gmail.com>
> 
> Rust Binder stats use BC_COUNT and BR_COUNT to size the command and
> return counters, and use event string tables when printing debug
> statistics.
> 
> The Binder protocol includes freeze-related commands and return codes,
> but the Rust Binder statistics code was not updated to cover them. As a
> result, those commands and return codes are not accounted for or printed
> by the stats debug output.
> 
> Update the counts and event string tables so these commands and return
> codes are included in the debug statistics output.
> 
> Signed-off-by: Keshav Verma <iganschel@gmail.com>
> ---

IIUC, this should have tags:
Cc: stable <stable@kernel.org>
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")


But other than that, it LGTM so:
Acked-by: Carlos Llamas <cmllamas@google.com>


Thanks
--
Carlos Llamas
