Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323B848C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4Y5Q+se"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF701BB
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 04:16:16 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7af52ee31so5799657b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 04:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698318976; x=1698923776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbZbBKkfguL7J/KpZDIZk5oYMQUan4x5qXihovp8Hhk=;
        b=C4Y5Q+sexM0keAyrGTvUnlZdf4eiIeJkxt/UlfTCAe+COo/9saOAWaDqGt45xHUwo8
         xYNc//l4SDwY29Gh2XF8g9GUv68ozKEuVfk1A13s4RCgt9Vim6yUKo2w7d+NWBWfoByk
         90QPTSro+PEAhBL0SAUEeh/Pe2s0H5GjoGvR8f7SBH7BhmStzyaXiE6KIMXeyZmnD8I6
         O01tyZkqReKvmu85G6DeSkWKcnJZrxJEwt2dTkr8YjVQKl/r/K/bGilQ6qlzf6OWBc/v
         hhNJteJZmhLO2ycsu4F+5UH9jYnVaYPayW+mfwcPCHJU/8DxzyqIvh3LXtEAH56RHwVW
         Rncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318976; x=1698923776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbZbBKkfguL7J/KpZDIZk5oYMQUan4x5qXihovp8Hhk=;
        b=RWznPGUQbcHcojwXIBgCC9Txvw2y44xPQCr80U4d+zlnPUg1RkpcVT2D5SH/Sp6rJU
         PRzklG4thvcUHyjTFPOSqJ+LxNJ7MEGrH2Y0kLEdC+uj4adgx/+EdOW66zwH8fEyFHjN
         O0ppOkPV3iE/jQHG55BkeBdv6stzMRPLA1WVRXzBjY1WBDvBbn4XwxokzBvun8wFPXGY
         z82mJSk1RxpSw96KnwgJmZ72e3M3ytv/THikD5jt/AIRk2I5zLv2kN9zo/d2W/LTMcsL
         tVtXWO8eWtdYL1VZ5STNhsXNrqc3Yp6xQlL/TP1+XeFlQZhsuValTSNM0eZ6T8u5ETkL
         vWGQ==
X-Gm-Message-State: AOJu0YwRK/KS1LrtPytUOkGa/J95cUmd3sGPiA3/Dnniv+Yb8hQxHc3G
	4pRT/iJokyROCfeJk3xznZkiGeWgbGKvG3H7YFiPl++gAY0=
X-Google-Smtp-Source: AGHT+IHqzjPdSewKkC6oKdiE7WlFNnS+9rotQpaGsqqdTrxKuWAh6phZ1+Z/rc2mw0p4WlTPXTt7Q9qqEPqQqAk7gq0=
X-Received: by 2002:a05:690c:ec2:b0:5a7:af46:d79d with SMTP id
 cs2-20020a05690c0ec200b005a7af46d79dmr25728826ywb.43.1698318975976; Thu, 26
 Oct 2023 04:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
In-Reply-To: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Oct 2023 13:16:05 +0200
Message-ID: <CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com>
Subject: Re: [PATCH] rust: fix relative links to kernel header files
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 4:09=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Relative links to kernel header files are broken due to the move of
> the output path? Looks like some of links has been broken before that.

Yeah, we wanted to clean these up when these paths stabilized  --
thanks for this!

Please look up when that happened and add a `Fixes:` tag (i.e. instead
of asking in the commit message).

(In addition, "some of links has" -> "some of the links have", in case
you happen to reuse that bit in the message).

Cheers,
Miguel
