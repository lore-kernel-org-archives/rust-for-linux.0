Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E0F9C8
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3ruRdUD"
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470ABB6
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 02:05:19 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9ad90e1038so4421060276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Nov 2023 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699265118; x=1699869918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEtOUHr+ylvdCWEsjETM0glxrAdvAWGd2JXMrCldqU0=;
        b=X3ruRdUDA664QO/3pRW+g4+0XRGc7EnQGtRu3PDHXKqQw+LXkWg+IOcrOeA49XclGG
         sKlNEWPqn+pJpAH9larwMSxievkjntua2AxcY+eSfWJPQociciQoxL8hljDUKvJy/JyM
         W961sQg4V2fpfChysY+BnkfXA4jevEaoqL6eN6DuZOyDZkzHHZ8grW0xXOoUSJhQ58+C
         zEbEqWKioazv/fWqqU3YqIPaK2YBCBASb1+Sy3u6BkqAG11pELj9PMlx9vv/WMU+FCpZ
         HBgZ/IHjw3tp6bhcF0rG7hHghzkc7Tt0DdAhQ+ZJQ0dal1dhuAJ6qsIyHh0UCg9KLdyg
         JLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699265118; x=1699869918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEtOUHr+ylvdCWEsjETM0glxrAdvAWGd2JXMrCldqU0=;
        b=Af9VJLYwIj8uf/1cUFrEasNS7HVrbh7xL3JrlJmWhCmDj2WJNEAez8l5sytDDQblik
         l5bxqpmTHzGxt6eNuknTF+bet1NS3/UutromsLaOIEcB8PV1cpcj28DYyZz/4VC/ICyd
         zjlYORrznuLqTUti0UwZdmxkCRpFN9m7FBC8McCFndP86UC5nFdtlThPXc1fSADgIm5s
         jkTRA9b8ti2XnbY82XbxpurKkLFyMEShNznKIUYCysQ5tIW7eTNDnuukW4/3oaplLR7Y
         n0x+yWQ7qrSe09+WAw+V2ipVYKvhtD8OnX14pdXRjCDgNUaPWhEiCFVt9H0qC0+HzSJS
         Xs4A==
X-Gm-Message-State: AOJu0YzICCnjXyw9hEEZGojH0sJ8Y8slqXn2RHdsW+tWVOlxlc7a2+Uk
	ziBfTih4GBiomOM6iTyvlR0BXrzT1uyRyt0/X/M=
X-Google-Smtp-Source: AGHT+IEwh76eWPRReapLlt6bRP1dVeabEW+W92yky3DwegStnf2NMbBNsSIHne57C+8iqIYFA50zrR0OmaxNA+pk9vg=
X-Received: by 2002:a25:b53:0:b0:d9a:ccdf:3873 with SMTP id
 80-20020a250b53000000b00d9accdf3873mr26006185ybl.48.1699265118383; Mon, 06
 Nov 2023 02:05:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM0aA4MOzDx7HK5O6aYjJAqASKCkLm6mi=Z3fsr2-VSKO4KFdg@mail.gmail.com>
In-Reply-To: <CAM0aA4MOzDx7HK5O6aYjJAqASKCkLm6mi=Z3fsr2-VSKO4KFdg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Nov 2023 11:05:07 +0100
Message-ID: <CANiq72mmfvig74-WMKkxEHMwJErAtauz=z-uCptVaGZNQX9OGA@mail.gmail.com>
Subject: Re: Considering first class integration for Cargo
To: Steve Fan <stevefan1999@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Mon, Nov 6, 2023 at 10:56=E2=80=AFAM Steve Fan <stevefan1999@gmail.com> =
wrote:
>
> Please consider supporting Cargo for pulling in external crates, as I
> got some no-std based data structure crates on crates.io.

Please see https://rust-for-linux.com/third-party-crates.

> In the future we can also use Cargo.toml to check for GPL compliance.
> There's a license field in Cargo.toml so that we don't have to add a
> huge GPL header every time.

Which "huge GPL header" are you referring to? We do not have those in
Rust kernel code, unless you are referring to the SPDX License
Identifier.

Cheers,
Miguel
