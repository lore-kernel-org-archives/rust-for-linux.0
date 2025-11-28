Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB2D2BE7D2
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295949; cv=none; b=LNOcdSkjJLzOKssyuJXDtK6pFe3gRg5kqbg0/fHUc98VlFM6g0F84N9cBkYzchpsrlNNgd4ammAeYiUC42lozkdsq/tXDbT1GunCXwFFH/u194/QeiZiOTsj01ykahYg+BE7/hWniBCeJS4OZSxUO5F+HesSXu/38T/MvDa+9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295949; c=relaxed/simple;
	bh=+JjBQnIc3n/TQDNH5DW6jJEmk5LUMiMfaNI8ak25t3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoSn/dIV2cKc0xwdYxSxvNkjLPwYdv/H2/+NiL+l3HXrAiTq3IyxYFrBe2vl/JWJyJpTByZykGLfHxUVatoknODU03XRuHvIHkgvLTX1+Gokkqk1CB5E0S7Q5QR/wLmjSa/dGl/6lhZZW2Bk9Lhym7fmOpMtBoJ36kw4l0A9taY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2b0GXgI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2b0GXgI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297d6c0fe27so1883285ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 18:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764295945; x=1764900745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+Deo3ykW18zczZJ6v8g0bsrfahmwg6dAeCD6Fwe49Y=;
        b=m2b0GXgIZSxzYqBM0QjQEaXbVOiGsMBj0d/0/VYgSbWbxHwzfhZ5FrtRu1+QfLTmuE
         zeyGAwgK+NCFkTUx9EWADHZ9YirlmRCsYVHOqFsRjY/pHJL0PpYxWJdlp4CXEIHlc89O
         8XfW9WB2PtVQj+J1egRuNxB7JhAOEN27ylFo+R4gYavtFMq4IOQ35Oq1v2m+fRWGqnch
         gfi0qTpcfBQ3uGV4NF1g91x5Zo6NA4sk49rvLszMXyLoWVoRWsrYRgNfEKzDCTpLBdse
         D+aNbhuoiH6xNo+XddhZ5hUcoo8w3wh0mKYvTXtxiwR+/hsPpi9irYZuygI9+YzNoi0i
         M9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764295945; x=1764900745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s+Deo3ykW18zczZJ6v8g0bsrfahmwg6dAeCD6Fwe49Y=;
        b=cG+XST+1sD74xzKYhl9/kiKruKwZhsdzuiufn7SWvty/XIBIz96o4dWgVnPwMrRd9Z
         HJB0uLzMZ51tGmHxYWYj4jmW3YVcwZtksQ1U6LPPz2c8PWA1pvvDbEI/QEUqajBUOdQj
         NzfXugc/aANo4PjBMmjPQp9Fkkwt+bwt7WtdERw+jSnvYEddBRsPFWb7fVBgD59QobqY
         oPbX0sohEQjdtunrpP2CHAB41Is8hM3S3YFYcCBNLhLqe6zC8+1U7wdv5wg5sgTVw+CX
         Ux1EI4ITScyPxmqCm+E0b3/cMf7X4Fo9lRPsg4OxKzGMn5W/YtOZKMIWS/S+aZwRDFE8
         pqYA==
X-Forwarded-Encrypted: i=1; AJvYcCViAjiT1PXhfAg0TaU9mwu6ObPiIEo1OUmTu9IHXGCyaL32lFTprckB8NwuOnQ7+jinc21nJtLM0mvAoC3+LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzDetJnK9iCf1G12r3rPwwpPWKE20TmQwuyxnwwAfFfM1JUFd
	LwN1tkLTPte0aY07OPGTNJ8jBZTfDssQjiqB9r36+LmsmU5CncXC419vAY60jSUxSmjtGXjuDxl
	IEcFJXYU6Ux7dLALXaqxKyqmQIFil8f739+ou9e4=
X-Gm-Gg: ASbGnct1JWpuj5mn7Gm8GhpifO+w+XaTPgauY+N8vceKJtYMrV9IlXJfzfrasqK45aY
	qGPN+5uwSd61b+WtAP43u6d2WwTG0UWYhvHNDbUvkS6HfwETvis43dOeVoHewapbLQJYeA1wi1G
	z6/6e2H9YEaG7Xv99Z2eP7NuylglqrGEFAkb9RpzR32uMRHE5UD5IPkzzL6R1p39fpTTYAtkNXn
	9XghiGM/6UBEaZXjD8uKqr0RDHUcpUxLV1HLpJkOuXhrj8ZFnnKIOwB7o1kYj8KOY706y4xXEYg
	J7JncP6NJd62tM3lPWPv3QvBMB0F7IkMijDO+EHAdI0ECaY6fgVRk5V89djT0QIF69Uc9ITvLrK
	jaCsSAYkSMmV4EQ==
X-Google-Smtp-Source: AGHT+IGYLeogPgchpl+C9BaX080m8/laVbJFX2u0w7K5WqERoBGK0YuoMHDL+taox1roK0Fjrh0dQYgW/d2FC2SoX2Q=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr15846520eec.0.1764295945264; Thu, 27 Nov 2025
 18:12:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aShM9CAyRPe2gYpK@fedora> <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com>
 <aShdutWrmU2q7gUT@fedora> <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
In-Reply-To: <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Nov 2025 03:12:13 +0100
X-Gm-Features: AWmQ_bnSCfo0kSJKrPhUON6xGy08v8pEe_OgiIJ2vDfYQ8R252hs7M8dyxpNm1o
Message-ID: <CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize overflow
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Shephard <bshephar@bne-home.net>, dakr@kernel.org, airlied@gmail.com, 
	aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 1:29=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Ah, indeed. In that case, can we make the if arms symmetric:
>
>     if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
>         Some(sum & PAGE_MASK);
>     } else {
>         None
>     }

Early return style makes the happy path less indented and is more
consistent with the C side. However, here the happy case would be the
indented case, so `let else` would be better:

    let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) else {
        return None;
    };

    Some(sum & PAGE_MASK)

Cheers,
Miguel
