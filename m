Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D290836EA99
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641352; cv=pass; b=qlYFbzMTi+WGm/d3HjWNYshbMjIsXbC4P1Sx7i49GhebSa/8erRE9IcJvAkevnBx2TlcfaC4EIYPjv4JaH4AQQZRN1Q8fKiWUkhfihYnIQ9LLsAXId6JfDbHc1oHgK49ZmCu8ujTcgEaMG0IvF/geq5y4sYKPN731Pzb9CR6z8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641352; c=relaxed/simple;
	bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BY6VgEM2l6oGHH3Shkk1cxvJdnGW/DuidS3EePgMfddDtNIlblWgbTbgI89YAaTg2ureBbiXTpuUChKPgijWO2jype0BAlPRJ+jObLWsVaVEpEFGR/dRh9OEPoDu/amOE06EdrQ2f21fGb8MgKE9GeBM1YTYn/V7BoSrWCc0WBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2s3Wz1N; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2s3Wz1N"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30cb5001e5bso72091eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 03:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782641349; cv=none;
        d=google.com; s=arc-20260327;
        b=WmSB51dGZraZhxp18iAxxQPbgQnBTLvCQZost0bnRykHXHP1PJeaalSJ23rdJWBXfq
         M3cITRfsf0A/gEm6oviS7SpOieMYJogPQHhe/c/a+vzVTdzqBLGYVfsqo2/mBkIG/s7p
         ggIazMa3YQ1Yq1N1mBrm0IN0Mo2zUxpMWjtZQbW6ohFh/Wg5NDNAbvZjHEYxgRKGyOq4
         Ot8RXabxoUlVlDtvVaPR6DwrHoOzK+YP3LBkumFNNEwFqm3Vp7Sa1FwAhC1htSbmi4rM
         V1uS5+FW1us1ctbPLShji2rART9IwrjhvPTMw72R/pPoeGkEsufB4HhA537BSh5DGaZb
         4C4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        fh=AgkRWKsqJkKI0dlb9o3luDV6ldUks4mVOlBA2PG7ngE=;
        b=s1d3Sw4rs/JBD+0qT5x5e6Mv+zO9BI31YDjQ6MDIDgNFEBTJWD+mufItwGQd5PKmsx
         8t7W8hGF+2jhu5dXDRqq3G/lhRvHUzhDwPquq5yEE/NNvVjxn4ecEjeRSuF0TZl50KpR
         e1pLuVjADrYWeg+2iu6r2f8fLmFDjdwNaB2tAGeQ7YRFDR2sfnrHu1EjF2ctYxsCIp+S
         JUHqT3OSPaEPA5HXQDBrWb3OPZOhCk4vGV5r+l22sBkbhxDUi7BxH96+comioNrU9n/O
         Lm5q4TvAadtKTX8BkUGQ/yjLKV5Afj8artqhdbC16LltNNf/UQ+zzY++dGcuDO/HRpKp
         PysQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641349; x=1783246149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        b=j2s3Wz1NL9n4BfxFbs8a9ybTUnzD/ufHtK0KWIUQWC7iZryQCM8kvegBMNn16U3w5w
         OhjiM1fUxfbnu5+OWMRJPsBoOD9RoTwhYDBri9nhOOy5facyc4zDqjWj8YN8h8L6BVKG
         MiUas3cgpb6zNkY1DQBzyV7WhZt9wb+7TZO+Z/S5qnN0cAGLAQlZSkEXndVWFg0bl/QA
         ShKPU2DrbNSLEEmzgCn+SJOTg496JOumXqJ5+MjixbZYrBNReqg2/lvtNbQ9pqym9rdP
         sCSrlTTSGGx+ahy282jwmasPq0kx6/onhdXUdUos9UMhxI38syCf/Ji1+FNVcyJIRNRy
         aStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641349; x=1783246149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        b=fR3anxzZzljrGHB4BcgVjC9ni+02vZ7epJJmX3GiyzwjeYyEwl2YCp0SGSMxLS9XTE
         wAy1dl1YCVwUsP+FlAYc3Aiw7enHK8ZyWBPIv9T2fOoERCD0Dnv+E6iTmmfpPuMUg981
         BgRxeNscCBfOK2m8e+WnkHu++RRXGqxs5XucW1tPAdxwEN99TewAVQFthQ5A0PIKNHeO
         MYND79dQxh+H/tIYL1Oo07WolJ9JyeW4yT81DkpTUHJkpMdFHaTmW3tSEAmWGiU/tbiz
         oLyhmDYN4XJJZ2iNoSXCM7VwzS8B8fvegJy2RJ45l+eJ8Sc8mpPPAYNRnaHJ/bIECbCs
         ZQVw==
X-Forwarded-Encrypted: i=1; AHgh+RqWFTGGtZgbAW8MLXAgGu8wjkaGP0HTIJEVc1ewPC+XhuNyKXTPiN7XbVXjvB6HIRkV/myRjMcDVYYaDoSObw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFBVCSiXZUOTC6i8PksDtRGolLXhHSfse/ssU10Uyexzux6Mf
	KxcbtDQchTXHVDerSRl5hjBbcM7ICnammgQYF30aM/RYZ42djMggyDjXiuqXSW5CObC+HZQs3Oa
	wqDeiwNxVK0sBPhZixTiz4rmq2LFxdws=
X-Gm-Gg: AfdE7cn7QGVbQudZ8Bj1X70rVhMTC5iDUieX8UDZm50XyBg8Www99Z2/qiDCnpfVNuU
	vURoVKfWV01UnsZ9UdPIvocKz8KDIV0XtNW06cX5A8H0hYVPHjZZKiBdOHw5nXpCwkC0rtIGVRQ
	f5KukkYYdBtcyFD0Fdwhsor45TWuLzEU1nXeeScCUrsnpfnHSpue/09PjqovOUtRVwxx2lHsIaY
	Dc4NLCCae5ve4xT+NsQED/QDUSrCw0M32y/PSDVRsc08pLJ0z8ci+3cY+q+57ocuMsjpzA0ZvZI
	5OuMa97HDCliIxrn1JVoLUGoM+6rkB+a18ZZG3zhfRL5YF5cne99FQVSCB/z+nMBDjrvPHc7iPs
	VkCrz0dzIYNLm
X-Received: by 2002:a05:7300:8609:b0:30c:b42d:47d4 with SMTP id
 5a478bee46e88-30cb42d4aa6mr2725415eec.3.1782641348716; Sun, 28 Jun 2026
 03:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625224927.404258-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260625224927.404258-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:08:56 +0200
X-Gm-Features: AVVi8Cfb_v-G46exRFY3-4t9C9_BwKpZ6hE6o2xuD9yPTXeLyP3R3mkBDkoASc8
Message-ID: <CANiq72mx1EDo4EYLUMN63_MtScJjobbPH3QCZ50oJCnZ9vc27g@mail.gmail.com>
Subject: Re: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id initialization
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 12:50=E2=80=AFAM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `usb_device_id` initialization instead
> of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.
>
> This change improves readability and removes unnecessary unsafe blocks.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Looks fine -- if needed I can pick it up via `rust-next`.

Thanks!

Cheers,
Miguel
