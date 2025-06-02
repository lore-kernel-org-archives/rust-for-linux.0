Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC5F1758B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860140; cv=none; b=rnTrQ6mUDxddUx8baVQrvbziko4yoRMCFa8Ah1tZRDhLqMDuZwx97TrJleMVzItv0l/5k4+ZjQDo1sfy7FxxJAoUhwkNRy78ajqyaadFCcmpL7nIReDgYPMhKn8Dcmx8zjtQeFs5Lpb3ujMFDNPGlaCS2ONfL7kOhqf4muCpp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860140; c=relaxed/simple;
	bh=Lgz+BLFeEQabK0+ZpWJOlQc4IuQGHDjipBLDp5yZ7v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imtuNGZ0vDYbbiwkMSujV5CLFjXoTTKHwVkSSrY8aJgDjIVC3t0LKJxvJ5EmXl3pdvZy8iBBhgk4kN9e43b5UghqBBZu76q79GQ5bz/O96MBoCWjnP4Es3OvwUFWrbcC6ZofrT3xidVznCdJcOzd9BrQv4n7hnNQ+9IBwkFqznw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtOkXeAZ; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtOkXeAZ"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2e3e58edab5so1689271fac.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748860137; x=1749464937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qycxfetkp2Y445+JA1NY9RHjOJR61Z4glWtbTUVoHw=;
        b=UtOkXeAZkZzD1Kp07ImmrJkCkHh1ch5m8le2xPyCp3oin2TwtoRqhhV4VvMZUkNvwN
         yJuuou70elm4UJhFTUraOWQh6HV78ZUhM1zQ2/Ne9eeLMsWFPWr0dr7sFQn+1zgCMnxM
         hHWqhswf1lXdvKr7p6w6WKV/MeU5pwPgZlITh2o4kGUU0jFK9IH1Kkf9o2C2YBtO5Y47
         imDkIayeCaLVkcc0i+2aq0t3q6q307IPq9/IHEq9ZlcQUzI+OpZEAcVFRdooum45spsV
         6QqoKnxGXleLYchA3t1o4A9O56GUlnjL394HqpABwC67flohPnjao3hl0He8GZT37OV0
         DoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860137; x=1749464937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qycxfetkp2Y445+JA1NY9RHjOJR61Z4glWtbTUVoHw=;
        b=ULSz2Pto9BExjPMTTXXy+qaGzvJuHEUuB5qLAq6/vHiVNUuHdjxp0M8dRFtk2hyquE
         PRx7vhAsjNmUDrV7HOvTvWRsiKZ0sa+z5xF2exG0EP2FVSJ4l3XK05JcQzGqivKQqzbw
         3y+PE7bpYB5dx033nzyZ8BkLM4ZnXqHZuIhnDmAaQPek0Qvgxl/PxsrWmq++BFgVfW/u
         dQ+tJqnXgzvh2eI/MbrMYdSKMiRVD1p1EscdnBgUrkz9+mMLdwBMIIHT74txIg/iPNK+
         GG76LjXJZYrjuKeTAmM4QFMELI78ptj5OusUi0oqL20TYMlTVtnd9c6B16AduOg4lQ9R
         TmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK9LEMxbWPbHBqSM2SBclJKpUEhXF7OPUMc0XtHO8YsN2laGwxPOg6r8jRurEVdxiW1WBkkFv3HziYr/q7WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykC+w2NZAc1neOOtyAx11QTidD0D76kI61pcGYsdu2NM1chTKx
	NRLRdePt9BcR+J4rxASZsphoaX0bi7NGm4uHSs01uZmAeNJ0RfP948PirGmJt0MlC5Um/GyZGmf
	flJVlIx3kEf7Jps9MqXWr0vfOTQloXUo=
X-Gm-Gg: ASbGncs2SQh4zpGreHIcnWSSav3Uku+PqKEeFIbog816MerGroWhn5vn+Y4wMssGPdO
	jSb6OW1r8bOHzV1ym/NhFT6v1YoKoVJEwlECLqCyaTESmK/H5sZRbs6J4f3wuJIGYkHYMpVr2I7
	6SC1sqVidoK/U4/I2wLmec28WbA4NnlGPKykseB1Yea29l
X-Google-Smtp-Source: AGHT+IF4SACnTbASdDZkerZF5fG9yGeHSIrww7kc0Vl6pFDo9/75ariOqTK6uDMBYZt1rLPbLUKDxLa2SaUTUv/DtU8=
X-Received: by 2002:a05:6870:799a:b0:2d6:109d:2598 with SMTP id
 586e51a60fabf-2e92a10d609mr6943321fac.5.1748860137546; Mon, 02 Jun 2025
 03:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org> <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
 <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org> <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
 <CANiq72=MZ63Yyspe+XoHkT6zQNWmLt8_qRScoX=2jhLzV73e8w@mail.gmail.com>
In-Reply-To: <CANiq72=MZ63Yyspe+XoHkT6zQNWmLt8_qRScoX=2jhLzV73e8w@mail.gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 2 Jun 2025 07:28:45 -0300
X-Gm-Features: AX0GCFtNSGU_9kIiBSaaKE2gVPOqmTcX_fyaVKbKhODzCVXl8Pb3LSUjhysNYCA
Message-ID: <CAPZ3m_hTr7BN=zy10m8kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 2 de jun. de 2025 =C3=A0s 03:38, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> escreveu:
>
> On Mon, Jun 2, 2025 at 3:18=E2=80=AFAM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
> >
> > oh no, it looks like I submitted the patch without the explicit v4
> > version and without the 0/3 part :/...  Sorry for that, it's the first
> > time I've made a split patch like that.
>
> No worries!
>
> I saw the other message with the extra "manual" v4 cover letter, but
> that may confuse tooling, since it is wrapped and the title does not
> match etc., so it is best to resubmit it properly at this point.

Ok, I will resend, Thanks!

> The cover letter, and the right titles etc. should be generated by
> `git format-patch` for you, so I would suggest using that an
> reviewing the output (you will need to fill the cover letter in the
> file it generates) before sending it.

Ok.

Cheers,
Marcelo Moreira.
