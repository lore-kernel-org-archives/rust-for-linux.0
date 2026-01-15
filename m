Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB93203B6
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512250; cv=pass; b=BTWVx3zCVKD35rip5FKLewPGSA4N0H60qTlvm46Gs0mYs0SwMyX4/n2g7mVG1v6DSnFkS2iB+18uE1C9bcN2xdK6h9Sa0J7trKjsgiwG93mDXjxfD6PEQjwxnx/psiyT1IAsj3aimxDohYsA5bzYyoPVv22SklpkF60SrkMCfFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512250; c=relaxed/simple;
	bh=nHXfVF06+6lbqXiEQ3eGug1XEDlqZPbzcsoAj3I851s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTzcd72RxvqyrOkLojA+0SdW4nNxrtUUKGpy1okf2EdThMkD/hbp8tE68ApT+vnPQRx15NMLYcNLO2yZNJ9pomJnC8xOrPxfmF5Zh0mSm6Y5kFkCWF+o7OIRD0P2FVCf1dxnl7G7PT3Z2V7+i/P3kMfLpgTNXuwD+tFaKkWf98g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX39EQ7V; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX39EQ7V"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ae2dfd9eefso94460eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768512248; cv=none;
        d=google.com; s=arc-20240605;
        b=IAktyE9JV9N89aPLVluVXc8PyeIg3ubWXGGC5ahFZVrgzXI2Sjrh9jwUZ+1uXgK56g
         k/J/iQMGUeKe8so6BpKv2l9Nk6355fx/gbrfUk5yC4D8HN5KfirtHRJID6uIPDsYI23A
         UkGV0y45pTNXIfm5kug3phehhVo3amuUwVcHIpLj6O7d/tAlQrw3QSHyVOe/h7YEa/8A
         1Y6nx07OipqKAgYKb+ur6vfrkiuqAHF4/RMVrivTqub3cxJq/INJBjdujbQnV1mfx95S
         blEXubZ9/SytPLUtyA/pgRR11mCESLoEVI36O7VWEYmGllc3T0augKJU6Tg1ibonhb+Z
         Uuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHXfVF06+6lbqXiEQ3eGug1XEDlqZPbzcsoAj3I851s=;
        fh=Bdd2scOI8IxoRf407z+9Nh8vYWPmkrGHaOyLMoUeVYo=;
        b=MHFVaDNECOd2U42OTUKyCORYmk/m7Iye0xsDge2Mq4uPf0qjH/xORHp/VMhFqULSpH
         CCgzqqfXCmLUrU51TBL8sFSvAh6m4EE1kwp7010asKvK4ROScpCXTrrQxIdlNRHDKJTZ
         ffI45iitqM5Tar3fAr6xo2dX/0qb1NDdjFV2gr4iQ8PjBPMYurvggjWtYlQH4U2t7rpc
         rJD3PhCAvHySlYUar301mRNIGJyzF3axcYuzyyzqzvvj1AFuyZAr8+b/M8yVhERFmFqv
         3Xhfp06IsW1ipxpJiWtVhsRT6q7F6WdHbfQ1PmLuB3N5OcMhHrh3t9hoQxCjNzPQlPEY
         bq6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768512248; x=1769117048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHXfVF06+6lbqXiEQ3eGug1XEDlqZPbzcsoAj3I851s=;
        b=BX39EQ7VTMYhteuqYw1+Vwy1YFxgc3veq9qYS/oF0Qiofim6FfJW4zT1m9WWCZhsxX
         HYQSKozSU4CQ8cZRO5RzlApbftFJt/+WsHDzuyuY/Alr+zD2g0k6C18XkcZvn8mKVI7T
         FdPjPwxmxWhOM5OG/9poKFPbi2gOhL8Nf20XP73tkN5oHsrMBzYtCO634kJueznwUOkc
         zWQHFVlAGt060OVfCkng8IEWfaYOKNYaaMHORYMgY5sLkpTNe/+m6oJxQUJhbdoZUjO5
         FNOpEWbeyAejCzWTT/bsvzuFfLyvgTGbKAgQqN3LsZ37+cVfToqXoh8y8Psh+MS65tD8
         /MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768512248; x=1769117048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHXfVF06+6lbqXiEQ3eGug1XEDlqZPbzcsoAj3I851s=;
        b=MivqT+DquQbCtHjErBvZ0vWqk9vFFFYpOJl5X+zG9o8+kmHpygYU+WPD8SmRWwTdjP
         8mDNh79tPbHyCyD6xEe9/VAbKC0/dOqVTTX4bwpraFHGG4/sX0wDvcF007VcbGHAWRxJ
         euHzaCZb/env6WiyAkIE+u7XSNnzO80oxZbC2irj3ZiBjGh9i8lDR6UUQr/C1vuSIBfz
         xeAHIQYe8z7Bi1nJAYYq+QOWJIRDFl6LM6Er6Hf39HwCj25g9unIeM06Q+cBjVvQnIMU
         iPIEAHnEnVMFQyQ5olepLKHnrcVh6k0J1S+2nDXjUlXhdlFoB9IaQIYaSW1J16yLE7G0
         hWnw==
X-Forwarded-Encrypted: i=1; AJvYcCU+c7ZJnTlRpbpzmfWTtkbZyJy0xwsvHoAoXQPjQ8uyzPmTK1ubFNFXITqfitZHrQbY8cK0TyNND1sUNte96Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2BQfCnM07QtBYoTxBsQA0Pvuv6oC7af5CoiCTtMkeHPKZ/Z8A
	z3HQu9SodMQH2Ohd3swbHtTGBcKRb9BTphhfZydNx8cLqsZ5p665Pls9KOmvTtUiKjYL1tHUySu
	FvWT0tTZ4iPqHDWCKk9c3U99daq6z5As=
X-Gm-Gg: AY/fxX6TvEknQc1/AiYL6vtQQR/fPz50aAb4NGz31mwhTkNhxK+UY+4HnfqWENcImwv
	mFZ+3Qj0U3kEQzSdRCTGQNaibM8dijUHr482TSIDPNosHgUuZ42GMqRUdU4BZYFCXMU75e/H9NH
	7443iKEd6LA0GPBYnLg44lx7CdfHh4c80ipheM46qWMtZsAJhUZYjNlr2NbIILObS7o0L/n3XM1
	q9wstnCaRvlERSlu2XWOthLFHMVGApDNDGk9IGNE2ItEsulP5N64P9IjQM5yrLsFXGMkygtzzyQ
	jSdpn6N7A4VJJe1hhWVQssiJSCfM9ajSS8rjiVtjcrklSq8+7fGr/5/MkdPtMfOGRLCZs6liMpd
	vBCluJL2uLan5
X-Received: by 2002:a05:7300:2211:b0:2b0:4e90:7755 with SMTP id
 5a478bee46e88-2b6b41219a4mr461012eec.8.1768512247743; Thu, 15 Jan 2026
 13:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>
In-Reply-To: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 22:23:54 +0100
X-Gm-Features: AZwV_QiEAxGStef6O5XKw9tObI54ZAR_9WnaIZTtsfwkvBKbCFnfPyWUKOuCctc
Message-ID: <CANiq72nHhhR0Twwm_+6+qb8Pt4E4B+e+9hfxNyTnNg2cfiAb6A@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile quote with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 5:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Our copy of the quote crate uses edition 2018, thus generate the correct
> rust-analyzer configuration for it.
>
> Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Cc'ing Jesung who is becoming a reviewer for rust-analyzer.

Thanks!

Cheers,
Miguel
