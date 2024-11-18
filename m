Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDFC18DF86
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923275; cv=none; b=YtY1ltlG76pvsSMYr1OS9op+vBuZhawkXGq2n6rppmN7z9MhJSc9pDdOp0TZulKZ6hIaMdze0AreJ6Cp7fim6/19gDUkbtWErxUtE0AF4ujoBWITtvghFEPFknoPYtlE2rHBXEqnuFW0m3KabtuJZ7aWxe57a9lUmFlTAsmpeT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923275; c=relaxed/simple;
	bh=XXsIrjaLPtAbu9sbK4FP88OFsgTuPGUxicrKbpGG+pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkYAZsWx+VAbLBIwzVGcLhlWKTBWkpwdhAagKGVVVwRantJIZ14QT66R39MGFB+maJlfWjFrSROkpzllZrRnwEW+1EHypDL9s7OzWWLEDh0SEtfJFCKUoiMbRZLBDpSeUmh4t/ZYt3UJ98vkaLLlSs5MmXmDPxZrowgDT5iGtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LsFH/Xyu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LsFH/Xyu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43193678216so36481245e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731923272; x=1732528072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXsIrjaLPtAbu9sbK4FP88OFsgTuPGUxicrKbpGG+pw=;
        b=LsFH/XyuHZ0TAiVRgIl3wQ6hzgSbe+GqQVz8y778tJcBiP2StudxriHQaDeQqx4sZc
         dh1/cnHPBuTlhiwFBkhuPG4lfYfYFdEBh/pYknmxse1fsVrWDY4baL7WlFQ85AGLOgBC
         hiHF16apdzojPXNulsRX1PW/xUKTBaNeQn/gQ1RJIks82ipr/kPPtLJtTO+5zgIC3sO5
         bJGZLEwA8uA2eBliv04EdWKWuQKyUaKdjDxYJgEqSgESjBKMvnofnKvVSqYvmBI/LiQy
         3k+iMDEYcws7YChs9KLvsiBJj2ntwTAE5AT016a+51IS1T45skutVCV8oKr7LKEKVuwm
         SRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923272; x=1732528072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXsIrjaLPtAbu9sbK4FP88OFsgTuPGUxicrKbpGG+pw=;
        b=gXQbQtf+8sDjkg4B4EIEjObdGcG9v7RH857BGiJfnpUBX7r/oP7u1D6akln6ib2ob6
         j0cqvYFKj5aq0YJZ1yeN47chEFphCP8n4z0NPJWZoPGX0slvao7TL+Cw1lwOTxa+nR3V
         e/uE4zwQhCApdPALX/p3EVEhvFZqZfBW1Nzx7X6pBdWWHRDcJ5GsSvWA6eXpYrZAM+qt
         SOlnfS/hhYTVIJBUmGy7e3UOGscC2YVvYKmGau2cdQ4yhB5NjLyG+LSRySnnbrcQnK0c
         PlbliPeBmpq+77FXW91keUoiqPe8r5Y6siPx5RrubvZnbAwt0SMp4bzXZK5bWanXvxSS
         UWzw==
X-Forwarded-Encrypted: i=1; AJvYcCWeoYGC9ILqesXVJ47v8W9kpPPcEF3vhciXjswa9jcqFjlFCmUw8Wf/DO1lXlXonrGMGoJqNjfPsMrP9qd0Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpTZZb0v1OL6bGqEMLP4eYNXwV0/c0OpmYiIbtZQ4OafbhjFQV
	d635MH2MSDA3nfPmCwXOeMIUwaaV+GPNK1acU6w2DCQPN4qJOAeZhXaaS2wj3qLfmrWwBCTmv1w
	1eJMJwfJatYod4/ACmlAk8uo79TsjZCZKVs7k
X-Google-Smtp-Source: AGHT+IFW3ZZ2HFelm2woVtQeHr8EXXk1OydjKU40b/QkCRm14XNYCXSKqUggk05fm/ig0XesvILnEgyXAhF6bD1p/U8=
X-Received: by 2002:a5d:47ab:0:b0:382:3789:191c with SMTP id
 ffacd0b85a97d-38237891a14mr5679855f8f.7.1731923272561; Mon, 18 Nov 2024
 01:47:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241117133127.473937-1-ojeda@kernel.org>
In-Reply-To: <20241117133127.473937-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Nov 2024 10:47:40 +0100
Message-ID: <CAH5fLgj2ikduoBOCekGxdStemVR1EAN-fdcQxOVUJuUL5Z2KtQ@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: remove spurious item in `expect` list
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 2:31=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This list started as a "when to prefer `expect`" list, but at some point
> during writing I changed it to a "prefer `expect` unless...` one. However=
,
> the first bullet remained, which does not make sense anymore.
>
> Thus remove it. In addition, fix nearby typo.
>
> Fixes: 04866494e936 ("Documentation: rust: discuss `#[expect(...)]` in th=
e guidelines")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
