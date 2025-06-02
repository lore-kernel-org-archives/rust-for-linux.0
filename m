Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A88221299
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872120; cv=none; b=ranhfVDGWd3DAQG2UZUChbhEjoORI2Qe1j/lwpeQMTJPJ+goFt8F/4xAy2h8cPqJVU+6VyZ4TGj7lZO4oOUfp+pUK7BwZjalE3mRjc9tPBylzgxV07JYYFWuOKihWtkd/Vcuv0Fgj1H0N99OpSl16dwbgCrRdpLjpoC06rqsGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872120; c=relaxed/simple;
	bh=zOSeXNcd8Limb2V+zOaCZevg9OAEa7wcn/HbXg+RdIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHXEBHATtLKIRK9VjEswi0ljtPw+UKxETvtzIlBUlBbkiATJnNwyEv9D1VI83G7TrrU0dW95TptsBPya0eqDph57A/trDsDS+V//LPp9W8XzW5hDu7T0/LbHPCuxxiyZQ64ZhymfXMGinaL6LkmTCkVo88cmAzOZ7YOrQEul9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1QpiWp9b; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1QpiWp9b"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2c76a1b574cso1349372fac.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748872118; x=1749476918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOSeXNcd8Limb2V+zOaCZevg9OAEa7wcn/HbXg+RdIo=;
        b=1QpiWp9b9h3f9od5DTIyQjVX+XhTPDPRxupc/Hq57596+G307Hp2LQsTI/ZgqVSHt1
         FFib3xiB5SdwgLUVbPzJeg8HfsDkwcSVxWBfxYeXBmLDXDMPG2vtaS6/QkJhAyu1KtPc
         usR2V3kt2dKuq/AMw9uIav7EFiuR/D1KtiwUrMPVySf/1bgDT9CF3IsFr+MEaZ0Oi6O+
         izBBHvjXm7hmeBvHzpBCKBcTbYGpxIa2a9H2gZHSeotBq/DywUpdVZ/R9oQYHUhniUdO
         MDArjRa3cKlPJ5EFUWZ/fVKfZ8PTSVHelYqghJAzZOVgwq65DEaaXarZ/x5LlCmz5vDY
         pOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872118; x=1749476918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOSeXNcd8Limb2V+zOaCZevg9OAEa7wcn/HbXg+RdIo=;
        b=lDNYFNo2PEq7kLxY4GDGruAQjvP61X7KK9GoV0IbEpopeHWjh3zVbqMw5rYPGinDB4
         hvRuHslycMT3X7BaJb6qeFJ8T4HlCYakRIN+IS9m2E7xoXdRrSdwDvmK8tjSCUyPxyKv
         3iQxt5uRzykB9X+mpQOEO0LrQ7kNWY5GkuMHc8NRZDWPCWMkMvcNCif7hREUO3cjNcpt
         COu46TUFx6ss/a35rILSPXocDNp8RAa6zgQkTZqKLkISgUUiEYx954lZNBpTtUSUU3OA
         O5ZYbcfDqb2WXUwZGwrSlCuntTal5b1NkdI30QXmrA3rzZwP+sx2N42e9M2cOLM1HgXr
         aZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCW4ea4xG+uwzNp2d9JuQ0ZAS/BC+88O07d0StWD91MHsufo4oVQqnLjQm3KQsLEl+sUILfu0xPNdO+au9lGDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTzRtdmBAn3odA9B/ZGAaVm2ESjeI8wxgFv1kmi4Yw4lw2ziim
	OlckGBXfzsFTgLk0EJz8ub7tJWzKPczprA6y8ZdGBuaZDsRZeeOYbe5gTu8g4N4SUljHv5SXirV
	ma1usOf/uZwI9i9m/lstWNr6zJPDL7NmW/hen3DaJ
X-Gm-Gg: ASbGnctrG0vLsh1kr7N/P4lq0R4nISfQx1royOdHEG//v9QxOBKM4teXtGvUp9u4xCe
	vjZ546Ch8nyhy60cDgo5qhcvZzbwZvdh4nqNtfgL7KQjNZ/7rYnhIbg6KWnTe1/VlJZV3Vr++Kv
	rgufTI14+ztQY3m3S4kMYY0xCfw3fe1bzn3vKV2VI2NwclIqQ7+L3HKaiqP57v4V10UNjxS/CLY
	Q==
X-Google-Smtp-Source: AGHT+IHZcil0xtLyST3sDOJtjEJ8Q1w8t4vE+wRo5JvoAI0L4YVl2hM6fja6W80hRtiHTsXppngSkoU4ekQc+wPvxGM=
X-Received: by 2002:a05:6870:9106:b0:2c2:4c92:77f with SMTP id
 586e51a60fabf-2e92a478289mr6485269fac.38.1748872118156; Mon, 02 Jun 2025
 06:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602133653.1606388-1-bqe@google.com>
In-Reply-To: <20250602133653.1606388-1-bqe@google.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 2 Jun 2025 15:48:26 +0200
X-Gm-Features: AX0GCFtH8q7_iibcqy7PZfc8_r0qw0yaACH-9rlFYCUQZJ89nTglDsYGq_wrzcg
Message-ID: <CACQBu=UFGmCVK=tpcerBXZBQyF87EhPJqD62eAgm0OHtW6yc1g@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	Pekka Ristola <pekkarr@protonmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the spam, please ignore this version. Had to fix one more
typo in Kconfig.

On Mon, Jun 2, 2025 at 3:36=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
>
> This series adds a Rust bitmap API for porting the approach from
> commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
