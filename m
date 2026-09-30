Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1B14E06D1
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781981; cv=pass; b=LHu1LgOGdVhjtruj6oFutKm6s2QANqr/hinQL9i+CxJbyaacgHbtC2sGDXRXA/oVqRhvDH5D8K79L0XPfNQiDVo3eIM185xrtNDC4iGzVcQmzOr1fMEzfGT2+BGoRqzeueYBf7WEOtD9C6Kll291Dv7x/ssyDfLdU+eJ4bwSV6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781981; c=relaxed/simple;
	bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lV+nmOKd0LslmbO5xtFDEi3RIZe/l5PglfVv9T5DxVIzTilyDHXFQFHkt0gcd8xSeBzXBfw1DsgktrT5tB65pWzSiMcnPcbsAWVIeTId2+tGm07QyOimNV1XUyNxGSzudJUvtn6UISaSqaCsCkK59zX+x2nkYbF6thAtRQ7rjmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2l7/XlY; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2l7/XlY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so600118eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 08:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790781970; cv=none;
        d=google.com; s=arc-20260327;
        b=R+BzS8mNOdwugU2yQ1iO9nO7Bk+ob56/nwlaPAJP9ARXNYl0l+VTjWDlp5HTTn1mAK
         pYj3xbNUom3eumV82R3KP90rp5A2VtpgRyALoiSFrkbz6wC1K/odNSavQm/zNqnWkAg6
         bhAb9NLHFbOXNay8N7RmnDvGRJxiXStuAltxWFLSfpAe8PiTk3Ag27/coY5Dj8HXV6uM
         +TW/0ELehTDo7dNHqt135VFAJ586E18Utl7pmtDVdTyeteQwNsBfyPaUhy/UeWb6UcAH
         qZAOyFPMJ3bCRn8BnTo42G00+ZI9iE1hdbjQRVKYN2qN5hI2EttMHSsuefROADJY40FC
         IN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        fh=hipEcUTyA1FV8ZOf+/wLehxsXXXks39R+jhfxU5P+f0=;
        b=EMkc3AM90APDE86IH4I01axvRewcawFwuLIoRhJMHfn3RDwa/1jikfKTmuyBvWwQ+y
         QTDKOFpKe3oRY5t+Nbo+/M8cFdE5HnMvIBXxd6wvFHR2MRELUP0yEGX5zzCSC+xRzn8i
         VYxg/kRyyfDgrI+8+O+OH2UxNEGNLAGCyVQBsn/dro/5rvqvBdPyVVaapsCMUAGdf+aO
         I+DDrq+NmoCLbN1/imq5l68aJU/v543F3ZoJ49CzV362qV78dQc/y0ir0CZBftarZhWp
         5iJpbWoR/6xz1aYn/hKzlDqTjMPhjix8wBAZd576myxMzXKejIDmtCRrowfYgv24+O/q
         gC9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781970; x=1791386770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=G2l7/XlY3zQ6NT95T4GJIABV70dQH3YXfhm4enxJMeipuwl+3j1XoUkEd8u8oHldOK
         esuecKKwebCbmzlTH9xuDG4FzzeSEAX58acn2Sv6Miqp0XhSDE5nU4vxFdfpDOVZZFRc
         LwN+K2QUSnmzMioeswr6m+PTzU01zYe1ikW/ZbHMWFZtlbNdvpl5a0gl37FJqtb0bRX9
         5g52nlVMtKtu4x6GY2+fQcJiHz85/rlk573rk9oNCNmlG4aPmR/XFdDVLgpw6NBLOK6Y
         5SGhhvCUzM97hK80rknNUoW6UjGSqbJUARHn8XvaFHmRFork3u6xX2D8znP/ZC8nJfjg
         9CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781970; x=1791386770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=Qz1o+X3/baEZB5AuLcjqfFb/VMIpaJ/YkAZzLkgSvzZolGTXYuUyumGJ9Uf0pnXAkn
         Iw33/e+qC+aO8XdepVNlNMsvh+lxRahKm6hC2cOl4FvWLxW25nNHNdbgMRKsIe/5CU1J
         Lql+Wu6opCB4ubcEwzd5zKbkn6Ywo0OX2r7E+4rubDbV80r3JcjR2DX8QfpImnrMWeMn
         RuNCvaGlht6O0l2DJXOPX5UaerdeIAINewu2vcu2MO0dz0wRty+d+XAP3EZ6Yn3+a4oE
         ckkyTwVyQxlVkObPKiJVWKYCteISF0IAGMjduw4T+DHEjfKZM52fUdCB0vRms5B6gyCD
         +1rg==
X-Forwarded-Encrypted: i=1; AKwUvByHrxhgSsI4IgWWw9nupT/XzH87Zp7irV50apEe8k9MFrTTCkBqrsxVLOL55L8KaZ4gHMbrXFFa6a4FSpO23w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxY4/254hiGXR3ApkDupsEcWGlLNrStwnYfssSK/9q13mvzxPd
	riBV4HnC6kr57eWFjqq7eQlP2Nbne5WifR+a6Q9u4lRMrrPxBNva20UMiFE/MzCqVHcaO5uCn9t
	9DIrKmTgTAcEevhxFwMuVYxLHZYIs6Mw=
X-Gm-Gg: AYBFou3L4sOtpIwQFELPTUJcUHQ1SZuMTUICECLKJPkaV664qu9kpvgV47jbK4EqIqi
	sPYkom5BO1wPj1idCSfsj1tPEXYJuBVKZIqHhuO1PcwRyHkHUsuWNKzfCo0KlOuxQHgOtdoqJHY
	msE9YavBUn9592mEjInNRfYhzzivFf0nQfN9XsPJn5TvW/2Quz2Ac7RmqyBN3RIxA3ddT8ENUDG
	Mpy8YpBMD9CtlWrl3oWVgoNXYwKHJ/GQ1mCHke5viLyvD/Lv66xG9VdQ87umfQ9iAZnOJ/UcMmK
	CfY5XiN01szExiaR/bm8MlcPLuLLhg9edbgLEtL0eTkr/XccTrOKppSst9CfD2/DafETf6zbKOp
	u0uVHX/6kkMpzRgUIGEDV+WYBtsILesnS1BNq99AaW7nplEFE3rw26ieLteoZOtAZxyXZ39zeNa
	Qkg86dzoqa5vxvvfjDcoLI96M0wGuLcCCq9HvJsGRmCiP5iQvjPiQ=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr3012710eec.0.1790781969755; Wed, 30 Sep 2026
 08:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rust-block-for-v7-4-rc1-b4-v1-0-642a4c1aebd7@kernel.org>
 <179068244058.1205226.1765319338142659278.b4-ty@b4> <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
In-Reply-To: <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 17:25:56 +0200
X-Gm-Features: AclHuK_OBw9tG-s9O8MtvXyTH10ESbf_7IiKq4RprYC7l6RRjV0_TwsAnU0VqBg
Message-ID: <CANiq72nFiT0EoL8Z9iPT3xcPWynofUAs4F2gb6-NWmUQmtBHPw@mail.gmail.com>
Subject: Re: [GIT PULL PATCH 0/9] Rust changes for v7.4-rc1
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jens Axboe <axboe@kernel.dk>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>, stable@vger.kernel.org, 
	Priya Bala Govindasamy <pgovind2@uci.edu>, Dylan Zueck <dzueck@uci.edu>, Yuan Tan <ytan089@ucr.edu>, 
	Sophon Z <aiqubits@hotmail.com>, Qingxiao Xu <qingxiao@tamu.edu>, 
	Malte Wechter <maltewechter@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:07=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> This series showed up in next today and broke the build for me on
> various Fedora releases for aarch64 and x86_64; reverting this series
> fixed that from a quick build test limited to drivers/block/rnull/
>
> The full error msg is quote long, find the top of it below. Full log:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-rawhide-aarch64/11055137-next-next-all/builder-live.log.gz

Confirmed, I see it e.g. in my arm32 build.

Cheers,
Miguel
