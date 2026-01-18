Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117AA223DC1
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768776401; cv=pass; b=GDw4jnznERWvBqa195vE9q/AEGBU3S7+Ey7S3LEeabt2mLc/tXkLbPJPihfvGPz2FbtVgKq+lVnG8QRrWE4n1YB6s7XZbSNHPQrNA9lFsNxBZLDECOghy36KjJ5JokzRv22Y8edNa/IKt6Hn7Uns6wKOof0ggU9nglvY8nZ9RUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768776401; c=relaxed/simple;
	bh=2g/7cFlPY2ZAdPsMyWoE68vAlVX/dSFDy6oQHwex+sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZGHex+3eph7pfV3GZrAV3niOfWIkK8PGXrtUcAcT03GU4AAlEN7dEqy+yL+jGKn9X/qLAsDgl6wxIEDc7GnDKxEk89sc5164XMBBNp17u1mbCx5Q3FanWm0B+cOHrv1nLDo9A9K4Fg5LI0lDw4gEUhh1Jg4sQJdXg4A+fm9ol0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiNKT7sU; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiNKT7sU"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b1769fda0eso387210eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 14:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768776398; cv=none;
        d=google.com; s=arc-20240605;
        b=laObACNE3TszztoW/S8v45Wrymo5yi5h84Ag2YQoOOPLXG5cP/aveji5mROT8MPTT9
         gfpuWZ27O8t44WZZkvdFNlbCVTE5Z13PQh8HCiX9DbfGIfeyoiWoOrYaMFBGg5tyPCcT
         AjPEUry+nOeg/2DqFiM7fYwKr0O45epp/gT1AlS+1P17JHnSzxOyv546w1KCZQMZpwIr
         alE9ODtlAy3CN6sp7UyirMvNgM4QUIw19tTPTfKA/jaLu5+u8g+iTAM9Smthp2i8pmaw
         oJ1a4UwcdM9FogJRGboqok3qNkGnkhNTie1ePAyHinHyUSWLpMD2jCtCE1S9lOufpM67
         m7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtVEsLC63/IRG9ePaQ4Wz532UEWlaB8YwqF2YosYYDk=;
        fh=Bt2b+qIV8FcGYG16JRG/rVSHmtV82FRpQbXfPHOkIdI=;
        b=epwRoAmU0ifiVm9TAvYJhbZ4YAgfhDMh1XkaSN8/Mnwf6CqrANxiWk3sfWMfhnRj/K
         z+/QPCOEg81ANnjlbJDB+R9IM0ulvYl8gDyfbwdxpZnEsqMUBihHeXR5X6UFzrCR62QG
         KKL+uNTVJ7rwEgpXs/7456XK/RFRvhGIjf+Tzd4mvhoeY/uAcLSMxt4pg/DRdviabc5p
         mY+EdBR1EPT6633aazX681SgkwRgVhObvdCmAdeddyF7bxdBwfL+/56Xyak+bPFdNChq
         8tr1sPrJ5CdBzWlFuUBV64dATE6meJnOoAkNZdsQg1wfd29xaoJZce2JaS/MQudQj3g5
         /dhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768776398; x=1769381198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtVEsLC63/IRG9ePaQ4Wz532UEWlaB8YwqF2YosYYDk=;
        b=RiNKT7sUt0UeJxtr9eAMht9VCrKQxQwvjkYqg+Nh+EbYjqdbFXEy5RFdOZLtYlL7P3
         tXtCh949D7x6+iVHHwyHcEczfLbRkvZtV0NAKl5Zj7TRa76H/4xfpm1SYn1lZMb6mx/1
         qMI3KdykDFWJdkkZyKN1BoeutmHCs3yInnJG0ieWD9cVmooCLIgU5A3SeGJhzay2jaru
         g6tkBAiZ4pA54ZnCrjBv2m3ZPGAgLMbYIWUISmhV+Rq+QJVl1BpPJp8k/kXSW5swbiuQ
         yufYPKVNBXGCSzWfIxIYSo58LXSpzBaDc1LVwzNj80Uop/iL/jnArEjMlP1r9z2WujU1
         nBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768776398; x=1769381198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtVEsLC63/IRG9ePaQ4Wz532UEWlaB8YwqF2YosYYDk=;
        b=ROAs7sazUxQGzVNEyLH82vhHuhzOQbw/3xEzYR/oN1Wpix2aHWteQp8j/O5hZc/Zfm
         Y+JOdUjeVUtOVVyi2Gd401jm8M/LwLT9DQ0fk1aNJ1sB8q2EWSd2eKPlbIIZF52ZXx3O
         GXHwco4W5IFs3A+xpfp1drcgG9RERjZ0NNs+a4HslVBd9A/A5Ur5J/F+MNAfDu6OJ0cE
         rtO9LZBzhA08mYvX2/JtCJ1dh7fYQYC/FgxxvJtLpRS6jTMxAb7R2QqzJxem44uQsNhC
         dwq4wWDEVuEFYfHyKVkbN/MXhimO2fgWz83DJcb2B2cG6PuITyHgPmuRmnH99E5V82Xd
         KwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUc9RsfMUAbz4o7rc2m53kSC3z6/7Touz1TAGh/otKBXREJJlgajQ0V6OnQ3qbJQvZhLNFbWP9/JqGBFSjr+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfPM8kffTA2wp4uD3vtgeFj3aihyhfHUrqL/y21MHKOZgIqpfL
	maUqFFZGSGUG/T+FTVe4CtnHpeg0AdTI0ZnJG6EpE1HKslWWrC6eMFhokYWhoTpgETudX/5RNSa
	NuqJAWz3m02rt58sS8wKXUjc+Ly7cJssH4P9xBLo=
X-Gm-Gg: AY/fxX7MKKvYRQKsc32GpEGIzx2k7JFqraixtLs929Fh5uG+WH7XInndXYSUwcF3TWG
	pmi/BY1XBG3S/spGI4WYvSg/DtOkkgZzrH1PSPQEjg/zLOcyz5txI3XmnqJU+LvSorflEPFl9nr
	9YmhUGnF1hvIsxVmBwSoTar4fFKzDrv66OSW6w25TMYBolrm+pF9lCC1kUyheXTCEjnZEsko5VO
	kDpVoEm0fpij3SBPikI6wJwxKEn8U1UY4xZKZ3nn6DApk7Ds9ETZMikp8160sJn7jHvBcH26LXd
	PS2LNXRsauIIOXVEkNz0HqOgS3OBvHA2SlXKGexgv9tHYb0ZIZ+/ncc6mgazwiLhjoEsm5IkJ/w
	Cjy18xXYPFi1wfUBhB9JSAYE=
X-Received: by 2002:a05:7300:f18f:b0:2a6:cb65:1974 with SMTP id
 5a478bee46e88-2b6b3ecafe4mr3840431eec.1.1768776398161; Sun, 18 Jan 2026
 14:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be>
In-Reply-To: <20251221081659.1742800-1-stijn@linux-ipv6.be>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:46:25 +0100
X-Gm-Features: AZwV_QgLttooLq08ae1MGIYSqi9xhNf1UwvXHTfzNO4Jj3FY48KQmYnqWrzcVhA
Message-ID: <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Emese Revfy <re.emese@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:17=E2=80=AFAM <stijn@linux-ipv6.be> wrote:
>
> When CONFIG_GCC_PLUGIN_LATENT_ENTROPY and CONFIG_RUST are enabled, rust
> bindgen fails due to latent_entropy being undeclared:
>
>   BINDGEN rust/bindings/bindings_generated.rs
> ./include/linux/random.h:24:39: error: use of undeclared identifier 'late=
nt_entropy'
> ./include/linux/random.h:24:62: error: use of undeclared identifier 'late=
nt_entropy'
> Unable to generate bindings: clang diagnosed error: ./include/linux/rando=
m.h:24:39: error: use of undeclared identifier 'latent_entropy'
> ./include/linux/random.h:24:62: error: use of undeclared identifier 'late=
nt_entropy'
>
> Fix this by adding DISABLE_LATENT_ENTROPY_PLUGIN to
> bindgen_extra_c_flags.
>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>

Cc'ing plugins and Kbuild.

Kees, Emese: from a quick look at the plugin, it doesn't seem to
change the signature of the functions (and even for variables it just
initializes), so it seems OK to ignore it for `bindgen` purposes, at
least naively. So I think this sounds fine.

Thanks!

Cheers,
Miguel
