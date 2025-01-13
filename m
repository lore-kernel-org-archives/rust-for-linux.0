Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64123A0E6
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779367; cv=none; b=GRJOGlREKXmkVhn2q1be+vW74QXsKa0NCURRH5WUkIoEwlmN5E5lqJmD7S2k2dJFs1zUPNDjlC3CiwbubRLmv301/5RYLjxNFDUJAeL1L7iQzTLlQRURRIJd5oxEElOHQ2QVPPpv9RqmR0L/M74fVtgw4bj5JsdY9UCG2Hmzf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779367; c=relaxed/simple;
	bh=HYY1Dith/Ir3/cP1sPA7wowRtfUcAiaQwxIyA6BOfaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIrgu2O8Od/vhvQmZyUgmg1RhrDRPaKcdyVRyYa9okI1cK8r2j3Mv68xMX/jgrj7qJ++UjKzX4x0DX3soiRvCkLywg/qfcWkGkZ/+R1Et5QABKI5vx4X1nLtbKBsLxVhfkvIeGJUahryi4xhtoIolV0TMxJ412DAkOgy8/RWKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDXJtg+e; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDXJtg+e"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f615e14d0fso452234a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 06:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736779365; x=1737384165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qltxDRXvNwCnwJ9II/l8QXuyLftY0v1I7ynNRI80Jn8=;
        b=XDXJtg+eQE29MVfTTZwR+9GxIIrQas1fqA02FtlrjZGDizD+XpHloRGGgN90qEBDN7
         tQ/kDXW5MBHxq0HEXqwERELsSW7TcArTFytd6Cdm0qMdLnvtVRndDxTPvGdncdgIL55x
         NOKUyOswin1kMsex9qYpq+y8wQDF3nkMdDE9Np3otaceKQOQpQP/+87OP4UMWZnL3ddJ
         folBZv4s0YAUN4YMjQwVt1T9/SCYrLpSZp0VGq9fnXnXc95J+DCFuxlBSHBfqiIhq2Re
         Q7Pz+hTKvEmNOZrPxBdJutnjI+0IkvRtik+o9CTUQyP9gXGmu4WaT+vH1vTdlAI7bbBX
         C/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779365; x=1737384165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qltxDRXvNwCnwJ9II/l8QXuyLftY0v1I7ynNRI80Jn8=;
        b=rfZD3YwFI5utmA/1Y0tpKPc/7CKyE8ZYDANzjKckfRhI5h5Og14oRb/uhteuZKL6Be
         izFTsP/un8g8EUjvN7qQq2CYOP5zIKw7quBWtSXEvr+LsHBnJLllg3yKwq+TvRExoJBW
         VugPvKygcZLf2jLi8vpJPE5CCKklpH2NR8b8dHdDLe2mp/JRE31AyjAW5CQ/Eqbf2//o
         YIsVKKrC8qn0lUsli55vR/ZsB34o2rMEmsgSEYPHQKmoaX2JY59xE0zbeMzYEPkvVjND
         2qIKYaGQFwYdSGLBjLW+HWdRfT347drgpcqJ7ftSmzkIWwKk7GrTiVy1+xD39GkzJ/T1
         AM0w==
X-Forwarded-Encrypted: i=1; AJvYcCVl4FI3IDCuf+m+ZxF44Wde5d+PMT+6wExxkkecVC50LtwCEAZFgkLq51lxPTcpeesJOq/7QdabI4LbvubhkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfrLF66qc1Vfk+CCJy7Tqt+VkQ48AuJGKRkl/E5LjN/wMhM42
	xmSnUGw5UcjBw9tQ/fa2DcWPweQ4phNyftbfN9emASsCTKlK0f3IR2vqXm+wtgHGTlFacid7K5N
	VGqFSSPgIbUzEIgVhkQ7sdsQpD2Eqs0dk
X-Gm-Gg: ASbGnctCeHoodz7Ldwa3p3v4eTHkLwKyqk7amY/ZX4Fd3qUr4b9RYTnEhyODuDH/yzT
	+8QZ8nqWwQoraUy1bsgkAicxhJcD/dPPRiGBM7g==
X-Google-Smtp-Source: AGHT+IHE10Z3TaDzZATM5GnPW6RHEeoe3m6UisYKF/8YUNyZAS2IlV7OrMQTvhaW9TnzLu7KjP6B03iQfTlta3bM0cU=
X-Received: by 2002:a17:90b:2b8f:b0:2ef:c419:6930 with SMTP id
 98e67ed59e1d1-2f5490dcd55mr11557988a91.6.1736779364897; Mon, 13 Jan 2025
 06:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123095033.41240-1-daniel@sedlak.dev>
In-Reply-To: <20241123095033.41240-1-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 15:42:32 +0100
X-Gm-Features: AbW1kvZRz3gEroyggj7hBaQT6pmSQMCMlpH4i9ZAnI6wHYnGRJalEQn0PGcNziA
Message-ID: <CANiq72ke2cym-VhN52vCm_Ujm+Z1=SnE=SL2y3JouKhjYGKt1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Replace unwraps in doctests with graceful handling
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 10:50=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> In the following patches, I touch on error handling in the documentation
> tests/examples. There are multiple occurrences of unwraps which can be
> replaced by a question mark operator which should simplify the code.
> Also, people typically tend to copy & paste code from the examples
> (citation needed). If we leave the unwraps there, I think we can convey
> the wrong impression, that it is OK to use unwraps unless the programmer
> has a really good reason to use them.

Applied to `rust-next` -- thanks everyone!

    [ Slightly reworded commit. - Miguel ]

    [ Fixed typo in SoB. Slightly reworded commit. - Miguel ]

    [ Reworded commit slightly. - Miguel ]

Daniel: in the third patch, there was a broken Signed-off tag (with a
"proper" SoB in the same line) -- I fixed it as mentioned above, but
if you didn't intend to sign off the patch, please let me know,
thanks!

Cheers,
Miguel
