Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B930E0F9
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372963; cv=none; b=B5UKwus5rAVHbFVFEwzAIJy5K/aYZbgFiwf/Ya3Yx594xGEvm1ynRgagxfNyjcCOa4B1rBz/jTUEOT+AQH89O2n1zoGnw4Qgh1KUMwCDFY4Oka03mfi+wb7n/SUB1C1KEIOojNX8cSadWgGzTVonL3K4o7tu2dFcRi6Hl5rEgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372963; c=relaxed/simple;
	bh=CNE7KbqVQWvI2RgEONt3Y8S0ouzZQLAbHpNMtvz0fgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/OSIpfAMaTvn/GXKDq9z13LvCF3cbjccUva1qw07Ss9sGhqhVlQu+LJviFstKI3F84d0oNJxoWPIkuD7o7oZfR7w/I36CDhCRdwdyKCJa0q40wF259MlBOaoCQtg6edcLS5RiSJaHnB3Noo5UC8j+FklMlwJRPOM08dYJrOLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TFXgx9st; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TFXgx9st"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so2327798f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 01:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763372959; x=1763977759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNE7KbqVQWvI2RgEONt3Y8S0ouzZQLAbHpNMtvz0fgY=;
        b=TFXgx9stFtUpIKZu0/oT+nPJyvbtvVqdfHxLLZURWfpbhH0B80rmvaansFrFPWotge
         qVrSJ5PHq+QDHEhQgxXFWkg7pNoY+1ZhLzt95szX0fIqNDPawAY21FNDfKQ45LI2Kfvl
         96EpI7tW1KzoOEMf+bQdgUbnE+WGUgMKwXVK5GFD2GmzSdQ+xTr2hShSEPZBLXKO5K+j
         jdCFTYvoV3j7f1h7Lm+yuogx/9Fbu5F6nNOw3orBFcJLvRu3e5Soln8E+x1CONHpbg/X
         9r++qOenji6uz5nIFOhpve+9osMKkDoxdC68I4QCIds3N9l2M7bOU9uZLHlE1k5X5YKA
         /stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372959; x=1763977759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNE7KbqVQWvI2RgEONt3Y8S0ouzZQLAbHpNMtvz0fgY=;
        b=HryxNeUnOxZR1tbuoHLVs6YsznisaQAeJEcUdgNyOurYTzYCJHxqukq91Wt963YbOE
         mYO9mT0kGBCEo9D9Ub86B7b/9dfVtT9QV10g4DDFDXtAIpKHMqSX567kiSPRnV314c/c
         fCVs5Xa1SB5nTDpiN7a9tMHpAVGQ8lTz4hRhhA2Nn4rOyFf7T7knM5KmWhqV5OuJtokg
         rCA/hIyqdWCNvjCWxNY1XLUacPrjAfMP8YhbNEi43E/Ln8f3QpHshA1e2fkOub84tmpA
         gV1a+3PzJE+1jgXps4sHj4KflzvaJk8lKNvVEJHSAaApaIk8IyWE3wwCBu6mtbsMXDKH
         JQkg==
X-Forwarded-Encrypted: i=1; AJvYcCXYsrcZ84wiHpT/yUu/EezkOytFAPgrtpp3nkTOOedhI1MACzRHSTqpalidg77gKwCfOTaUYipuD/hwy66UuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyugpk/WKeIYxEeaPzFJRr2LDj1zG6rdoDkuTovvjRRwSADM6+Z
	aY8aBSt4zhq5hdgWZP0gU5ONtqwluOz8TxaGW268UiTPaaf16DquHwdlZc8zu0fNB86zTlsRJXB
	x7U2rn6W08aJVVv7YYjlsD6tKJ2njAprNIiHna9X3
X-Gm-Gg: ASbGncuJaCj3ohBpOFy8oEFFKQj+nt7YnuIkG+l1ZrVDBqwuMDR0fopfSlNHREAurmI
	+jvFdz/oaN+AAbQgAilxfz6V4QNRlW63V+Nk+Pjx2AB5tUJTrFOk/xyw86SZGQ5pHuCvLrkbIVv
	sMBfl4/R9O/CKOqEKzO9ZRzQu1cvdwF4EZ65589GSXtty/nHKy/hxR8oxSfQEdZ4MO5UQhu3B42
	D6dFgQ5hFo1GIPeebc6dlNScTtHk4MITe3fNZB/O+OkD1MOQtpuQNKappMvNI2RRpDa1Eoj6ZUq
	EZbsXC5ZmFmsjHQJ/erJbNR3dma+TB9yeShH
X-Google-Smtp-Source: AGHT+IH8YCYGV2S+juLRjDKyn40UwfPsqkcXdTOnoi2W85HbpkME845DVwjXxLdf4j6VbBFEphOGCaajGpmsgMuealQ=
X-Received: by 2002:a05:6000:220b:b0:42b:2fb5:73c9 with SMTP id
 ffacd0b85a97d-42b595bbaa9mr10050073f8f.58.1763372958607; Mon, 17 Nov 2025
 01:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117080714.876978-1-ojeda@kernel.org>
In-Reply-To: <20251117080714.876978-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 17 Nov 2025 10:49:06 +0100
X-Gm-Features: AWmQ_bkzFWgbscghZI6cgaoGm_Ak95pUyQ19oba0Tx8hSJRrA-n1VAVT0JCDMZE
Message-ID: <CAH5fLgjWFUwMaxPYGRR2YC8FCv9ex-YpM-VWrkVZ7Wgf8Qbtig@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::disallowed_names` for doctests
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:07=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Examples (i.e. doctests) may want to use names such as `foo`, thus the
> `clippy::disallowed_names` lint gets in the way.
>
> Thus allow it for all doctests.
>
> In addition, remove it from the existing `expect`s we have in a few
> doctests.
>
> This does not mean that we should stop trying to find good names for
> our examples, though.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/rust-for-linux/aRHSLChi5HYXW4-9@google.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
