Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300129BDA2
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583951; cv=none; b=ruj9XzWV3S6ijGcDC+mFUvpj1p/13CWftqzl7qMlP8IKD8ROR6pVETdx9Ug5g0c6FbUhCxf+MNPzgH05O4BdEDT3R7Hunshk+UExFnxkjtrMVs/CoirKyN8/NU4PnguGBGI1tTqvhlQcQ2/fjlnMyHRqJAlbQU0UWPxRIwIvFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583951; c=relaxed/simple;
	bh=b726nZknlbe9H+/++lomsJdo+2jt+ZOW4mKUjJxRTd0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t0raL6e7DmZ8gy3RH/xXw+vPPMsmEq3ugNvBmosTiuRY01ooUp3zyjl/qCf4yudA/lM+pMFYnbdDuBpvMlLksu7mFIQEsHKHDBn8FETvnkUuUwP94Za8aM2Nf0P/HOk/RdE3idrvvqvn9OrHso180SY61jB/yugD5ky91XvYYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HeKGAKL/; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HeKGAKL/"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b736eca894fso321674666b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583948; x=1765188748; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zWRwUejBm9BKXVzUoav9cs2vUob0rmYezsnq2zTgDKI=;
        b=HeKGAKL/u1tXrpFZanaSDksDnHfmskTg2G0vIU3PqNg+219TmMsveVTqhLQ2QwL4Es
         thvnTj6LG/dd1oyJtvhm+LD1v+zu3NArCnA9DO73Bw56/xLyh8SrN1k/vUQjBp0VO21M
         fYVHFil5azHQpQj/d8Gh17oq/ViuyMiYpb+Ekljxve5/5vRsi1UCExa9ErQ5ml2ZHQqY
         adfqkVY+szwrbOoRQr6Ny7WgKshYXH0/0EZlQ7A2EXn0oCSZvJ6Y9IrcCqDOILs/EhRc
         ooAzCTdyiRCKBcznrrSLXAsdH+MVUYtRwmYkXK0oICiI2evAtLC/uQfXhke9LFOK+vgl
         xQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583948; x=1765188748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWRwUejBm9BKXVzUoav9cs2vUob0rmYezsnq2zTgDKI=;
        b=PwXwYueF6HWKbJdL6cX+nbClQUv8+WiX1DzwdzaanNCTZzXA5Jlxbi0u1ADqXOR2Hh
         Vaj4R2iN2nK+/IdAQr9Q0Oi5UThfYsvNiH4WcWRrjIgp23rGmyYgfOpvjwlPBA1skvFf
         LhpJizg4x6Oo+3erFcdcn4WiPB33DBXaAu9oHyYZcFy0yu8ZectvP+ZCkPdjqKqWO/cS
         cMLgky5ngeQakJluy78fVU0mRWYXrIe4H1tRFjcCwBb68bbqZtdCXn8XvbwAC4UycazT
         TVJe2mgC6prbaYyDu6uccJsoz6e1XVmcYaQK9aRjmB5eBNJH13HLn6oFqEUfIVREckOW
         5sPA==
X-Forwarded-Encrypted: i=1; AJvYcCWsNshVTvYbHJux1dT6x9V/89SMsROlVk9/KxZJ1WpEMWTau1bKt9+qa+yOpFLKUXlfHek8EXQbBZgDosuR4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8aRSJzXzlKW/smnS6BSYYOsFUhhO5OsMKfIVeXbPX+BE4DH0
	ELAlRioy2HkNGJ/VMQx5sRhhN2Mn9ix8vZ+Mbv+L0ebv35zWSHKD9nM/hbx2Joj4plt/60+siuZ
	OaclT8KMD77hXsrJQtA==
X-Google-Smtp-Source: AGHT+IFXoejl6BlNF4MzrCpuVuIpCdgqw9CGI6wR6ByG6Nhg/Q2M0hoVPH2SzRL1V5qyn/aHMEZ4oktF9KaI67Q=
X-Received: from ejcsn19.prod.google.com ([2002:a17:906:6293:b0:b70:bbcd:93e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a22:b0:b73:8c6e:cf6f with SMTP id a640c23a62f3a-b767170cccemr3988317866b.32.1764583948141;
 Mon, 01 Dec 2025 02:12:28 -0800 (PST)
Date: Mon, 1 Dec 2025 10:12:27 +0000
In-Reply-To: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
Message-ID: <aS1qC_ol2XEpZ44b@google.com>
Subject: Re: [PATCH] rust: num: bounded: add safety comment for Bounded::__new
From: Alice Ryhl <aliceryhl@google.com>
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 01, 2025 at 02:25:16PM +0800, Hsiu Che Yu wrote:
> The `__new` constructor only performs a bounds check and stores the
> value in the wrapper type. It does not perform any unsafe memory
> operations, so it does not need to be marked as `unsafe`.
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1211
> 
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
> ---
>  rust/kernel/num/bounded.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index f870080af8ac..cde1b8ba6880 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -284,6 +284,9 @@ impl<T, const N: u32> Bounded<T, N>
>      ///
>      /// The caller remains responsible for checking, either statically or dynamically, that `value`
>      /// can be represented as a `T` using at most `N` bits.
> +    ///
> +    /// **Note**: This function is not marked as `unsafe` because it performs no memory-unsafe
> +    /// operations itself.

I disagree. For the same reasons as str::from_utf8_unchecked, this
should also be unsafe. It creates a value that violates invariants,
which may be used to trigger UB combined with other safe code.

Alice
