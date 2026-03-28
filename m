Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEAE32D0FC
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Mar 2026 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706012; cv=pass; b=l9fEnTKtOvAqVOr7y8QVqBDlyWGeBeDbr5cqs5vJvPj8WjscYE3qtLu3NjA7BkcVE6iG+StyJnJSDe1nA38ZwKv0VWQHMclwZ7/IvbVzcz6lBNLeeES/LQ/ErMgSMzcs5bAKHm1HtFKWYfbnHx/hY3tK16NZuACCx96CWY5ATX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706012; c=relaxed/simple;
	bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjmUcjlu7C8P564em/pq5EAEdenw91c5Q8imHuglJyREP8sgDbjrindsot86PTRYOCPRMqw1nViKznOMjHi5lRM5JlhCGAazvi87qP3jxeZdBt/yeeO+7oSCW737Sj2n3owCGAaA37n+ZeqcOd2VwENB55R/0Om/O4XXmfEIyTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMKO5gvp; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMKO5gvp"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c18771d582so54237eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Mar 2026 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774706010; cv=none;
        d=google.com; s=arc-20240605;
        b=NM83RLDiXpJIZbn2zUTG7DJo0iypBc9+mPZECHPZMYCejPmqN1paHmeaXkMy+8X2ur
         MBDaiPgiL9hXYL9xxvzFB5/Ov06fLKpsy9RQMGwMdOl9s69TOGyATaAt9U2XaqawN01R
         DxcbaHOgmpSDjzXri22F1lm1eHsdr2qL1iwkCxiAj+bJ7ARht0WCruXM1jnnnEnVnCPI
         aQ5uDzTXvYR62QmPO0IdXMLsCxtGSYBOlNBRTKminMCHzoP546VHEUz3TB1Pt3ti6fI4
         zC/sAGrGW8YB7WMRntJGRvSnL+XxN7Z6qumTSXw2umwxLww59ddwRdkjbPjPICoAuPpG
         YMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
        fh=NUpFemnzAPj5EkA6tvMjj9/tN2vwXt7bJV38b6Drfe0=;
        b=JnbIm4IrUbK4FvmlAApo+8XOzR6mC+t3ZUk7caIz+EvxzKpB6kMK6gj4QFH50Rnmrs
         MTieECANJ+sXk1Rp+1eqZEaQszgRIIldeExzRnTgAFrtuyXLf8F9RC2Ct1iS5fyOsISE
         3/IDbF/jZu9GoqUJ6u+i+bMvO5nqbnENuZdPO+w7h6n6kNgKf9pmnWVmcZXcSyMmx2rg
         FLdgUGjsqEEWyaBCwly6DF0YoA1EabJ/HlrVymrOqhEA8CE8PZuCTSw9FkZdTaclm0r/
         pfJCuAClAwrtyLi/nA3k0axX/glfqWvt0GKmQcd0Z6m6jMsLvC5XoHvhJGjhbhAwsPgY
         IOqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774706010; x=1775310810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
        b=hMKO5gvpa+q+I7DLhA7WSWMS6G8j+7Rrof6D1HXkcTIEjAq2Ispjj5JB9kjmumAQ0R
         C37ass2zSCBIbaa3B4/FnLJKUhJO8pmTI99S/TvE07lOTnoyT/yiuPMQkaqi+v+PSOGe
         GtVBNdUTrQg1vOQg+Ttkn+o/k7XIdhQoGNuZJk+bloT+2oElGy31AXDnzbPWQRoNvcNG
         pjPfeWCOARBrOGXq4fVEcJs/4X+bobYRbloDs+TLxqUV+wRmrCq2Q/LjPTe7R0hdMugP
         MbvVgdQ3LVMQb07IB7qq+FToCeoeahHTd/wweT+8mg/1A/UO3CEcYgZwML4oPtcsaWAy
         BcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774706010; x=1775310810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
        b=Rj2T5BKAoJB65I5loiTHycZwA/Pvmo7vwezDbyl/WLI7aHBLGEO0Tpndp5jaBc+sfo
         TzcKxMAmqkoGizIwVJi5iRPbuQOkx8ZhysSvcF9daKftFc6GIi3i6tDWrtX0Nu5y1nrh
         iVFavST2QPifNnNFUzHHHUrrQSZ3gE8jwrTUD0qza58wFM3JXfWEnUqVuUgo29rREPpq
         Vg+fPCFTWMo7cwQm+xSF9GLd3I20AdJa84tpt2RUJxErgXDbS9I8FicVAqpJY/V5HGfB
         blJuzMRAupwiBs5OJ4U9TuOseYMbmQanP6dxbYI6ebVP2nsD0e7yVFAaRH0NthgRfXz1
         A/+A==
X-Forwarded-Encrypted: i=1; AJvYcCW8c+UgU3vxDXNzFEG09Qr5E44P/D9aUnrawWvyUHonW6KEyZVNvtLMQquWFmiin04iD0MC0I+PKo9yN4SHkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylcKDR91SNVvxbdvCnXkBVx9vmtxHBsqav2pZpc1q/pfI57Q75
	QgxXFkOt329xdlmaNmqKFNH2tEhXXMEctWd6bfpS0Vead1WimjaJrWmqfw2cTnCsHuPmoD/2yiR
	OOEgExXRXhaVAdZrU3EIT9/EHtAKN2WM=
X-Gm-Gg: ATEYQzxVfnbUN0ZiOpLyER4sYtCtAQYi3Hs8Tg14RFW3S6azMWEsaUN0YigUoRcDubb
	I79qwJy5zUgoLVwLFiPGrtK9qHX5RIfA7J6EnOcdOyr9X07iTGEppFYOg4cVAEqwrhBM5VfBL7d
	3xqUmoXiJ7joK/d4PJGyxoAvSF//6ENF/V8DtPCIKS7mmlyO+A5uoscfobI7RHeHvGZ9jGEazVb
	AS5Pnrzx+CnX96uv19jff23enA5ry3m5Fiisx/s3bBmec96N1eCciQI05YbPEDueaICDLwSFn0G
	l0FzTh0wBfpNelLe4g7QXlK9szStoJTJsUDkur348vlbKa+NXv/ue0zQoCzEZOEUuRujkyMwUG1
	ZH4O/ZSJrwimZiO33XQ4pVgY=
X-Received: by 2002:a05:7301:9f0a:b0:2c4:76a3:be04 with SMTP id
 5a478bee46e88-2c476b31c65mr246246eec.0.1774706009912; Sat, 28 Mar 2026
 06:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Mar 2026 14:53:17 +0100
X-Gm-Features: AQROBzA8MjUBXYFRm6h4gop3ycXvMcobXQ3-8BaNpAO4VrnoBIXKMybPKp-xm_s
Message-ID: <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 9:56=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Looks good to me. I'll wait for Michal to add his blessing and then when
> picking it up tend to drop the Fixes line. Or do we also care about
> CLIPPY-cleanness in stable?

Do you plan on picking this one up? Michal already reviewed it.

Thanks!

Cheers,
Miguel
