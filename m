Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E301943DA5C
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917480; cv=pass; b=BqmSFdtgzWyi8m5DhQMTnS6ui1aRcUlZocmA3995Y8jDd0TMriMo/Lpk70v0aNK3v4lMCmrhbXk4hH0uFzwR6V8hinBJM/0aCY5Ths0dZHLvwIclo9Nh63YapmuzW/gr4D82t1xVqjhMQXmHgN/EPUtrcSGP2X4l7Gv3ylVcMHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917480; c=relaxed/simple;
	bh=OAGjZkrbiq/bQA3jfN6VzfXNX7TX26hRESBiS4kECbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwACmI/wM9ZTENDhgslZRbAtZrkrJ4xeQM7GSU/EPeLpgoMNuJ4KzXwadQu0si3+CMSn205czcpI4j1shhNE2TevHJxqttgvBUSBoxs5JN5ukR1e9m9mOHa8dwCzzwhxjxAIaJgQq50vWnR9aZ/fxB6VobUqp+w4ujjk9XCM1q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH9MBB4n; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH9MBB4n"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12336c0ae91so484241c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768917478; cv=none;
        d=google.com; s=arc-20240605;
        b=j2UDc0IHVrgOpdEYtg0ItgI0MPNRLpqAwn+Q6y5nTMCZ3u8UikaSaA2KJQb3QAGM0x
         usTrxSJSzFzHRzhIE2c504zdDklkPcnWwI6FgZIrY9Yl6ZlEg7T7m5MNLA3SpL9HEua6
         vs8iKJfTQiy6lbnp1KVHRl2R/rP/1IC1Bzwfi3NxnzKZBr7zFY6JZ/z31uMmmPa8rw9y
         NrBpEGnCCbew8tY1V+YQQIvotJva7emS8LmFgFDXt4cDSP2L0SnLrgvUOxUgQSSdBUkW
         zjXLsdeZvDs92lXueXR83XhATErjn5pUQpLuFD1sFxJTrZmJQFVuGfTClFtQBqYgTYr0
         Gu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8CIMHpL2KT9Zw5mKFt7tiXNzVm1VMS6xo9LvlLfyuc=;
        fh=fLyK02ojV8eyTUrS+J+VT6MJTVEzkP5sIzaXLtA+kcg=;
        b=WSuBq5/YEjdjDcAhEeuAHid7AuuO5ihy4DcTubdO9Stt1fLGsHgv3r8BQifMUmdVjo
         wCCQkrvOTi9fnSf1YLU6bPwmYe7j6+ypoAjN98QRcfCh/NlBJ6pdQxWD3Z1BmgpSH92u
         NvnVtX66j/zB3y8yiHxihNJPS6GuQ2WzP2UehiJiWs3SApmMiB0a/zNSmjcKiIMk3Q5q
         yCTB4HDlr3GaWdbMgmKCvSmXa3hJmqcAly+62FjFIWmgDDVBcQslQ1N3z1wUOr6RADD4
         z0XRTCSlPCiqKOQ8Xqh+dbyIBiJuL7aB/fcF53ALOPplQJXc3dRYGeHnfq3jQ7SmAh83
         FrQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768917478; x=1769522278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8CIMHpL2KT9Zw5mKFt7tiXNzVm1VMS6xo9LvlLfyuc=;
        b=KH9MBB4n4cMxPxJUu5hD27LizFmeZ55LccI6MAPNUNE/nI2vI1Ho/jGh/L6V1SjN2P
         qPCpvzkGHGbQORKeGbx8MRF+IGV8m5vXBvjEXpyD5ttOve4IHbJML2ZLu8xeDLjq3Wmy
         0/0DIz1gxpRRwKd68PuBeNPXvffU1QftsYiAyDhrNP9RKwG5MJvB9/zpuu0WSFsy38IH
         eHjA766teRGYqXdVYO3x9uwoqwkgB+juaiN60Rq5/bTuh8TLTpHVHdqhn0S3sGRXvG0x
         K/fPHLltjab5ymYSqiKFNsMSPZaaaWIwXapndCjWLNXNakesaCsNdmumeN18YwZNM2sG
         /V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917478; x=1769522278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8CIMHpL2KT9Zw5mKFt7tiXNzVm1VMS6xo9LvlLfyuc=;
        b=UvMQBgQpIOL7h1e3+33ZolV/6/KnF0yz3mX4Ybiw1void/pqLxZe1ToK1plk0FCV5z
         uOqDHs7oASdjYJ82Pqb/+MAKMjm7hAYF/Xznaj0oyXHR/gOFTwksySuN9hqzJtBEGz6G
         BF+mAchDuxfaPYTJFBelEDL4sMw/rLuoWajY3m2g0EdC8aijoTBJgJ/8KI43JDn/sjiE
         CK5MKGcs/1Jzn0eGx/LQ3PJxfAYKDWERIUeMPW4R8lBBoNXoNqeSpfPL4wi50vwnAe7z
         NYArMVyi7kzLo362e6UZmL4HPE1n12wxp6XzBxV8/9qAVAG+drOdJMYd8P+z0NY2MVyt
         JbGg==
X-Forwarded-Encrypted: i=1; AJvYcCW62xy2I8tCXSpKAtsgjbeM0CCQcvGoU6qgqwG8x2LGWSaZ9wgvvv7mxOYu3A94ZWSif4HXAxLUO7aeUxu/mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1OGFcokgNFPkYObQAqdVHXRdKal/Yf1VO8JUBS0Y4irqBWRl
	sKqiJGtfV3xTyqLqnv9CR4di66RgMdBUXn7Q7CnjxIkwZiQsVxt9DPmFu9sXgSBRjD7vGFnX7TO
	efg9Nkh4Cd4pQ/+qUTccykaNINVSFFz4=
X-Gm-Gg: AY/fxX7bsxJ/rrR77rV39/aQCFvnlCj2VAhueeXEs8KULZJNNhOCWQjpNVl8KTNvF8e
	+XjuB/OK+/ARzx37tEeMexq8JURmp0n3X2pLxEPVLA7falkc/X+YM0CwctLHUSHwqv0hH4IpSbr
	qE9dZaX4tCWFOFC+6Uz5yIVptubRlticxf/n9yMw3duPkvhFFZps/ggNTveOeUScGqvi79t75ya
	dXiSxGOxKwo+yFHVaOGt6mP6mY4ulu+khg6CklZWqr++ycFZSotG2cG/ypAKYWsuUrSw5KKwS3t
	ST+0/1XZwgVPvRtuRDhLucBRSTHmLFXqsI4RAa4pkBWjqeTGILhji8+bR9tv+nCXFwQa+YqAPEV
	8PUezeozKdAAo
X-Received: by 2002:a05:693c:414b:10b0:2b4:83a7:29a3 with SMTP id
 5a478bee46e88-2b6f6afc019mr939495eec.0.1768917477834; Tue, 20 Jan 2026
 05:57:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:57:45 +0100
X-Gm-Features: AZwV_Qj-_UYcKgmVwZHnUgee6jlz2eLrchWIp8p8szSOUtBbAiNy0F0WbiN7czI
Message-ID: <CANiq72kRdBOfa85PnOTEYY-9bcEewerom_LOxucKFs_pBmcsrQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] scripts: generate_rust_analyzer: plumb editions via
 command line
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add --editions argument to pass crate editions in a similar way to the
> existing --cfgs mechanism.
>
> It sets editions as follows:
>   - core: 2024 for rustc >=3D 1.87 otherwise 2021
>   - quote: 2018
>   - all others: 2021

Could you please explain in the commit message the reasons behind the
change? i.e. commit messages should explain the "why" (advantages
etc.), not just the "what".

Thanks!

Cheers,
Miguel
