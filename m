Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2075330317
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479405; cv=pass; b=Z08B6Cy5ABOaziA7EjiJJtez5OEmQ4zI9gF//tOemJh9SZVfptK6Tn6WqQ392uJ7qvlvFHWMO9ZFyHqbkC3A/6/NwZeeqf0pqyIqeWDyu/6jd6ez92s1V3ZK3ppQwPPKuad79KvqqlHVwgW5k2mTuNsVXC5K9irH/VnljvlUhIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479405; c=relaxed/simple;
	bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uL8kNlFe/7kANx7N4BNJfUU+si4YsR6d+spJGz+nTaAW6NL6Dl7GJDZi8+vtPjm+OXN5ZM3Z0oDNU9U3u/dBtiOQVzfogSmEAm5K9HYfTsrLy4J3ncyAlnmR1oM0Bt3hRSz3HESk1y1RUTUJhJoMHcAOZ0JRkWMbQsfH2q5WF6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWCaNt6d; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWCaNt6d"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d027b7c8easo1114065ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 23:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785479403; cv=none;
        d=google.com; s=arc-20260327;
        b=ZQiJhl4rs8lKVO6ayFi0zj/wgF8k4tmHu9XJ3PLBhIke9HNa46hab7glkv0TAtrGPZ
         aXgWmDXydgKrsRmE/EFyYDXOj37sqll+VM7NLZUlzOF/7Ggq/l+qtq6vJGDOKZK+agih
         yL6qRgIHSDIyP9EuhVf2QrWYLUflXKPn5xJCM1zp21QEYcS3+g0J52ouCy7jcFUXhA43
         wwOAFek2etFdEUx/9BUJZsOMydPvMimZcv5f86DZ/Zqd9lTJVef8+XeqLMhctfVZQolL
         kR6IWA+AYve2rfWWBJTwUxgk+QtYTHLNCuodkmDFKIkh5UQfWjyKdxg1L/YuC5eAuZW3
         3U9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        fh=4BIFnGIcAxNiKQFUPvLAJDzsX/e+BXxa4/zVOi0D+jY=;
        b=PumdOyvLrQikPcuYfT5fh+5IcZr4tiRZ5nIh+aHGJ5z696ZlglQvbmOTCQMcSVEz3j
         SJCxAPFP11Df466hyK0GD6Z4zN9q1WIX1MeLTBlMOhXnr21hf6gHzi3nO6QkvbRc90An
         3V0VCQjP9XdTZ7UA2y3OYVgFUNNc+CFaVSJtiX2elw72E+YC/HELTB+M5tnLPAlKbyFP
         dJeHLdD9wTpId1t1nT+WAT4YkNP5B5n7x+Wu6Y/nDEKkEUvedJCYeHZ8UxXLxrI0r9yx
         Smm+mTzjNroLMcWP//u35Q49r9sNO/pVAGvxJG0ofr0ue9kF/mv/xGmog/O5R45YNHJQ
         7jLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785479403; x=1786084203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=NWCaNt6dNgAGARtRG0i87Zg/4MX5m8mmYfHmRZodmPVVojtjaNus2ym6gJYtL1Pd/L
         AOv8wQRegNwG+GTWDMU06KuMRMWo9BXgtNKT0WdD02cXI6YUfx3v6sR0VOs9hagIJ4w4
         vnKyIIdeB+5YOvum8D393ArHcLC4LBT79fBcIgbLi5vihAt4TNMsu4hXeFugfhN4ySHC
         W5nQEtPsoLJ884H3F4mK4Qtrrd1jUgKr9KCr4ehF1xIV8/txfgWipTUtPYDapxLJ/34I
         F6/4LcrSYzE7iSczVrekyvtA/Ww6xZ6wYo3NFEDB9G7amXtbcR2IB4gYc02nSfWbY2eZ
         DKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479403; x=1786084203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=boC+LST4jfH7XuSVQZN5tXcE0+OGV5niYEE0KP3ui+uVekhGQrfMc+t7BuzbFpoIMV
         TD5xCY0Te06IGdJYtck36CbJud80DEoAJTXPSPt/vsYky+USzFQe6GnMAxDTv7e2qZB1
         Oj6iFTdHY6JTV3uHLzdL1RK9/62WWR4PUpWY/2vPEKqS4q1UfHO5Mt7BJD/ZYXgkB2xJ
         9aabLUk34Kg5Da2ydAUVrfKCqQq7ljaEGtlPaXd28O8lY3Bl30dcztnjj44kGncdsJN2
         tWlr0y5r6z2mJpMxekaN8+I787aD1wtfgOUbT0MO1WVCYpcyHcvTboXMj/GS0Km0I3FD
         ik9A==
X-Forwarded-Encrypted: i=1; AHgh+RpH0ouBMlmKgKVz5kAqqyoX2R/Pv3DzO9YvQLzur38IxXkOfh6ACI8r2sGDZoX42vKHfeaixruqzVbAJ4zvqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxK6nbweeZc7iSmHxTFQAzJlB5hmWgn+SQkgXckmwVG9MgXzNH
	/5ajNJzwEoryyuDhezIoqax69LaRFFvNonpSInR0X16r8LghZUVjnB/JMOaMLYuo68M9pE1JWh6
	9Q+b+OMW8LSHQcKgC7GiT/WaFw//pq7o=
X-Gm-Gg: AR+sD13FvEEZlyQh02OaWEPW5ERCWMV3rvq6mAufDvYsj+/QRi+qJLOjCkw0FhT19WS
	R4Psprjv4gFrKMDtVrAOdTQo6fIF9MTLsSl3qT9a5x8plQgTAGmdp0aU+0DDjAtlrS3KS/+FYez
	5YMMD4x78fsv1wE5zktHBZfX9zukfgXvHu0J8WuFuXEULRXMM+fYaT3/m4m7M85b94haSO4wjtF
	447Vpl56MMBCcHTkAcKQuRJY/g+LzsArm7daoAi5dFhdkK14dVEsaksC7LG5hWjcbv138a6VTgQ
	R8GKnhW20rSExKPBZD+Em/Ub+9iFVGFiFZFHjHgQfnoXHw3FiXvEYg1NaukweHDM8mteI/XFS3W
	1HcmZsc4SQGW9BU2ebGUWwLvMazO9xP1Nwf/u9OyCVDRrzsp7R+LhWM883M4N
X-Received: by 2002:a17:902:ceca:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d046ef0048mr13066585ad.4.1785479403240; Thu, 30 Jul 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev> <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
In-Reply-To: <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:29:50 +0200
X-Gm-Features: AUfX_mxTwoRg7YuTGPUdUHKCs3gSMN4l-jXSn1vTLDoexparxESqmVPaSYuvKs8
Message-ID: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:39=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Back in v3, Gary suggested this series go via the rust tree.
> Would you be happy with that, or would you prefer a different
> path? If so, is there anything else needed from my side?

That is fine with me, but let's see what the modules maintainers think...

Luis, Petr, Daniel, Sami: what would you like to do? This touches your
entry, so it would be nice to know what your thoughts are /
Acked-by's.

Thanks!

Cheers,
Miguel
