Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05439269811
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748237; cv=pass; b=il7dTpSj5lcdzm4BowNFjuaVSQuBOhfQAYe6eodFtq2iHKeAbAr0+j2upjRTuVZZKBlic2lGhjkzdMVp4MeqhEikD4DmLh3u1Dvbl+nKMu/Y4ybQzte/iMbTDQ8McluXeMYPyaBBzNaCXjX5ZPfSsySESVwsG75IZjbKhg5vff0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748237; c=relaxed/simple;
	bh=rPHmnBNfSq768nvupCmQ8jy5KslrAnbIxrxFleDwxqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7LaVN3kf/cQBC9atYrAEQz7AF7mSGW47vDN1WM861/HaGM9W/5IHgcGYUbGXUK4C3PTQsbcwsqA5ztQ/IvqBuwsgFnbGe/z+esZvGQ2sDH5/cdEBAN4PmKvduGjsxjYxRDgxVtncbw+Ky1gQJn6cE81Zb8YyzKOfX58LpUq93k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or6DIQIA; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or6DIQIA"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233608c7e9so22452c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748235; cv=none;
        d=google.com; s=arc-20240605;
        b=dUcigKrL6kMigNAQmNqxmp8lFng00MaSo0w+o+MS6ZwcIynf0m0pSxfIOnug1uKmbi
         W9gckgInAh3Fd6do6IG2DSNB4hoeezTwH3eK1ytfHYXC0JRKkLmk2MpILHXp1Y888Ki9
         aI0gE4Ph1VuCnFlKeQ07ZAUL/P0i8iBEP8ZdZs++Tm3oYj9A8eKCG3yB0iVBqpHfTvP0
         uekzjVvDc8nw7/erpf0xSOXfvPQhwAi96pONz9M5rCC7Atm63IMcu9df9PxRP7Tbf5eN
         TLlriImAmATwTEXyd4MoNQPf58X7YbJcsN16gCwv2QFkPqyT5yz4XfCufKCVXaEMfrnO
         jdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52/KGhuUUV3SORneydvmYhr8P6s3vPdT0wmx2vU1+PU=;
        fh=XVdT3G/yCeLCDhA3Mcbg06zMS3st9wxzhEJ4pWjeXSA=;
        b=NcdsjzAXVyx4hTDeYr/eHuSh8mmT/jKRFATDkhOY6PbUUu7qcpvAAoryUALuU6K9xF
         b3+AzBVN7ikn7Ye/iW8ZE9bprGuycVKwH/LT6e7dLLD4ltyAkKA9a/nI9mpndj+YkyHi
         BT0v3AP3XDW3vTwvpLVrB3EqGoYhJcs82eTWEbm6wvcmVTNsPvz1EWCmipjyHknE30f3
         SDYPFyXfpYnI+O5lQgJA3oi5Sgk1Gt4zoTvsjUmZo4Xcy5WMg5xwIkSWuJhCVySBraGk
         /RawxfAwVx1JSigAWlMRVAqiKHYnM/Msifd8XoM2XT3fxX4EHZNNMSvr5BJkZoaPSd8y
         bXUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748235; x=1770353035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52/KGhuUUV3SORneydvmYhr8P6s3vPdT0wmx2vU1+PU=;
        b=Or6DIQIAzFogpeZUILauTGI17y2e3k/TX/tRCr966KRnUYQeiypBxR13kfZbs2e2Zc
         9JH0c6LC9SdNWlwEhtGEA2Nxodtmkncqn6e/AgygFIFRJ5/vGwszdt4VK8EAp/ln/6A3
         WF9SfyYcco53fwmDND8qYipI5174fY3+y5oq6PDZ3BtCUj4b/1Nctn5iQsaUDiJv2ZuV
         ChvVC2VPdoIhWK7MZl09EDkf87NyhEpyurnZJiJjII0PKc5wq3Ky4EL6L6RtsE13pFVO
         X7PW4ZZGjQvAEJBJtHnsxE6wCSi7nP3zZMGHcTQjoL0rVsi8w5j3J4MzM0wijJr/RXS/
         GwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748235; x=1770353035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=52/KGhuUUV3SORneydvmYhr8P6s3vPdT0wmx2vU1+PU=;
        b=UCiXQYdUR+6dbydERaJc1fWSnenGMOXInC3+bZByX0nBRp05Hf5H69wLnJq0lTEqMQ
         xkkUNZpQk2qLpUGjNaKbc6vcuflvorjbYHlJx8jF3/gtOgNNzFV9u+GJ+4kV3kwwF7ie
         VELxMin0m/MDp6/3FALLdC+ciB3w9Mce5djfQwEJtRhwbmYY3HC5DAFaAyPKQnKPKClZ
         UoLuy84mInwxG4wznjglIWESpoa/A2q5fKPhTo+tOfGpiB3DHbLO9cy0Trj4WR4D5EbV
         dJiLwMV9+urtf3luzuaHP2bpXdfo/WgbAr//Sts7ssXq6GIHzlU73J1lHOVveb2eTVpw
         vVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvcHdtSYP2CPh1/Yd6I+wTDSkBCLN0DnfpMZpNa7ujBd/qoug+ZGBUHPeq39qQXPNeYCjwc3yY0jle9kZsQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQyRCC7JgdjfE+EDWrB/Vd+JTxsqq9TtcTiql3Y7fNZ5X0lbLY
	UBd484Fe6qQkYL3kcLLWG+5b+VuuGF9mxBc6NbmzuFSGa/Hl5gwH+tsStjLhqKbj/6OOVIEUGqU
	QNWY95VE//HBcRf5/ikQVqLYZqt5luE4=
X-Gm-Gg: AZuq6aL6VC4T4/g8YcGjqPQtj6D+szPNzZOndtCgd9tObfLYP+3OmOMqSIRjNiW+3rZ
	KX9EiP2zePAxK/F06sLapHXT9ach8+EQ1V2Qz5GNl+K446iyRhENIoI8Gf/1E66AhVCzCtwW4r7
	a3Cho3xAQq/2h/vDwiBURNrlSlR1aBXSQl5LjA12OcPid9OSWAf48xbVl1KUZhm/oYTkAZTJDZX
	TB9jKg70pHhKGAXYCiYi87qjIoXsUJ8hKhpWWSyY/XAzKu1HOFep9BQPCLVAj5Rx/n4n30JkMGp
	V4W++8qYHtRpkYfhVjavW8i4SN83m+47S1+AtVOCLCQ6IgeLDUJPDyqYM3t0SXykfdlA4fCg72g
	Z6cneSCctLp1t
X-Received: by 2002:a05:7300:8b15:b0:2b7:b6ee:b3c6 with SMTP id
 5a478bee46e88-2b7c8934170mr412675eec.7.1769748234988; Thu, 29 Jan 2026
 20:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-1-118c48c35e88@kernel.org>
In-Reply-To: <20260127-rust-analyzer-pin-init-duplication-v3-1-118c48c35e88@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:43:41 +0100
X-Gm-Features: AZwV_QgkyklxREXPqiOOTu1nERsXziJ7gDmEXSfISYKn5XmyIr1pQK7Hvniypys
Message-ID: <CANiq72knqZ7-xXjuSdv4rAuxpY5u8xF8DvGyKVqWnZfGyRf2rQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kbuild: extract configs for reuse
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 2:55=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Extract `pin_init{,_internal}-{cfgs,flags}` to reduce duplication.
>
> Acked-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-next` -- thanks everyone!

I rebased and things changed a fair bit since now we have a few
`--extern`s more -- Tamir, please double-check that things will still
work with your future rust-analyzer patch on top!

    [ The new variables will be used later on to easily pass them to
      the `scripts/generate_rust_analyzer.py` script. - Miguel ]

    [ Rebased. Moved new variables above. Reworded title. - Miguel ]

Cheers,
Miguel
