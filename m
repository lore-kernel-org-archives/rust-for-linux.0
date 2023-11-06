Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312D156E4
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzR5MBSt"
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99790B7
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 04:39:59 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9fe0a598d8so4264650276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Nov 2023 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699274399; x=1699879199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWQ7/X3IKAWIhq4bLAY5djeEtdstDuUaHxOVdLn7KSk=;
        b=ZzR5MBSthxMi+qLw75zEpfg+Wa5Eu6cqlUiE6zYRhgLirE1aeLKw3LSGAg2WyeM/CV
         wyybDNP2vjb9zygsMOZqvWjOdcVQiXbVQ48Oa4teTI7+VOtFKw7lLdU9VetfKjxndxqs
         TI4vaEIxwltnUtuAfJQWYqcOPuseNacy5c2cl/cd1h1CMhLUIvWqt+b9mSH1y1vOdD1u
         pROeQVR4PN4/YjbxIPWp5AeH96kmQML2HWRUUSi0L76kcHMa4U6HFnYKI1AGU+DkYGwj
         3MpNPjlt+NgxAAeJoC/yd6C90bdmzQtQ8vcbJ3FFspM9wHK2naIEgilXN9e/bUS/qC9K
         2wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699274399; x=1699879199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWQ7/X3IKAWIhq4bLAY5djeEtdstDuUaHxOVdLn7KSk=;
        b=K40BSrkBwe5Rf1/41sB+r+NI1a/0dP3a8NESYUqOh9JUAE6ppQKjspxcBdnA3hf57k
         K6iE62zQfT9npxAKoIolYVcONzxyg1TSmvbIVynzZpBVBBjcTN+v/rBHjulRZvKapAg6
         qo3xXtNEOqLXMQUYI5o+UosGIFqQA0vbx6/Eg5qzUzn5CNycMflvxJYRyiqNyue/3U1X
         N7fyliJfxlnWdNl/cdPl+vj8zhEmKUtm10V4Wdm37AW8sPW/tkYj+teuP4eN74LVBGht
         iyqbXtO6Vo/dUMj/xhLd3HgkZjK/sdYiYVPYIUW11pN3hUneao8up4T9VWT7kOpJXzvO
         v8QA==
X-Gm-Message-State: AOJu0Ywa2EFeSOwSvlgmy0vDsXPij08pN6e8JqmXjhFp8MX40afaFD1k
	QfcimKrHtFdCat/Bx37kw13SJfY6JpbhEqjuttg=
X-Google-Smtp-Source: AGHT+IFBCqKPPB6KIcdoUgoX6E+xKuGD739cZXu9fGS+wXalVAJS5vWdYGyVjAaIfhyLjsVOvcdwMGSokh70bqAuWYQ=
X-Received: by 2002:a25:b11c:0:b0:d9b:351:6657 with SMTP id
 g28-20020a25b11c000000b00d9b03516657mr27699149ybj.23.1699274398717; Mon, 06
 Nov 2023 04:39:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM0aA4MOzDx7HK5O6aYjJAqASKCkLm6mi=Z3fsr2-VSKO4KFdg@mail.gmail.com>
 <CANiq72mmfvig74-WMKkxEHMwJErAtauz=z-uCptVaGZNQX9OGA@mail.gmail.com>
 <CAM0aA4Og0NC-OmrKNHcnE5HyVnoMWFXj1qXar+MbW-1F2c1=bQ@mail.gmail.com> <CAM0aA4Mby7oy1vqgicFvMGvKmfo+Y50NTgBCCAg8eb+ytEmtDQ@mail.gmail.com>
In-Reply-To: <CAM0aA4Mby7oy1vqgicFvMGvKmfo+Y50NTgBCCAg8eb+ytEmtDQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Nov 2023 13:39:47 +0100
Message-ID: <CANiq72knA5Eb+Xvm0=7LvAvg16oofE4dsZCaXvVFPsC77-wHuA@mail.gmail.com>
Subject: Re: Considering first class integration for Cargo
To: Steve Fan <stevefan1999@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 11:33=E2=80=AFAM Steve Fan <stevefan1999@gmail.com> =
wrote:
>
> Oh I think I have to insert the GPL headers in every source file? Just SP=
DX is fine? I'm just getting started with Rust in Linux so I'm not sure abo=
ut the license rules here.

Please see https://docs.kernel.org/process/license-rules.html.

> I was thinking if I have a Cargo.toml to mark everything as GPL so the SP=
DX info is redundant anyway.

It would at least require changing the current tooling and rules ("The
Linux kernel requires the precise SPDX identifier in all source
files."), i.e. it would make those files an exceptional case.

In any case, even if we could do something like that, it is orthogonal to C=
argo.

By the way, please take a look at
https://subspace.kernel.org/etiquette.html and
https://rust-for-linux.com/contact. Thanks!

Cheers,
Miguel
