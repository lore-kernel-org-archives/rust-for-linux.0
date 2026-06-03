Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD83407565
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476759; cv=pass; b=GzFPiMnoE1spWC5JE/eMhN2Wt8GqxZdJaWdVVy3Wpkmfn5ItuoQLSxMLSw+SHF8S1EsyprTV/cEjbfnVzOnyMkR9JIGbxJQntbJ1lJfo/4NKFe7MJ3pKnzibfK97r9wzBmI90y3dykt0DmmtVJrXJOdY64HAEyC/gWI5ZGuEMw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476759; c=relaxed/simple;
	bh=EGFZSx0nPpPT8Xi8klATOIesfD1+YDfuEGOz+7rhoPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iu4ncjY+reKdVhk5IqvxEYRGlSLIJt7nNxaV+wLHrXoI4w9uVIKj5+54OxQXypJlLpH+EkNBnzP0sJ2S5KT3Ht3qcdmVTGL/lF19bgV2BwZsU3rKv9/VwUqyZy41wHDhoZd8pgJ8EBrw/Ub81sBtrpwUfL+gGM1CLQ6+45bE0ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLeZiKDV; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLeZiKDV"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39677234558so38549481fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 01:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780476756; cv=none;
        d=google.com; s=arc-20240605;
        b=ExSS6xARr6nr8RZ/3QnLl7mkP2uJmm+PGOMrvy0ZffL8dSSrAg8lZWOZsLqL7fkzV0
         /XUq3FGW2/Qe8jERr1+mmXlr9F59uEmLiZsSTlY02QLvKvt+HouuDxliFQHIBN5YAPWN
         APpaLq44FuDjvSzwpPD9X0Mnna/+4YvSyDDRXZVg6NHk7vaVpWZnkpeHUSvL9ISRYrAb
         SKRugAqAs7kEA85WQCPs4iE+Wd7cIVyRqNxCNpS4WEJAZZKJpFoTHCxwjCjOaolETTIF
         HDSE8Er7aWPkVpflsWrdYIxyNswVlpKYZoHpeOwCiLt2mQgvybsz7Z2drI/Z5MhwREJx
         Pi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=697VXlmq44YvP5WclcZyXKZOINa+k3r8BrdvqCVk+gw=;
        fh=dpSxXlUl6aTmcU/8l0XbBmvlPBXjgC+LMqzsqG3UZV4=;
        b=JIoOLFWDr0kdSKLtKXiFO0cUsgQijvJdeSdyDt12JyH5eK/VX/TDItcskslwD6vZ9c
         jFdvy3EUMbiJcWtpxtMHrWNK3R4EPTbSTQrrUlC69sVBBud5FQoACvuprS6VV3vUDeC5
         rh5jeN876gX9e0DDwMFimNF7DXHqB3WYgi3aCxZsZaIkk+cyCs8py+uw98fMF+pzJthg
         CFgly5H4C5Mj7XOEbRNebXg7eHD/Rh7Ofobj+MZcNJWgEYpqNOTIFoqXAFbpYZ8a0Pa5
         wINt4a5PwQxfA6GOUXG8YOdPS83OUlM3C5PqSC0aFSQGffEWGxWRZHZLUWzWG94urC2P
         eh7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780476756; x=1781081556; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=697VXlmq44YvP5WclcZyXKZOINa+k3r8BrdvqCVk+gw=;
        b=YLeZiKDVNj6Gvhi8jRfGiv2GcNmZE32H8lIiG8LlRYFaagI8iSYa5Ukm8bV3MdqRrW
         LGKeYvasI4WlxQomrrI2GfrTKdb77ujA4mMWBQBnl8WO6n0ud0ZtcTLSMS9HiTr02dXS
         taPZvPz3PQVgeHnu5iqXfd+tnJnK7rtkGXp7PiWP2oj1U0cUYZ99dg5g+fFvx8zof1+g
         5R0F43m0bE5/2EbOn+t018cnCQYVLPVmOfUXChHYgBQWBXutV1xaSRRodRVbRgOZgjmW
         UVxsvc1pX9ChmPia9DStGHUZv7MdEqBL2pNTKl8FQrFa+OfAtdswn17xmqAdfjbJrthd
         jbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476756; x=1781081556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=697VXlmq44YvP5WclcZyXKZOINa+k3r8BrdvqCVk+gw=;
        b=ojxs51z+KtwL6IvvfRLu+73RgcKJCwM8d/svG1Mbtu66G/1QB4hF5thoamccE2Ag++
         5CDq/fz4+UL7mpvAS25oHuh+HLz6aGXB3DgalPqIAC8t2GUqDdhxHygb9jszkGm/AyME
         8quAfE1E/gtpR8LX6c5/4CfLkPTmGSr0sbWkKxpcryjlc8tTyyYNN8Iw+y3fL5+xJX1i
         Aa9HdaLFPC4dRAuxu65IjuBo10whk3U/rDdPpkTqMchd3Zj6VWGcUuORqe2xnYkMEveW
         2etoR020/42UtdVlr7b3bNmBjimmtIMvpCEhcxuwaR+Zl3i7ScP0YlmOFuLcyW7V8MwN
         7y+A==
X-Forwarded-Encrypted: i=1; AFNElJ80WHzQDJLwAqiwA89AQcZsqQ5N57DFfGtGUXG5bE4h5S/bWi5KvKjXFVmr1U9PBinqkrNvYN3HEdMjjRow0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsvGYvGoDXJAceU2PZrU0iAwz/4+poiTFrHGP0pyXqsX5H/Qm
	4Wvns7AblW1pcsYZE2MCa1a2F3uELgoFZcs5xaG9u0OvuhR32Ke8gkqaQt4c8+RRMlywAIyzZht
	19pKbm6e1OSrFNtb1omCRuSLMSeBP2vw=
X-Gm-Gg: Acq92OHPn0Zgjc7IRFKevKXxTg0glc4tBPHE3BiH2uvjHOil96unB7Z0feOCSbtqlOg
	kn7shPmmLOvIQWioGXc+ICxiIXXM7OECufSVepc5yaOcgm6+WkJTK38S9pVoQwuQPIRGpBGeHkW
	SFRmaEwqbk5ywtuDwhTjgUy2dO134FeczRyQzF9UWne5VesJcl3xXThpJdWV341d/It0MFcCesh
	GW7jJ8mNck6HREY3ngsozhFicB8z0FJ/jrKL03fX3SLKT9e0DSl2uy36xfuSTxe1yvzFqb40qQc
	VuZO0cCZcvwC5nybXIGo
X-Received: by 2002:a05:651c:509:b0:394:8fc:8c44 with SMTP id
 38308e7fff4ca-396aeebac21mr7138741fa.0.1780476755306; Wed, 03 Jun 2026
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
 <20260524132824.54918-4-muchamadcoirulanwar@gmail.com> <20260528170840.54173bb7@jic23-huawei>
 <CAO26r3R5+xYQM=_uxF32MQRuxkhpeY3bTwq6M3o8dPCr8-kdnA@mail.gmail.com> <20260602130642.068b24ea@jic23-huawei>
In-Reply-To: <20260602130642.068b24ea@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 3 Jun 2026 15:52:22 +0700
X-Gm-Features: AVHnY4JZhb593s7xu7sfNCsQ5zG3L-rlxBp4pbrsozwUpy2S1S4SNEX8wP4dTkg
Message-ID: <CAO26r3RnTS1QOYrM-W4WagNDSCbb+T-+pQTou+yy80BeBWMgCA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/4] iio: position: add Rust driver for ams AS5600
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Brandon Saint-John <branstj@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2026 13:06:00 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > > +                let angle = (angle_h << 8 | angle_l) & 0x0FFF;
> >
> > Switching to `try_read16()` (calls `i2c_smbus_read_word_data`) plus
> > `swap_bytes()` for the byte order, then mask:
> >
> >     const AS5600_RAW_ANGLE_MASK: u16 = 0x0FFF;
> >
> >     let raw = client.try_read16(AS5600_REG_RAW_ANGLE_H as usize)?;
> >     let angle = raw.swap_bytes() & AS5600_RAW_ANGLE_MASK;
>
> That swap goes back to a pattern we ripped out of the C code years ago
> and why we have the smbus swapped functions and regmap support for that.
> If a given part always does the bytes in opposite byte order of smbus
> then it should be handled as part of the read function rather than every
> word read having to be followed by a swap.

Understood. I'll use i2c_smbus_read_word_swapped or a Rust wrapper
around it, so the byte order is handled at the transport level.

> > Rust doesn't have FIELD_GET yet, but a named constant serves the same
> > documentation purpose. Single call, no manual byte assembly.
>
> A named constant serves only part of the purpose. The main gain from
> FIELD_GET() is we don't have to go check if a shift is also needed.
> I'd strongly support work on getting something similar for rust as it
> makes for a lot more consistent and readable driver code.
>
> Basically I want all the useful helper stuff we've built up in C to be
> available in Rust. In cases like this one I would prefer there was never
> a legacy of doing it any other way!

Agreed, I'll look into what exists for a Rust FIELD_GET equivalent.

Thanks,
Coirul
