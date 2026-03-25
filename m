Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7826B75B
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 01:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774401592; cv=pass; b=cVQ34NL/Zthj9x2aLJAyVKdevdTwciAV2ak1umoCdORoohECOGmnW/cH/b73GmEZUuJu4G/6pKJIq0JOh4xx7K70vSNLHuCvHFZQKZqOpZ/HnIJ1XJhP8FiRbb00f+A6WZoXyaA1lXEWyrAcSRH24pD4llakvLJKViXuDFp/zEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774401592; c=relaxed/simple;
	bh=/E/GqgJ14QL6YklKFkXjCjbwmqkXA5ShU5FF1OHivuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBikBlcVDetPM4kY3qywjh9Y79R/9aywQqUDDze/1clUPgMgRXY+IwxXcMSaniRWv4Z0tfb5Rzz3PhPoc9JoY1fleXNHy9U7Uqakskg5WrSp4PeZJbwXXgoxml6OOG+3xqGWNSJea2AmHLjO5mJJL8Szo9NgPoZtnabmIjVLU6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkbjqvRz; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkbjqvRz"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0e6f5abb5so217662eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 18:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774401590; cv=none;
        d=google.com; s=arc-20240605;
        b=j2KcJor7CC3NysOxBuehkaqKJ07+WoopFa1Jr1SX+sQlbF1sF2D1A76q6q9NpMWMai
         tuAAb/fWQYpEHATVFxJHj0wLZzzLY1kNDAGCgYIh07GR37vqLHa4FjEEy6J2kKZ13j0o
         3hAhJ9UHjec8NxeXV1mG2Q+aYrkSkmzT/eFyAX281ariC+oY0H6i0CCD47L4joYeUQiJ
         OobQzA6tPBnHi/Ifzu4ZcCxXOlNmRwzAq4Nw3mPpz/u0DhBhg9aF6xsQhu//m8T9OE95
         mzgr6c5BH71hINBuio5weISCDBxXrmvt8w4do5kdCoROWTATSl6bY6W7IMgzCRRszvDx
         /onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64IXguHQQeCrErD5i1Yh0GtzXKvFs6teDjvImntcNh8=;
        fh=3MAKnpmcohHJouNWtTaJWFmu8l8SRfzFGbDTvdPJp0A=;
        b=UFr3TodH+ylgsRBz9p23p8uSThH8yawaV8aZ7eMOQt8wokUhCCTW6veYHJe4WMv4v4
         21llXFc12dzI0nnRrUKDKgxYJyGCrJ7id4v2PWohO33WpoQzqfww6tqBHwaCEFbhCAON
         yaHnd621ikX1DInDfN+ThT8U4EUkBIfRThNNGiCHbbvNL2msmYKWwEOB+oO0kmP07sOq
         abVj4PVKwrFoXFIarw0OV833r9gK7H1ebyDyi3NGTZSNBj1ASXlFgNtaYMnONNz26VOL
         hJGmW15oud1ftDhM88UvgT6rleLquFeD1ZGsv9mx94iZZG65VXMqFyzaf/t5/Um1GiH2
         UcBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774401590; x=1775006390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64IXguHQQeCrErD5i1Yh0GtzXKvFs6teDjvImntcNh8=;
        b=EkbjqvRzt8h0ERi040B7ATZajy6yPDbawXCvNOuqkvIIeB/pW0lq2DbRdOEifOgDmA
         QFElKF+EoqHZ2EQMCs11LDCJ/tTdAvEKQKwoHBs2P/qRA7nzHk+HRSdMJZfZUlNv5gGU
         dvTiC1LPQJrprivhvuschzITa+flHaTXUJQLpkC2f6vEPT3QtMl6B8WM3S0tdfvGSQ9W
         HYn8Ra4vVkfWBHfJolYMjy+MVbFofXyXJOu/dA7vLr4Ap6zOMcHZXNhxKut1WGzh2aYi
         fr39NxIcHZFZDAtawaheREhz+8QdlYIiKF/ruiiV2dlaA0rOJ5hkut9pdvZfI8kUAv+Z
         Qzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774401590; x=1775006390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=64IXguHQQeCrErD5i1Yh0GtzXKvFs6teDjvImntcNh8=;
        b=heBhYCt4XpcgupRhr5Zisuzqq4bJCb4hRGGhah8q1sCjPqxB7q5xrutlTvQcKdjtMt
         F3oF0v1axN12zaL6eZ7KQZ0odXSGmyUmU0jvvw2VXoMFzmWOxypqFNPBAo1Sbi8zC7YT
         +3OfSpb2OhPViznFG+HC1KE606R4goFiLCIKWkdGnofcyv1/Hany3lU00eP+V9uPU7tr
         xQotyt5B6X4z14z40X+SHlEaVVK2OGveCvHGUG+Dam/cyxH80kSE+qzziZySVD12UeKp
         WwrgMkH/CiAfXgvfL6H5Ojx5a+ss0b7f0gpeZG4QFvFviA4k508egdQUVWhXfpl3gKiy
         AI1g==
X-Forwarded-Encrypted: i=1; AJvYcCVaGCTLZJF4EM7xdn686kLT64KbqyupZzr/RbsGLsyAy4l1+/s+3UZdYJKKPVgitCugDS3elk/VvCPpvq1T7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQfYFtBMVp599OYR5THvfXAFPD45GNqqPSPJ+CX5SOUGd1LIq
	77lKe6qgodcVNtSqehrzefjHu+ZznnLl1BVnSd7yl3ArIDaXpTWr8kX4/hUfpdeXb0nEMFcj758
	ba+d5f+IIsljTn8TtrXbrp5QQSlKeTCc=
X-Gm-Gg: ATEYQzxWjkrYsscIW1E3bFIdEpGMPlY3enWxqh1qYIgwkQSkyE7cOdCuUymnfnhqP1p
	xX9LUfKVOB8Mj+NxotSgRQoTJKC+NmtMHnD1GlJmSFPyRaTVOy05M2bK51LvkFLab/M5RQhV2M3
	EhCMFbkVu93AYKF6jlW5EvUX4zby7jIRg24Ixr3CK09KyRzIwLu1EBW/SZLq/PgJzeueVXuJF7G
	GK2yzwnBAtanClzakulVmulH2mBPD8rXaBAAu/4bhJdgxgqXXL6xXXsrM6gUjRcmgRi3CVs7kTu
	r/B/rxm+Y5SiJ+dum29vlSJMGu1SGW77eKZEPOF4Vu4xxDwfiua8cfpN1k89rNWCWjterPgGFMB
	Q4dSEMlMwkNJhqNhi7Np2Nac=
X-Received: by 2002:a05:7300:cd8a:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c15d3889d8mr388569eec.3.1774401590160; Tue, 24 Mar 2026
 18:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325005118.168814-1-alistair.francis@wdc.com>
In-Reply-To: <20260325005118.168814-1-alistair.francis@wdc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:19:36 +0100
X-Gm-Features: AQROBzDXDHpXAwJbh7MLMr-sJXuO3VPsVrroVQo3peBmZ_B8usKx0LJQhirRZok
Message-ID: <CANiq72nEaqGwnRO6SPJ7Ky85+X-U3ckYa4Z5cg=Uoqi9fwHBMg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Mark all from() for Error functions inline
To: alistair23@gmail.com, gary@garyguo.net
Cc: dakr@kernel.org, ljs@kernel.org, vbabka@kernel.org, 
	Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, tamird@kernel.org, 
	work@onurozkan.dev, acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:51=E2=80=AFAM <alistair23@gmail.com> wrote:
>
> 1: https://lkml.org/lkml/2026/3/13/962

For links, please use the Link: tag (and also please use
lore.kernel.org for mailing list links), e.g. it would usually look
like:

Link: https://lore.kernel.org/... [1]

(By the way, the idea was to create a "good first issue" for new
contributors in our issue tracker, but of course it is also good to
get this done)

>  rust/kernel/alloc/kvec/errors.rs | 3 +++
>  rust/kernel/xarray.rs            | 1 +

Thanks for Cc'ing the maintainers on this -- now the maintainers may
give their Acked-by's! :)

> rust/kernel/ptr/projection.rs    | 2 +-

Gary: there is no `build_assert!` in sight, so it is fine, but perhaps
you wanted to have it more forcefully inlined because it was trivial?

>  rust/syn/error.rs                | 1 +

We don't want to change `syn`, since it is a vendored crate. It also
runs just in the host, so it doesn't matter if it is inline or not.

Thanks!

Cheers,
Miguel
