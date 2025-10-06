Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D856221FD0
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Oct 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750068; cv=none; b=dqMqWgR7nLPadttdTQKSMkO0x0e/aV9qTlXcBqrE1qYYnhOtM9mPLdqqRA0tjWc+IZUYZkPWoaGNPPE4c0r/mybVB1ppOJzVNzdVisouq4roO+haZn2iVwzncPC8yn5PtKaHqd85izgEUJajnK/ohj3QFa8q7JiNfc5/8g1kB2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750068; c=relaxed/simple;
	bh=E/FPw0fY1WNiYy4hyNh9nlCHleoKAmsLZkg3ptd5JBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgrBVia5G2JVem2DeCs+tvB+K0i5wk16W6/Np4JJaIBfPgYNloe+kWQmVRdNVaXPUeLxdxzoAMoiuG63xQqu0EFWC878z6GE4ouFUqL8ZlnFp8BjLhHAxQe1vacBbXCbFAIKZkyEYs1R/qp5/WmpUz428WauAAkno5tTByTLiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii9hZK/A; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii9hZK/A"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32ebcef552eso1078079a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Oct 2025 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759750066; x=1760354866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/FPw0fY1WNiYy4hyNh9nlCHleoKAmsLZkg3ptd5JBE=;
        b=ii9hZK/AUgJGOk0I8YPiYshKZ9iCAW29phYwM1KVj+qUqT4tNScpOcq+plPVv2MtiA
         AVkf0ZYudHlZmjk2ao32OTnXqTtRh+kMfppatE0M7R3BSkG4z0kT/bp/9AsqlxJzEC0p
         hzlVJQbNvI14fp/PhMdcdJDDwNrHtpuUHD0wOv6KSlAbK5mSUBFg5msXnnRfiqhom/CA
         abpJ7XO6yhXN0d9EaQJWN8UXLJokutMHpbvTDWFYL9hvKH5ieZrTGDt8nhGZZ99psIeV
         dqNbmtEvySGD9tueSk5zgMFkZiQyaLzTFGCqGP+IX4bxVOzJZxQpAgRCYevYmVFFy+Me
         Sh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750066; x=1760354866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/FPw0fY1WNiYy4hyNh9nlCHleoKAmsLZkg3ptd5JBE=;
        b=jsvKQG0oSgXIULyFamHCmNfSqvTiI5l4aMfSHZrc6Hgk7RqmyXL5SYgECSnzLYcckt
         uBBgr7HOu9NCvaat7NNv9uxyD935Zvwhz70yeZyr/pBVhe56LEnlfE/f8k6a3WN9NyM7
         u6V2hHUPJGyAhpjKNOBJmz46xqPN3Rry3H5TYLqn4QujrWLt+ZHD+U501YSNANcgfzQ8
         5sBUIMW+LKfK0hE4KSJThpUxuNDSRjCc3crrLu4XrcB7Hn/imwAzyw8+2zzzPjqdXrO7
         324jMm8hnnZgeDhUSCx688sNxPcIkM6gPWdum5I6X1YjwrzB1tGjfvdjsuM5mCJar+MV
         7emQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMCdnohPxz4+cT8XlF3sxiXcd17v8hYJTtcTkHsHZJXVStkX9nzD/mf3L29kQn8TwsQrEXcuyf4X4l53FDvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCEJBzSKU5yFY64Tq6y6qm7sl45k0FfE1oPzM/gPGI8e8ZIXYc
	dJkdozB7Wr2cZkURR1f8vQbsf6UJGcdVXiyeIpgf1+OvzD18ysFl9MvyYhNT7JHz2hhhIHEo49b
	aMSWeKkoUPc4QSIG9CN0qjinkXMZ+nIE=
X-Gm-Gg: ASbGncv8Cb09/33iSGflo6CZ7en7GqffOH9a3lei+e8e6AeGAb+YM27zP5F4nOaaHd2
	26wjPMEUvesCcS7Z84pc5FB9DKU72be7NwTd8GqsMoZD2c0XDzO0G1Et/PPgrEucfg/lsxld0dC
	ldZHmivblzi7SYBMFlE5dH0MgE39uyr3q2QS7wyNZZwBG4xWRPmrQLFjWsCoDnL9lGyKpeftvj9
	m5fl/38x5Je0+Hdq69dTdOmA036DLsTPfU/JD6727QfpXADGd1tPB7lIQLgiP22s58kHB6TvxX+
	H35b2kFOPcXYcGPwRqrISyQUaY9JWKNwRU+GF+1/OHFuo9iE2c0RN0L4XLz2C9yx2IfrArg=
X-Google-Smtp-Source: AGHT+IGU552WBlNxXYsiZP3k+YaYGnd0eztZK4BBARL/9cAMbZoEa5fIfV4DQMF8tLrK1/G2rwbinID+IDLRpUaG874=
X-Received: by 2002:a17:903:18b:b0:257:3283:b859 with SMTP id
 d9443c01a7336-28e9a6ce25fmr71533365ad.9.1759750066264; Mon, 06 Oct 2025
 04:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
 <20251005011100.1035272-1-safinaskar@gmail.com> <20251005205335.GA2561157@ax162>
In-Reply-To: <20251005205335.GA2561157@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Oct 2025 13:27:33 +0200
X-Gm-Features: AS18NWADaxVflRFqTezzJZlF2JybUbasQ-cTILinYfyS9GRIdfm3RSh3CWudziU
Message-ID: <CANiq72kDT_uDpmvMyMEXodSXP3rsevjzW7G134H9A7Pmx6_7nA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Nicolas Schier <nsc@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, sam@gentoo.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 5, 2025 at 10:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Thomas and Nicolas, thoughts?

I think it would be good to eventually split the hostprog flags into 2
sets: the ones that are used for bootstrapping, and the ones that go
after that.

That way, we can get the best of both worlds, if I understand correctly.

Cheers,
Miguel
