Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237FD3C5DBD
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122523; cv=pass; b=ogRLBe1wSPUnDdjH2kFBDVIdDF2Vrt9G/6eE7g4jiv3hdIcrWARiyhevTzva1d9sQaUvIlDV5PvKVDrTiDsQltIulnIvJOqCc3bNF5+33X7a08WpawGY8NjAuz/7VS7DixjL0e8GPrrh7dTVOtIuascGFnyzG2VhsLx9KVJtfs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122523; c=relaxed/simple;
	bh=H+8MJmxAzxHci1nqzgw3d8yN6pNlkg2uEw1psZ3js+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jh6mpFMaL93SiOUAUnSJOt4w3/pMjGvFciP79MwkOuiESMBG9BUwVhA/aPEYSyY9glP132GvSGhnOLKo2Ch83yezEMI2Z602fkf2LxzsbV3NbWCLRYl9dM1rTZyIjKOW8qlAZye0g/Kb9Bdu0q0UZiJ/TNmM3qtr4ksOop2IxII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roJLmoo2; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roJLmoo2"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127148c2112so78830c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 02:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775122513; cv=none;
        d=google.com; s=arc-20240605;
        b=GKge4ZU2CN1uI3h5CzOi0g71owS0Bzf3sUg/gSBwKCbZ9wnQ2gcyP3sWyz1IQCu+uz
         LaSubEkByJRod+ltOMBHgidRm7DWB16GSeu1Ih056IbKRcakPZD53r3C4HUx18E5u1kW
         KjyMeyjD5B2X7Yv/ZUd/76durhVshmQVXWGJ3WoP8dlpwUpudSD87Uko2dcG0oVKyaeX
         YpKZq1fbNhhENwlOc977zJgx2fksnCeDAblTEJuP+gKGi5wJ66zPUrv1mcm6AP4+UKrn
         mUginxHDW3Yvki6/VSSigK4HnTzbFurWKb4ACP/D590SXSM9Sf8HQFIUPKYqqIjrW67V
         edDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9MGhQXpb95MvJnOWeDDxYCn2JYlau993lcCngfPdIM=;
        fh=CSk0Yvhzu4x+GG38CjW9D0F8cN5GMuVTkDBi8tNQwg4=;
        b=aEJFu+Qt3F3G27NAp+3Nxf/B8k0OiVXZltBY5hvEfQNn8cLeJnpkZbpAOIB3E9x/Dw
         obQLemLHTIyQ/LelmyEN3lGwQ1D3NHHPZUXqWKp7kws7h4Ui0DqPifQNXTQVpRC1f9OS
         iIu/OEyRlmmDM+e1e2EKhyZ85F1uMTuj7n0FiO6Adtz5MO4G9Ri0jiAKble0nuDGFmk/
         VgEul2wGLnB5l9v6ycsRjKme9bekQ6ikZOoCZ9JhROoyqDRtVRNNGqbDsmDQOzgteipV
         mceKVonIsMxLVeZC/UxKVrh4M1UTRgeq+UduUySornG4yWRWl9l1Ir2dKr+pu1J8re/0
         CZUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775122513; x=1775727313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9MGhQXpb95MvJnOWeDDxYCn2JYlau993lcCngfPdIM=;
        b=roJLmoo25+/I0rVoQZ8KZaNejAONiNZ+f7nOrSVPyMqvamkD6nqeurJi4zvEUKtYEu
         0xSitIDDjbjwokAcvSbpu0nkmAnHHVPKZ0Pf3U8RMHtLYHg0PUlNOdzSdSblieojV5cP
         RL3EgnUto8EEu1NR2VZIJVQqGb4QsChR9XoutDj3ANftWPOZK/rNIXx7wD4Bfs6w88Up
         oNPCKxRlu1nH6KqBG+fPArb4qnMXMJxiUe/dtfYWsQu4hQbMYhtdeIey0orUtKWSdcFe
         F2qi16kLVTEy5y2N2tqxPXdlW/BNXs5xrUfg341dfJhMMWpkya9Ccu3AzpUJpJFe0lQL
         v5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122513; x=1775727313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e9MGhQXpb95MvJnOWeDDxYCn2JYlau993lcCngfPdIM=;
        b=cdnomQRpg4sMWIWNrIFf51Qhn1pFUhCGooIOlbSoxLmagmEhlM9EuaEtTzfeZNCYJ9
         qvx/s3hqXY4WV+btYqeXAqOBR4+ffsjFDwLzy2e2wLSPWoY+cYlykpsZzwkcAqrbLhmZ
         OHCcE4wMKtJf1t8zAQq1HkwcPs1bZBWJDHt/CUsbXBfBMQGCJbjs98qa6HDojj3vYfkc
         GEJLQNlHA2bLEjWOFApYi3qNkw/p8heFY/R9R4mtaaGkp2yjn7kKpFAMXMGcR2eQs63F
         Ls+rshb/8fdQIwoRS8Em+W7bBOkzYNPN1vbz5nuHfKLsvQt51wgBW/D82oFNuV1M7xmD
         FSBg==
X-Forwarded-Encrypted: i=1; AJvYcCUhYxhvGiEj+zhD/QWg68Mk/5O2DETwnCCHeqGrUW8UX/Ob0YAtXruBa5ucwIJxjUoqLhPrugys8r23ODjAYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUI9C4zJkS2ra8uHs31SMziFylFMuyv5KedAZ+TbgZntezHkA
	HuIseRgGFtfjQ/oFsqWvZi2TCpAWV5K5ZAbExC0pEbOLITRjK43DX5N9YXfr88nEYhziSXb5Ssw
	3qAfoKGHod4bII1c05DETYL8bwmUdDKk=
X-Gm-Gg: ATEYQzweDQeFWY7K0VAn/BC8u3RgW6+tNpJ2HDeyLUe1BT1hnG1ZiyMdzTfNHIQn9r8
	+R2EAXI/jQKwGKfEFio9tB1lS+7V7IGfrLU1aRF3/z774rZEb8icMFtuBhroUGGj2daRIxoazE6
	GZ9ecuOcCmoygVO0jkVsCcYes/mfaZd2IZ8EfOuZa9nGrdI4wAdBU5YWJQaBpfefkJITiP7MpYJ
	SZIpvi+k6VjXeZ39W9rcxGhUuAf/jiQu41KCqh1+3j30UpN3nN0OIxgT+qVHTa2P+4+0vIkdEDK
	SHLGj9MPo28X8uh6QOC1tM8X6IavZMiQ4FxLPwbLT/5B6nwM92P3g1ZnWyGMxiOmtJ7Fo/wRCki
	i2MNslbXuIfgVwrtvmZwzA+qbtIR9ZHOEUQ==
X-Received: by 2002:a05:7300:2154:b0:2c4:76a3:be04 with SMTP id
 5a478bee46e88-2c92d960048mr1609624eec.0.1775122513022; Thu, 02 Apr 2026
 02:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9n4jgykD1L0kgyY6JUs8eV8w-JbuJ0K4_2PueWW5k=47A@mail.gmail.com>
In-Reply-To: <CAJ-ks9n4jgykD1L0kgyY6JUs8eV8w-JbuJ0K4_2PueWW5k=47A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 11:34:59 +0200
X-Gm-Features: AQROBzByB3Eew30yrRn2_8Vsth0D2pFV78U6yhNwv22T1V0z6sK1iP2dMa5_BLo
Message-ID: <CANiq72mNkLZTx2F9N15_K4w4kLNZytMzae0Y1XM=T26o6WqgrA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust Analyzer for v7.1
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 5:37=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> All commits have been in linux-next for at least 6 weeks.

>   https://github.com/Rust-for-Linux/linux.git tags/rust-analyzer-v7.1

Congratulations on your first PR!

Merged into `rust-next` -- thank you!

I noticed that the tag didn't seem to be in linux-next for that long,
but I saw you rebased the branch (the commits seem to be the same, so
I am not sure why) and I recall the reset of the branch initially, but
isn't it more like 4 weeks, i.e. March? Or what am I missing?

Cheers,
Miguel
