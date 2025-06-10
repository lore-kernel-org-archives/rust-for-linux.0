Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084582206BF
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548995; cv=none; b=WVpNWipFGohOWShb4QGNNKXNdyxKQSe6SYJJ7YzBazbpIo1M8AhsNnVfDo5e4/oX3IQ/ySU1KanlkYxcp6iOHdxjMYpF10Tjj9BoGUFWiCf02+D2BDrzcJd9bGd5fksGS4LGz9sLfrz8tk0/pFyQIjaqYEc7WudIUo90/ZELp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548995; c=relaxed/simple;
	bh=UZCtpml3axhy4S0Kw9a2Zpy0I7ArytglQm2qT4TgfiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BakUchmKS+VTx5FWWq5/SnKwH8rXuCypZDy1geARmdDxmD4FgADfie6WGuYzyjJ7iAjPg7iZAGocWfIqVOES2/z4CvLjCTT+SVPDrQhSPEan9xDN0FqFdjWWxf/6SEc9CQWS8c/B1gy7yJeunbrdT/TA0XDIKS6DPeWwDGgFzYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8FcqMPu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8FcqMPu"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so402924a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548993; x=1750153793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZCtpml3axhy4S0Kw9a2Zpy0I7ArytglQm2qT4TgfiI=;
        b=V8FcqMPuf7p+gcne4PoZe12SWdjWdn6dC3B3GgDy+gtHWRdkg47Sdk8a0f15Ie9XBw
         /bMqDhiGujP7yQ0RlGvDsxGiVmkvoSXZdwb/iqov3ACj0bwVlCcZT8X7S2y5278NBFhj
         I1MvF4PGa/6GD/8oIeRchwVkszMfjG+wrU08YLJ799CcGHG0IRgHN45SyevwA0uzUxzo
         JQiGdC1eb7YAhrFBotrJU4u/SPSeSeQJHsRG+9wqjubYUkrKcU2vhpIK9MxZL+tga32v
         WMHITaJpM6+Fy+s6sGT5jFJLzo98Q/n+q6nqIp8K5IIx0cxGNslKHMP8eaxRQrGbSF05
         2KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548993; x=1750153793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZCtpml3axhy4S0Kw9a2Zpy0I7ArytglQm2qT4TgfiI=;
        b=E3xXzT1VHbodyiLyImmGQw5o1KFYVr1OUxCt4bmOlBlv/AMb1bQgFCiIF4pfIaJhw2
         22COJwjC6AeWBARAN1vwk9z/tUS/5rA5DjHge3YPVp3ZekjLNAcMW+4E28Xk6WOz4i58
         kxsTCRim4bH47v3UZccvAySwuJDMM2UdnK14SpFPwkl2GdpBMd4jMkaa7I7N+vXUtJHE
         8dHAF4ZXt2vc8JyJG8m0Hh272Fyy6AJkRetlLu5PtaDBROaHtRq6ISoa+dDU2CGy+fbG
         bl5tNEajBmCMDG2r7Jwl+Ffo7+fNZspLoAKjd0bnEyMCM8r8YmD63z50fq2kmhE7tEAB
         LUNg==
X-Forwarded-Encrypted: i=1; AJvYcCXJB2myq9zFXDl35NejLXi/G73AO6TBzqvZ6ZNS9ZVNFc16jjK7HrgiHHxwx38lxYMcEUpaNhChlWwUZDnH8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YykQUkVG+rLzUZ1R4JX0GISuf/d3Y6DuoXqRmVHpiqbqE9SKEdg
	0tuxtW7BsZpamgYrmSeJ/Rpy41ancJud3PeiV/aLvgcJPVvmjF5BPqhD6KRXbAoMgHky+HaVqtf
	tmHeMc/2LFPETnl7oBcSO+JJg9fPPMwI=
X-Gm-Gg: ASbGnctQyjo0Psnfy96wcc6Y9JgJzLALXQfrXpTANx1z3aXEmju1lk7mdxwd3lJCM2e
	fmkm33stMae4JmFec3DIuZIFtSpWAHBompKHLEACoaxX8zhSYrMbNEgfxgSj6/TgU18jk3hOrfM
	0JHpxkEa9FAde2VVqt6dzstArUAb3u2tvU3VgM8/YAe/U=
X-Google-Smtp-Source: AGHT+IEs4DaQuMWszjV080nzP9eynMXAqhW+T2tT1Cog/BE7mgtCv9/cFophK9EX1fEryCq06qnikMfvQHC38qd/Cwg=
X-Received: by 2002:a17:90b:3890:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3134753c519mr8491794a91.5.1749548993320; Tue, 10 Jun 2025
 02:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
 <CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
 <2w_xemXUO2dSUIMi71vfN-naCZx1PE9R9ka68JgQUmrvl8J2lm7iV787DsNgkc9ZDfhGP9maoqYqf8WRy8Hmcw==@protonmail.internalid>
 <CANiq72n7SgO26P5kFuA1AnnzmUW7q2_7FtH+nUxjoxjjcMeD5w@mail.gmail.com> <87cybc3v65.fsf@kernel.org>
In-Reply-To: <87cybc3v65.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 11:49:40 +0200
X-Gm-Features: AX0GCFv3itf40DYDl11Eq2JxlmhJtoNrBdUkVc34k9yM9eEPeYpWO_nIYAM5tBM
Message-ID: <CANiq72n-+FKrWmbtwoKn1n90Mw+wyQJKUrGUa7opsuNYbts-tQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, tamird@gmail.com, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 9:36=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks!

> You want to take it directly in the rust fixes PR?

Yeah, since it is a fix, or what do you mean?

I guess there is no rush given there is no in-tree user, so you could
pick it in your -next one, but perhaps someone else wants to start
using it in another branch?

Cheers,
Miguel
