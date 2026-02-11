Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABC36921F
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806481; cv=pass; b=VLTVmPFdbKHGI+RQnF323TQQy3D7OYdGH1SH8kKHejB5S8DQpbGmSP8oWzOOESoojNYOxo90mHVHGHbcjtrM6I0jgu5cbJeNNGjQwo1fcw7QhV5tyFRprVhSh6pxD7qusL1dd/wtuVyyze0BwSu+kimcHQ5xVvQSjVmrehT+E38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806481; c=relaxed/simple;
	bh=ygS/KJIrgTEQGYtzJb6sDuaxRuXu9QCFvwwEJ6ybjPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMCxScTGiAJmIy6lNuFOjJv9E8seo0lC9Wny7vuqLALEV6jSt0L1vVu5aNOi+jZfpm87w5zwmJpZ3r9Uiw/oRtdjb+a5Nn2sGOW5GtYI2fBfS6H+sVJu65T7BEq+u4zEdSfZTSFMZ+ivo+L+UWZ1/Jzne8y7cytKEnKTOV1mMhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niAB0vv5; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niAB0vv5"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba85f77203so215478eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 02:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770806480; cv=none;
        d=google.com; s=arc-20240605;
        b=lWAG6867RSAQYyTJX38E0al3moG827MMU5vbmUigZs/EvNGBxlS+MJakb9DgmbFuNT
         aJNebnYBz/YcRy6GSubyE1Lm01BJ9xoA462tCpNTJwkDfHVyE7a5HVBz2Ly/no7f15y4
         W8l/nmy2N0a9eBfKuuY7aOPgHR3+QG1Ft59ejF9K5uTRuq996Z0mzliGU19/3h0mizq2
         tXw+Z8pJiRnbTi8jDx8et+MjWjOlFusU9leGlHQOIDfoxKOLnA5j64HIUyKrfv9iYccY
         8J+To5BjOAA41tXJ4G9MbmoAnruTkyY6QHLy+hARUpfDZOrXiNgmMpwwrblRiD4T9byA
         GYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXHp7S/iyLvY9ql3/OnccpMG4H/yun2WlS91VGZ5/Lg=;
        fh=ZCDQeEezeDim0S4AKmDy6bdBANMwWoug8O8JfWUXeWs=;
        b=WBZxsVVCIFr69OEIDK4JLTfNdDS7QHarM3dk2ItJ7lasM137Si8kQpGR3KEs1aY6Rw
         ohTxt3sA1ou7kBJ7EUGEJnvbzXEPlR9wWbWg7Ty2vYHoCoNyG9k6m0JiuAdVeTJJsBkl
         6ZZB7FOzaMRSOwUBLqnIeKzLpSwI6bFJFL19jJ+zNa9qG20UmhpjSAH2VGQMV7tVrYRj
         O8Gi6yh9ZWJBIWloqwHGOriZDCECizbxk60E7pgBZneg4vZFtYV9tYABe0xas/0lfNBu
         5YPSfMn363whSeyT3gZsQqubsi55vENkkL+B9Gm8QbBHiwDl22IeZQ2mQE7/9Uj+EHE6
         QrTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770806480; x=1771411280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXHp7S/iyLvY9ql3/OnccpMG4H/yun2WlS91VGZ5/Lg=;
        b=niAB0vv5fkMVHGGctevdm0M+COomci0y6ApcLBPj+mIzBzFDpOFWkOOOX5Bw3WRhwc
         k2x2JVEBFObuMj6fw9o0LDIrUt2OAMVLYHc/XrI6mYwS2S3/EpSqacL78sshaaPK31gP
         4+sdH8nS2XIsLjxwstJCCO6W/nSR1w7YYpa5XPNn2Zk9SOweALh9HBPyxWXEcbV09e+K
         30cQ14dZJtMea+4TKM9+c1CypjsCumBABwp22pl7/camZcuqejsIZ2l9lS5crMEFk3YF
         R1gWNgg24r54yu9on1ntrTfOOBTf4XIxuhnCnff+hW/8Iqtc0OjlMEzxcfhtFyg5L7XP
         shaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770806480; x=1771411280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXHp7S/iyLvY9ql3/OnccpMG4H/yun2WlS91VGZ5/Lg=;
        b=gmpfrtKWF4DTN2DY9OUvfaBBrjidvYlI1oJGoKLaIUd2aTTeJdiJJ8IDHY/prPiTer
         OulsvBTmnj5Sn1Vqany6mDtpWFm+1Fgm6Yfx32tjgKv+wAkToYGWndNEoZIxv6EyV/Ut
         fTf2nshxaGY+jcLfBkzm4OpSFJtmNZdchbWQQ15t+sB3eA275eLUZohlQ4bGRdIzcuGT
         95UxCbo/tF6A/1bqf04YLQsFZ5FGt7ZB+piQHQZKvalFfwFznuw9UN6rg9/NZIi5iOzT
         kB3x/f8Q5JoJKqlZUluqBygwpwmgUE13iCdvrZsLwqef5bmRAo4R2jmDjOtMwHfZGOXg
         NceQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2iLk+rDKhIrpDizRkXH/uE5XkKP+KLTFXEXsdbOB4qY1Zi4JDARjATHYGPJBn9muFNqAn/BLprJAme0coFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyoZ//hO4na4r1/K+d1tnw/NyOhZHTNFSz0qiV3lFTX8Xd3bOh
	TN0dBnYAlGuM7djvbCZx6OdpR6DgApTG5bn9MkRFrXgTA0WGerjV13FbTJB8H9HcJEwFIQx7u52
	3BLypHnWZZmxS1gREx3pufrxcpacFM44=
X-Gm-Gg: AZuq6aKXkLKalyx92dBJNdUF7oVlX/1MISgcYNfhfIw4e5TXePH6ffl/xI5JdDGdXDg
	zG8e5K3Fm1Ayx7/gwv5DfgDPnt5DPFzHhz5Gw/82zH2jeUbtqX0SeiweVCaBahnibK2h1xOQo8n
	tYDwpfuFUEZHOveWL3wViNH8sc1wV6tgtZadWtz8CcO2kJodkqy3ZMEo9XUAh7SHMS/mLr743TK
	ZxwZY6hDSkIJDH6p3fj+7JrVThV5YKpO6nLjXqolexk4f4if5ntXlS5k/MGsFVZGij/llwgesXU
	lWs3G4Tqg9oGSb12Cf6KziPgGE0eJ6y11/cfZe45XbuUn1fQy2pHjtXkY+/1Pu1mpv11GuouYj1
	aF5zS+Ef0bxvXE7aa9eVeRir8d6cGmI1LqMM=
X-Received: by 2002:a05:693c:40dc:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2ba9e05a837mr206329eec.1.1770806479793; Wed, 11 Feb 2026
 02:41:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211095807.132855-1-9erthalion6@gmail.com>
In-Reply-To: <20260211095807.132855-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 11:41:06 +0100
X-Gm-Features: AZwV_Qi8-0s8a064H_jd0KP3XaMxJ_Cg3S2G28D_5OStfj3L5c7hvaHWqbAT4yI
Message-ID: <CANiq72mFBaFm9QVotxeDB0TanKxQRko7ZFhuF-RHq-8WCemCTQ@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix feature test for rust compiler
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 10:58=E2=80=AFAM Dmitrii Dolgov <9erthalion6@gmail.=
com> wrote:
>
> Currently a dummy rust code is compiled to detect if the rust feature
> could be enabled. It turns out that in this case rust emits a dependency
> file without any external references:
>
>     /perf/feature/test-rust.d: test-rust.rs
>
>     /perf/feature/test-rust.bin: test-rust.rs
>
>     test-rust.rs:
>
> This can lead to a situation, when rustc was removed after a successful b=
uild,
> but the build process still thinks it's there and the feature is enabled =
on
> subsequent runs.
>
> Instead simply check the compiler presence to detect the feature, as
> suggested by Arnaldo Carvalho de Melo. This way no actual test-rust.bin
> will be created, meaning the feature check will not be cached and always
> performed. That's exactly what we want, and the overhead of doing this
> every time is minimal.
>
> Tested with multiple rounds of install/remove of the rust package.
>
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>

Not sure if Kbuild covers this given it is `tools/`, but just in case
given the `MAINTAINERS` file, Cc'ing them, as well as rust-for-linux
since we try to use it as an index of Rust-related things there within
the kernel.

I hope that helps.

Cheers,
Miguel
