Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZz2EqC9"
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF5310CF
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 05:15:58 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5cbcfdeaff3so7295317b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701954958; x=1702559758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzSPTNn+FT06sDCJZpD9Hz6TBs2koZKCVJM2T1UACmo=;
        b=iZz2EqC9EfatcwBqZBb8Z2qLkK6KA3gm1w6Nb7nZqJw2e03qXdDgyUY8UCQnXbKahF
         HlyGnEjWlaHKZdcbIi3HovNszKARS0Ayy6hwyvVvEBXkUz9aI3C2xTu/9Tsj1w53CAeV
         9HRAw3jmNZb0kvL4bK+O9twOCSYNCOdzT9zhs3Uvmu6NhhJIjNdrr40JENnqLraOdVaF
         wqC9rrQpjT6AH9fYin+dfjtUZfRXiCeZZnmupvvzRzWgDLkKajk39BoUS5Te9FHcYbUC
         WG1S7p92WgsYmRnbwJb63uIaECEKg+CN5H1cYv04K4nB/2bA4znEMj2m+A/knh5vJI/k
         flrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954958; x=1702559758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzSPTNn+FT06sDCJZpD9Hz6TBs2koZKCVJM2T1UACmo=;
        b=w4HBHbtp1DMyWnePrFFxzSfdfrx2QfnCVH0KhQnEmYRUzZD8p7FWFtW7s1xZ6kI/R0
         MIzr/dfPQTGjZ7H71lzYxRuma77NojNqbaRWDuZ7zo9BR2GJAfFlXKXmjhsSwb0/hum0
         Ft2ZMwn1zC8XWxbLUimwHvATrWZ+OWScJ+DXA1tywm1q575vlHrc46dF5TfAypsDAD55
         H5vtYL+uwEJOJfs7WTnZrDmvYN+FgtugnYQeCKAWbLAzonXjiSBjYCLejNvxpG+io/j8
         FYP0HCe9dPF3qPFQY/mapxHX40wAkMfMAmvNy2ISWnSPeYTZyurWZDcqrzk3uTavtS2j
         BJDg==
X-Gm-Message-State: AOJu0YyA2An8t4dA3+hv7QrnAswd/s4yV8flb0PSyeXDq7zhdz7Wda+A
	ncKfzdr0fbkl+d4HQ4d4XCcGCJvKRsbmgsr/VhzayceT9EByVJtI
X-Google-Smtp-Source: AGHT+IFXRtHxUXYTmxNUR80kIdZplbkvwqaYA5F+2+BF+8+4LmqtUXWaAwNoR7DiZfWA4yZdFiwPXMHuAIumDd7DLEk=
X-Received: by 2002:a05:690c:d94:b0:5d7:10ba:a2eb with SMTP id
 da20-20020a05690c0d9400b005d710baa2ebmr2526447ywb.36.1701954958170; Thu, 07
 Dec 2023 05:15:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207084846.faset66xzuoyvdlg@vireshk-i7>
In-Reply-To: <20231207084846.faset66xzuoyvdlg@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Dec 2023 14:15:46 +0100
Message-ID: <CANiq72=0m=h6v=SmgVnTs5sk3jm1oZ_TBhDXPq2Y41rCV4J5bw@mail.gmail.com>
Subject: Re: [BUG] Rustup override doesn't work with O=<build dir>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 9:48=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> I have just started looking into the kernel's Rust side and found out a m=
inor
> issue with build.
>
> I use a newer version of 'rustc' for my non-kernel work and have set `rus=
tup
> override` for the kernel's directory to use '1.73.0'.
>
> But when I build the kernel with O=3D<build dir>, I get:
> "Rust compiler 'rustc' is too new. This may or may not work."
>
> Setting the override for the build directory too fixes it. Not sure how t=
o fix
> Makefile for this and so reporting here.

Good catch. Previously, we had `rustup default` in the documentation
instead, which did not suffer from this problem. We should now
probably mention in the docs that one needs to make sure the override
applies to the build folder (i.e. when `O=3D` is not a subdir of the
source tree, since that one works fine).

Would you like to send the patch? Otherwise I will create a "good
first issue" for this in our tracker.

I don't think we should change the build system for this, because
`rustup` replaces what `rustc` is meant to be, and the build system is
simply using whatever `rustc` is by default, like for other tools. So
if one uses `rustup` to control what `rustc` is, then one needs to
make sure it is the right one when called.

Cheers,
Miguel
