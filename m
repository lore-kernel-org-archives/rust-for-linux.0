Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767C38F931
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663240; cv=pass; b=P/Kf5UIy4QMbMHbCcyL43/EilfobhFd1hoci2PGQY4gK5cStkdttE7mcEE98Bv821qiG2AB3WC42y2yfYrgSFBJrQBl5jGjo3oCTIJAd2GFTz4jaFQYJIJJ6ss6zEjoi2SM7z95fERjolWblraB5BJ+sl3teInVBpgi0dYWoY8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663240; c=relaxed/simple;
	bh=GIXcFcRgi3IwWQOVI/nK6qDCIPKWXANc/7q7PF48oRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1JP5/D/ApO4TyAAmIDpwrs41SHYaGXi9zMLG2GxfXxuoWU9/kA4tzY9bgqyNLW5EynqmBX0hRgS4FruuQUvj0ScPMJcSLdd/um91fgVr7Lqim2uVvP92znih9d/7XiaLBJZXf8uVyexVufNngWg1H90F8XT2RmvvOW/nDvGvCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgHChW2L; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgHChW2L"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304da3b4508so182147eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 05:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780663238; cv=none;
        d=google.com; s=arc-20240605;
        b=E+cv7ng4JMMgkuZ3o6lqgMPlrOMLnOeAf9I0uDItxWUBe18vC8pGhYBY1BHKKBDdqQ
         XViDxNlGOz0iFS798K335mEypudfZ2+e8Z4z/Jn+jdbTEc87JweuksQJfoF55NsJ9RC6
         jyFdDczCJq6FFXgEktSXnWv7hIHMefLxoco90+AynmhAfakUamdTq+B/FBrfBHbyrTcm
         FSywyW7e7fowoigtwy2XA0RxzF4kEXWdw9bkQDJliKsacKMDMmArVX52s9tnjoSVj7dF
         1zgs/UEeqlPpf3q4ZcXrasgQi5CO3Qvg+v602aR9Uc+8dux7rBhhQ/7xK/9Z90iM76Gc
         vRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vq/SBizJ0N1u9CvM8MVgScgVED4Ezs0M0slZq5actaI=;
        fh=2Dof6ZmXcJkSgfw+721yG4KEUacGqmfR6jLUYCEUq5o=;
        b=IqV6XEp+runp1QSMohR1EA11dcsCSxtRxzIOI3+KRhOUcHz6RWA0LUjALCGsnvCFpI
         4rXHZZQaQQhTEtlYHwVp2h9p1bmXl5Z7HzkP3o5qczQ5A5Oz+kXZLADCZtBwRqQqvS7x
         TG9Hmp2hYecn+RnV82ChMCSvPAqZ/JBXrJsZJMb0jCiAh8jUjhLjWGjnwvzST+zT0SqA
         OSy/QcJqBka6im7sEHV1iRSYn/M6pbqGnIvCFfm2xtJpbR+bxETkCb+A5X31By57H4DE
         C2WsstuVDX8WXYCpvll1l6tekNwR1e7jzztJAiqpOj+dgbKobh7lyiNoqlDbo60o1y9F
         4INQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780663238; x=1781268038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vq/SBizJ0N1u9CvM8MVgScgVED4Ezs0M0slZq5actaI=;
        b=HgHChW2Lz5k+KZ6qvbicVzH3oMjz901ZwEx1pPW7/Mk15J59b7MD2HBsyEy4YHj8Xt
         fbDTBvrkVSbD9gqMItSEZ7tzeegMRL0SD/RwkA696qbtryml/cFcBIhHvdAHw2xiIuj8
         m+gIx1X1HHVdT5p3K4YnD93AwIdukp8FyEUqhY4hs3vRo519AQblYSM1c9tADOFeGLzF
         cp4tvQcztaQZxqD5sOwITrwkPUtcLR4t/3dfIgjytAuYpoJ0wCX8baCsMFM9bRe12dSy
         CUxkq82gO2CHf0EpZiZUX14GBcWbhNEBgumACSWNugkGnLeXiZ3M/Q9EWEmjUhTFhmZX
         YqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780663238; x=1781268038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vq/SBizJ0N1u9CvM8MVgScgVED4Ezs0M0slZq5actaI=;
        b=n6v/olsUdpUZNnb+LZCMxMWAtnY1+BFlfuPW8N77vnBFk1QRZ5GLFyUfgdM/Ch8K4p
         Rdf711zLysl9ZVIITabGEFBqZQBR6OxZQ/yRsmEo70/492Kb//pF3K81aoRV2Hus3pak
         C4eER0OYinEvinz1ANxZ5ynLnJVJKEjM1aerPpVo/Fsd9Jy+vhKc3c533EOixM4wApDL
         QsCRi/pej6eP2uBgDgHHnVUoE1EuPpr5xozKTbYLW1OBHrWYtiXEGfjrwsAw17UTd3/u
         xkvX9dbdF/66Cr6OGalCxrf15pPIAYsdODKX5iI1oUl6Eg210igNNT3TZ1XNN5f2Wqgj
         egGw==
X-Forwarded-Encrypted: i=1; AFNElJ9Gzp3G7p4xq1ECenZE83RzmIrqkcPV3G3ikPw6i/3owA744uAGg49jEe2Ob3LE6chw5bUI002JZQOCFzz+Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwPhvdwGZ+BLkPagWZtuI+LptDzu6QllOEfHius4vXMAHVBhu
	EmsM359BmJXDnB1GTaCQZWsdZKGpfT2MfGk5/F5i2hF4SABQtpmk/lvTprPtDMt6WIEMoulx3mj
	jnCHY0tvwnJhm6wbw2PJVIYn17Fq2hec=
X-Gm-Gg: Acq92OHO3To670QvOqul+qmvXWZF+N0E/gRllpivDXcGDn/7xIqgAv4z++htQfUHL1O
	YkfU3bFa47i3mZQMX/GggTQsZJkCNNYve+GIliPDSsoZfbfVyaMM+/d8WZbiFxz9pLNCVP1PvgR
	xQiereOyNS3tCzPNyi5mnv+MX8ku6goaeHOpqYstKac2FsclOBuEul7vsrBsNl8Q5WZQSpLyJOV
	JCxeFgfACGmxayYT6QdEdyWpzQk1fGeNVs1TvXYvCaqOzqihTc1Pb5fOo3nFYDPCDG+qTa/8E2Z
	Ac1z7ZzloFwFuDf0LlYDHEGK1fnKVkpKW9vKEhCPZum+kd1hz9osDNK1yrUv4GRiIcWPXEKumZS
	rxFiVYT7D7EMwH2Ro3Eu+roo9BnbS7VOYmg==
X-Received: by 2002:a05:7301:6781:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-3077ad33bfbmr804716eec.0.1780663238163; Fri, 05 Jun 2026
 05:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <226152a3-1e4c-4eec-9a17-1d40426a7b18@I-love.SAKURA.ne.jp>
 <20260604210704.41751-1-ojeda@kernel.org> <89f0f308-2ee7-4c68-b811-8132e5d88530@I-love.SAKURA.ne.jp>
 <CANiq72nGo=F5D7b7Hx8A1jfAJw_72Np+UpRWBRQoPLAE+RAPpA@mail.gmail.com> <4ffdbe16-61ab-47e8-b696-e2fcf9a26385@sirena.org.uk>
In-Reply-To: <4ffdbe16-61ab-47e8-b696-e2fcf9a26385@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 14:40:24 +0200
X-Gm-Features: AVVi8CdSI-2V9LiHbf7DlAJ-2V_Zlp7bblv2hdXO_zi9OaBhf5BufpYbUqI7V0I
Message-ID: <CANiq72nKDpzd9BTPfQ-NhWgcTgWdE=spED_n-idv1Jnekdo=Fw@mail.gmail.com>
Subject: Re: [PATCH v3] block: assign caller-specific lockdep class to disk->open_mutex
To: Mark Brown <broonie@kernel.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Miguel Ojeda <ojeda@kernel.org>, 
	akpm@linux-foundation.org, axboe@kernel.dk, bvanassche@acm.org, 
	dlemoal@kernel.org, hch@lst.de, hdanton@sina.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tom.leiming@gmail.com, wqu@suse.com, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 2:04=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Oh, bah - something turned off RUST in allmodconfig again so we lost
> coverage in -next, sorry about that.  I'll need to work something out to
> make sure I notice that happening and can do something about it.  It's
> kind of worrying that this keeps happening TBH, otherwise rust conflicts
> are likely to result in broken builds.  The dependencies feel really
> fraigle here.
>
> Had the rust builds been enabled for allmodconfig as I had expected the
> tree would have been kept out of -next as a result of this.

No worries at all, and thanks a lot for testing it, as usual. I am
happy to be there as a backup to catch extra things.

I Cc'd you since I was wondering if your new `LLVM=3D1` build should
have caught it (I thought the GCC one wouldn't, since my understanding
is that we lost that last week due to the KASAN+RUST patch).

And, yeah, it is fragile... It is quite a complicated set of Kconfig
relationships, so years ago I also ended up in the same situation and
early on decided to add an explicit grep for `CONFIG_RUST=3Dy` and
certain other bits that I wanted to ensure are in place after the
config phase.

Especially the toolchain side, i.e. the fact that `CONFIG_RUST` gets
automatically disabled if the Rust toolchain is not found, is
particularly subtle. We are considering finally changing that to fail
the build:

  https://lore.kernel.org/rust-for-linux/20260521-evolve-to-crab-v2-1-c18e0=
e98fc54@chaosmail.tech/

For you and those building with Rust enabled it would be great to
notice when it gets disabled by mistake, but I am not sure if most
maintainers (i.e. those without a Rust toolchain but using
`all*config` routinely) will appreciate it (or rather, tolerate it...
:).

It may be too soon -- I considered announcing it in linux-next and
adding the patch early next cycle to see what happens, but I will
probably take the safer route and ask in LPC first, unless you think
it is a good idea. Any feedback/suggestions appreciated!

Cheers,
Miguel
