Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012C32F753
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324926; cv=pass; b=ekxfSMfBXGBnCx5PUDQPyIvjdWNYR0ajOOtOwFwAeMm/5wc+UAppa69W1sN6MU5KPmW7A4117qVA6USos746RhldIMQyqeamJox0NrLbXI+NSp7pGxsmeIV7NPZGSzZVQ6zcMZioUjRZF+ez7WUSXRfG6C2dOx3Ng7+mY3KLUEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324926; c=relaxed/simple;
	bh=xjTm4UTRy8OKd3ez41ZxqWldIxjIWM5KqYZRXhAXsKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZYRNcqAZQZ6DDUl5/kaIAkXXyTnBxQH3VZT5FoeaPOffKSiX6ekpKEZJkpo8/H4vIeQ+GX/zc2+BcvByLaracOX1YFMeLi5hDwr5lSSDO2UENt4TYYcncSyQI2RIKCla77+23siw8glWNPFUISNgJeAWoaNk5wZZEqylTU8osw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glPF4Hyz; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glPF4Hyz"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a2dc92dbso63009c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 12:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770324925; cv=none;
        d=google.com; s=arc-20240605;
        b=NuF4iaATe4JwSo/MsXhS2oJKDce2wd1IemITG7z7/YRwvBloDTIXc+hLuPh2qTQAPd
         nLL5wtoqy3xZqzZa//WkhUz+8HWFedAkTBWBRb1wJEsFYMkUuoPqddmEmfhnS46XKtCo
         sR0CJJoVcp1kwMVvQQwXj6/0TD7cUv6X1e0oVHB3Oo81OPZg4rpd1rkNwfIFH1BPs4/U
         J9fHmTNpM6qjOAFaONscIkxug6oUeBIFxl0xyWpVwrl2rrJuSPp0HHYrDY4Rw5YG7xMF
         YPxoDjiBrhYw0SC4VvIYH5y5w9VY9DC/gRSoV9WzMQV7tfnUPa2stWZQ4VQ3XYR7lzeS
         c/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XKZTuSGQUxxiUmKbMSguO9+vRoDm0aoqPfiDa3GzLUI=;
        fh=yt3kCp48Q/Xbrkb3HMgHTFDCWhJZ0uSctOrL3tps74k=;
        b=jpYR0X7A53ELNxrB2weEYHPDUbhOWoCaW2wUd6xKfKvQ4IO6au9X0bLkcW3OnZcy9K
         ebedPSRLcEijwp5oVrvq6nrYgqhfagJl/IPO+tiK6t3BP1ubbQ1OzwDjfX8eXia96NZv
         U3msZi1IqQURlf6G7T/V6a92PKOrBTHe7fbi4wcuD8qBpS+hnyqUOrP1KKx/ypgbaiwr
         /X+bkon9mnaieDAV6Nzuf9DFPekk3+t/3CPSK8EgnMg0KqjKhApKV8OPgSKxmc/qsknv
         B0qYrBVh1opGpsPPQu23Mp+eT8/+inGXwMP0ZItHlsjhtMOpwnj7xkPD3EOIPH5btSPv
         +Stg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770324925; x=1770929725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKZTuSGQUxxiUmKbMSguO9+vRoDm0aoqPfiDa3GzLUI=;
        b=glPF4Hyzs1TVxTuLjI/8e5VHS5F7f8nNvS7/Hxl4jmEdAPL3GRC0xSyxLHD5XhxHWv
         9F9zz/vaQnjNoQm/7Wd6WrWcUa8Fy4DkuiOUfle691iHU24LJ97nhJGx5i/YONJB0NbV
         ghLzrJp+1tIhegz6kx7gjofOJuB+GVNyzKiT1M/CXCvFoI2KHK0u+aV+Y4pKNy8azoj2
         lqk8bsbr1Fm97QN34Z9U96IUZoPVxamqgRhbCw8JuFB7MZ2jGAhTvVVFgyh26RZfZvmd
         SKMho/46TEbUuAtyfCsN8lk9Q427iV0vYQfLcQ6qUKsisfAOk18O9s3cX860AbHtgYRi
         shbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770324925; x=1770929725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XKZTuSGQUxxiUmKbMSguO9+vRoDm0aoqPfiDa3GzLUI=;
        b=KddD43n2UfZ0hXOkK6EizUMHnZXfbCINmy6zTfffb+GHAa8LRJ0lfF9lZ+UrwesDsm
         RQKIilo92u4xDRzqHCcJFXvZWxJ8OZKQP8yYXoPeacc0W8bPkyINnb9BeL/Q9CP45U6N
         AQrFORHOPxC6YZRt4Bt31UIW78jyXC3IQOFhbbleCNhHz0l4YoP/K+REDg2Lq+HSzZ7R
         XN5qyY9DmHbr4d819lJR4lx5OUxbWrObRKY8CTluj4Gdet8sCkBgYpc+YfeAyhy4bC1o
         zRP2jQI+uQe/zSOUPgxSjp4sCq8ZKKRyg0eoUwgBILHTdY4aFJQ/o1bzeUAJgEeWCJ72
         6DVw==
X-Forwarded-Encrypted: i=1; AJvYcCXTsoxX1HoxZui1wJyoQR0OdegDklP3FyyhrPn09mYxdSDCWf3u32I70VZL1Vb6RS7takTZZCEsru+/+sxN/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR+olEy74DaytO7Y5NhW4kLeWvy/KcqTKmPvie4ywcyuGlT/Yt
	bHKCqF1oS2l0pu+ut2bumqViRbjMexnY1pT4M/9nyY/CS4BdTyvQ+MA5XnfKyMfvuuEj7yEEyGS
	0uCZ0jcCHe3RZyK14cFjBFBkKu+nem4I=
X-Gm-Gg: AZuq6aLktiBsOVHJ37GBOOF2QklmdN1j9vBG8+2Uc0jYuW2ep7qna9FEgP6BJaq146d
	M8Q/LiFM15+0n7y5tpUHdj8A5EQDxpecEpM+biZZJ4xgfagDF3YiXaxzZS404Tm1klJueIr099N
	5iIs/AGw/OGM4PIcNLmbuk34D8W0UFmX+QzqJAXmoXTp/NTXEkbpFZxwFDkKqp8lPCU6u16Afuo
	Y53ZQyWVHyymlEv1reWekngwwee0+GDoiw9w47TWWkqjKDQb9SM/5vbE0cQ3++OETgFjR7JgTMo
	BTwyo42uyQGX5X+mSbXxCanOrRX8NWAvOpeZAiiMVU1MWKcwMPabcyeh/ibvteafLM9R8g6Y967
	EddS2oX3mRDlq
X-Received: by 2002:a05:7300:c9e:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2b856496e71mr93609eec.3.1770324925279; Thu, 05 Feb 2026
 12:55:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com> <20260205014218.2202385-1-jason.kei.hall@gmail.com>
In-Reply-To: <20260205014218.2202385-1-jason.kei.hall@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 21:55:11 +0100
X-Gm-Features: AZwV_Qj77gMu1xEmF3bHrvD1HRLq5lq1Wbcacx1GXaqBncTZVSC4BXihbx_yDtM
Message-ID: <CANiq72=38f0dcyt6f3XDf4cZ809cLYghWj+72p+j=w3mFLv=aA@mail.gmail.com>
Subject: Re: [PATCH v5] scripts: checkpatch: move Rust-specific lints to
 separate file
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 2:42=E2=80=AFAM Jason Hall <jason.kei.hall@gmail.com=
> wrote:
>
> Move Rust linting logic into scripts/rust_checkpatch.pl to prevent
> further growth of the main checkpatch.pl script.
>
> Warn against the use of .unwrap() and .expect() unless accompanied by
> a '// PANIC:' comment. This enforces safety standards in the Rust-
> for-Linux project until upstream Clippy lints are integrated.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-linux/linux/issues/1191
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

Ideally, this would be two patches -- one performing the move and the
other adding the new lint.

Either way, the file should be added to `MAINTAINERS` -- not sure if
Joe would want to maintain it or perhaps have a new sub-entry or
perhaps a co-maintainer etc.

> +                    "Avoid unwrap() or expect() in Rust code; use proper=
 error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $h=
erecurr);

By "proper error handling", I guess you mean bubbling the error up
with `?` or similar, right?

There are also other options, like using `unsafe` sometimes etc.

I think perhaps the best is to keep the message a bit less strict
(since there are cases where it is OK) and put the details in a link
to, say, https://rust.docs.kernel.org/kernel/error/type.Result.html#error-c=
odes-in-c-and-rust
(Cc'ing Dirk who was involved in that).

I am thinking of something like:

    `unwrap()` and `expect()` should generally be avoided in Rust
kernel code modulo some exceptions (e.g. within asserts in doctests).
If the use is intended, then please justify it with a `// PANIC:`
comment. Please see ...

But I will let others comment...

(Also, please Cc all the maintainers/reviews of Rust and checkpatch --
doing so here).

Thanks!

Cheers,
Miguel
