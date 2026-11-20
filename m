Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192465;
	b=O2RbBsc2bXNklnGClgGo4Tsp5buOyM8Y2rMBlmie0vXTEYQzVJZWz72a1lNrqLBAyJ0p
	 MHfVLgN0LUVnnM2fimuEqA77+pTyoP8sR1kXPMJcZZE+GyQU3rlDL6PCeuZukOMqpxHpg
	 xWYH6DqZmXKh+8A5sM2Ih2Etgvpvp0YRkINmCBNWWHPWJVBGaAVOyBXCCNFk0GYZky+6T
	 J5hUVAo4qR0sgbkG3lC6LLRthn8PtRL4BZU2VFq8wbA1hTg+Mns6gXHSaqnU4ie9b5LYa
	 QXMnnCOQB5rJuEUlGNsZZs2vyh98yOnRu3CGgIdJ1V3vS8BhOxYuec9rAuuFisSsh+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
	b=Z0PYxFdLVvJSQ8rmvEBDw7LoyvFVSyvuv/qgXhkX6KwpxvBxcgtxGj6J4s6AbuOZmMBc
	 LQZGgfEPZKO/13ZDFhmrOOjitNHwkupyyvzOkcHMUhXNdWnJwXldOjlo4AQUDjkCbnvp5
	 EiOUfGyBGWqpRwcN30a5jXrXpTSh33a68FfCXXzKaAtQ571TA6qAXrwYGVkX+Vh4YfxS8
	 pm3Gxmg82L2k7sZok+txQCSka/BMJQCdKlsgYxIHFVhs8s5IDqp/awKOf2Jy01q/h0w9a
	 FXIkwC+JHrltpWvtHfCmiEnE6Ax4cNQ9J8w7iSBwCIb38hfCjFJJlmuKuF83tG31k2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBIN1JR4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AE606A331
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688AE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBIN1JR4
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so62923e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 08:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192463; cv=none;
        d=google.com; s=arc-20260327;
        b=jz/ySQGuQpRokuteT/lqMO38qYlKomRhXOIQSEE6FXv6Bnck+PQcrk9aKzFKzhzeoD
         42YQgpCqw3o+Aon8Lk1Wy5TjD/YVGh8cB8C/lw3QqQZqda54n26RGxQ6lPxWt9aNWydl
         L+w1FDrPmEQARSWHy360qX4lCVB7GX3dslMN/mYbpIlWK4PmwiZy+ZhMFXcF7fU/hVBX
         IqixZhJTLYSkUr0pgkVVQkz2KjQphuCnnLv2eldBylcSshmTV6RriMSyX/A29YzaDsIs
         TZeAy7865PypDD0lbzm8KEBpn/AFFePHIfghvdtUz6WO7n77oU+J1D5SQcjn/8bRuMn8
         M5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
        fh=cjLUN/X257Mydv9+fXqwyZ0qUNXXQkk4O9ghKTI0N2E=;
        b=Stgb1+4MhpwOhCtBjr0C7WpBZVw3JcwhVTE8wPQYXA7kxp4SZ+FmPN+LJ4+Xw5KWmG
         gGVEWHyD50FekLTEB6S53Iw5yuZ7AZONmrt+WQ+NkgUa/yIcg7NNqS86H+5ek4cSPPBs
         cl0MISQhe+ovhL7Zh0VrkUNlO9WayupCO81iZmLJG/EnsybM4i7TQ1ht9zRak4ewcEaS
         JWQDtobwl/Wmgl+vfi0CN6IFGRdDEl3NGYNeRJdNOvSfjFAdZ+7bqtbqKxdzZMZbbvzL
         NGZ6xdB79cHpxnb7fBuoMoXLzMa2rwoZJbOXxIj6qHVExJA/SP143IRdoQZ7jRHcS/uH
         8X+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192463; x=1795797263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
        b=PBIN1JR4U5r3qyhOBJhFDoZHEKQteUgVsi+UQOHvUWCMUsKte9+vLKf7/S5XxRhn3O
         WymdpLThCMjsVl438IqLfVuuksvDStQqzGh1eIoUV0NUl1m9QfVTQ5uypVvckAfkrbmi
         4bTvq5IqyTpsDHUNjCWuLqHmSneVjLbbwpdrdnHmUvbpFF+ZVhAUfFelqZSmf+s9zzZh
         muFSiSxVaodK63XtUTRDO+OBWT1ZFcQPCKpWUOVHRaUloopyY9wTdqHo3v+pV2qDDrjL
         yv/2iNNsmH6ZncQdfCZu2raj5i30B81e3k9ccKy8az6GxlsZntIlSnMNMLFHVU9CKt/J
         effA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192463; x=1795797263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
        b=VoibNuiuk4OnBAOENn0n+5jB8KTx+nyOKA1Sh07E3WgFZW2WgEI/0Qz57C/I2L4oYN
         yv1yLsI5msCZpcRmBB6m4u3c8AqJsO2GOQRH6f34vqnf7lGNjz5mArczKTRWyIk80715
         x0cyG8w5xV9MAhkpfuGrNnWH1782KB114cy8H37V3zqLU3AgiaIbkslKp/zWVm8BKarG
         jWiv5G+GOqntWIch80N2wwFz65coLrxjBgD66kkzA5/eidjn/IJ2NmmMpG4xP0Y/9ex9
         V8mtiOukTyiUdZDO4ajseqOrkppeEykcDSRhoWQTRPdwubROD8kjhGUzWZbEw0QXz3rd
         1VKw==
X-Forwarded-Encrypted: i=1; AL+hErENAq7Yb/cd8fMM7X9+gR/PspJsUBwHdIGPFIoDveWzKRryeqp6ieERed4FPO7t4EayZpq+/JXKVhSd38Wprg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yOiAwBv1tFSwrnQqslJ1mI3AG3yQ1KOD17qae8eZd+ftZQxEb
	pupDZeUYgIU1riHAwO9pHQMw3iheOzECMIdUQw1YpYoWjRrp57Tu23NQLpJYYOjqlhgRrHAWaYM
	7U2QGI8NaGL8qgpvCfeUbFfA8WN55lGw=
X-Gm-Gg: AZFdTZd5W8y/JQFeFiaHnPihuNe2Y0iHOqSclUUvJiPmLk2+lVxvt6lZJgtrG0UDuXK
	dDMx8tt1juEfRQ2G6+Hgb7xIVSFfS7FIGaeYuoEhAqawCP/BUBuMea+sca1ynavBLaMQsyFPFds
	1W3zGmvuEFE+WqwJNiNXZl7YIzYQyxswuc/bhMjHQRPqCCyusyzA4AgQHWYmJ1DNnG3fsSVQMeN
	aM+wxP33OjRAa0l5IvDGDb8f/q0Z56LMsxIeEuU2lvm84+aQz6yEN44Dn6zL4y6oyrqwKlSmcER
	+2zjonKdCE09OeYtZ7gZ9/TrSdXGjZOaMibcqw7UDzFDjDmR0v9YfKWlrziRRP5S8iTtjQJ3Qrv
	c0qTqBWoaWYp2KqMzCXwrR86aiEyNCyGFZV82XlnWhDwzfYFZnIOmajX4SU/U6qA9Z/1DZoh5I5
	n/9dSOI24eYvBR7nhsbZf85l2WdjG/lUQpfROcqoOQaF1PawKlVCyo6rvVIKtDOYIk1+MGsOAlI
	XudPej99CrEXXVIzDQT65m7hBY6q3JLWTZbVHGIS9Iu4DqL2PYoa7ryrPHpuKUok92a7wdhQwI=
X-Received: by 2002:a05:6512:31d5:b0:5bf:f87e:3d25 with SMTP id
 2adb3069b0e04-5c1bc6b22b3mr1458709e87.2.1795192463418; Fri, 20 Nov 2026
 08:34:23 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
 <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com> <nh-e30bf2f4-acc5-411c-89f2-b5dd827aa4d5@google.com>
In-Reply-To: <nh-e30bf2f4-acc5-411c-89f2-b5dd827aa4d5@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 17:34:12 +0100
X-Gm-Features: Aa3M54ql_SOOsMze1HazvjgluNX1SS-NF43fsAY8uNsD-xH6a3BgMusqBnpQfFc
Message-ID: <CANiq72=9EeVT74BW7RA=hVgvx7QE=41QZ80G5CyiNhmJy5yw4A@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Jules Mercier <jules@les-mercier.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:38=E2=80=AFPM <peder.bergan@gmail.com> wrote:
>
> I looked into bindgen 0.73.1. The layout diverges earlier at
> task_struct.se, and my v1 leaves that offset unchanged.
>
> I ran a reduced test and found that making the type opaque can worsen
> field placement on 0.73.0 and 0.73.1. Would you prefer limiting the
> workaround to 0.73.2 with scheduler statistics disabled?

I don't think we need to do that: `bindgen` 0.73.0 and 0.73.1 had
other layout bugs and, anyway, it doesn't really matter fields are off
by 1 byte or many, i.e. they are completely wrong either way... :)

Cheers,
Miguel
