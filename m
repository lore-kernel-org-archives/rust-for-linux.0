Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E58B7DA62;
	Tue, 28 Jan 2025 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101638; cv=none; b=c4eROsWI1ISiOaQqsugVTe4J3m6lJwOXyiNBTs0xhxLBFdZgslzx30tSk4KFJ3slhpZIebX0VnQ26hzdF2AsjzeH7v/bFhW8Hi+xFQIZzNc3etxU0nk28/AIRoykqXjF2/IZkYv6CiWXfbBF6OYzVtUQ9FXuct3Ije2s3JDFMqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101638; c=relaxed/simple;
	bh=K3IpmpA/0XtW8uajzPlonLjj8/7xI4zjBUZlYnqQ4+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5ZxTM8speEVQKfSmGGOuH1i0gwfrkzzlAyKA/u+54/+VOiqiZy89sCsSX3DZfQWYV5e7HlHH+RdUloFsxDWNUweJxKMsW/bVQJQAQFMnSiIzTV2wIOaCuX6DnuoTJrZgluCWPTpncIP32bfTFu6T6xRz4MV5i9NMZvC7AF8X04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcOdMIcX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcOdMIcX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso1445893a91.3;
        Tue, 28 Jan 2025 14:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738101636; x=1738706436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3IpmpA/0XtW8uajzPlonLjj8/7xI4zjBUZlYnqQ4+0=;
        b=dcOdMIcXAFhxTtmNrlJJ2fjztjikWMdhY57ZInTG3kGHMCgpSC2GDXpMS2tjoc/wuQ
         sMYSjCQkb51dxLT9dw9++5SlTjoH4gJcFMK8of/oatXd0Wy7qCFjt77nO3NHMPeRVpmv
         +KEIJQ2mHpw+dHAruJi/wObvWIxjaZf+ONXF93c9FGPYcRmMvtkDKHYmqj1NIMJUlG5u
         EhaaUe3H4IbPdr5j/+iPysWUvsJUMH3QSARVLp9EN2WLq8Lej3qPIZMj3T0PIk34O10e
         g5yRMp0lpk7EjX2NbecT24+KGeHXox9PN+TBCazh+x1THthRP2J+LVo3rsntflm+0Eio
         OB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738101636; x=1738706436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3IpmpA/0XtW8uajzPlonLjj8/7xI4zjBUZlYnqQ4+0=;
        b=LEG9m3oho4kbULgr3k4gNYWuJ/rH8VZAsZhPbpuRvMPHHFcaQtw9RHB/r1ER87XPQI
         uRHYwO8zgKlTUUZlODLI7AyrWOS4xr7DsDr5BU8ADoRZ6Z8ywHluMpCccASVO6vaxb97
         5mG+iVsoQ/OyaY++kmo+caTuGL+zG+OL66rnZzFgzI8g2uUa6wUeGftfTmegzxK91XOR
         MqxhIHJ+cCR0S97a3J19orJcz9frrk4cBhyII4DDP2JW63N+NBHMpm8Z1mXm0bl7LDjy
         DPPawq4bK7OYbT/f4ctoLX3vdCHoP0tz5NkSG+h+YW6821oINheEVu2WNF/+QLIjDQ9B
         p4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCU0MnkJcvpDslDQGW9iH37ba9/bB2mlzGyP9Q4VK3QpE8nAw9lawNpIIJ88vcf1ktqMN3gDFVS8oY4acT4=@vger.kernel.org, AJvYcCUpS2FCfDQJaSOO5VUX0o4VOp03kjcXc8ys81tgmyf5KgQflNpWBYrKM8r7y5VWKRl5PkcWyj7PaBKgGSXO4qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YynDFIm//VOQN00lwMPdXcrB6+i68410UWREO/igE5ATOWOHFbx
	IFOgtJaOg2+9vM87wslQlmOc1uET787vTyEQVhqHg7zZp+hLX0RuDSt4v9uzQpiYboBCDHjvyx5
	KPf/gAxRYvJW7Aqpi/JMS/uHYf1A=
X-Gm-Gg: ASbGncvmiHnHw6NAktzVRoui4Jr8vwDb8elwVtwrObqFFfr/5aEW4pxNxYtmDGau7cE
	RCf+KLaPPfxtqCMReAOfIW3JYseUJ4vz/9D7OAqInBNFw2cKRBiHhBQforzx7sM3m4J9SfLqWng
	==
X-Google-Smtp-Source: AGHT+IHs2ZX6b3auzA+0oDctgslq9X0ArW7qsE48hPm7QycjwKQqq+429G037h17KwD4BrKWROo+ZKpSMK40TBy8pCg=
X-Received: by 2002:a17:90b:280d:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2f83ac5e878mr344222a91.3.1738101636640; Tue, 28 Jan 2025
 14:00:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com>
 <CANiq72n96fJScyVr5eWrfTu8WE9dWXNoyTaLr-CuFj30E57RdQ@mail.gmail.com> <Gv30E9TnyGo2GTh5Z9xnxBXcr3jYGFBmgG2JwkEsCq0X4kHuaPrH_T6cq3iTSzf70fubE7CbJl_OghSPUurylDVQYVzPnoEntilzNv_CSHI=@protonmail.com>
In-Reply-To: <Gv30E9TnyGo2GTh5Z9xnxBXcr3jYGFBmgG2JwkEsCq0X4kHuaPrH_T6cq3iTSzf70fubE7CbJl_OghSPUurylDVQYVzPnoEntilzNv_CSHI=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jan 2025 23:00:23 +0100
X-Gm-Features: AWEUYZl4iDL1I_JenoDS_bD8FQEdpw4TJAHN0AxkTvZAw1oHzgwOwHV2_FhoPyE
Message-ID: <CANiq72=JU5yXnQemmuM0Vnp8NKNO2H+LcmtzzMU4Xn9tBMduJg@mail.gmail.com>
Subject: Re: [PATCH RFC] rust: HrTimerMode replacement with bitfield_options macro
To: Timothy Garwood <gtimothy-dev@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 10:23=E2=80=AFPM Timothy Garwood
<gtimothy-dev@protonmail.com> wrote:
>
> Even if this patch depends on something ([2]) the "real patch" does not d=
epend on?

I think it is fine, as long as it is clearly mentioned that it is
meant as expository only.

If dependencies are an issue, another option that may give you more
freedom is simply replying to the original patch with the extra one,
so that they are linked at least in the same thread.

> I forgot one [1] reference for the first link. I'll fix it.

Ah, what I meant is that some of the text is line-wrapped, i.e. the
newline breaks are a bit strangely positioned in the main text and
e.g. after the `Link:` tags there are newlines that should not be
there.

> Thank you Miguel,

You're welcome!

Cheers,
Miguel
