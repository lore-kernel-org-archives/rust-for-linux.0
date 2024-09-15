Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198518B04
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726421588; cv=none; b=kcjWh4Dyl+vVkWSidjFXbQBGn+UZ/pC5ype4aBjKNxwk8CqM1Icff2qjw3pz0/VhHNmnhtSsO0fmft6AtnB35rgu4zzYhdGI1kb3phtPZ2Cmk6BZEnytguBTe0MUsrI86kk5w7vczu/Yl19+JTVo3RkK7s/B5vwHWUHwbsgQmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726421588; c=relaxed/simple;
	bh=z/9pV2OnSea3caphcEzp0l5+cmUlBD05TU7fCGN+lak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNHtzM3jROSYXICh2g2+sEV7JYXtVf4c1rUjpsmWEw9CslEAHj9wr8XcQ+9avEF03CzB72OQw8CtlIkByHKFUVRZhvGurhZuOEh3Nu2vx3IBvCUQN/1ID6B1U3MH/ncXzOeTJGG/wUw2dNiOT7NCshz1APs/afFOr5gX0z627w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmiExzHN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmiExzHN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2da516e6940so731813a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726421587; x=1727026387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/9pV2OnSea3caphcEzp0l5+cmUlBD05TU7fCGN+lak=;
        b=NmiExzHNbMtBTpQaeQFp0d4ApOfccLKTsnQdZUnUss6n+2+Prpz4ypSbCsoogyPV7A
         KjS4R1K6TFp54b0ONRQOWONzbmT2Ia3pPIkW30sU7ABObImkvdRKyrnHV6Cs5ZDmc+Gy
         aJHoj5ZAQU2qmPMjgzroy0sJVKhwCbzFv/nZGTsLquyz+Zsn27uFFHpybHqXzgzBZlSF
         OJsFUpbITQRBmWSuohmqlCKrV5VZ1u1SPq9HN/XoTX7Ipg8SIRYvpxf8C6KqXrDNiLet
         KHp6pFtqAXOTSMOk5gaxIoM30+SFAV1K9Esomshp0BjthwXP1riK48H5TEnutx396kKq
         TZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726421587; x=1727026387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/9pV2OnSea3caphcEzp0l5+cmUlBD05TU7fCGN+lak=;
        b=PU1VVlEV+2FvxIm3JkS0laL2q29/FiQ8ZsYSIG0I3aib8jEglk7E1SscXUdhAZN5Qn
         dKpN/6lfle+XHTEoEQ9gDADO3Aq7UX75ol7vtQXICQSOhexvBFB/vgdBGyYJmuecSD7a
         lzj16wF1X67bPbjJZOeMLwhgFnSBnpvSoNZVvVd56Nr+oauQ8RS/83amiuLq7Q5ecOF+
         Pv8wNOkzCKDleOoFbWD6LEjyu+ce1EtGLX/ASpL/dmm/Nn0UnnAprs9cxXFAtQV98iUt
         8bnqBS9h6uVkJXfpdJo+0b4N31nirbTWlPgRWmBxI5btCwjKBW3pkPLf5MMaKEB4xz+b
         k8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyMuHQ0dkbVZ38B82pJW6WznaoRZpNyXU57KTvQpyTySWXvHvI7BF4GOo1JfEjh3Hwdyh6/d0fe0jV6hJXvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywge8NhL8z2XY9ja6G5e2oZpaqhyTa9dXWQTI4F0km6PgnuehHv
	UMckof5ku6/+1U1USQeC8q6BDbJtPf/NNguevNt78HdH2eQJp729/AXMA1vCMYSvH8g1U2Cl/js
	cxdoOQixq59NLKdmUXJCJyLbzWzc=
X-Google-Smtp-Source: AGHT+IG18L8YA+beTlzOeQ3SOsobcw23io/dFOv7ZrsKxrf33oxkKE574je92dLfibcf3FzQOPEgwwwQkN2pmpBNICs=
X-Received: by 2002:a17:90a:34cf:b0:2c9:863c:604 with SMTP id
 98e67ed59e1d1-2db9ffb84famr6025325a91.3.1726421586531; Sun, 15 Sep 2024
 10:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM4PR14MB727606461A9C870981F44D9BE9662@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZuZyIRaGHxGMGUid@boqun-archlinux> <20240915131651.02a5df84.gary@garyguo.net>
In-Reply-To: <20240915131651.02a5df84.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Sep 2024 19:32:54 +0200
Message-ID: <CANiq72m_Vt59Ewi5t-j1n20xOPNsWt7zqnUur8Y4N1HxaDUfMA@mail.gmail.com>
Subject: Re: [PATCH] rust: add trylock method support for lock backend
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com, 
	ojeda@kernel.org, benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 2:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think we should stick with `int` unless we change the signature of the
> static inline functionn to also return `bool`.

Agreed, I think it is best to keep them in sync, either not changing
it or changing it in both sides.

Cheers,
Miguel
