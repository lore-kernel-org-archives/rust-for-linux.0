Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4C37F8C4
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386787; cv=pass; b=lvJIyb3sP9+O5sVO/8gKEVh1LQ0fAdRMOi4naOPU2l5ICK/87i3dMh4tGwt7XoZv0AAzHgLS8c/jMqP2z7AkN0jS4+hMvgwt5jbA/2tTIUGZxUQbUc7V5L/3QXAjgO7fq9LELrej0uhoTCVvtjje/IEQMqDL5Hj5l1RTmc1v16E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386787; c=relaxed/simple;
	bh=p+vPmprnmf0DgJjuMG9/SYFWlGSdfEY69pr95Cgl8+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqrKtEJQ54hLqk5P5XeiMcFBqUKNBPkoUYtgTVTyMl98nI51hRUSK5m1aSUFsZ8vTj1gNWFXG2LAQDm05cQove5mpgyE1jj/PTNWGTponQQ7/Vr6z4JH/iYT9NZr3ZLL88sVTJG9lB4yBDai6338wyFBkdoadOpckN00PCBaJZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebx/H9QL; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebx/H9QL"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1233ad1b4cdso13543c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 02:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768386771; cv=none;
        d=google.com; s=arc-20240605;
        b=BQY1gh64CIW+7vtGXgEFZV2NEtGs4wEixzRsFXEi4Gmjiu6c2ZUyzHg4nH7hy5XYmA
         vdXDAfvZErWe+0i5jfYxMqnrEWXNyHFEt60bNoeg/JD/MDjbnVoj55TxXwEdhG1MVlE0
         Y7X/FgW61fORHKtwMZTqcKFCNF6MoZ3J3dv/Kc/ucE4RnCsYUtdds27EkmIFol0J2cHC
         fnJmrxzMqgpKfBGy+2leej0vZ0WatUJ5ul0ZKx/2eCcqEmzszOdE48sm1jsxS8y5kGXJ
         fk5P6atLT7jBdnxYN2zcsA3c3NSlGjjb4esN2zGFolqOJVY3zlr0iDEDZ0XGh2+seSFg
         lJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+vPmprnmf0DgJjuMG9/SYFWlGSdfEY69pr95Cgl8+c=;
        fh=rG7B450lQw1o1gg3Gz+ilZ/vNKFtnqGIDsDESUfC1vI=;
        b=KpV+9iuxwXowfAR+GRcsRd2p1qpa2NZIiDmG5aO4M/J3h4J62Yk0jgIBDd0QNrs2yo
         g+SN0JabV6GW5vn558gxBeFkgFFURAvEViwPKdaSBTjVsjBkB+/2TLHCrYarP+rf2P1f
         e39rOwrTez/d8GiKBbm7s5WeEcngyWLoKU1/YZ44U9Otd+5ojgk9DC0+BdCL7iwmULkl
         hPy7jGcSgaAxXAE6FzoqTPPJmZ16ZpS3ACH/8NZW9ui0pjIiGy+2JHfvPj4yHCp3wvDO
         pwpHpjgCeb6r1LmRnYDK7baELvERtwY9aCLd7un1V7ZUa1who+S0s6KrS4YFmWNWKnvR
         OzQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386771; x=1768991571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+vPmprnmf0DgJjuMG9/SYFWlGSdfEY69pr95Cgl8+c=;
        b=Ebx/H9QLgdVkZLn82n+uN79js03msDroXjb8TWam+5VDKRPNK8FK+mz8ZQ3tNI6Dls
         1KDxR3zyyZQJKf+YaS8URYpkhN8osfh3OCPSQQiLd6bKrmksyD1UxZe5yKnealdMne2F
         HFLiBv5uEEQtZf2hD63YQrZkUC0rm4KdKkAX8Ey84D8SuizrDQngEkXEgvrWwyZsYeR6
         P5L7VmWFow2XxjsZFdM9gSyJruZpfPthfsvcCW88EfBrrgW21jICBg4DVBiW1TFwLGlq
         zoyakMpxPnB1O4Vw/RCkkezZ2byBie43MkC1s7YHEqftYyXnFrHAWmCqjvm2FGkrTIhi
         +fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386771; x=1768991571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+vPmprnmf0DgJjuMG9/SYFWlGSdfEY69pr95Cgl8+c=;
        b=HdNlKi503iW+XdyMZ8jl2Jhy567RD7gZf8mhdRBqgFsNmub8xQQeip8cgx507G7/H2
         p9sbE8Xsi88PgEOLPueLGHeZSGdd2dlCXzmmlfC8xlQKaUJXHCs8kA8DbhooTQgB2Y2D
         8gGN4Fvo2AQxnkgNOtWjUL0D7tyeXujxpZ/lkKR+/+elPWb0x0jixVXHSYs8pWC/HH+H
         BJs9UVQcrLpIEE87l/IeDG+UW3FIHf+TUj3dTDs7jLCFLp/zH+bJWiZvdRbc5TpBYtf1
         f0c1VPPHSXu0C8qgmie/Vyy1Kr/sUyj4fKdiCWixVduTKmDfq8G0CjObo+lQs/gXJL3R
         hCfw==
X-Forwarded-Encrypted: i=1; AJvYcCWpgr8Yd4TnHNOw/3HCfH6w/wlt+4sMwxOlsXeBgJhBQBSIfS1Ha7YZq8qiusFN2dDaALyWh1E4PPWBkF8Hbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/I1KV/5kMR5OUA69nxC+2zN0I/hGvHt0G9Bsh+BuM36Hg0ob
	hSnX8MPdWukNHUUdO0G/F5xLdXAXM3swTKIbK56ceXZWgCP2kuUTbrReT/XhcJ3ZGb8ZzwzEQ1w
	cVmcxuHfhtCYWyAw1JMUnnACPW3QwJbE=
X-Gm-Gg: AY/fxX77+KCMNpl2nMsUmkw2aoXDd7jWR0LNve9Vz52Us9zOHDEzrTy/KGIslcF2E9w
	sU1/SsqjshE2vZBdaHl4oS5PoJuFV2/lk0U1V5gaxq5/sJKGTKZ9heHMwuMJJ9M9Owyn1WPAAE3
	5qfha6sFMgYdiJcNFZ2xUOW8ZsN21LxyQt8NbMQxQPZTGv3ZZrlDfxZCtJYWRtrvLCjxRfWPyhP
	w1al93WeDcS2KQ6lWqZPRdx/pxexwE6Gqe5MfNjhRON+lBrMvV3iq0TYIGojDdNqzrOWi/vEN29
	3akNWEQy9vg3TH0fFcUnBYcEL3USbaF+d08/KgZiQMT4yuNydRkxVLxhbzRr8F7je0J0WJc+ZlX
	XTZR+i0OCC8VA
X-Received: by 2002:a05:7300:e7a9:b0:2b4:6ed1:2ece with SMTP id
 5a478bee46e88-2b486dcaa52mr1613053eec.3.1768386771158; Wed, 14 Jan 2026
 02:32:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <20250723-rust-analyzer-pin-init-v1-3-3c6956173c78@kernel.org>
 <DFO7DMI84JCC.1IAS0JWKKLNTZ@gmail.com> <CANiq72=rs4vu5RMY=hf7Q3MZe34tbq4XyOAMyDy9Nx5D6EhFjw@mail.gmail.com>
In-Reply-To: <CANiq72=rs4vu5RMY=hf7Q3MZe34tbq4XyOAMyDy9Nx5D6EhFjw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Jan 2026 11:32:38 +0100
X-Gm-Features: AZwV_QgLFRXLm6dG99zPB9ugEa5K1lCzb1SN-Aj0GcVh3HCwop5EVqd582LvpBM
Message-ID: <CANiq72=vbcntKJWypj072qrV2T+CoGRow0QQwh1Yrv8W+M5+Dg@mail.gmail.com>
Subject: Re: [PATCH 3/3] scripts: generate_rust_analyzer: Add
 pin_init_internal deps
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 11:29=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I wonder, though -- should these be applied as fixes? After all, even
> the commit hash is provided there, so we could add a Fixes too. They
> could also be backported if needed.

Ah, yeah, you already said that in the other two.

In that case, we can take the three of them into `rust-fixes` directly.

Cheers,
Miguel
