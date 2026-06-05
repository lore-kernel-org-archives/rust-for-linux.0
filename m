Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E331F9B3
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658149; cv=pass; b=oSOeG3Lkdbv8Qo3GPTqHfy4BbJCshvQR1YPiUyuiEw2IwIj9EWNqzsJ5+2hMZxhEmbCYrVN6fm/p7LUo3o2w9Vd1E7dqlU5wZCMY9tlBKMZ3zaVSvK4q6KFLTqk4yA1Hxo0F6LeNip0DuBGddIHtic/sVza4OmcmrW70HXX9XV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658149; c=relaxed/simple;
	bh=my64/1IBEIL43GuC3wT1kWWVvvLkggDAhttkWSBbVOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3Xlko1oypyk4BUHoHx9BygJV5x7nrQ6qUcmhLXXzvv4C2xyGPCYwUi7P5XlGjjQv3Uo3u+1NQ3fc8tbHbGepEPBV/ZDfjyNZLKESGSX47X6fzonfcd4VlADj1h7cXxLyH3Ag87qwfNt4pwzBa+KGZhlVD7FDHynZQ2JL1vt/6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epEirlnR; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epEirlnR"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d4e57d33so59308eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 04:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780658147; cv=none;
        d=google.com; s=arc-20240605;
        b=ASOhTsI8oaM57TesJ39PRiDgpnFJJ3iKyRn+JKESJ/Jd65o/QhLrW3Gpe9m/Wgf+o8
         yiO8X6dTwS9tFR4ooQH5qM4HmoehIJSujhKvfv3O4TVmxK44MFG7mk4X8gfHKcIxAsQx
         cRKk7LaSobu04V1hjkPkNTNUk7FT3okeEavtIkI2OITaL+WojEfoaHtYBoXH2rASItxD
         1dAWS/Klcy07BsqxLRMtjMXJXtHPJUo9/5sTuc24vdmFfsHFCrj2I/o97ePMLplFR9xg
         hKlE31h9DAVD4fzAJ4nVkJrK0Lx3yoXqbS38JzBXdFohtEZ8rzdf1pAh5hFboAvJR1BG
         RvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=my64/1IBEIL43GuC3wT1kWWVvvLkggDAhttkWSBbVOM=;
        fh=snV+Yb8xmPqkvuzSwfnkQC9qvO8sIzrsJPAYm0+IkY4=;
        b=EyW0an2dGtaOx/Kpn13xv+olYSWruXDB08Q1i/0w0H5DjTHUDLVrIlbzhl77cRX4Pi
         9W1yE9iY1CPqpXfw0A4sQuiR9bQ2sAC1RmllMPF8bfnE0E8za3OdV5OUoptxreTG08H5
         UKzG9IIf05riPyYO8U+SlQepJDc2gss8IiKG71DBFe+Q7+CSZvtME07pxFxVbyHe9vfq
         mBx7nqiaipwMj8RzyJkDKmhEaPXpYnmTa9Sc+0qTR35o9o1p6txoJ/Umbs01rZfQqDyd
         wMRfhl1vPfGGm5ZXHCdqU780nAHFN0GypUDNEfOmZvLiFPkFZrtob+b5GCFWU13cteKz
         TQpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780658147; x=1781262947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=my64/1IBEIL43GuC3wT1kWWVvvLkggDAhttkWSBbVOM=;
        b=epEirlnRZot4ImqvNbrFaFW1b3l7g1/0FNHU8xDv9t0M9Dg+h+ef6ETySayjrCDpyk
         seD6HyhA3cKQ6It0b1Fd6Ybnscvt1/6dAF75/7w8ItPnFj+TpN616hy+G2bCq5RGtRWd
         C3OP9/Uis3tl++HjE1BsBEI5OVj8gPXjMnUx8/bpLHnGMsuyOxgyDScNj8DVT2fVYh9E
         GdrjtDpnXjZAD1N100tDw8GKXUiOZDgU5YuaCeB8mKURkJdzCeFTEuwSrlWlx6WeZOLk
         Dnfoov9aVYG+GKiHLLLeMU+jjRZoA0aY/1zdwQZIIadgi6/L+MXiD9PpiDyedMaHAcJQ
         akSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658147; x=1781262947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=my64/1IBEIL43GuC3wT1kWWVvvLkggDAhttkWSBbVOM=;
        b=ES7SE9ZifuOp9TqbpaOtvbCjdfyz6VakDzA/CtFxBrJIGRly5qgjL8Ea+ro2p5IG3L
         WGn5p7yQ7rkK0C7xOXTgp4nabUWvOT6UR6pd5bbCMGF1QHbVeDYgZ8Ut/yljrZly+5x6
         eNlEIjnu1AyJjV7Q9qLhIzUGE/btJGaEQ2joa++fUOpeyhJGBRnTRG2yXwhxqOSmq0tY
         Fyuu6E4LCO9RJfxrnyvmlnpU6Iic4AwtXktKd8VwygUVKTvx1n5il6SB1J/oz0Wds4oZ
         KIdBki9bZOipmT35LyQsG2QG7z8pZP/uIrSp+VwMLIhqEM9rwDhZtU5YVfcF4/O/IRO9
         FGvw==
X-Forwarded-Encrypted: i=1; AFNElJ8yX0oZQiYN0vnEt0+LGIBj36udpq6c1m5PRjFiwDeG1wSY66xFykIXtmcndq4CxEQJbEAopJ6d8Nms7nV4Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Mdb7QqS1WS3CJ6adz7bCR+oO0wjemOdcVMi+skYTDmkfq1aQ
	paaGgxOUaozwoa4MHYZNMU0FgbB8AoHNWOgDy6rfD0R0QVsvYuSP0l4GK3pzJcPD3f0PgOJqRHG
	pUVlPJUXJlz+isIMvr15v8fTTcM1huCw=
X-Gm-Gg: Acq92OF9zAK7vBnU4IQWvBavTp1kCOGoeqHYLIjeojHiURtHxb7tzMs1bmRREzUsnMi
	3ebqIfCNmI0eP2i2ol4P2tz6wEbPBE9znzw31CqyaPy7O6JmXG0HrBJjhuZTcnHSaD1K0+CvPV1
	gnY8oa4g81jD6GPeOJol+iIcxMs8Aysm34uxt8B15Km/BBw/1wkOyHKIxqPqUPowceNS8mrdnzC
	CumhYDnE+qSIizp9+2NMPPYXVGL5F1O5CKdWrA6eNhndfvvQUOP/nOGo6D0r9QGGvhF7XQCCSb6
	BSKoGdhIT31JpEg1AaRZtU/PC1lwxFv/YxjLdw1plQIceH5cvoJo5yKT1VsiXPl8wB+V4gfxcR5
	Nezq0VpZPtVB7Nh1tBBNmlWaUmgSD/nnEuw==
X-Received: by 2002:a05:7300:134a:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3077b326a5dmr659325eec.7.1780658147377; Fri, 05 Jun 2026
 04:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605041134.38290-1-ytan089@ucr.edu> <20260605071104.135675-1-work@onurozkan.dev>
 <DJ0YRJ6MHAU7.WVR4P2MQ4HIX@garyguo.net> <20260605091632.313084-1-work@onurozkan.dev>
 <DJ10CJ31GS5I.1ZD6WPPWGZTQN@garyguo.net>
In-Reply-To: <DJ10CJ31GS5I.1ZD6WPPWGZTQN@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 13:15:32 +0200
X-Gm-Features: AVVi8CfJonDrVd3vGam6duBD_2L2EfxY_kIzLcohD_P9GEpMXFyOnCWv175rJqk
Message-ID: <CANiq72nE9H34DzEthWmRSmDxgaDW+XLLbrA=T6ywy=hB5FAMrg@mail.gmail.com>
Subject: Re: [PATCH] rust: firmware: return empty slice for zero-size firmware
To: Gary Guo <gary@garyguo.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Yuan Tan <ytan089@ucr.edu>, ojeda@kernel.org, boqun@kernel.org, 
	rust-for-linux@vger.kernel.org, zhiyunq@cs.ucr.edu, ardalan@uci.edu, 
	pgovind2@uci.edu, dzueck@uci.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 11:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> Oh right. Arguably the wrong error code, but it does prevent the path fro=
m being
> hit. xz decompression always grow at least 1 page and thus won't hit NULL=
 case
> as well.
>
> So indeed under no paths we will have a sucessful `request_firmware` with
> `buffer` is NULL.

If we are not expecting it in practice, then at least a
`debug_assert!` would be nice, or perhaps even making it an invariant?

Cheers,
Miguel
