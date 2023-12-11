Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xup3eaF4"
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00006C5
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 06:54:41 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-db632fef2dcso4361397276.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702306481; x=1702911281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiFN4XX5Waw/j1P6OajEITNOIuIfYQpCk7NZDNH4kSs=;
        b=Xup3eaF4OIHEOFKSdtMAU26Vq2nKe0QKMahnXkTXthi5WZFDaDYCHnhllVJk97eQy0
         dTbco7DtZMq3VlinCAydWwBBOSQIIPdIuEjGDALWn1eAnph1ztCGF6FxPH82rHqNr1l3
         lD3tOUK3A9GIjc9Rd3WNV+47xdMtzTvZ66wMoT+MKixnFKcc05BB8+AsDuqtIy89NQrr
         c4azqN80Hol0tYr6iApC508VARzUaUrhCluZBmO3Gz8iT+CkjTja+oxyOkbd3uKnnRGb
         h+xX4rm54TqKlaI2MUUACcfUHz07yH7Ep99lQTgTdKgUEhzd/GrntFo83pWFISVDaJwR
         TNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702306481; x=1702911281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiFN4XX5Waw/j1P6OajEITNOIuIfYQpCk7NZDNH4kSs=;
        b=c6N2OhpmvLLWxwmPFoZiqEDkhc00HT9CrOB8SgKSwV7oxFXLo2y7OhJ6+HM9Uj2In3
         VXygiiBVBLhv5l6NJufkSZ4Y43qjVn54g5Uwlo0C2S3zEyHHT+rAon2xF6xVedp9VD6d
         9u2pNIPoieXtoNrEQtY7qDMntlcDwJ1hsFl8jut9NoLU8t8Cn7NIoLBeZJ0+RAAlzYV1
         Ohfgq4vxSh8Ac81OY4ofx25L5zihYyLtHotomQPAWBIJAU4HAo/5yBvQ+nJ9iv68zu4N
         mDB7+eAzGHsQrUTglVLwf8tbFpe0/PojyugatAoiJQHNYMTzWME9CVbmaS6bnkfugtJs
         b1aA==
X-Gm-Message-State: AOJu0Yw5IaaeEBfP5ceg9LQmpM5/Y6u0SBUhbWg6fCkS/2IoYbuxWigQ
	AQslWQ+EyJgQ1XaeKO8SpPuANrY7DBFw5mU/AQtRjJozgquW9h7b
X-Google-Smtp-Source: AGHT+IGn09XH2yOSX2QY8S3aSEkDcbE3TvJcccn1zfqNbjvzayS5wc/aWOU8T8sMbvY2Zk4+v26TgCB/xj6a2gkfBXY=
X-Received: by 2002:a25:2591:0:b0:db7:dacf:5a0a with SMTP id
 l139-20020a252591000000b00db7dacf5a0amr2717868ybl.126.1702306481171; Mon, 11
 Dec 2023 06:54:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
In-Reply-To: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 Dec 2023 15:54:30 +0100
Message-ID: <CANiq72=p7EzJG6ZGcpPv64fmVOiQaKSO2kj5=QN4cHWOsinh0w@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 1:16=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> existing documentation, it's Make syntax is not explicitly
> documented, yet. Add a test section to document this.

Nit: what syntax are you referring to? i.e. the Make targets do not
really have syntax. I imagine you mean there is no example? In that
case, I would say so.

> +Additonally, there are the tests that come from the examples in the

On top of what Mika said: if you pass the `--codespell*` options to
`checkpatch.pl` you can get your patches typo-checked. It is quite
handy!

> +Rust documentation and get transformed into KUnit tests. These can be
> +run via KUnit. For example::

The KUnit tests are the most important ones currently, so I would
prefer to put those first if you don't mind. Also, if we are going to
mention this line of how to run the tests, I would also mention that
they can be run by booting the kernel for symmetry (please see the
KUnit docs on the 2 ways of running the docs).

> +See the :doc:`KUnit documentation</dev-tools/kunit/index>` for the detai=
ls how to use it.

We can simply write the path (e.g. see what we do for another case
grepping for `Documentation/kbuild/llvm.rst`). It should automatically
figure out that it is a link, create the link, use its title, etc.

Thanks!

Cheers,
Miguel
