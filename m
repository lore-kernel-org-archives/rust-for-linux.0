Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A557C9F
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Jun 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780849830; cv=pass; b=Pz161K9+aKpFWoTNtnfYG28L3ePu0iICSSFHvqw1NzV6vCwZ2Z7VPiumDWmDf++2fubfWQdCKS7buCh6cQeiJZ6Grlq/zEM8YlkUl9HjaP9foT5ODcdQmjJnCUYmf+kdMAwK/6qqlNGRkkpjLU6s+v7V6IktLZh3Mlz1gnMTkPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780849830; c=relaxed/simple;
	bh=g1OhKndBp9USotFFa3lsz2JnsqneIjel1pqA81Dmoqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnyY9Mf8vEZFCfhFDzW8HmyHQGF8lH2pdmbvCuh96icpcSGFz8cEpzN2gsV6fkg+/FEpO9YsCeKaX4P9e0MnY3PB8auTDq/KlxOfS6wdKQoDjxR31J4i5FKJEUNU983RijdFwa5pAKZ6W/EgArXYi8Cd2z5OQ9MgY5UMA4B3yhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCwZfN3B; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCwZfN3B"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1363f6f7535so199690c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Jun 2026 09:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780849829; cv=none;
        d=google.com; s=arc-20240605;
        b=KPS76AvgKm1UwxYHdbqZ8ZoKrw+YVh/RhxjHERn2v1ipydlZREF02/k87mPL1IPF5T
         NafSdza9GbzEASH7TtX8ipR6L4DWJiT6NCHoIGVxIPqcrXLnuKW7ieV2opI1cRCDWBHh
         mDKBZcTqetS9ltlBsxOzrpap9tM75VUHVlYHbo9js50LYjcmjGxLUm9tXv7JyvMh7FEh
         P6yhL3lmroXJuwH3+LhsrWRanqFVuE3OPpYMwhu8R84ftE/wNelJfOPpzqSgXvptMBXm
         sJsksiTlpoEx+UzGVNuMTCkNDGeSjNdJgeqr2CCAmcoEHcK7XZ16llvPy/JXSNl74WF3
         xOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1OhKndBp9USotFFa3lsz2JnsqneIjel1pqA81Dmoqs=;
        fh=+eMxbAyNv3PHeP7K3n7qiqVLI9DPUj2JssxNrCRbW8Q=;
        b=jojyZuQwmUj7C2iXfszlaA29IWXnlLcQ2BGatArvlM3EhKwjuAxUuY/s3I4eGdjTmB
         xo2bzcMh9TIUX93JwWhaDTHU8b2efPWodIl8iBkKoy3wQXZSKyQClYwE7mFpXGi0zNBJ
         QC3JIED9RoJT/QpTv+kRhGunUhv15Ybr3HyXP1hBaiIbq/jfmwZkW7QvNBcVlLeCnGBL
         teWnXcBH+ht3hr5YJ5TUvw8jAUZ10pK8nuJgzz0S/NbzbVFL0s5ph3dRoqTLkYfuLnlS
         fQQjHA0CkqUUEBg9ZEaBgrCvxQsj91RIguFzjM+MXeHR9p7GPbFWojiVqZpUU+RDQuFn
         Bnkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780849829; x=1781454629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1OhKndBp9USotFFa3lsz2JnsqneIjel1pqA81Dmoqs=;
        b=DCwZfN3BYA9LUQ+BhpuRtRNDNl5uiO840M7gNkwCfAyXZZYn7biOTeEzlrQr/OnrdX
         KwETAcDXAc2TE4bp9JmsqXte/Vi+tEw8efvg4u/dF/gqcdvPaohod1aoTuKbRloHwE0G
         BJ3CgJMmEOJnD132abjZs9Dq8B22y8KdfmKF5O6WE+8Dk71I1uekwNEtyEwTFvdqb++q
         K/5OeqNzPfZtn9QF2ptFQBUfykb9jUzEKOg4aek9NWGWAvYivGJtRv5xtPdZ0Fl7/t0U
         DlxVtBbyQe1oAyAYVezWWPIsZ7uqcda3JvGSBFQiihjMNtnQ9xe3mZaBsYZJspsDSzC+
         AsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780849829; x=1781454629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1OhKndBp9USotFFa3lsz2JnsqneIjel1pqA81Dmoqs=;
        b=O3ikgOaRg/aoob68R1uCtcKlE/2OyZ1j9hLesDKfwAuDBYoF5i0sl/3P6EKti/Zorh
         aK0O/1GTXpgzApJFN53jGZ6Avmqb5oSOv9+kL03R7pdLo1vhpf1Ofddiiwj4u/diapGi
         xWl5m6T8wx3r7z7l9vEEyw2ToMc+XSQk6dR3RMCk2dH2jYsvGj91F/IA8cZUmmgAskss
         +3UeuIEVq8HbcXAl1jbs3UDkcqSoBE5fXIWgBaBbgNc+78yCL/17y7K2QIFO06LgEruI
         8QteHhso8MaRRX+fTDvEYYecrMgmmJ77b7X/kYvrOirBo/gL5YYLXAziIRKHcXLRRck4
         q1tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Fyg/xsOIolpWT7waqoGtRBWSBblwr9f+THr7yVng+1GWcL1McNmvgCe0OdkWS2K4uULBDOaOqYx/kp5KW/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaX7Xk2zzJ8+QgdDOy6cu20clLQ+mSpMRzLbZLG9Coxo7Hwd2X
	yync519kT4xk5TCZrbNabCLHF2Y+CBJyOc/wYNjYRKkOWBhLCOczslFH6KofaPuIOTN6WoBJ8qc
	m65vfsPom4xRhe2G1dfhb7layEYRN0x8=
X-Gm-Gg: Acq92OGeAWm0V4ckKOj3RizKcR4SMsiK8FbCzrpZ9MjW/BwAGcJDMnGiKvQTbI/1sCU
	HZZ687fKjW7iR7+t4wQFGgK4z6tVaBr6Ls4FblbuoD5j1EFpif8L3qrSMqA+g47SCwVHgAye+0f
	/jjg6nOh+rq0wDDAbceIURPlTzGdJNTykjqGt6uWxWUkQIxThiAYiPHEZR4EWDCXoETQqVYIQsm
	U1ZUg2r7u1bsl2YOfe0XDB6kZYCySp245+Ph35F5XjcJMExAaEh1parcyi2mITU7H1SeHo5FmbN
	Jepsc9E7CE4QuRVaDJnk8fjw/ywmsa92BumcYrrp5Ys1S4yLJ1m1UrWcv2w+VJ48bqLn6wYLebW
	VK+Kvm4UwboNmA5tqeTnxJnNSirDzOe4Cgeo41aM3+Toa
X-Received: by 2002:a05:7300:eb91:b0:304:e865:f7da with SMTP id
 5a478bee46e88-3077b7d66a6mr3211042eec.7.1780849828673; Sun, 07 Jun 2026
 09:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-impl-flags-inner-v2-1-ad1ff3f7ad2b@kernel.org>
 <CANiq72nKtrhU0ccpS9h+s+Li6eQtQWD-Npd72zih54e6+aepDw@mail.gmail.com> <DJ1YOCK6GQLK.2B3X2OMI93JMM@garyguo.net>
In-Reply-To: <DJ1YOCK6GQLK.2B3X2OMI93JMM@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 18:30:16 +0200
X-Gm-Features: AVVi8CcZO16Pv6zndvDwPnn3ow4JGgKv0VoF0GyJc-K3hVpL5uzR5ehYjoedmz4
Message-ID: <CANiq72n-PkJQgBsmHAkvr82b+BnnfSzaWdQPNzCXFr0SadQw4w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add method to return underlying integer
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:22=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think I suggested this approach because I don't want people to be able =
to
> easily be able to get integers while enums could be used. But I didn't kn=
ow that
> the `From` impl already exists for flags.
>
> Given the case we could probably just unconditionally expose the `bits` m=
ethod
> (and whatever mechanism we use to avoid exposing bits would also remove t=
he
> From/TryFrom/bits/all_bits/...)

I see, so having it really private. That makes more sense, including
the `pub` word. Someone may still expect the field to be actually
public, but at least it makes sense, and using `enum`s and guiding
users to avoid exposing things they don't need to expose is usually
good a good principle.

Maybe another word (like your flavors in the other series :) could
also work... But I don't mind `pub` too much if the other option is
truly private.

Cheers,
Miguel
