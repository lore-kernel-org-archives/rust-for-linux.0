Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C0B1A72F
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvCQfgQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17370C433C7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702901013;
	bh=H6yH11fmFs6fKX2ciuRNdsIGiKAP+/Tnew37FEsXRbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YvCQfgQzOGSm0owxZLB0wgBOxmOflTkdcbvZ8V4epckiKkyrDGJSLE5BFWLY1Vy3T
	 VM7nxWS42+Q465ppSdGUXSeR99pVVo2DBeNqyPSCU/QgCBmR+0Z5SpQc9zT/FnG442
	 WZCjThZdyG6noba8g9ra3FAY6yFzI59QVw+lUTfJme5xPPi4qbvmBO9EIcTEXWx5yn
	 DPFeOJs506rfcP1l5Gyl8kAeT2uUdQ3M/6mU+nAi2DlpYtNA72SXJLAAZhtU17BfYT
	 GEiI/L/36GHX9KlkUMRur12fZnE9KCwRGo0sHXLL5QgjUaNsi8dgzsIEVW68n5uNFy
	 vuo9V/LndE2uw==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d9f4eed60eso2599978a34.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 04:03:33 -0800 (PST)
X-Gm-Message-State: AOJu0YwD5H6zwJmUIvRk3wZHxxMFCYL8sVsUjJqIKeklZ1tD5GpNvrQC
	Aa0qEgtUr0LkZXCytdFJUc52/u0R33u79zk0+34=
X-Google-Smtp-Source: AGHT+IGeZRVIo0zS1Glm1levsy/GxaPY4SV3cQ7N5KLkXaR8fgyEKH/qSiLg9O5J7TvhFN0gOhxIWyFFQAeIzhOWl8w=
X-Received: by 2002:a05:6870:648c:b0:203:a72c:9072 with SMTP id
 cz12-20020a056870648c00b00203a72c9072mr3364007oab.43.1702901012485; Mon, 18
 Dec 2023 04:03:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207084846.faset66xzuoyvdlg@vireshk-i7> <CANiq72=0m=h6v=SmgVnTs5sk3jm1oZ_TBhDXPq2Y41rCV4J5bw@mail.gmail.com>
In-Reply-To: <CANiq72=0m=h6v=SmgVnTs5sk3jm1oZ_TBhDXPq2Y41rCV4J5bw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 18 Dec 2023 21:02:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdj1yJv9pZ67Z7=Yi1GU0=bc7B0BnDSf=2L7OfpQdGKA@mail.gmail.com>
Message-ID: <CAK7LNARdj1yJv9pZ67Z7=Yi1GU0=bc7B0BnDSf=2L7OfpQdGKA@mail.gmail.com>
Subject: Re: [BUG] Rustup override doesn't work with O=<build dir>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 10:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Dec 7, 2023 at 9:48=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
> >
> > I have just started looking into the kernel's Rust side and found out a=
 minor
> > issue with build.
> >
> > I use a newer version of 'rustc' for my non-kernel work and have set `r=
ustup
> > override` for the kernel's directory to use '1.73.0'.
> >
> > But when I build the kernel with O=3D<build dir>, I get:
> > "Rust compiler 'rustc' is too new. This may or may not work."
> >
> > Setting the override for the build directory too fixes it. Not sure how=
 to fix
> > Makefile for this and so reporting here.
>
> Good catch. Previously, we had `rustup default` in the documentation
> instead, which did not suffer from this problem. We should now
> probably mention in the docs that one needs to make sure the override
> applies to the build folder (i.e. when `O=3D` is not a subdir of the
> source tree, since that one works fine).


Yup, this is also what I pointed out a long time ago [1].


[1] https://github.com/Rust-for-Linux/linux/commit/f2238e7













> Would you like to send the patch? Otherwise I will create a "good
> first issue" for this in our tracker.
>
> I don't think we should change the build system for this, because
> `rustup` replaces what `rustc` is meant to be, and the build system is
> simply using whatever `rustc` is by default, like for other tools. So
> if one uses `rustup` to control what `rustc` is, then one needs to
> make sure it is the right one when called.
>
> Cheers,
> Miguel
>


--
Best Regards
Masahiro Yamada
