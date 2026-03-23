Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE64324B16
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275870; cv=pass; b=TlNdELQxD9BYmJOs3iZ4vnNUkreEfC/hgCAGYC9sNgdnENjgMb2iXdfCarEEgXHZrCq4RUkBUwj1VtTYQT/lteFn8uS1yeozZInmwPlyEHW6c74DHgjvFe2tbJk1QBV39XLCSnjj/NnhleXWvBKL3KukKqf7nIEuKSFVEX9/Wz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275870; c=relaxed/simple;
	bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L56QH1ZC+akDg6fljnyQhZ9bONtnxPkUeph/S/LMPM7XXUy20zhijj5JDpP/1VVUmN3/iYhQ7tEEOd6oUMmlfkO17wgaleztYX8yVEyiZkVobLvjehpyFKlzMVxI7tyV5TTLkfLQNtBETWX7Q2MLbYuKeS7FjRLKxBsDk1lwNCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANvQ4kEo; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANvQ4kEo"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso154322eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 07:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774275868; cv=none;
        d=google.com; s=arc-20240605;
        b=IvufbwywcO9g4VQROXbsgrpBk0+TGJGRgCwslZnEkJOEzCmn+x8KXFfFP6qzc2fbhV
         6eK22Ffz6fKZePIGaMsYyNmFRz7pTA5PyDg4rJYUOCVx1mpu1z/KqX/jVYRW05FDQgCS
         2f2BL0dC8IbSPhVdR4/aL9JZREjyUtJDyFulWNFPk/Ne/O4Hc/tRTIqbhYJfawG7bKDO
         4gNsvcbhE8enrFQOnYSmZZFzVsFe6efUWK419ZL0n/xOr7KnGvf/6VXD5JIgCbM9RO1P
         z3aa1lypckfdBSSkR6Pd0QpiJmMiefhPAPTS+UYQPLmqF4y6XwFLmXyAmpX2azhiDp0x
         llfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        fh=Hps0ggN28szXp5tRYmTtjjA1FIPqVDl635ZmCJnj8VI=;
        b=Zl0vdeSLDTDp/UcYR/l8YjPfslzLu0JnfSg5678X9lFygXVBMt/EN2eamqgdRmAZqI
         kyFksRAxDNcz8vFF5TOVhyJ6rNM1C0PMHfeNrHCQ5ufAPe+OcDRwmqA3GXy4PuTRz4Mu
         5eEZ/I3jpJSYpvamPAAP5efhch+cYv4YjMBFBVRSUovOtiU/s2wVJFYaGQeR99NLc8mr
         JbeEzgQnqJ2V4xYgnUmVktdVjJst3/vB5cnwkvUPfCnw2Ck2aVuH89p8kTRaZkQJ6nud
         sNqTMXDlqpEBcOJdQNEiwvqm/CU2ZZBKinijCgpAsTbn8Uy4vvkeBAxmOg7HpqO6r3T1
         0MUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774275868; x=1774880668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        b=ANvQ4kEowX6ctjhFYCqAZ/zTnBV+x7PhMgRa4RksinhHtMHKAuk9BeGLKuFOR20Nte
         NaWoMzcw/FRyGp02rsA1jb5x+aNAuyttYez78eKImwJL3kkg8H1Kp++sbIjP5OOU/drw
         M2IjZ/An3vK9LM3ommwnf24ZcWutl+fzy+9LNkpgLOaBb9UdrcoymxHHSgMyHsfnAktn
         h+oFn4tRymVdusCWl30JyIoOwgLX9liY7FQg8lDTR5GuobEdkoYLlZuYrP4rs7GxNjBx
         iyBtt97tBIXiBSQrqS5HVo3s8XOHyiJAP2gF2UAqSKjeuxFFkai2jjfzJnyKA/bV0rEx
         kwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275868; x=1774880668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        b=ctkcRJFUAKnQuekQzYo4YxMEWIRRIRozA+VrBpRywb8Py7RtowGdB3PN0uHK78Zb0E
         4Ot7rSf9AwmkG2ZCQ9+mnkbu6vyRFR5okQfNpnbV7gSRy8oohNSGNxppFBaLfVazfGBf
         Db5bmILziJsTfVAKBH3g8/PHFs5xwQ3pm7+3VWjeveF9fgj3UrROAdreUdYiINQ2ZmNW
         1qp/yPJD5DpK9XrSJO/V+c47RvPdZqpSKI2LqNFCz9AJIOMGQw3Ne9Q8i1Q+Qu3FrZEY
         Wv98SOMQdNhidj5Aay1cIRuTWgHg/SK74WTipxuDGwhanDRUoI+S5cKn0uLSaaAObLme
         9CBg==
X-Forwarded-Encrypted: i=1; AJvYcCXK3E3RPFa54DOk+xqPHRmzummoPI0d0ygJo7a4FT6wVbKRZ9Ui732XM3SkigB2myncbYpN9Z/kbCarKXA4AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiuA5RAt0nh7C8/P7vanwHLgR9MBggLB/byoB0MGW4PeQvsCFg
	nNxRBpq44frqgIXDfrBEppJ5jsISpMgFXHLFck9E+CdVJtNy0oXW0x7JJ6dLITq3gp0XZVoUAsX
	nxtZOQHfz19ugjuQnE7fPyofdBT+8JDI=
X-Gm-Gg: ATEYQzwqIS2x9+WB8mRjLWOomeSLKa6lXNILfoEGei1xd/o1LqY9rwWZQD0Fw1TJw2N
	d5L26G37MZ+DMqAdB37bLHu9lnMm6YZHutKeWMvd9p4v+2R04vBM/lOq918N8lXPGqSgaNjUB9s
	BDqZNmgCtDaogxSq9ArJsN1Hda2fpK3l2X1fb4E1F98w16NYRMkkclytTwIpyk9BaCrRXOx8NUJ
	9N8LTrrChuTsyzNWImHcTTfwE3nkUpiCP+v+EmHlRH/Epbrjy8TU79A+hhM0WgwAglRbwIH5Gzy
	B06JNSpaZidA3XGt3VVn8VRvA9ytkz8fd9hkJ5acRWHlMCJ3zumSIF87nrXmRbQccYDfHD5slRv
	x+EOy7lzBNdc+NsuEk+Sk/U8doW/ZwAWXWw==
X-Received: by 2002:a05:7300:dc94:b0:2be:6e6:e479 with SMTP id
 5a478bee46e88-2c10956b92dmr2532830eec.2.1774275867800; Mon, 23 Mar 2026
 07:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323130224.165738-1-ojeda@kernel.org> <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
In-Reply-To: <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:24:14 +0100
X-Gm-Features: AQROBzAmfgdHr-kq6MIVGANQ2ER2Fz1DKErHcHlGdKPXdISrZZm7VssL1t98GY4
Message-ID: <CANiq72=umSRNNRP-KoFFSe1vYtUf_U3hQhRkGSuLp0F1eQ-0dw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Aaron Ballman <aaron@aaronballman.com>, Bill Wendling <isanbard@gmail.com>, 
	Cole Nixon <nixontcole@gmail.com>, Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, 
	James Foster <jafosterja@gmail.com>, Jeff Takahashi <jeffrey.takahashi@gmail.com>, 
	Jordan Cantrell <jordan.cantrell@mail.com>, Matthew Maurer <mmaurer@google.com>, 
	Nikk Forbus <nicholas.forbus@gmail.com>, Qing Zhao <qing.zhao@oracle.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:46=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Can we avoid cfgs by always wrap things inside anonymous struct?
>
> The comment says "This anon struct can add padding, so only enable it und=
er
> randstruct.", I wonder how much bigger the task_struct will be if this be=
comes
> unconditional wrapping.

Yeah, we may want to do that -- please see
https://lore.kernel.org/rust-for-linux/202512092319.ECBB8613@keescook/
from v1.

Cheers,
Miguel
