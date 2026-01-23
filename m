Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD668238176
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181874; cv=pass; b=Rfp3mFV8DOVgX9y5HhKkAiDEF8BksCC/5yogpSh8A9FGzWPiYuIwK6TKJReDonj1E/kP5iIrmi3zR2OQgbuEo1sCXBMzfPB1EnlB2Rdkdd124LIHCeG/Eh+C36EtFNhs7sQVRZwvdn/dHs+o9xCZlKrRp9aq2KfUR036as6+whk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181874; c=relaxed/simple;
	bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXzOSHFCLOTGbRRSfHq/Z0ygLaP2JFobXHsusmnjMSTrYuY1WU8s9EWje0bwaeZsUXjMIfJjCkNfA+uemHc3lYxLWciNtxB8Z+ELC889XwUSUKePCNJ2o668HF0/eYWDLoH2YKxS4IROezbWlKi1XrzgXz69l8esemSunkZBqAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Erh6dc4y; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Erh6dc4y"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b7267ff06fso200683eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 07:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769181872; cv=none;
        d=google.com; s=arc-20240605;
        b=M5oIPKfknSqvvaWzk61dQR5nh6UnAWi7mOXF8A+FvhOeJxzlGWhQtzyKXgG8Gd4tfL
         MteS+/BQ98zz/nDPCPRG120XoX42dTrcZOSVEOvCkxgZaA5In/sMoic+XKr5CJYd1Bvr
         DliaYZAWxxPljIR+iEHAqqTszWFao/EtJbIHo4YAHHYv0LXmJv276VpbEKn495noZ49h
         Ww9oTXoUJrpacBLxilNyZuRLDuvWsoc8Xpj6gHBADCbmvZxliHN46Ql5wFkOEfNXyFPn
         sBti2vCaCLD+wmTOns90m8b3QApiClRAPbc1o4FqKXYnx040IvsrPN6YY8oC4IZF65oY
         VONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
        fh=zIKqjQxiLQz+zHa5RlAL8/pgyHQ1F28eK4bHDsIUVvk=;
        b=XyuiW08Mb+WK7AIm9xNNRRTZJL/uzcBgg8Uothde6s16NuI9odSwtd488DmS5NiKvW
         zAzCoswWQ2C/WB5z1s712pvn9x0JZhq1poBNgRJ1mqkibAKJ2AJ2iz7BlJIbqJ5WOohT
         YOF3VyjRbxZIv+B2ZSSGPj+N5HhJujUM2CM6uDEcptjumOW93VC7DO/XghpAXBEj1p9i
         1r5XMQjE/NVGr+CqUS7isv08wTgUY+fvnagLFPSeTd6k+nhLNFdKqZG+XuZ/TKf50Ijl
         O8sdo3dTHk499eGc+oVRCQu6gDB0i5oDKaS6k8OZLBy/RUTfW5EvHuPZ9QkGqaiA93bX
         6JTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769181872; x=1769786672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
        b=Erh6dc4y/Zd+GZtYZOgubq4U9lViP1cLUfVsPkPTf6Tg6Hj1NZy8pUwXLuFORpbCac
         f1FiJVqb8IXoE91gmyWMaNrUMz9l0YVpBuxXxx6yns9qjTdwUToujeJp7AhkLrxhtAbJ
         He4ZQ/O5Rcl7VzxWCw+2quPU0tpXhNhX66o/agPFdoi8nn++/xoPUr0J0MDQvPd/m8u3
         /WJ/FgwYxyYUcDmHm1jEwOHwkMQkvtKrdJq4Rhe5Mlk2AoleChS0vgiqOicPTCJM210k
         i0rxNGq56XWqIgf6991nqw83yPjEJgzfUcWuobgDmEEAry4ES61solI9Wmd9EZmna32/
         hUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769181872; x=1769786672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
        b=mDx4xH1b6YO0fmwKH12GLKkwPpRQUGkqIOBytVSq7NzSNUZ2p5Z+ifjpWCmDK4LmkL
         n9kan3g4Q/ZfSSynSM1oq4paaC0kTrIqLWcMjJtQBGGwV6Nbs4r6V/SuWZauxFpJuyUf
         RE4IerTvPcIzlnu7oIkKTmLZeg6S8RqFD7wvu0X6ID+CCauNtirCVK/pc8f+/TNlBRHa
         QDYpyy049rlsCey24BbdAQxhUC0JdyVkOh7JsBb64lXARUXcMsb4oMi5ZvzO8RHwI5or
         TsT0xR9KGNZH1RQ0Mg6b6AjRYksyGZoIeMyoiwkVIyY489uErZ0m07eWG2kSdeZ2Kvlg
         Krsg==
X-Forwarded-Encrypted: i=1; AJvYcCX4wQ/RfmziBEHO9cPNmdlfdYqnhK58nW9IUA8UbMu2vprfldLWlDTIlPPSec8vR+jjNaJHPrRqXMa3+6OVUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02+ekQgeCTVN53hvdHrtjwTGkit8960KokncaM1a+0Rqwru99
	9/oSz/edlEL6ZD+8CcVoeKDqBjE8dXN4xbtmZUH8k8Ei8+7o/ChGYiS455zvl+Cjiv2f2uwqabd
	9X72Nv4o3goLKPPP0hXOrFUwmhU42uYo=
X-Gm-Gg: AZuq6aIPeITnUrFY+tu60HisGRSi43FqC7HQ0FH3rh5RbTZs1Qo+Sk32iJkZ6HWEY7B
	CY0ZpYff9TO9d/3qsOh02PdzqDtJ4p38K+CHft91W95sRzLvZU9uNFohpqKcxMZ/4TdWN80wyav
	vM0bgN9falZbLpTjNZRMmQ8+x+J/YMl+jv1cizSD18oTErv1K7rnQsUY2yoPIgJB+b19AHJYelO
	YYAJEDkMHiy+A++Art4lWdK7l3ijVr2cFq9utQ3Mh5HMObX5d3q4YaKNspXke82mSWlTWdNMOUe
	vci0LefbkmzdRbrR02HyXgCbkTxY7gKYVSuReg9fAz7yVuswrJz8Ktb00TGlz5rcRWHaXcA3Q6p
	fQqN6ft1F9IK1tzueM+G7h6I=
X-Received: by 2002:a05:7300:a507:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b739bf315fmr909834eec.6.1769181871865; Fri, 23 Jan 2026
 07:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk> <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
 <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com> <aXOPVkAQGr0lEfml@google.com>
In-Reply-To: <aXOPVkAQGr0lEfml@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 16:24:19 +0100
X-Gm-Features: AZwV_QhFUx03nDzWGbtH5yx0sTnESlXNd8pfHxRA1FMqOX70S3PEwkv0l-iFPNE
Message-ID: <CANiq72nTrdhaz9-9xojcJzLBB=ntFjtdH4xZbQk+A662G6Tt8g@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Mark Brown <broonie@kernel.org>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 4:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Having a lint that happens on just one random version is inconvenient,
> so I think we should take at least one of these two actions:
>
> 1. Disable clippy::precedence on 1.85.0 only.
> 2. Enable the clippy::precedence_bits lint.

Yeah, in case it wasn't clear, those are the two options I mentioned.

> But I am ok with enabling clippy::precedence_bits.

Great, let's see how others feel about the parenthesis...

Cheers,
Miguel
