Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63B2B9B7
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 22:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727647311; cv=none; b=ogqdn0vlJxQ9L2SuCLfH/Qs1sWQW0NqXXrwYkUYTLRvIR83O41TqN5uBhzXdnWzpy0zEF8yy/GnVyp9dbAemlBTjh25TC+0fzTVTkWenvGXqxLUN+PByovaxFjxn7xZcdMyYCXsT6Ic+zQkfvYrKKArdMMFBUTcK+Vj0dByXYkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727647311; c=relaxed/simple;
	bh=zMus0Pc79gKj189nyXTQAwgSBAQgMA8EYiDhd1e3tpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arWebGaKm/jnuQ/Xlgk7a41B1ng/BRRY/n0oFzrdmRhjLeUsh+3+eK1/siKTKL7QUQolhRIeYXRtaO/9FjmFrGncz1lPSm+TmwSLZblK2iX6QheDih/vhC47/kxfHbOk9rqyn/dSMDVuDYF9r7oGkmIxAZi9J/3y2aRHdFLl2gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=XSOb41Q9; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="XSOb41Q9"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e25d57072dcso2866430276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727647306; x=1728252106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMus0Pc79gKj189nyXTQAwgSBAQgMA8EYiDhd1e3tpQ=;
        b=XSOb41Q92jvV+CQXjMGw7KUxwMBwGQSmc4nL9i7osXWbL0dkqCyeuoi99xHlsw0Kmj
         ZJyvt5p161V+2udjvwk5NlTr4NbjHWCXe1dQ2wmTOh+b8wygQJTkE3F8SZr5llom1HVp
         S49/7lGEATSMbgBqizTwWT9R4AsEQe059VOJVhONAwkY6SWMfMrhij/nZAdcaQAToCyi
         VhZFerv0/BIFQMBGGVjN4hxm2I+Gqos48jkojosr42nBaDH6U1SHIRdgMucMrCqBHdaM
         VNNS+f342Xty1KvxWICueKnpXLMcMDmPDeYF57djaVBJ5xKL8uyKpbhfkkuQIIy4lcUE
         3R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727647306; x=1728252106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMus0Pc79gKj189nyXTQAwgSBAQgMA8EYiDhd1e3tpQ=;
        b=SDbajQBPMtIcy7FtaaVi03axGswVYWq61A9PekJhy+hfxrsHuWr3Hx7LbfcuD7pM+j
         6eEAHzs0Ecx5ZMqluRGLdKJPoCpt36LoswxUlOy4rHav6ObWSUz76V4qm+uNjvmB17zc
         v4MA0meBMLkSlO2CF21mI18LE30pEXlN6KVf0txbFHSKHTGEElfbeSWNltB3CdyhHYbZ
         VSvlQU2FII0X7ucgGBA3DcdaU+zauGk3nBufP1e6/1VOV2//Ax+pQTGEmQFjwpJVaMmt
         kmfTC2SVigpstsFS+Prra3v593s+OGj6iuUcNb34i+YtuB1fLCvLjXWXHtWVqrX2ho3b
         vbaA==
X-Gm-Message-State: AOJu0YyF6yJqyflA0catS+tuTzwAv5Ga8AbvsyksnUGlmqz9fM8dXPnp
	3NL5QLUlgRqT06UY1zOlsSc0NVr74C3iBTFCPbSXNs15ku14QvHDsqO/0//TN/vvHfgScnJTawz
	1aoT3Bkm0MjpptC7CEH5SfgD0Qgem8jJzoNUE9g==
X-Google-Smtp-Source: AGHT+IHq/TFRNvPSIRS6GB5Zg8xLp3T+T9PUAHYiATWgoREjCvsY04CX4FJtKGKhVBtOB4pDoj9VziUs/57ntqdlNgU=
X-Received: by 2002:a05:690c:3745:b0:6e2:1a23:7c07 with SMTP id
 00721157ae682-6e24754f0edmr82993087b3.11.1727647306612; Sun, 29 Sep 2024
 15:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dbb63b5698aa507bbe3dec54b4458a3f151899d3.1727606659.git.hridesh699@gmail.com>
In-Reply-To: <dbb63b5698aa507bbe3dec54b4458a3f151899d3.1727606659.git.hridesh699@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 18:01:35 -0400
Message-ID: <CALNs47sgW2OFAUa2kdsZrkqu-Oj-HqM2qSWBtZ_o+pagcTZJwQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2 RESEND] rust: kernel: clean up empty `///` lines
To: Hridesh MG <hridesh699@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Jens Axboe <axboe@kernel.dk>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 7:17=E2=80=AFAM Hridesh MG <hridesh699@gmail.com> w=
rote:
>
> Remove unnecessary empty `///` lines in the rust docs.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1109
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
