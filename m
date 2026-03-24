Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1243FE35B
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361706; cv=pass; b=N1uqTVyxFxMiv7WdtPfXVt47PnSbc8FDo1FcnYWtCaGWqhXZA/D+QSLBtY/+qe9E43NLksvlMdrio/8C+PYKlODSzj+qTRvBiL31dyofT7lvVYWlMiPZdLaFfZauNe/9y8cEsZllk3ug/KnV3m51woD2TGhBRpj5wabB6AFrRtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361706; c=relaxed/simple;
	bh=J6uSWjXvm0eVOdTTAw2p9BUHTcRVSFjdkTfKIdUbjkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJl7JJQoFHEzu1UliVlaRxaZr3+2DB4ugHhdhxqyUG0oMSbp9k6PfXFWtlhCbWxJZaxu16sA23Ncam/U/aS8At/1bODdKR7HDKgY+yE+jiMlNFmZUCx9+dapWOyOQVndY4VbBXF1oAfQQ02UTn/W8BMto9Nzk8PUpVzR5wnJn1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtOgZMlO; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtOgZMlO"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bda3b4318dso240467eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 07:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774361704; cv=none;
        d=google.com; s=arc-20240605;
        b=AdkrH5VMQnu3a135472WHwNRwWoVWC5rn0KMNEgNtRghW8xlssjJoBuulYe6jgriie
         OtxSNw45entyJLHiODw2A3oytI4/OT99JKSuUUUvdpZ4c7P2rlIFNtyOSDeH0feuA+KA
         enaujYKx0Jvie0F28hCejyBZW4qAnXUhJTvG/4PsN4HCVQSzq5OlvO7bkZ31yyeJ83Hs
         g6tC6KHYxU0xKW4PLEBGNHYMm8gHqISxAfS0cy/Gd4p5Puatc+5bzl4o7xMEXtM3RJYF
         4Q2D99n6Azyd1L/TiI261WHAFxLy9Q8sWh9xmqzOZwqYIkxIRWB/g6EMsSdgYK43n+Yl
         s48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J6uSWjXvm0eVOdTTAw2p9BUHTcRVSFjdkTfKIdUbjkw=;
        fh=zAOuFtxjvtKhgUCcwTeaOKb+UFHImHmtRGfD8HebPnE=;
        b=QyKFDonDwfFkPFdEBhQZzrH40jrTJ9Mubq1GvkSu9T0vU6z9ZEjl2RhjsPq88/EC5l
         /OuvwWlpFVX8v3oMwrrRrEtcrzifEO8CP87hTW3i4TPOawDm63Cl6wLzJsZK2+DsUjS4
         xnrcgEV0urx3DANpzbt5M9Ol2j8ojhe1v56CswqQRDP0xixwZq36OqrFgZ87bZw+kjuB
         7lJa+tqKGCubRVgHeMX9361kveyPubHXKs9CcTIYME/czlvz6IMZVujjPlgN6Vf8sUOU
         kVQIkNqLPycaFPdsReagfp2qIkZikx4syjJ0WMpE7X5vO1mYJk7HDk47YyYomI6ude3h
         G57w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774361704; x=1774966504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6uSWjXvm0eVOdTTAw2p9BUHTcRVSFjdkTfKIdUbjkw=;
        b=FtOgZMlOSoO2UV/3L7EYNBk7dF/QO5uQy3NCt29iK1I2iz8RDownDtoOgqaLrFtrIM
         dr2zSImExHGxZe+C7H0gP7D3alvCRiCB9Xdq6MkcZg6+UqLgV7NFdk0vq5B35UDScS3V
         h8JafmkRIXzDJzwBPdw84o+MyQ4+dYZVrf4mThdxnvOplntsHvrFy4NfkI91oI2DuHpz
         q/tBv1inE39NcDLMKX526WLWUhXj5pHF+A63Ae1s7pFBbQhnsT24uOFlv8lDXVbJqfvF
         tuFbViZXtaOlOson1wf8bphAW8YMHyEAqwb6L0vu1xSWZ/voBxRmmqO1y74JGRWv8laz
         53fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361704; x=1774966504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6uSWjXvm0eVOdTTAw2p9BUHTcRVSFjdkTfKIdUbjkw=;
        b=eRURsCU63cVQXI1Pn1uX92XXAzg3GJzCHD1Jkfns8uV7y+X8TBeLO9+fBei4zCrivn
         83uq3Fx9nRKIPC/biwBY+TplBj+gHNKzMkFiFEdTMbV0bdn9zbbyE2Qzr9dL3U+4cLT1
         NJhdPp/R4y/A8KDQjEDfkxI6FQVokFEM+skRYOqvcWKRyOGFFsgdTA4/KGCpmvy++ka6
         9AVdWu9d+4z0aWgp187/kGIZFuXfFULVoPESNsJzA9M8Lc6J91v/kOEfGa1JHg46YAGb
         YqU0lCH84qGvUQWi5K3unBR4NeBpdTLeTg1Pi1/suWr3nB0X9xDem1rB6d7+8M+ToFmf
         2LSA==
X-Forwarded-Encrypted: i=1; AJvYcCXndBTzh2r2Lbaz4YwiwDx1JzKr9tzOVgFz7xwmNI+5eQCcF/I+flXlgqCeZurgEqsrmyK5liU/2FwBbd8ddA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBMCDrS2qQ0pHSoVF+YP1k7XofIxPrMxs8zattydmThnvYLSE
	3ryB/IRxX2mKhemMgCnS7zIZwNE+qOpHlQjzq2bX9YEAJMLqDfyROgdZHlolz2EEsyCQZhvm7/i
	A8lABZ77PSQJz4swyYwkxoGhSHeqibic=
X-Gm-Gg: ATEYQzy32FqhfdYCFlZuHVLZJ0o27bPlZq8KTsFew8mFWETBpT1K4Yi2kBQ1R5FZTLM
	jNSrL86EfXkz4hq4sTZXsS0NIK2JbMK0+a4lc7ICcy0/cYgg66zojixd9/Tuarb5qXxitSn9PEf
	evwfqScvbjrk/R8fAAnl7/+kPdJDCaKZaAwAECt2Z4yl0nCGJ6SdcWkeyyGzHlcg5CelEmJ7l/5
	Ljkgferj0k6jjU9yZS2Duorr/vPjCOeSQbSX9KeCOKV+1dDdVlwKCAdXXcmqd3ZAxpUZ4QcIoxP
	bPsgkbebzIj8tnzjor0O1ZC1SkrdncQLF32vlFGA685hnwnIRTgYX3bR1uCgeO/G80ARHcmOAtn
	FWI9ZaF6nrS0ii8N0I/Lmyu0nmAfYBSi/yA==
X-Received: by 2002:a05:7300:5711:b0:2c0:b4c4:2b25 with SMTP id
 5a478bee46e88-2c1098863a5mr3511552eec.6.1774361703632; Tue, 24 Mar 2026
 07:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
 <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org> <90810e54-3324-4100-9f04-1d4d07b20ead@linux.dev>
 <DHAE8HD97E6I.2VLTL6O5QWJQJ@kernel.org>
In-Reply-To: <DHAE8HD97E6I.2VLTL6O5QWJQJ@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Mar 2026 15:14:50 +0100
X-Gm-Features: AQROBzD1xWuyXDEG3VO29z_HXDTrTW_nNBbvzt1Lq3SlyFVbzTlMaJosY-sc1gE
Message-ID: <CANiq72k2-pDStQ6WJFPJvvn7AgzU+P_rkB_2T4ZA3P=oPJVWdQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
To: Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin <igor.korotin@linux.dev>, 
	Igor Korotin via B4 Relay <devnull+igor.korotin.linux.gmail.com@kernel.org>, 
	igor.korotin.linux@gmail.com, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 8:03=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Independently, since I think this is the first time you manage a kernel t=
ree and
> send PRs, feel free to reach out in case you have any questions. :)
>
> I can't speak for other people, but I assume Miguel and Wolfram are happy=
 to
> help out as well.

Definitely :)

Igor: I have been helping others become branch maintainers as well
(since that is how the kernel scales after all), so I am happy to
help! Of course, Wolfram is the one that will receive your PRs, so he
will set up the schedule etc., but if needed please feel free to ping
me :)

Cheers,
Miguel
