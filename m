Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0C23ABBD
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761659862; cv=none; b=P6QqIFf7NC4PqZyjF8KE8wPeRPWfI5BjZDxOT577MqTR+qTRaytvH03gzD9YZKFvJ0ezpbPoQ1OHl0RoRSps4xMiMXEiZ8hYdB49kk/OuzvyOJUqLa2qCnkrRM/ANJqq7vjn9/u4jHoFmhuGGJB1J9MXZ5jev3jvWAFCOnJqBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761659862; c=relaxed/simple;
	bh=nV8aVqNOJAIyIjO/EUdFBuENKUMJmFxkUUBjy1ynmIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leQgydCg3wFMlnAI01qoSDqHkwPMt/d8VS+gII2xvgaSqKNVcEaN6mmRNDwbbO2vdfHmonJpFAKX24tvbQ1Lqz7BquAIH5U9X8STfecfp6gAuxdxRnavcV8eMCBJkARzyJ5bEUxkql6UaODYNW6DRxFIiOpuU8XP9QHy7/hJTQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1P5+oPl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1P5+oPl"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-592f1f75c46so983633e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761659859; x=1762264659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C2XMyUgu0EHbkLApoQMoHRbeyl5zqyqZMRCLgfDJEo=;
        b=g1P5+oPlWgZ9CxUj11nsE68Y7kuCvnhAWJiZMttzVN+7SGSh1Hi3Wi2ycPRVAZv/OB
         /3UNZcd2zyl5im3c6Y9MpMX3t2wtioTB9B32myg1d5GoBhmk7JxTDguhODygf2Oyfcat
         azxfXaoSzj0YsHU59cYdLOlHRahrUAlQuoLaQ1g/Qz0On0ojDGGQbgeiEuccz0ltQd6Y
         AI/EdR+7wLRzUlVX/YuPgk31POyP/lzQpZiDEr9phBCNXUgI/phu0TI6not+bZF6fw8r
         Yjwf1EZmkBdrUOJKItEeH9YrvOnxPi6OSetlJsv/zGPqe9IHEXR7wWK4IRBMgx5XM2Wy
         ZhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659859; x=1762264659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C2XMyUgu0EHbkLApoQMoHRbeyl5zqyqZMRCLgfDJEo=;
        b=OBLbt5djbqW8zQGQm+GoRYLIb7U4xmEg9UDPXxnlY78CfyZG2dkQHYJMyZGQzIyiXj
         S3GnffohCKhqH0jAtqnRWGMIeU0o4T7J9OEVV1a16d6fkc5Pl8C7J0XGACgA3fU0diKR
         FAKJuBDPbv3cmKDsvK0kZP2XIxh9brq+BlFzhD9/AzYTblvTeQlWAhR5Xi2rwuj29ShW
         qiDil6p/W5wck/xqtCD7djGW4gmdSAGQi8UxbbF75MsI+7LSeNJpS9bbwdwVai7/BRQL
         YKosptmx6eI0JUXix1DcQDcs1ZYBp5m6b4Wl9/PY7fGzp0aC2rMj/HETKvFOuhZmO9Q3
         QkPw==
X-Forwarded-Encrypted: i=1; AJvYcCXO1xJyIGotK+2zD8yWOZ08FK1+LL0ZLHhqzFVS5ULL6pXRGt90AAhm6Nxjf1Kdb0xTKSUhQHLAYg4vIEb+Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi+awUK5Waeb6h3e5auaeM8fLHftRLfuR9hlp1vbmmpXwclZXw
	JAseUjVpd1up+2oLtnOLCKTrExr66YYRNFvNVotrFPF1b9zQ7epVVdKBqTTldyVv5rNJU3udAIc
	za+PZJEvcgAgKSEsniv0aZ11qmcSX5Bk=
X-Gm-Gg: ASbGncujOsuxbfrOhTqMoKkLavtTKKBG3QzhuJ2taSZ4vWtYW92MqpaTrlzUhIPYhpa
	/+f7elnFVVu1Xi5/ky3kQ0OpMkxfwkQPEjXhrPsslVezqqvGNissu//WFgcYcGK5QXgokm9Laum
	A6G1V8hf96+YLb95EY1sI3ln1lQLuoP/jqTJI4FiL7rwP4EfILo5ynaes2sZT9mA0cspxStDQ49
	kg0baqvv9uw6rg1cbfu8GZYKejAwDaYPhWOZnWubmUkMnicpKvtR6bVs4g6rpFHqzlfIP9jWPos
	URL6GIaPNMDDkZALVKi/DOZItsNkaanxyi2HLFTYDxMJKn/iE5JE1MmQVAG/fajEnZqm/X4erlE
	mDqpZtzGHmybciA==
X-Google-Smtp-Source: AGHT+IFS57SRzyAyh1eA0T/y//nY2/lPuyiomWpmCMnvcaMsoEebfDQSxTVSOlnauCaDmOiZN5PfiOLQuY4tBm0ugog=
X-Received: by 2002:a05:6512:a90:b0:57a:8bb8:2a26 with SMTP id
 2adb3069b0e04-5930e9c8d1dmr707784e87.6.1761659858839; Tue, 28 Oct 2025
 06:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-5-dakr@kernel.org>
 <aPnoTV4kPz5NHGBE@google.com>
In-Reply-To: <aPnoTV4kPz5NHGBE@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 14:57:23 +0100
X-Gm-Features: AWmQ_bnk18uRC3GZJw-yqZUBJTaPq1ujFmD1FsVkdoikw4byHiqEGaMJE2xDXoI
Message-ID: <CANiq72nSugiQhNU++HYGi=N6hUN815copxgXnfW7fXt6pWhkjw@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] rust: uaccess: add UserSliceWriter::write_slice_partial()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 10:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Isn't it more readable to write it like this?
>
>         let Some(src) =3D data.get(offset..end) else {
>             return Ok(0);
>         };
>
>         self.write_slice(src)?;
>         Ok(src.len())

Yeah, I also tend to prefer that style for things like this, because
the "main" operation (like forwarding to `write_slice()`) is at the
top-level. rather than deep in a closure. Plus early returns look
closer to C.

Cheers,
Miguel
