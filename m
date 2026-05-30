Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31618369D64
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142505; cv=pass; b=YQefr0ir0LseJSlqCjdBzQPOW+y80FH8mtC2sNjPTdwH9Yw173PhU6UhilVNcdf8uGAUqy4ngnMxr7hIZrDHVR0P0LQJuQUy7gsLBLSjyheWV2xBi90F11DyL+09S9xI7E7zlPwguazuzKnmn5nEADg/PS0IoiHJr53aXjWQRRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142505; c=relaxed/simple;
	bh=OCqszMk0ZgOWIK4Jm+n02VgcUtOHbxZDLR7gWYCvH4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCDkPnsfuvcxrmD/w4GLZS7/3tsxI2FpJV0A5avsBNzccdvX4mS3WHsAHX0Kt4HCJn0mRov5Nn4o+Per3Ww5kFT84Y2jW8tzZC3x+plvPKXBulUdC/XP9r73drdfI9PmqAaJg0KhDj+Al5O6219Dg0eLUW8CASjWk4n+bYUcdtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOLZXYel; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOLZXYel"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso118447eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 05:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780142503; cv=none;
        d=google.com; s=arc-20240605;
        b=A9fDU91ib7mLkPPkwlyaeaIcruckG0g/n/b7tT5R+BttkTueFKpb8/FPVOVouIJUJP
         N1UPU7ynM63NwFplFW/HamqAP3MIMtHO463ssk6cxPvRU8zs+CWTgK8tQj/DKnmc0aYt
         qdaf8Jgf0M6uAZi44ndkggrl9ke/o3tu9m2lZ9KROLrlF9Od4Zw7Lky84saHYv2nxwBF
         T0EXOYbwxCTjot7/R+cY79yllwK/xr86t+WLwVX/ytvQOu7lV7eNHc4PWGliuChfMo6H
         LvthtWy6ngaG/O/6aUYuVTWUN7yYqkw/4ToVS0WILOBCTQoTynl+Cz8FE8zr6Svi16If
         wk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJn8/bdk1cE+ulHsADFHheOpLB5d3Qes9hugaPWOOuQ=;
        fh=aXM3CW9yX0LVTZcCfyONsqfhZZAF1+kX3zZh5aBWD2Q=;
        b=fmlvL6o+4jdH9wP/AJr2ZWpUdxqYaChafTAQLCIBDwIMNMWn9hWm/al0pSZtAy9dfT
         hbjvh+wZrN633aAR7xJR5OW5o2ZAGLsuR2AXYpeEVIUbBh4ZtAWE8k1gyTaTtmJJjij7
         8He00L3gXe72JhLjVUK8ZrL0QH3CkSPvAr2//qx0saPmsEtgUKlhDZFmAZ5sPhTseiea
         pLaCj/9ahc79aelT3s7vnP7DXYY5ZXWcjh5HADOhKyngm/1uTzMPqRLex/h36y21G3Hx
         jWg0LTa2MR0JZ6qGIBjZkAI0s3o/wAAVc5zy9k9NHCB98SnvuoiyH4oTMFodwFIUi//U
         g6JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780142503; x=1780747303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJn8/bdk1cE+ulHsADFHheOpLB5d3Qes9hugaPWOOuQ=;
        b=HOLZXYelsos+2Pa7vM77drfVCTY6Gx/4PjajxYibJXhesJ5w8MP14JHfP/yL+1+pQq
         TN3QJH6z1lYzMCXcQlezILd8V0sL+X1q0rnYwZIH0pJOe79qfRrdxWHW4lVM+tRtrrBz
         0RW2mA6XWD/NcOM1OrcQUFv7oZosUTd4G2upj9BIoHeaRiL4ojCvPOHMbNUwxZFvstKf
         qhDLpsEfN1zhKu+o+HuS8Ru3vC7m16iHmqWDTjJdQoFah4BLORsf3MKR2dR21tKs/z0X
         Q9l6ymQZJJ9hdidx1o/Miuqv8uNHJIfgNlZK74Z672Z+tXUOB5Wz1w9zhJG7HnZ5XfXM
         aYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142503; x=1780747303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJn8/bdk1cE+ulHsADFHheOpLB5d3Qes9hugaPWOOuQ=;
        b=TRylfoKrzmGFQUjzdIuJqY6D9gbhUVKFtgcIjjKdTsrWYaJ7uhgbaoy2tqLBwITNf8
         pRXSCcpeXTvejyczZnynxeP7wvfXQxkXZ8AT9cOLmlcwhR50RQVqJl76W29y4JbbVIlF
         esfh4omyuLxZgdn3UWYEYX0yUYMg8yfRGpXkQFlyAI/8SiA2ruUCg8FkKCIIqzWLqaAI
         j3HMqH+L1DkJtjm69aMqoySKd60bac6QYlDtG3rGQI83MWBSLBgEUUs9ii49CIf2DVf6
         fFZHe6Jik5eUe0Xwg0pFTV/y6GyDLxIAJ8q2Zhcv2CQpZy8ducLGMiQ0/N6u+arc6Bw+
         EbaA==
X-Forwarded-Encrypted: i=1; AFNElJ8AUx+/+z+mh66gJShGptb723cfl3eCOPtU49saS7vxVtt6LAZCkjzqt1cuayVwzK6Ii5cql0eHx5aD22JIlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtKUbSEaPHRCUKVs7n+5VvzUMr/tIxEB9tiCPTgdZlI7nMLNU
	EtTtkeHKNgTmZFyIouDbsQfmXU+Wbbn4JUWfxTZZAUZJWt2aIZScn4M2vPd+A1guXI24Xb4y4Kn
	k1ZIL7M06Zs9mEiWF89IQ6i/6WoX06gY=
X-Gm-Gg: Acq92OH+z5M1ySBFrMerdsvvEgCV8VuGVjV5SIghsFug7PkhzBktBRo2KfnxvD07qnf
	4WyRt3nrsXH977ppFEU5QTuZ1neO0sbQQrykLPrH4ip6y7HgSfdgcELD68Z9VtZh0azPn2vrH8i
	ymVjVmotp8IAZ3+a0rk+nxi40+95b3wzaJop+fTZ8DYtkcDg0aPk8JcI7AVEe4hNSKMzKThCGr3
	mfNCmPTNSJXfaTWyqQiGYUCIJOxU6MKz9X/kAd2Cjp+6pw2cefUd0GBZphTWW77mV3pEyGbQPyP
	7wnoiKmJTdQtdt1oOY1gmCiukFM5FbzqieEJr+LNFCqNaR8/Af4gL0eNXLbexzRcwL6WSjWf3cS
	FkvE3WU6pQthSD8DOBML9/Ahy4R0tm2DUSg==
X-Received: by 2002:a05:7300:d508:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-304fa30cb81mr774505eec.0.1780142503142; Sat, 30 May 2026
 05:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530114925.260754-1-ojeda@kernel.org>
In-Reply-To: <20260530114925.260754-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 14:01:28 +0200
X-Gm-Features: AVHnY4LGlmoBZX2w5sGabCmClFAFhHgoPKWwrt4LBnvwnqXauOwx3a9EVVcoroU
Message-ID: <CANiq72=1zmEs_Sc8PpMNETmHEXNUERwCaWddxjuTH-TuSLzX2w@mail.gmail.com>
Subject: Re: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 1:49=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
>      } else if cfg.has("X86_64") {

And the same change for 32-bit UML as Sashiko points out, of course --
tested that one now too.

Cheers,
Miguel
