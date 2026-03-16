Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678793DEAF8
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686117; cv=pass; b=DKy5o+DxNXiPp1o5VanrM/v63Du57qfpPg5ADzCliRF+k0JcRWTi4eg0P/AS4Sru1NYy7n1NcZqXVh3lPXlRfKwa4aFmVDB83UnabeApgQsF/NTkZ0EZfEoHQgQxIB2OQzwz8rIfxybSx0bmPSVYsUBUFgJovm+U1aFzlBOtCxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686117; c=relaxed/simple;
	bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6M7hz9dyibYK3tVZtDJEb+F+7hZTcaXOGZSkmvlhkXmCJYmo6NiZdLuxbVmwufQes7Uu1sTLF43WoCHqsdcoNY6X0l/Zqg1/qFrEvKan7Kv0yiIjSnUYkMmjn2DPJkDSrpacFzgG+iWTrWlsQ1g3yEZY4099pucthT+2IdxgaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgfOIo9N; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgfOIo9N"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bda3b4318dso369786eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 11:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773686115; cv=none;
        d=google.com; s=arc-20240605;
        b=MlZIV7w2XZOJBuYq4QUi3LdySo8nc+ST9SV7kizLD8Hb5Dwg72oyz7NMy2h/LXndbD
         1PVcz5dPnEIaFB2Ta4XJOl+QodzUs+UaQpqKINvWieTO0pEa7FzV0dzEdOQ2zFBx1NHM
         3GikixIYCk0839Xs/bhZTFdylGnQphXlhMa3g/DViwyl+ThyFqL7vw1T+ooNYosmH8TH
         5QLwWwPRJuQ8lKEkziXFrSMwLs1Lwu3OdEE3oEqNJRKll4r39I0GY85Qdad2pAkF9dSL
         DhYGt2yzlDUCkwp1RbhtdcUS5zfbRhIsEo6TZwVkyKH1yIs4IrNoWVxkBGA3NMqWZ2sF
         jfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
        fh=hoFWAtdbywQ4JCfKfh88s+6NqBwUQli8HJMRYaBeZp4=;
        b=W48OJ8or3wIIoHKc00E4xDUro6ywDDGJm0QCNCMkWBeNEAKM0fnaPOfsHknFBB1Voy
         TWenyogBWeBw5s6ywgUYw8XlMA0GumVv1vuoorPpG8ZK+Ca3fXZc/96XSdH3lLpBCaO7
         9x/tGKuAfMzl4h2fDq912sdCBKY8YtbmXFe5b8OsRWL6ZmQ7vt+0gi71Opvj6yr22dqy
         MMwRr8m9hZyfbKJYtCugQUVqC7+Brp3pZO3iMCumTnn/zOC78IMQj8H+y305RM2w8AHK
         5Q51hA6FQFWu3IBuiIHOHE6MBI2lyuI6WNgqvxNU37Q8gtMztK7CyFeHoOIEbFNtv+To
         4fGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773686115; x=1774290915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
        b=PgfOIo9NFTBVMF+ATh5Gcn6P4hUNo5p/NIQ+HKvLfpgNvw0yPfbZ3GFJ01Zeg6FjLk
         j7tayGKIl06vhTvH3cpLPDoSn1mIFOlAeR3cqSaKi23FtkYCHS+D5ny5LOazVTnaKK57
         YFVNHN2BwLAOGQMEUTyvd3mGQoj1PBv+PLiVA89Tx5kxxWDM1W6fB2ThMimkMog+uKA8
         dQs6yZg2Ma0MXMPoKQ6xlPUeyoUWJhFyKWqxJ7GyfptyvP0rOEEM51Z6NeEdWPI3oNA8
         5W7zg+tufKCm/1YICqQEt1g7iR5pielc5hxVmC/Xy3kDniH8e0PLEPB5ur3ZNuu+rDSM
         hazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686115; x=1774290915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
        b=nl+OiZmalIizUJNSy78rJUyy4VZwfdu/J1Yl+akpypOWIC+vwalZRir3mmbSy3R8cQ
         FCiwbpZBelLjIaQj5MjWmANeavxb2wVdY0n/ZpDj2ugIosFoGr1JW8RPfenRplgfDnJs
         8y+WLOBgF8Q/y1ykDDMxUOTZ/QhXWHbVhu7g/aN07HSTcz2cBuC+lHh2iBjgCxKrN2h2
         t8Iu4fZrL2beopJ7KOwW4GwsWosg48idgDPVqeDb6Fef+CR1wYRG4+uf5GKIL/nn7dAm
         +BiOvkVA7iUTMcdYjDqXq3CUg2O43jmKSWYxgNl4Sm4Nqw94GoTQJFGjG+Vx+CdXA+cD
         Px3w==
X-Forwarded-Encrypted: i=1; AJvYcCUlEKyLgeWn4M1rtCRiNF/jgtQWImIAMRZvxL+c8MiMo/Uj4YpMIEwQ35THOVo6e/GLCm8s+vw9St1je914qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJqNSDNLyEFqanPJqthRahdz4g0hA65SlYiFAzhhHrKV+9jpl
	lDCSyY60fqiQfr+xUUsNaMYnDAn9dloyMhmbPlNMIBRAaDvsfKphkc3OBM+njTHSrGDVFFMQEP8
	OE/E7WExc1JJDCppqISkTe1ZMaTjNHiI=
X-Gm-Gg: ATEYQzyUe5NY2CXmpDdDjf+5rDjIeMO/9NYZVstEFoA+fyj8pXr8N3pIOB4u3weD7yn
	1vIj5lcSgafQJhyIjR+kR/W2CThSSLdehBlK7Sf0xqrxFfc5nS8KzuXB+xKXWKUG/99qcn6Jusc
	FaRm+fDJXrCz9jH7151PkTQ8zFloRb9FmXpzxmZJmrnV7Jvx91OUOg9quUVmJgHI8ltVjT1dKfs
	Qp7iNZA6e4iuC3FK28ZgmTXi5l4fTujfR30QNgJkO68bT7wLqKcUhiqnsJMkW7vDZiiYNhlxO8h
	NP4aln0NH83o09MSFo+5m9uwTGa00F0HqwLmFZMxMjN2nQ07Eq2b6qgrKSytZ/u34p96WRJcdY3
	yTD14hV/mFKwru0HTWFTCBis=
X-Received: by 2002:a05:7301:1924:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2bea555c8d0mr3576087eec.3.1773686115426; Mon, 16 Mar 2026
 11:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316150720.1646109-1-gary@kernel.org> <20260316150720.1646109-3-gary@kernel.org>
 <abg_C-X9LJ2vAoqq@yury>
In-Reply-To: <abg_C-X9LJ2vAoqq@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 19:35:02 +0100
X-Gm-Features: AaiRm53HxmxvP-1v_9tfeVjOFSQr5UVIZ0rfMH5rbuUhD5Ow6r9jfA3VP17Rl5w
Message-ID: <CANiq72meoQ4_b+Tq-NMLv7LzGJKV1oy6bXuriaOWSsQW0jv6MA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: add `const_assert!` macro
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 6:34=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Same here. Miguel mentioned in the other thread that newer version of
> rust will make this list shorter, but once that didn't happen, let's
> follow rules?

It is not a hard limit, and there are a couple other nearby lines even
longer than this one. The new one will be 82 columns long (including
the addition here).

To be honest, I don't think it is worth making this patch series more
involved for a single line that will be temporary (or it may not even
happen depending on the order things land).

If we want to do it, then I would suggest doing it in another patch
(and likely in another patch series too).

Cheers,
Miguel
