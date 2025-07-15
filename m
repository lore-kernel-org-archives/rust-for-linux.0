Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8827054A
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578340; cv=none; b=XkfJR2D95Ekw7QmfGb7PDUAPtymbDBJcLVuWClcesEaNLoYv+AgGmKm0op4HnYXEkC4yKHBQCPa9qXbjOsOnCA1dma7sY0h7qh4k4Ski6lQyzfRDB8A1Er5n8OmJGt6nRMe8FySHU/eOogPH4YpNPStZONuSl0OWlaLBKMKv6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578340; c=relaxed/simple;
	bh=tn2uvXI/I8XXnAkPIkxG6BvDao6/URcYrwrPntHBZ20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ex3y2iZhR66rKaGKvglYQb97f4OK222SvibecwYQN+WJ5K1j2ofQZwLiczdkji9tTSVL1WAVAg49eSYgLDZGBQ3rCXnW45S6bW7LX4AQv46HfXuAqncrWcL4AkhMsQO6KQ4N961Ayv7BVtvVN+fulyNg2HuCbEA2bgJFh8JNuO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdpArHtw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdpArHtw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so1333778a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752578339; x=1753183139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn2uvXI/I8XXnAkPIkxG6BvDao6/URcYrwrPntHBZ20=;
        b=RdpArHtwPBnCXhmoWpwGq1Ovhr0CHRjf8HH564qruD1mLGUpwmROfqq04iusSa2/pM
         ZWLPOKr+ckMz7Zhg0MYfD8Zf1yn/tVfXt0KAvTwtOOyM9IW5sJFuZJAPW5K7hZiKNGk4
         i2E4Xt+8suD4sQZl1M++pdeO5F3+LDEb5W44jZwhEEtFrngoeh8HYbajGdgjob2OuNGW
         CCLF8fqT+verkxoYQHtCh0ZACBy8wzacsSCya9ZIjKZnqLKkRpz5knshcQhp+gDx4FfL
         KmcsyMzzyvCwPwL2j3BD7jo6dG3nWs3EwSUTouD3uiE7tBnuQqT7i5tX61U1dQFoVzTj
         zIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578339; x=1753183139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn2uvXI/I8XXnAkPIkxG6BvDao6/URcYrwrPntHBZ20=;
        b=GCqLsd1uMBJtZ8GqUQ8t29qt8r1WQM+LeCnz9TE45zf0TZlSy1FGFhiaSFDF/S9n5A
         8ssL0RnkN6P7xpUiaegWmKg8+fxa17fsGz57E24MwyLzpHwp7aSCvnxP0Cn418nT6nnE
         1pZpoeCO2bDFZ/K0qjCP7HtRFMrEAddfMmtOOD+iNbdIP65Z5TMwuSsdg05Hh0mCcUXB
         CmtWjyo/1Z2jgk01eqrcoH0CAk7Twq0TgaaCWnY0RpBBVMHV2djlV29y6ZJjeEVivzsk
         689t+kyAqPSRJLJMgKCTeEyJ2IfmmZq5RXWygzrUsfggppXKP9S5+wbGq1fP7sgWR90K
         PLiw==
X-Forwarded-Encrypted: i=1; AJvYcCV85zAPbFrzFusKZ6p25Nqc4BRXRlxG1U+08XAqJNjKjJ5PaKjMVRiPp0H837VQwIkeH1sIRW7Js+KHJs2zPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rOROLB5+lYrUhfMxSTU/XdhKLJylB+eK3ZNAuF45yVona7Js
	QhCK3Hp3FZeSgAJKjsehlcQBHlCog9y2WqEvqdk1wri/pxoe9AhPIaW4j6NbDc7R3GkZsl4NBcC
	AK+vYh2K2AjIEGtQGbdgapMYBjiMGSxQ=
X-Gm-Gg: ASbGncsxJE6iLZ7IJmhPyCDgLBtVRFFk7/h+tgM2zrFegoMhcCHkHLLnEmpVQyUr/Bg
	A+7AuAI95msg1nVIe9bdMCjIPH5rU3g756fwcIajpFJ3lxH1s3+Z7YpLf010WV7EUrbtUzpwdrc
	DAF0KCv56QZFzCKOjSjkFhBhLj5VR+u9JWgEL+XVuVqbH428siBZeJQ4M2ZvOTXTj6eMiR9MqC6
	e2vbqHG
X-Google-Smtp-Source: AGHT+IF4vOK6snabX4To52wDF+9k6VPf2yCQ507XCAAQpsWtX9maT96QetKU49/ASOJ3qbku7fXcCNjADz/UhsdUqTE=
X-Received: by 2002:a17:90b:4b90:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c94db9c61mr895181a91.3.1752578338702; Tue, 15 Jul 2025
 04:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713190244.143286-1-ritvikfoss@gmail.com> <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
 <CANiq72nYqOGx7FEfMyp_8VnpZargzZ0uannbO9VMCk=kiEbd=g@mail.gmail.com> <20250715030618.ljqvviloypmfixfq@vireshk-i7>
In-Reply-To: <20250715030618.ljqvviloypmfixfq@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Jul 2025 13:18:46 +0200
X-Gm-Features: Ac12FXz99AzijCWQ51RiPrV_7I2p6ZixSTJOLpDHKq1hKxJj6aN9PnvM197guDc
Message-ID: <CANiq72mKbv-PCv3WA4Mq79Yb2VtrLmxipA_NCaDFdF=JmXS3NA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and `mem::zeroed`
 with `Opaque` APIs
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Ritvik Gupta <ritvikfoss@gmail.com>, yury.norov@gmail.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 5:06=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Applied now.
>
> I manage pull requests for cpufreq and OPP normally. I had to to
> cpumask, clk, etc., as dependencies for my Rust stuff but I am not
> sure about what's the best way to get them merged.
>
> For now I can take this one though.

Ah, I thought the idea was to continue like that.

If that was not the case, then it should be clarified. Do you have a
pointer to the latest discussion on this?

Thanks!

Cheers,
Miguel
