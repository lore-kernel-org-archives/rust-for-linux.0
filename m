Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4091885A5
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766914627; cv=none; b=f6n9OQNXV56UrGRi95g014OZ+Amx3nSZp8cv22+G4+3Y5XlQxc/mKXjTZ8GXYv17PdBiuHSy2OiIxS1j8jBIsfB9GycgxPI9yM9O1NaJijI5LUj/tGtsnhYGADL2xVJXfRErghxtt7AdAUB9RFk19VSGgNX26v6s0yOlRHUcggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766914627; c=relaxed/simple;
	bh=MSq6LbycQU5W2upfVsZcsayr59YiB9medbm/wGrvexQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nntr/XR0bSY3meWinDeCPQitWUBHmqaXMEn1pQilQ6aeAYE1eW+xc7x7Z0jEXikiXU6wSWzDPKQBPTaey7K7vy94jRUQmT3ATLE6Xzn9Z1InpoiFqGENCHtnB9CG4ddlKsYbOx+5wTN6Q85zIJG60G/HVnD719wuIFn3wTZlFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1rvZbw/Y; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1rvZbw/Y"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so34881435e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766914624; x=1767519424; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ERMDcXWUOF83lZ3L7ZeLt6R5vc7OTUYMu1o7eUiM+U=;
        b=1rvZbw/Yvx2N1MQbw7RANorfEDOjbAemMWZCTv0+cfYv1AEJI3fh0K+IPTtuKGx3F0
         9f8AsK3LJ0q0ZFd1Gng3QjfO30RaiYLLqmpUjd03yOkLvByxj5RVCcZexT5l+84pfXJa
         JaYqv5Z2+S6iSREdTvExtdPALBrBhr49Y1R/aYDnz7DVuLdxLOAjeHb+szho1sssHArZ
         inlTF4HXkZXibbA3RzXX46cBEzHlmZmzhBl1Bl4dlFdSc5grQ0puHBK0KxltoZio/GzK
         qoinE8EAxLkJpbL+34ghE7nJuAf8hBPK3ZqEz9yn4QsZUsA8iKrukMb8kBk4Mfrsh3Ey
         0RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766914624; x=1767519424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ERMDcXWUOF83lZ3L7ZeLt6R5vc7OTUYMu1o7eUiM+U=;
        b=D8W8IhmRFnUqKURyV4mLI3fMdDXDKZ75UbIh+lzug31dyFcM6IFQXPiSgeWF9817Dz
         S0uxfh1gwuEU1uZIZX73YvBhEOiM3uYizs1meY6oJ7V54sX6TEBdZ4FE2jHCJ9stWRv2
         lkZL0TkzQb1eGX36wnrOzH2ZkChpcVs8WkyheJNcedRyjYGbBQ7uDWgPtnN7AXHl0EkP
         jt2gml4VqJ3SdvvOyghN+5akjqcW9owCjvHcVterzN6V/EwOmGUMr8yVKslUW4L6Is1T
         0eqDrN6TKNZqSFslhJ6GFjgrc+vU7u57BQ+Y5CaLql827zcUJdFZetUuNz/ypIBEVOuQ
         CFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb+WbCiRCk7tBLC44DblomNTNcAd+/o0vWA7zZOXfNcbaSU1bJtdozgcgHpNlejZ+MVRL7dFfhxHSjhQ1HHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqVr3IvkT6xNNV6XmJiiNxtz1rnxGSmfCN7r5NJ8EKj4WBaNG
	sveO1poXx0x8c4FhLBPDYOykVfQAKX0S2y+8tmuqibPdEfAD7f+NEg7rM35YZXjGzXMv/rfYT9Q
	FOjE72IYWUrM6dJ5ARw==
X-Google-Smtp-Source: AGHT+IH6rikPMb9sJAVrPq49AEUDgYF6ItrNWYlt9X+UZwnF+aICeCDLZPgALinsT8w3MXTNthN6wtjZr+mlFfA=
X-Received: from wmsm17.prod.google.com ([2002:a05:600c:3b11:b0:477:55f8:e1ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:115:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47d1997e733mr212659365e9.30.1766914624144;
 Sun, 28 Dec 2025 01:37:04 -0800 (PST)
Date: Sun, 28 Dec 2025 09:37:03 +0000
In-Reply-To: <tencent_7183098292B42248DA2FAE7C8EA39E3B1A09@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <tencent_7183098292B42248DA2FAE7C8EA39E3B1A09@qq.com>
Message-ID: <aVD6P1j5WhZNMTpF@google.com>
Subject: Re: [PATCH] rust: dma: remove incorrect safety documentation
From: Alice Ryhl <aliceryhl@google.com>
To: Yilin Chen <1479826151@qq.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Dec 27, 2025 at 12:10:27AM +0800, Yilin Chen wrote:
> Removes a safety requirement that incorrectly states callers must
> ensure the device does not access memory while the returned slice
> is live, as this method doesn't return a slice.
> 
> Signed-off-by: Yilin <1479826151@qq.com>

This patch looks good to me, but the Signed-off-by does not match
your From: line. Please update this to:

Signed-off-by: Yilin Chen <1479826151@qq.com>

so that it matches the From: line.

Alice
