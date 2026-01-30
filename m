Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94134FF59
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804586; cv=pass; b=nqsyy7VYSTeXqiF6OE9F0Yz8fazQoN7PXApSef5AsqlAd+PKJ7X1r7BEzd+dIFAruyV2xlCotq+bXziMWFHXQHRnmPZv4WWvxJgjAX7AT3BsjKvK3XvynqPIUDgsbSGXuWe+gGEkQLpOSO+L7ktvW1g3/N3gWi37yxV1WZN5fs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804586; c=relaxed/simple;
	bh=WMF789FgXx2e6Y4/vq27WMByX/ZrrFaKKZtWTYUTPEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOGNbSU2pH/eDE80SEB5fg5X5Y1XgVW/x/IX8KDVc/GWLD2NXZ2TZW2jiSMn87AuNQmq/Ux5zRCwLQOD7t4ldr0bPPI3X0rrtqd85yL1G1mlgjRzAO05NoBt00eb5O+bc2W+oD5jSMtmDAhiIA7HE7ie9HMCQ+Kld+VFJWGdVLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgqTgC83; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgqTgC83"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b79658162dso84941eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769804584; cv=none;
        d=google.com; s=arc-20240605;
        b=hB1GVjtBd1Pqn0kQzInx3XOofiFDhjg0ZqzxVbL0ItKGv6di7oDB7CyTqdjTpAvAcP
         tdMYeZNZTftkODQERuogQa14JtwiNkd440GZUrWt2QwdvD2tI+TTF/iXgnqF4LqKzmHI
         cTxf7ksrnsFT0XTk1bsyrgLz4PB6gPfFMMQDc9yA/Pc7YwCfQntZmk1xMWO2xa/wNvfp
         1Gozgt1zT87+1MpVlcQqok8o3uVv+elSJ/vJ7UwJ78giusptRnuO5xyrqVvLFxELheRz
         fuTzs9T0ElQBSSj5GDfpmyVyrJ8rr+U8oalm1Q02oatVPojzveSEVvmDy/WDXzrWypiT
         pNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMF789FgXx2e6Y4/vq27WMByX/ZrrFaKKZtWTYUTPEY=;
        fh=bn0RvMCxWzwMzEttNZvrhOoYuyQDzvVd+2Z1lWyP4jQ=;
        b=Dtjz7bgBCuP3L+HzgFMmI6WOcZ8o9PkepZZYBhxq81YBxqMcpfX7Tm1YQSXLpGf8RY
         wyG9XIDSc05kgMOKrHsvX+CyxJLMqVJqfpSs6y+pf+JExzWw4otrIHxbNgzGBsJawjz5
         Q8JUKwwRNHhaCXk4WGsBz1bi+rDX9OvgIW+AtqK56jlfENaxdEq3gSlPRvzKctpXfM9G
         h2b8lgqx2RNSFb7spVV6J/XmTOHRYZQHTWGzn0a2Y7D7o672So1XyXBYwqToIrgPq3SU
         uk9jO7WLlnJod25m88EhcranwAUFjS3IqF4l7MtVjwsZwTqAps6OFfXkEuOKJG2MvMcz
         5emQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769804584; x=1770409384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMF789FgXx2e6Y4/vq27WMByX/ZrrFaKKZtWTYUTPEY=;
        b=SgqTgC83O82fSspNQE1x4UziEWomgX33iHYCLE1hpgCaArkJ/phzbYBP3FxaYjwZoY
         Xw+eCFd55mEDjVISH5JchZo6ZjIEzDtmTYoIZL8dzdwGqyNGo1rTkL9IcZWj9zyrS121
         fwovYTikQZEU0JjBTqB6H4qhWu+T9GfYMJwZaYxkkJB1dEqAvHFUQBAWJfUQG6BF+JWZ
         o8WqFiO0LjT1dUT3lBFvq4vYSOZWNu2rXPIBtr6nRjoWHay+Vp7SSTBw7TlXY9PhsIW2
         Vjuj8a1hAUDYP9RB8hgGNhFTSMK3F3lylcjM36m5SfMxlzWDw9UoZNyUrdtHrWUzPFYq
         6qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804584; x=1770409384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMF789FgXx2e6Y4/vq27WMByX/ZrrFaKKZtWTYUTPEY=;
        b=bF4POYQtCsrUNNGFJHrOOUIEY6FkShCRxun40T+nF8f+pAvfKzqnmHEtrBpUl5AA/p
         qTrKmHYej++M2GIdhli+AIHiyIL9to6j3vnwxgsoO0PCXWMRNwq7484h3TIOITONp/ct
         o/mBs/mFndoU6nvjdCpv9QHVhDob7FHuWVBMzeT+T8XFVdEIJiRdn74fRETq+lSdD6zB
         9AT3fEjGcJZqWdF+/Py9mQN5cIcedLfK2juNAGjqkItKYs7LsbpyHiMBeJ6w10yCGS2M
         GOy5/P5itd33oDVipP4glXFb3mwmRFpdWFnJn95/miyE+1zZ1ZxWg7T8E1LMOTpdgavZ
         6biA==
X-Forwarded-Encrypted: i=1; AJvYcCXqJM5oZFuZWoKAtRS/XASgNNlu0Wv9jriLFThXiy8pHLoWDwfsqMV8r+S4Q5K0snkQfjODKccqulrL8ly9lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVRumwiz01/vmIAhey6FbOU2byubxUvCciPSQYAWdpgh6ifg2
	4ixC376oBiNt0VxYqVmjlacEdFpTXWzhFqCtko27tKVSh459LV8pxmU8UXNvOpMWag9dcdcP/qM
	+FbdmcahCz+MniwJ07St3O1urxReBqdc=
X-Gm-Gg: AZuq6aJoDk5Z/GdwUGr4PUAviydMxyioXSlTaHyzsc+XrWcXnf+JQF1iLlscjM3BHiB
	nNLEbBG7dtU1sYsODAg8s7pkM6mgTnihqMpBs4ojFlxskAAR60T8O4OqE0JhiXqxaMN2EkUYLC1
	RFhTzs3yZ65gPukfR4CY6wqMTlvYxSXPy8aW746NVEe7qpI0JkRb8qq6b0hxtKWsBP4wkuRgb1T
	Nht4K++H0rFSs2wxM+Vr4/QP+cAqMdozFfyACeA3oDp7EjmZ5c2i5mfbXuw4I2QWLWNVQ+VbcZZ
	hjRczwkMs4Erv7vyGzuBw/VCqe3K5cwDnWk7xoGc/6EX6T5tOa76UtmwVysoxIuTpLoi1fiheCR
	JhGJKXyszfWyl
X-Received: by 2002:a05:7300:6da6:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b7c866cfd2mr1123479eec.3.1769804583886; Fri, 30 Jan 2026
 12:23:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
 <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
 <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
 <CANiq72m8Bx=1s1+_OFxE=PFOjKrtuh_uhsomTA9VwQ4=Fz4d0g@mail.gmail.com>
 <CAJ-ks9=zWmVnspkfCqPH=+-_qZ0YZVyNrs2xMvRRvEmr-mNMcQ@mail.gmail.com> <CAJ-ks9nMHtAaLc_LHOWqa_hTRqVcBNpGsaC49VFh2O+_3AoY+A@mail.gmail.com>
In-Reply-To: <CAJ-ks9nMHtAaLc_LHOWqa_hTRqVcBNpGsaC49VFh2O+_3AoY+A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 21:22:50 +0100
X-Gm-Features: AZwV_QgY2s756W2c2BeIdnOIPOU_dOHgt0R3PEDW_x6O8Bex19ls3-KPywJ22no
Message-ID: <CANiq72m43pEweeWdg0qiGH8Yq6MyMJnFYsxhfYHeZu6LPxFPUQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Tamir Duberstein <tamird@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:15=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Applied to rust-analyzer-next. Thanks all!

Please see the other thread (and please reset the branch to e.g.
v6.19-rc7 for now -- we should avoid giving linux-next unneeded
conflicts).

Cheers,
Miguel
