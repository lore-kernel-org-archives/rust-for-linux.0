Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEAD381AE9
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126703; cv=pass; b=lRhH0wYOvY7QYn7VbAm4fm/VHNAGe8mU6gcqEi8igLp8JMhdyYJjc5iVBFUkfVIglDzJTbDXSKafUORS6mGeIUAEST65B10xL03jikLhRDRdirw/k7F5TMQljLCzHmB8bySoAS2mAS5jaKbI0yS8UBEtyCnGYOPaFGHqyl1RKOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126703; c=relaxed/simple;
	bh=IX/UXroWIqNymrcmjNPsEva92cifG29x0Etx92JtQds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqbdRZQXeeAHlcFc8WsRsS0D3xZi+RJgNlbTQvAbQKiEiDdVkOkA1JayYk2MAv6cQx+bCqsfDkkRs1yDoUMQlSNRs667F+1TrPBMtHH+cBy9J4lU7wktJdBgbR/BOSdIBMRNa262QtjqhMydkU6DFz+tFtdMc8B2cUS/u5orUL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2yE2pFz; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2yE2pFz"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f13ae64db1so129472eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779126702; cv=none;
        d=google.com; s=arc-20240605;
        b=eRLLKSSPxTnaLqv/a6jKLMBiZ1BecxRxg9nT/5AD8w9nn1CfW6wpOsWqzqR6VfX6Fj
         qeEvoAwYzvVv4c1a5q9kxHP2kE/LNl7o1Q+jos4HnsCsyxcSvABx1n//hDypgLvsgMsl
         HacJuxXoOY81PfurSXE1mXF1udQq3iXs2YSjz5tqmWux3tnkurroO3nPAbCM7f6FpV6s
         cITOIDQ6Pc/yKGxCFdXp3ad1kjUKnTV3/ji11rgbqjNzqHXKM0DxJ7kfAVFzWCQ1bfsd
         fD7VMklZsZokOdhoqUsYeCIYpTsOa4tFhCRJ8Ny6lTduFWwQI0067QB4Ydzg38oXLM0D
         ZtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T0rA7vHFgd0f8o1DPrrIUNEns3FQJfbf+hci8JnJQZQ=;
        fh=NZH0GBmXhDqj87CByKKGy3E6eUy5cso5g2SMsjIuJUI=;
        b=jy7tfXlf835Hw4eBQQ4/NDNGBAkRSKrkkFlNXNcO4bRma9rZIbRvE6BiFbxk4RZ5Hd
         g4uck7psmZLsMUV9xgJuSX9MeGTEVfhrv4FCC4te+/DvK+KdN41WtK5emYE87pnSRQLv
         KqsLy6vsIT1RJLr0YjlGnBDm3DfxWh26UHIU6PqQjnSkoD2lLImOdWLo2CP6lM5fnHgD
         wHYSccnxBQsoz1Uj+RXBKZRIoCfumXzNHHQGW2MQOT7EZG4qt5FX0lKvSkzrzzRhVBkk
         KT3gD+72vF5yQ1dUt5K3W2OCjwQNeTatc/OaUphLOCHCO1xegHvwv2cMJQQORI0FfGO2
         Jkyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779126702; x=1779731502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0rA7vHFgd0f8o1DPrrIUNEns3FQJfbf+hci8JnJQZQ=;
        b=J2yE2pFzGwKuejfk2yrJQ9jKVbW+tbSH+oLjvJUern7H0g7phBJdsVeHVFMFB23Ckk
         OZYXboQUlc3+XYPq/r0gkfh3KQzVq6LgdX9LwZNcicltiAX6gjWh3azJjt5JyUkr2QqO
         rYzN9ePW9HbSJGP0mC0gh33dOmWIVt4kqzZynMMiLu/LLGEVHrorFoXZMrKjdrsj1DRw
         Q1lYdBvn/8IXhI+X1Z+GobGWFx5RDpitRR6V/8NLBX2SJEP4yfNT1LqeXHYUrHVv7ygH
         /+B04gQ6msgv5pJzk7PmB3mB2imgXnLcSfCoVAErhzBlEJNhIK5Zpn7oEQk6o6qCXApA
         6tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126702; x=1779731502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T0rA7vHFgd0f8o1DPrrIUNEns3FQJfbf+hci8JnJQZQ=;
        b=dgjYvKoYKdKt8T97sBBY68P43cJe7wkT4BUiizxZcnSzvCP2OpNEEeBNPo6aRz+RSl
         JFzRwC17ZphgN9baH9Av+6M+kXZTohwoW7Sm9EXmpf4ihf0S3p7GX5/Xr6xF4V5fiyXi
         E+hNNpj6syUN/4ZHgNHBmR5UMyBLW4eAAVCQweN8+mbBd5rxvwFr2m27VrkIub2bip1k
         yMdWO7OFMD7LJ0gwFJu53Wlcu/jGQOC8IkMclYkw8Py2/OrTbEbFri1dNCTsWtJzX+FD
         i3NK/bKuFADTC9BarWNkZOu+5AhqYJ2li1Rq3WoTAJH9meOf09Xd2cBcO0nVpzeshZn8
         jVVA==
X-Forwarded-Encrypted: i=1; AFNElJ+J6rfBq8A70VqBa0CGGdG58ZgDqyaHbhtGrDM+J673wvVinGI9+ga6r1VfDLcU9pPte5UMfzTk8ymsT8yffg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO033uO+1wb8kxoc2QWE/tn33RINNAOpxbvb4tW60EPMjn6F/h
	2uYq0Qyt/Zb/s8BHGgH7VnyxvpcBI0tOLMmhF2mIOt0Ex7VVHVyIE18nRwbmjeMBXcrIdx2h/DB
	ZQCUSeSAL0PFf84qb7LV19/bYiCRzYp8=
X-Gm-Gg: Acq92OGwjsz6U+RLirj4MQ+OCfvQaQ+gZT34ZYREVkHS3SKOn6C9+KRZoAg0lbcWmXM
	51wB6VqQvzbSNvUZFcjPjzk6nbwsye8wGU1A2BkJSswG7MNalKqh0SxfrQRFeezCjQ561gp2s3j
	xcFVkRIwPxCRsjYRE3Ud5wsLKAm2MdCIUuvH+DSu5WPzpD861h7zKKQmr3ghhntkY9ilxQY4iqI
	f+AiK30ufTZjB82fv8Pq5zwTRZ01o3InHQXsGd2V0Rd+h4A9wqFOsg5dKU7BxAQd9o9odF4CTwI
	imzoHymehf/cE7TAB4FQBbmAGslRmDP4Dls//kbBoZMlXwb4ZzU4S2eBxHMAr60bSv8iM49lCu7
	y5o74V7c9DMEM+hJ9NILB81E=
X-Received: by 2002:a05:7300:ef82:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-303986d6062mr3232426eec.4.1779126701633; Mon, 18 May 2026
 10:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518174414.204573-1-ritvikfoss@gmail.com>
In-Reply-To: <20260518174414.204573-1-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 19:51:28 +0200
X-Gm-Features: AVHnY4KayYKRAQ5lP2mFtHDJ6vTREEB71bT_1LL92y-3a5eTxmlCUi_ZeMPT3EE
Message-ID: <CANiq72=5PUubJDYD57yhEC117tzNo9h6d=7f8OiengaExmGnyQ@mail.gmail.com>
Subject: Re: [PATCH] rust: cpu: use `unsafe_precondition_assert!`
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: tglx@kernel.org, peterz@infradead.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:40=E2=80=AFPM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> Replace `debug_assert!` invocations with
> `unsafe_precondition_assert!` in `from_i32_unchecked`
> and `from_u32_unchecked` unsafe functions.

Thanks for the patch!

This should mention that we are adding messages too. That could
actually be a second patch in the series to make it even clearer, but
it is not a big a deal either way (and perhaps `rustfmt` makes that
first patch not that clean due to the line wrapping anyway).

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1232

> -use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
> +use crate::{bindings, device::Device, error::Result, prelude::ENODEV, un=
safe_precondition_assert};

We should probably put it in the prelude along the others -- the
easier it is to type, the better, to encourage its use.

Do you want to add a first patch in the series doing that?

> +            "CpuId::from_i32_unchecked requires a valid 'id' (i.e., `0 <=
=3D id < nr_cpu_ids()`)"

This seems to mix Markdown backquotes with single quotes, and then
doesn't use backquotes in the first part. Could we make it consistent
if we are adding the messages? e.g.

    "`CpuId::from_i32_unchecked` requires a valid `id` (i.e., `0 <=3D id
< nr_cpu_ids()`)"

Sashiko has also spotted a copy-paste error in the one below.

Cheers,
Miguel
