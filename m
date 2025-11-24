Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE5B2E7F1D
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976863; cv=none; b=SEaK7YgoMboxfG9+H7k5UNVmpzYxgHBEXW2XGv6UQp8pAX/ysrAoc0GXWfy5MMBa35OPCKYlmUUClKot3AbRTjgbCyOpRDAbXYLWpmJVSZqyTmQpLBhoQCCjjIWLKUPDSt3m8aF3e0tys86/Kubm7VXOq42S++FPLjJFg2wwumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976863; c=relaxed/simple;
	bh=LDlTAi3LSr6VtjSJ2uDZPnNYms1HA69Mh0eqqO6nCr4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eZfV3tE1fzc7gEb23vkfoc9t97tUj0R5v0tHTcTT88tWaMhJb2nzYroiGQ5q4CKNPfk55sxHblyWgHh6Q8kYGmR5JWzE1S8JMBvbBrr906hJwJzl84ZqHsG4niqgOr9MHD6NBGO8aVglEUdDE5VKVuvzr27k98XjFbGYAklxRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfJlFcD3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfJlFcD3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so34289115e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 01:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763976860; x=1764581660; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiEWKVTpV26Kp0m9NO7UTLohVhVRfRIj8DxXW9L3Qkc=;
        b=IfJlFcD3u6zdajG3W9E7q0v2CxQu52ZQldxzfYYrhrPODm3upUfFiSRso1l2MKfGHE
         IQRcYy7W3+Lf6ghC2s7nBnaHbkHwjNOveZCIz0/qX3uXCNnJZYwW3hUl7GWKo1sFHIWV
         SXqF654x1s/lupF+otBd4JpbvfowTa7fT1U4HUphmbkQU68ekiNr7K/x2Q57WKbeisb3
         wK/rEKJ9hpt4+tqRwK+0zuAAdVuAoCSwWL99trKTC40W0cHcKSRGntaRzKglmTIXptMC
         KiRalTlw4v4PywcVarcTVvJOWpkUe51S2Cr3sxZSzfOTW4a/wnbtw0SmzhrNn+X7a1+g
         XgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976860; x=1764581660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiEWKVTpV26Kp0m9NO7UTLohVhVRfRIj8DxXW9L3Qkc=;
        b=ne2Z3xmR429XhOjapKP41fCH1deOjg9BaXIGJuHO3OZTd4P5zz/IfBzCjf3I9RJRIu
         hB8E0DYx2rW8jS1aJixL85OoAnP8m5pODukushMOgwRsk70Yy2k4symozV1cK87U5lcv
         rlMnNst/fZEHgMJS1oUclUHI7rNGVqUf63Hk43MOYUZ7v2wZ+vu8xxA25LZrXiqDnlGb
         mM4usWgbWoMyM0Sby5KlsnJIx01N/peCvr7vzmal53r5S2id7qO+P0f/y3DHfc4OuCTi
         QjLZabNQtv6gx6sij/12Sx/mYJpYyw0GjweLKFtoU0K2wn/aY3unTkbpVec5aSJTMs+g
         PyIw==
X-Forwarded-Encrypted: i=1; AJvYcCWmTFcKLzxelErqMs7JDDwcPz2evtslloAA+RPFuCFps1dbzlpAhqpvZcGGDtI1mKuv+5Wq5dhaKdhqQwmQBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX3dQVrzsh2cOXgIyw+hw6jpxZmFtUWAxkghKqjANoDdxYap5v
	adugYZ413SA1kQwbOF/UK5oGcZikhu2vJaaDEhoMWrxMPdGfaCW56Z2Ng/ohYGAYfWedLst1L4S
	6ZPwl04QqfCiQoQzzDw==
X-Google-Smtp-Source: AGHT+IES0oSYdajY95Fl6ic08kLA52v8NitYxFu3XFh9EK/Qqq5G86kCYtHHtgZ6x/AImmcWR8n1I8eukpGbHdo=
X-Received: from wmfu22.prod.google.com ([2002:a05:600c:1396:b0:477:5546:738])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3553:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-477c0174840mr103449195e9.6.1763976860502;
 Mon, 24 Nov 2025 01:34:20 -0800 (PST)
Date: Mon, 24 Nov 2025 09:34:19 +0000
In-Reply-To: <20251122190908.259929-3-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251122190908.259929-1-knavaneeth786@gmail.com> <20251122190908.259929-3-knavaneeth786@gmail.com>
Message-ID: <aSQmmxRzFR0Bqj1v@google.com>
Subject: Re: [PATCH 2/2] rust: kernel: document safety for as_str_unchecked
From: Alice Ryhl <aliceryhl@google.com>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 22, 2025 at 07:09:08PM +0000, Navaneeth K wrote:
> Replace the TODO safety comment with a proper explanation.
> The safety of from_utf8_unchecked relies on the caller guaranteeing
> that the input bytes are valid UTF-8.
> 
> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> ---
>  rust/kernel/str.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 5c74e5f77601..2801388c6bd1 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -385,7 +385,7 @@ pub fn to_str(&self) -> Result<&str, core::str::Utf8Error> {
>      /// ```
>      #[inline]
>      pub unsafe fn as_str_unchecked(&self) -> &str {
> -        // SAFETY: TODO.
> +        // SAFETY: The caller guarantees that the contents are valid UTF-8.
>          unsafe { core::str::from_utf8_unchecked(self.as_bytes()) }

As far as I know another patch is deleting this method, so I don't think
there is anything to fix anymore.

Alice
