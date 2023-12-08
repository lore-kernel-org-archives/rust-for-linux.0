Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgYJiTzl"
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1336C1732
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 04:27:55 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d279bcce64so18032427b3.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Dec 2023 04:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702038474; x=1702643274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEU2gKpHsiKMt4DuVStpOaI7sLqKKLa4l7xNuSHZHHM=;
        b=OgYJiTzl6St6M7l69ddNpJrKxKsw2OIGvFFbCDfZKmrPEJTpElxOwhlakD4i1y7WXX
         BshbNl72aj9wYItUlDHAH4OaGOMCpcgV0FDVCiqnZTNXaL5AfsqtRpta3IPnLFrOHOM/
         pdgBH731nq+E2xUO6WlHyDaAZLgyQ/7ilMixqZdwcPx/9XtrcA/FChy9BydA2bSSJrqv
         DU4XPAP/7cnIAym5kLUFbBhbsX1x2g/hc0dr6kZmBDEsU631ckdLuCfJTC2iBvHYzJRr
         carhNT0Ys3frYzD4BRbEya+OWgHuAlOKn/vOc/aWrkfInBO33hm1tS2gp7lau7X4GaZZ
         Y7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038474; x=1702643274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEU2gKpHsiKMt4DuVStpOaI7sLqKKLa4l7xNuSHZHHM=;
        b=hyhtsZ3fXEYVRCqTZsBALD9bY78t7zuNWo4E+f1kgYgNl9DOsCDedhE3b1QvyAovNg
         05I8UQrvGcndiq6822QrT20dvzsPB2Qv75aZsvsW9kegH7UPUJ5AepJ2WRg91da/VX9B
         VgsVw78Kyuse0PkfhIJ9O/C7AG9/Wu7FKBXqm31pAAnmXs9k0eJG8ZHXr6bFXwuq4ZYV
         Fb1BG0Nrjwd7NBQALjhvg9T3ApyhP0tGarIbrUw3MYGNRTRAZoO2IboP5zmSV8h6fpxl
         BH/MkUP5Ed6KvxNPlD6RJmzwsrfyhNsfS/bDpdbTIvEGzr8cBewcNg0l3SQJiY7Dzoov
         9DcA==
X-Gm-Message-State: AOJu0YxAWjEa7nwJy5qyJCk90GFn4lZOAT0oCe4nxq0JP0e2d0KW5eF3
	0fVx3AMrbl0SyD1wdnCboxyWOetZsYDJTNfPhmjwFdVUMq1d1Q==
X-Google-Smtp-Source: AGHT+IG81ER6FZeVkSLhOnirJ6tIaqmSk0a2vUjR13jgCmONoVT2379gBJMLuAKzozNe0+LVUOVRNraPAQK/iHZanvg=
X-Received: by 2002:a81:99d7:0:b0:5cd:c7a3:6cb3 with SMTP id
 q206-20020a8199d7000000b005cdc7a36cb3mr3669267ywg.37.1702038474190; Fri, 08
 Dec 2023 04:27:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206125736.2040066-1-dirk.behme@de.bosch.com> <CALNs47vKrFdg3k6sAYpX58n4BC4PHzbXk8fCBYbcnZuzPhancg@mail.gmail.com>
In-Reply-To: <CALNs47vKrFdg3k6sAYpX58n4BC4PHzbXk8fCBYbcnZuzPhancg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Dec 2023 13:27:42 +0100
Message-ID: <CANiq72=WZruHvMcdp1iWhez19wzZ8PkGAAg98kTVLm7soCeyFw@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Add rusttest info
To: Trevor Gross <tmgross@umich.edu>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 6:31=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wro=
te:
>
> It may be worth pointing out that you can run via kunit too. Quoting
> Boqun in [1]:
>
> > FWIW, I usually run as unit tests by:
> >
> > ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86_6=
4 --kconfig_add CONFIG_RUST=3Dy

Yeah, in fact, those are the "main tests" we have now.

However, I would point to the KUnit docs too, which explain how to run
it and so on (e.g. it is not the only way -- one can also build the
kernel normally and run it), even if we keep Boqun's example.

Cheers,
Miguel
