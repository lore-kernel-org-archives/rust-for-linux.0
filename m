Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524123ABA0
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584148; cv=none; b=pFw1ZRrJDqg6wZCKNIU5WQs4EUEZ1JehffOZ39/3jMolAXyD1kvLdoNacNEzH2mnwol5xlk2JBzvjSBjIzQYbFvtf9Oo6TJ5rQ3S5Vc1ba+6GM91LRfo/fhdMIwstAB74eqAOK6/9hMOrDzpIZFBIuMHO+osvmteSK7yBZLpXB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584148; c=relaxed/simple;
	bh=Kdv3SCKTBD3LehAu6jaHd1Purjf7ZwXpPZqolVK7Srw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nFicZr3wHF00xXi5uAUe19QkPk/NK/WcTdy4gpH+yWVr76mSAxMdY42AdWDIHy6a+CPcn8LX39PdgVL0145j/EUAk3gbxE2afV/zifyRPPoaMgWUOQpD7MTPa4myQj3ZuemRrzFCH+x5nzyhKiJdknxWXkrD3HidzMVNw4KJxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fRiCROMq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fRiCROMq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47921784b97so5554355e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 02:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764584145; x=1765188945; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GpLQJ9dOdiuVACsHbAD3yP25d0qiWHRjxvVpo7GAy0=;
        b=fRiCROMq75jAfPrswxu3H9xPr1MydrKjDZ6I80T/ZYZj7GmO2QnEDAZkbpbP3/C2Ju
         iJCFebSLRbx3A04iAIlmiTYApX2yVmkM+vyCZuipnOxNvcJqntbab5+9aGcTmTvlu67O
         0R3fYFi3cwApAVsAaqbS/bb+93X6T9wYc1c+F0MqI1HBnn6c2jIIM4dxtD3l9/tbqfoy
         kJ2STBw0f225fUhBYSfeo/hdUZZaIK0R5/OKE5CVlauNpg+kwB+b/UwangeWmkqxA7mv
         DWDRiXQ918tcb9Mgqy0R06G7Ltl5Y2N4tpdYnS3/UDd1EP3MQbcmTMYLWLocy1xjTG8P
         /Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584145; x=1765188945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GpLQJ9dOdiuVACsHbAD3yP25d0qiWHRjxvVpo7GAy0=;
        b=c/JajoLq+JjsSgidcA9IRQI48a5mvZiTHtg06tbF6OI0JjH4SBu/WyU5ld0mb1dme9
         Vklr8RRSjT/5wEIsokMNwryIHZNt5zCfvP9DEFswzuEaHS+dmxafnJENpdGoc+7JWDYg
         cWgYB5WqIyq3ymKDkOWSEm+iwSHGy40eHWNS1IEA2fRiJfOC9iqwdFD6v15fY5JzHfW2
         8nQSUZUvrSbDkX3S/fahGLV1Lr9+GRTWDXM2vIiyr/icAzWZwyvIND/p2nPCyuP20xgC
         xbzUEtJWQd91fSZnLHZDhKWTXB6hjgPWxUNFZZGnGawKjWDqA6YSYlnCBE6nGzMsDgFO
         hGBw==
X-Forwarded-Encrypted: i=1; AJvYcCVi6/xQTg7EW4SbRkx5MHLfHaFjI4uWtSWY6gAzL2pqQfT10AATdGNG2LBSC4M1YF87z+efy+UGLwbVAv8ZtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPyOIUf9zcpaaQy51U9ynPMFmZK1bBJyOwf/x4/dXao8ml7nbS
	PA4zHDWeDIaullPQWjFDeCZn5Y3/AkK6AFJTrONnIQOXCorX0tD4eKIHMme9VJ0gC6nBTZvG8/p
	3ABuWu7CvML83VQ/t9Q==
X-Google-Smtp-Source: AGHT+IHcGM4yxisvUfev7D4bMOhqy+0bMfm2V/eSTptG0QxRcGz5aIRvshesctslXJmHO0lGpKA/oZ0RvKl2Yi8=
X-Received: from wmjs21.prod.google.com ([2002:a7b:c395:0:b0:475:dca0:4de3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1382:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-477c1103274mr365543855e9.3.1764584144957;
 Mon, 01 Dec 2025 02:15:44 -0800 (PST)
Date: Mon, 1 Dec 2025 10:15:43 +0000
In-Reply-To: <aS0rkCpdbRu9n4p8@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aS0rkCpdbRu9n4p8@fedora>
Message-ID: <aS1qz6WjjP8E49pY@google.com>
Subject: Re: [PATCH v5] rust: Return Option from page_align and ensure no
 usize overflow
From: Alice Ryhl <aliceryhl@google.com>
To: Brendan Shephard <bshephar@bne-home.net>
Cc: miguel.ojeda.sandonis@gmail.com, dakr@kernel.org, acourbot@nvidia.com, 
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 01, 2025 at 03:45:52PM +1000, Brendan Shephard wrote:
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
> 
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
> Changes in v2:
> - Reworded commit message to follow the imperative form.
> - Expanded the documentation to explain the `Some` and `None` return cases.
> - Added a period at the end of the documentation comment.
> - Link to v1 (and v2): https://lore.kernel.org/rust-for-linux/aSheTh-T1oroAUHR@fedora/T/#t
> 
> Changes in v3:
> - Fix documentation layout for better rustdoc rendering
> - Add doc examples and doctest
> - Ensure function is always inlined for performance optimisation
> - Restructure function so that early return is the None case and the
>   default is the happy path.
> 
> Changes in v4:
> - Fix rustdoc missing comment (//) prefix
> - Rebase on master
> - Link to v3: https://lore.kernel.org/rust-for-linux/aSoY31U3uDI2y7V1@fedora/T/#u
> 
> Changes in v5:
> - Use kernel `PAGE_SIZE` for all doctest examples
> - Backtick the backtickable works in example comment
> - Add new example for `usize::MAX` input value
> - Newline before # Examples
> - Link to v4: https://lore.kernel.org/rust-for-linux/aSzDj1htLp11eCWF@fedora/T/#t
> 
> rust/kernel/page.rs | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..4a0cfa32a5d6 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -27,12 +27,36 @@
> 
>  /// Round up the given number to the next multiple of [`PAGE_SIZE`].
>  ///
> -/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
> -/// [`usize`].
> -pub const fn page_align(addr: usize) -> usize {
> -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
> -    // cases.
> -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> +/// Returns a page aligned [`usize`] in cases where the value can be aligned. Otherwise, returns [`None`]
> +/// if the aligned size will overflow a [`usize`].

The first line of doc-comments is shown on the module docs. I think it'd
be nice to shorten the first line.

/// Rounds up to the next multiple of [`PAGE_SIZE`].
///
/// Returns `None` on integer overflow.

People reading the module docs will get what they need from "Rounds up
to the next multiple of PAGE_SIZE.", and if they want to know details
such as overflow behavior they can read the page specific to this
method.

Alice
