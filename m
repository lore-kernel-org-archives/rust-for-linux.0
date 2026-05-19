Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18E31813A
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 22:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231225; cv=pass; b=kyEpdvdamNg68g5Xwy2LwmtRDp46vHwCsr8B3zpwjXXzIj7GaSs0V+FW8lKpLRxIvJtOeBDc7tCcAj1qwjPXR2TM0A+J8k5hQ7cLDAUpSox5SU9E2OnIDDBNw4X8S6hedoupnrQAqSzqWs5vMw+jxYg0YIxvR1EWSZDaaxiAov8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231225; c=relaxed/simple;
	bh=t7GsyWB2IPgcH0kXJeDMjnPjYo7LDFWtUu/d0O9nP5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiRhjLSXecEXST7T92CRfLGEDja7YNydBGR1iQM8q0pFxUdW3HZIRt7mWgsZKH36nKu8+I6OTsH/bJ/D7iPBD4ImFK44fyUj42hyELTvfRBTzFWnHBNe5SOO3uvLwViMKGD3bjZbAT4mffgigJ2aSDT0wRFX1EfCZsuddvT3LZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAg0ZccG; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAg0ZccG"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-303c0a57d55so382955eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 15:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779231224; cv=none;
        d=google.com; s=arc-20240605;
        b=hBBgGS2hYy0ql5/pnh/VXnHJHlLEeyURWeMESVZwpODxEIPUlAy+Limhpzwdj9ep9I
         iinZ2wUVQBQHvSRu+ZzfcTP+SdtlmFdHX17ZG/zDneAsR7Sc08DikhTsSkmL2ArwK1zJ
         /HzAuGpj8ivvx2pbUxgbLGfTbW9LKrFZuhm7xzlFk9cnvt+7tYNeSfkSUpbNKGA0NZBU
         v6aotWcM75YMi/PBqRMnA4ZZhtDnSKhJatlikP/wxza+rCin3c5/rjMrGr5M/omfS3XW
         iv9WfOWDJZk1J9QB5Vnd3APVoD4UYF1xfEOzQmZXJ0D3zgYrUf3sdoxYjFFHs8KsDEP2
         Qjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7GsyWB2IPgcH0kXJeDMjnPjYo7LDFWtUu/d0O9nP5I=;
        fh=2pUi3ZFwZI52RPthmiTIABFcmQBL4dwtrUp5jdwIzC0=;
        b=OHTuBM3A8zhap+Ea7F7LOqEamIzP7OywFm7aPOtn26tLctvrYaqycsnKo/+W6dqBL6
         jnsKaD8Bnb2x4RJkMMay4LBNjzBLqGLWNl6pm2y4ZGxISkeVeEDvo8RV6wWPEjXA75zK
         A/WCKRZQODj2ES7H0sD4OzLi5zEUjIENZsRciXDpBdxQuZWh5RXWZ6tlrRL0HEJUlHiN
         OfEoL85eEGFmBc+p26DL5lhRrQjsAg8LGPpPGxYhFqIJ2w1nhXpTfjlI9Xw8jJ65XfpC
         dP3eGwSiCg3Jj2fRB22JZK1Yt4XNefKsprn9xZQCoNGPa6wWiTKmG/+me8uTDRGxYLOm
         s/vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779231224; x=1779836024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7GsyWB2IPgcH0kXJeDMjnPjYo7LDFWtUu/d0O9nP5I=;
        b=bAg0ZccGKgHtDp7UM8NO7UfXUtDwRi+vXF4oEx6pf36/vOIAIyV+Ww0XPbkYHUZBjQ
         NnNf26X9hMdDbN+QHH4Be5LnWkDrnWFlaH6TmFl+nWQXIOVrwUcz5SB15Q1GexkbInkt
         Fa7R+AQeR3Bzr162YNZRSKSAMroSRqofQKY+vifXCe+EpGe96TesBZFGqdy9vm/FWG3z
         hOag9eEj7WspS/Mv1SaCSUhlHPJNzM5CpULLKiLolYq2clknGTI0lmKpKPncK7E41yN7
         OResunSj6Gk1vwZFkLzheZv1VACzg9V5dZMFsdZ76Gv0SkCwFj4qdoMOEAG2TeSrdV5S
         lLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779231224; x=1779836024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7GsyWB2IPgcH0kXJeDMjnPjYo7LDFWtUu/d0O9nP5I=;
        b=kz99zCvBl7uypmc5cbIrhMbcHx4mBqALTy7jWuZcjUMEs2PA5fjfrdXd3ew/ewec2q
         DYyBj+Q0shhOqVk4rzrIwwgs2oNanR/q4rSRh0sUvQ9kWNGXOxYfyYdqq26XL4bURf8G
         iIMH4u9J22R5Lch0j2zA65yoiVKhq1UQ3oQI5XvooVZCqpl8uJVS3YHzRDA3TntilI8c
         gfjSwnWRj0D8JEGDpPDcvwqotdmhORJDN93lubsHBlVTEsTdYn+3QfQ3UmsRr83Y3lUr
         p+FbJmFaye5atzjTWwJbZo4qx8O32JBXQmUcJ+nUiCHw4d0b93gKK8UI6Jx9kFYbTtNj
         E0rQ==
X-Forwarded-Encrypted: i=1; AFNElJ87b7jM9gYFVh2awfqKB+xWrut4Tp6avLP6QUX1gG8ovl4HNzPdde4Zwsj6LEGE/niSaXfG6Q4tCIclq49mEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQqngNBWOPbOfnkrZvUT4Uf7Cd+BsTUdjI4dWPQgLemuIYXtU
	j9u718Xg52P9CzJRy3y8SyvnzeNW6pHOAEI7Jhbp+ahtgapiN0RPKzJoGsOWNrBvgfhpaMFZ6Cc
	MR1BG4AzzuezfeREpp76MWSqe/rLDyGU=
X-Gm-Gg: Acq92OH9IXvdHAzRG2hANH1jfmAqUlHeo/vYS1IxkrA6M/EoMZNZF2oi07mKxf374Ov
	AUJEIj3CT5xbEfyXG3zPF21Iye7liWrEy1fbW0RtT8dOvTdyjTQ4sNxLVbQrVL1v8SVkxKfi/CB
	yj8Hc8nqC39eASrfG0jZxp3wZnfHuYyK/AvaWyYqSCA+jWB0HHAarQFh9ndLqyb+53i4o5cTNvl
	AuGojRtLUXKT+9LfqK9loq9C/6C1NSUAO5wz+YaXQG8VzzPsjyWL4Uu4iPbOmwIJuAsTfYbg7W2
	Y7qYFK4rIop9rcKd7/zsoRlBY7fd2u89qwTAQm+sKcPRsqTNg+0E7AAro1oMpybsVM8y8anrxMJ
	bHHKHA2nXoh9Umbyi1EDTSMo=
X-Received: by 2002:a05:7300:dc04:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-303986de8b3mr4791656eec.3.1779231223623; Tue, 19 May 2026
 15:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-clean-fmt-use-v1-1-7ae7858192ac@kylinos.cn>
In-Reply-To: <20260512-clean-fmt-use-v1-1-7ae7858192ac@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 20 May 2026 00:53:29 +0200
X-Gm-Features: AVHnY4KO2WS-KO2Dkl7eU3PJEOTHvMoozpWVqURlCPPQ_yBwB-lAcI4KyGa2TTw
Message-ID: <CANiq72=Ty3jmbbOieCdtQiprpbbS=_kSxWS1EGzt1zeu1YT=ag@mail.gmail.com>
Subject: Re: [PATCH] rust: fmt: use vertical import style
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 11:21=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Switch single-line `use` imports in fmt.rs to vertical style for
> better readability and easier maintenance.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
