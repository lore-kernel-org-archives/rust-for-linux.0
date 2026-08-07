Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4701379C48
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089099; cv=pass; b=Vl831vCY0DpLHsfYs1BKuMTyYbMx8mTCDjrok9mr6Ln/1lbDCyIQyx1mlrkB4tpZLKH4jqCGs5QWs3o0HZiSnHBpXsdGyczhC1D4lMy0mvXlVL7jqEs5Np6IXaxG7IlALJ7rg9g+Nqxotd/0cvZ9OOeBwAA44V2InRQojzLGp0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089099; c=relaxed/simple;
	bh=egIrnyP8nideDOsLCuz1AMPteQiUYBHGrUa0X/zOY18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBL3fouoXybaE7K3QesUEdt/JmKWzEYtRhB/Ls8ITwfOkWxjTU+2f/gEZTqxyUDy5xcm6LduYmMqLYi01yBQZ/zhI7Z1QNn9SlI/ESBsbgAPTW7SsY2WbhNdqe67U8HcXiSRntk30yw2ynrAmj/ca7UJn1fnYfZ7Do7oMU+3a0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC5vvdwc; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC5vvdwc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbe437a530dso242776a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 00:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786089098; cv=none;
        d=google.com; s=arc-20260327;
        b=GJwulqd57y3zc1PCnaXEfJ6tyZK0slUW5zXDDatViZ4Cxr+Sa/JXMZ7GS2ANrUuSMU
         BsFYrZVbs2XUVdl9DJGBh9BLAc6SX7+T/jvpUYbHAhLiZMGsIYBrjXjVhDsDJ5HEmjkT
         LGh8DtLv9DtKCbY58U6sSH6F6PKXkUpBj1p+TIY+rEbAExvCdNgLZvlcAYenYjhLfNCZ
         bdoL29rnvnEIq7yAkxWhowUXetD82bmvHF6PVjkdrjwd6bKq1suq3DQXX4faoOyJH8Nk
         /MDXkgZgyfEUQxa5dTh0/lbMZPhMGkW0hbTEQYKOIrcJOWSJ3YDt5DZScX7xlk49bgbI
         kZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4dbt5Ccr112sjavAehr6ouepSyHDIPtG/xMCYhfgEAg=;
        fh=ID3d5fTL3N4ZYMjpGUDcUfhMnWveqAz884EzvU5bUj0=;
        b=W73DQkMsxo9QNBV9zWLa+P259+2osg+X4EhyHF6ORw9dODUB5q14E2GiA6P5kaFVFg
         TrhPnLpslMy2FEEo8LsQETbO4hIk1aT6A+VlS83w4MQrfgpSnhl75elXXtLFvCnZOFKx
         XAxOy9LPm/7jNWMEAD5+Zq+YC8I0mRW7q2zie2AkqIHdkUSv3+Zl9qt5GTZeyB0ff9So
         g5VVoYykebhCSP5OzyXjmM3ZPymM9DgqJML8Cth/DIV7h5w1HdK4qCHML11YVBYN+5gx
         5cjG0qon5f/Mob7d39z2cd2RW/rx9usuTkEXsbcOkpzvEvQ4OH1tIIwKpi1RCoFTu+Nb
         JFnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786089098; x=1786693898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4dbt5Ccr112sjavAehr6ouepSyHDIPtG/xMCYhfgEAg=;
        b=DC5vvdwc0hxYnYPcydmosrREluH509Yp3zex6muJBnQNeU4HxuQ2NfsWaR2+Khaewd
         BhZRGv5z1kkRMMEuArX9UcyMEpeui0wmo6hZBsRdADFblZyA6DJvVKWHepPigK+yvZZh
         Rmp6oXPeWjRUF5yzvScCKDAvMTROlQ5/iu4Mr1Qwei+PJ2S1o7Wfn4gJ9x1i2RC/O5QL
         8FOeOGGByw5GulqDb7yl+GS/6dp2eD3WwFXw+pleFbzD/g8jQW6GJkqwUUOIjrwH8Kuf
         op0YAJ/64246iIm344KSfbSIIvMPHWW6UST9H+NXIVopRwR2prOd+5Vyn7ModfBqrNpC
         taCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089098; x=1786693898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dbt5Ccr112sjavAehr6ouepSyHDIPtG/xMCYhfgEAg=;
        b=qVTCia5HiXwlSqbIpnFa5BItKmc+TErTxSC0G38y1eyDfuHH7b+0yGrLQhLp8UJiIi
         jGAtRy4ZZWUr8HEO7Yus/qWFK6EywPEtF4XXMaeik++7MWPOg04/5cJHZWx3L72YP1RR
         CcXx4cfjVZRhIavkrc25OukQk2y234Wxg9CLolH5w0VVeHQVxUxSWlzfn81HCXomF3RQ
         g8VMBVtYANTwqaz9EWBGIF2YbjRobM1TySjTPbiLqLIANSVq7v8Q3CjevlfeC0yfSLfZ
         ZiXaULUun1LqoEkkc8xOeH/StaO5EY2aErN312eWRu2rTkao6b7oV6wHIbuyRuz9T1WF
         aiMg==
X-Forwarded-Encrypted: i=1; AHgh+RolIntgjiMCDWGN3w4YUocLc9wLU7j5j6JlgAoW94U+YNSAlisOobufAJCzgmTHS01E+x2EvlAVv3451YjAUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAp+DPKPukBW/xlikwTNrTo+w0/8WmThs6FTSMpDb8brPjHls/
	zL59R03xsBM7MSA994NyL/ZjBcE4xg8THw1t1hSQFFcvwkimrV9zgOtc/6Slnts5gvmD+PApVEv
	ZXRx6whahzIUngLxxDVUtoZWXjBYkk4k=
X-Gm-Gg: AR+sD11dV7x0nfp7lw6VEFn0r87YzJagwnv8dcj9OSjwdj8gHJY0Tw9Eby93TFYOP5y
	uwsz9oFnMtMk/cZIRqblpCdG/UWUvFpgfujofseBcpAm8QaSL0ekEA3IXYRk7GKMkl7/tfF+T02
	nr5e876QYAUILDQsRKq64DlbPb8nh+DkuB2NQVVUSpbTDFWrKKqhWtHxh3u6jDuuLrFWFN6+oQf
	Tn92axUANJHfBVQ9TkIvJjjQuI7jkQj6eBVM9fycqqyssgdRo6/hjJ0TKl0WHx55smLodz8dHAn
	lUmeolIpmVlfU8veiJe48ccMaoHnisCL/l72ifE5/x3oV3m2vFpOXc6L5gmtvBmRhNd+MpChLeF
	kxqCKcdOK9zanx35VmU3Dtjk/Pyep1xJp1pAxy8CxzK7qJ/fipXZPLRQdqI3Z
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr183275295ad.0.1786089098173; Fri, 07 Aug 2026
 00:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk> <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
 <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk> <CANiq72mzVuEfaf0xuDLMy1M25Xu+G2WvEVC-E8Xna52hPTn9Pg@mail.gmail.com>
 <5ce12a15-3f1e-4279-9b1a-57d6b2faf7c9@sirena.org.uk>
In-Reply-To: <5ce12a15-3f1e-4279-9b1a-57d6b2faf7c9@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 09:51:23 +0200
X-Gm-Features: AUfX_mzdHTjbGANECZACYbi_K1BQh4EHOE9vha6ZJCQ1RuHN0-F4tdgIfZJao7Y
Message-ID: <CANiq72k1Q0a2R6AmYm2ZDWH4AmP__uFCAVXswX7RQOdnP76dVw@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, linux-next@vger.kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 8:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> In general that's going to be easier and more reliable than copying me
> into the middle of a thread with a patch buried in the middle of it,
> there's a chance that if a subject line isn't obviously relevant I might
> just drop an email unread.  I get copies on *lots* of stuff.

Yeah, I can imagine -- sent now:

  https://lore.kernel.org/linux-next/20260807074729.108159-1-ojeda@kernel.o=
rg/

Thanks!

(I think you may want `-next` inside the brackets -- I can do that)

Cheers,
Miguel
