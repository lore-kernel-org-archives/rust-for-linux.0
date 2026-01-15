Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E2325732
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511568; cv=pass; b=Umng2pRdjdTysklKzoSm5LqpxYQjUHBmPXLcOXfK4X4D2Ms8r6ZjirNyvGm+fihctDGYgEJ0WMu/d7QZiPJ4Y2FlCeUmwj9qgtd8buvUHcdC+6YAZ+IVpFlWwxnLl2RnAo3Rb1nMo6Z8LRZqjgUftGnTfj6fMfTF7fTYrRVYNhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511568; c=relaxed/simple;
	bh=eWp2kr5mDcUCWr42I05pJmfkg2nITrvdljuMGPPIAVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aI8DzQxfR+OuUrU3+64fwK/QycXvl0jjQcnICBAwmjenqDbYcKz9BEnh4LrZLRGm4Dlu2xbRNM2mXzjWXJFWHh1HNGnrpYUTkxgoTchmqD1qFabccR2yyAKveIKND6GOHPlomTlOopSOnjQkN8I6HcX1BB3VsqQESgaBYN2Y3Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XE2wCFq4; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE2wCFq4"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ac370cf8c0so136278eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768511566; cv=none;
        d=google.com; s=arc-20240605;
        b=EybNhgmA94E4ms03Y0HPP2jXrCYUI1kJxAlDq2roT0DSaT59DwmVQfl7yyLhamZLDO
         q4QF4FWR7mGSMD6MSkSwybKK/AMbQq2qnI4UohiVmpTIGlY4CzLTXTWeg9U1Sl2R/uB0
         2MOuW/BlXgTbYgolOoIYR7ySvjlPhmlSKHnyYocgEF498juRmWwfFRm4O6FNqeYeN3nz
         PD3shHUlnS9qON+f66onSend8u9s674CPvrHABT+b13Ew7H6d8tG1siJXcqsHmL7z4Dz
         miCrWDI+jbukHAe4E3KkRhg8N9oM9H9x7AGcEc8HwlImLB5zHWK/CnHCR3mcYWzm9rol
         4rHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eWp2kr5mDcUCWr42I05pJmfkg2nITrvdljuMGPPIAVo=;
        fh=Exuffta99R4GJ6w9DC61RbTc1AfbU8gXF2AzGcy8e2Y=;
        b=AtemRtXg1VdQcBEONMPgvB4YeCbOnwN3wq1XqeOZUcaASczgBLRGturi19xD+MdcPl
         ysMcMder5dgwm16kERvbEMeKjcx3oa8pGY/kPggb2JuIBvLExV8WL/Wtcz5q+jA2wwF4
         x2/VHq1dDrN9Va9DHRAjVB3bvTsvQqtPY5dCdSpyHWlTIhnvdLAdla7teiQDUE0ae4/G
         unv39Acupt2b4pEISuLDCwDtCqaSOsI9MtRNdFP/p5kZ9orZh5oBUyJ8pWIh3R8IbYK0
         PiUQ3005FmHQPKnwELwtJPcayXFb4PNqeywEBsko8OCTHxSuPjcRvVfXfUb9rEgqSOC3
         jt3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768511566; x=1769116366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWp2kr5mDcUCWr42I05pJmfkg2nITrvdljuMGPPIAVo=;
        b=XE2wCFq4G75Ui9snd1KyQlMY0Ec406W74mRt/LHgPn3DstOJeptUsXRC08JvuedrTw
         tiyrPwPfwQeZ0CHaCDghFNvkyRHmYWzcy0M2VdrEVbZsXINqH2/u068puphw+RucvUOj
         aXeYMXnbjhnLm8ucP8XviNXKpuJYG2YhFV+xqFzBng3z3yNh4Qv0WC5VayBquKLOk/c0
         8XZNUBsjLm5Kzfjzw6KLVsqRRlsRU4gvmt+pebK9Rs8Nn8o1+uC0d6Yt1GZ1n+9YI/Ka
         TjMtp6A2/cTWOkFl2wIw7aTDu84/hKpqjR2M6qwwgCKdUK9Bz4gaq26Mr7f9wWIwNNJM
         FSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511566; x=1769116366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWp2kr5mDcUCWr42I05pJmfkg2nITrvdljuMGPPIAVo=;
        b=xPykbe9rGrsYO776wGrLl8Cqtan2hYDItUHNhtZyiXRrXZ+CQn36ZhzfagNEvJ3GcG
         8Uk1LuahfGfugHZm1bBSOWssH7Z2AM1ih0YQm0xNLf2pELJOruga1SVoONRpMHSH3F/+
         nRS0JtW24vhNrIpwBTbv5dMXwOEfPn0h5+MaBV7IApZu0OakN9Ob5sL9fIt1w+oXEqFS
         uqmX2A3NhW4yeKtFsCmfj5TNmbNwrWpTeNS+MMfISLZQblU9xUozZ/hzAA92h6G+b927
         jTzv0Imt1jieyUFsNrNF2WxT0877eIOWewSsuifsTBNSSgsd4ewz472rEhO12+USRD1q
         xr3A==
X-Forwarded-Encrypted: i=1; AJvYcCXV5uymHNyJM7W3JY6+GRijcYVQh/2vta4FZtfXrJwRYlf7W5MReePI+2WQewNhOF0QVVFlJLAAM6lOSsh8KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/sF8udHR2vT92U7qOuS3PMy8AetwkTjkPRcAW2xnpszGDbTW
	nkPswUuXW3/dnXArL7pOcBOY2jBtC/AZkEtLKXzHCP1tbczMBiie/zvhG9XaZ6Lc3Cf0a6CPlJJ
	3lxwYK06zmeqxCbf+WVazyRfN08TAENs=
X-Gm-Gg: AY/fxX7/lHe49xt/BfBU0bzzW1u8ZWN+2P9/zaEhlqLf71TbUtNL4SCmYcS9OeAPp9A
	P4Jl+bS5dvE1Gfs0OnlUi2OdReYe2S4g76DoksXcNGwKp7SRYTEuUMUMaIS4qJy8gqwVvIfRIb0
	0MTvUWpqfP8K3NF7hx7uE3HqXxwiB9WjNRLxBNf/6BCDAUCAJ4yNq4NGhUz3ROdFm6P1SnD+2OG
	zT+/5rNS0N/zDbUYJI0iWC7ym3L9HjTCQF0fBBYIuifdxVa1udSrRLGXeS3LwbqpobZE118kjMW
	0xGa1/IcZrdtFccn+FFuQy75EoTRVKamUmKmty+D4YBJpaFp3+IM6MkJ3cJPuVnra7y+f5JpYnl
	CaOFwdYn2+Oo4s3CzWEqi0HI=
X-Received: by 2002:a05:7300:2211:b0:2b0:4e90:7755 with SMTP id
 5a478bee46e88-2b6b41219a4mr443036eec.8.1768511565770; Thu, 15 Jan 2026
 13:12:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517085600.2857460-1-gary@garyguo.net> <CANiq72neLdtGORQ=GMsJ-mVgWscrAw4CB+_2cfbR4gtju4+azw@mail.gmail.com>
 <CAJ-ks9n2pXZWUePZVNbR_dtvtdjZ0uW2NknkA69UsFeUiCV_gQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9n2pXZWUePZVNbR_dtvtdjZ0uW2NknkA69UsFeUiCV_gQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 22:12:32 +0100
X-Gm-Features: AZwV_QgpY9NOETAmWNodXN4EHE24mi60VbXv3TD46aMHdmcI3MGPIvhsDDShtIw
Message-ID: <CANiq72k_=37BXwgkBjj31N48njMSJBB7aT=JT9GV06dVA5OB8g@mail.gmail.com>
Subject: Re: [PATCH] rust: compile libcore with edition 2024 for 1.87+
To: Tamir Duberstein <tamird@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, est31@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:51=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Hey Miguel, regarding the rust-analyzer changes:
>
> I see only core was changed to use `core_edition`, but other sysroot
> crates (alloc, std, and proc_macro) still compile with edition 2021
> despite all having been updated in the same upstream PR. Was this
> intentional, or just an omission?

Hmm... I guess we overfocused on `core` here given it was about fixing
that for the main build, and I applied the change of the edition for
`rust-analyzer` too, but then we didn't update the others, but hard to
say.

I see you replied in the linked Zulip and sent the patches -- thanks
for taking a look!

Cheers,
Miguel
