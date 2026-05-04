Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE93E2769
	for <rust-for-linux@vger.kernel.org>; Mon,  4 May 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910901; cv=pass; b=e4QMxVx4JBoGTdddXkkTDfetT/tVlAEobbBsPWOrf62CusRWlOByAopQB26oBdQ7kzg4XNs9UiY+LquCJB575ZGfLlhx+ZL9lh2qnAcq8KqYFaHbDYkgAfB9/HbTxlNipnFAuJTxwg8W0+kOFtY8IwRWcIMnSY+QqkETyOT649Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910901; c=relaxed/simple;
	bh=ef5tKPM5IfhcdqWy2kyiuJK0jTEY69jCU5pmQ0Pz2z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjLO6o66EMR86G8T2V0LcF0fFbP1S7lgBhIQuU1NhzfKsKoVv7xrGhuWS338BqA3W1edqTvwv+25qBAwLthQfsFo1DYmwg4xjbFd8ua0Kfu0G7Ij+n5H7e5a9+hi06skmOWtMdezl+gTa1ZcBKV+RIgJjy2sN8MzADkHYtKcbcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+/Iwx6K; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+/Iwx6K"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12db205ca0bso367233c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 May 2026 09:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777910899; cv=none;
        d=google.com; s=arc-20240605;
        b=VbeHCQIpl4LT3+c5tnsSFbvCrx2geZ0iuuxmFAJFyOlJBryWfzjzr+LCl3euiU/39K
         Jg3dhVbItBCy6r8mzwOeRhHXEFlEOZMv1LBOy88yUMntC2ZgxrMvb++JcHtTUCVL5fEJ
         5bN5p3bGKfjPCGhE4iGOPtsRc7gW5Ld/D+rjTljKJzBqLecfLPbNwyjq4mGZ0tAsJvpD
         AizJ1VFaYMeUR0wUUOwROy4V7TbvRjHVEY1U6wP+R160ZdJ8OUa+UxWCmgfGG8K3en17
         pNer3pybcoyN10HdLK3iLM8GvsFoqi5JkplBjxmstKwXRcv7h/v/rKiEH+MoeANrmt6y
         2I1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nNZrt61r3aoHY7uvFYEzXGLx4Snsy5tjVPxAnA1s7U=;
        fh=lC9E/lzqGIG0NoKS5RBaK7Yq9WAy0MunCK2/2ocT24U=;
        b=SflL48OTaU0EKwsAeDEYJL/9xZMqAvSxHUvbj+Zo+ZECQ+SK6O64F53lt9QsmX3mgp
         T5CoqPAXZTuRo46hzHDPalEt0RyGqWvMnoenEI47COeULwTUnPoaTrvzS+D0oOwDdS0q
         1DjTE0hT2ns+scW3BCWsB32BD5oimyREKBa1nCbIK158nnpS9MpQkajBJMNW2h6DkmBy
         OprtF0ypTG80dTehn+dICorZ3etJfjI9bC7O22zb51DgeMh5WJW34eRB52DL+n7N/ke+
         Vsy2DRYWToVMu9w8rAa9HLGi2fd0GXEd+2nK5+nOMNLRY0A8hHQLdSANUEZX28n1EFf8
         2WBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777910899; x=1778515699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nNZrt61r3aoHY7uvFYEzXGLx4Snsy5tjVPxAnA1s7U=;
        b=l+/Iwx6KXSIbo2zdrXuJpYOmT4v/emwmD6K41t5JCZt1j3lBOY+CpuD92VEu1WwYTw
         NgncSU588QsJ0H5xYqgv/P4I3wDk61+sQkHmeLixW8/XDkspCnRqDDjjDqGbigHH0/Sc
         y6tNwF+MHg4nqVCXK07KQT/N2EbJTudpXEOUqJCp/nlyZDu24j6P6jBzIhiijz3Ilh9X
         bR6EVR/618RJev/A+aoOrwlmYS3KJvi/AuWyk1gbzi5FZ582YUkcNYAOoHsirnOY+KeG
         bSias/mjm8Pb57jm9qmSif99OQVUfpNIcQHg/N4mk70SDqtJXikK1jyWSRiCV+5Q5IMt
         H9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910899; x=1778515699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0nNZrt61r3aoHY7uvFYEzXGLx4Snsy5tjVPxAnA1s7U=;
        b=sLE4zSSxXeE6lp9KsmOLp0SEbc+5gtA2sF4cdpCjFdLhRl9ZuFJKTy47gWUhLxjFX4
         HQJsrkezEIexW6KjefG4DaUjiLDjAQQm7epFGiSqYNwge2Mqo7YS/FCvehE23jcb2Lwp
         uLQzHBq5dOJ0xLY6ej77q+RtG1KJsQhYPUGEffBpLszzJWKBqxkkj5BZRK1uEHgg9l5B
         urnsyM/s8KJw5suoggHgD39uC0MzwKJFnhNVfUyMXKTCRX40RFNfk5nowpzIhjk+4a9c
         4/LlFkY3Fy/qeRYr76CB4nZL6nslYlmPnH19WXVOBXgP1J/TeVOiWEPCX2sQ4AJlar4C
         WSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5bmomYu3gBocSAt032Cq3UHc6ac0FmNY4saUd6LnJcewfn2YeApJ9lxl3hYI0YMRWrW4v7LZmYq/gjV2o9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYUnjFmy7ytAt4T7mtoNRAEOsAJsge4cKAreY+KaF7eQp2Xt1d
	JVo5IlQQJxR8ADCO+mVuYvBJU1vVPtEKOJqGYsKC5nMXy42k7kkMSgt/DUOGSsN1hqlnR/tjSl4
	erjkrL5hYJNJAvJZeDCoPo3hr+RmmCIA=
X-Gm-Gg: AeBDietMyc+XHHKSPZeWvqOJ1YAau+c0kQSRY7Ehr4Gzb/0Ixb23TiPNWTbL3/SwfQ4
	oSQsAg6Pf+7D4fV6sSHrXqGiq8qo8roMkSmW1/msG7GuvWSklyIPHr38KMaKIGO9JEtgc+xDMiV
	TaGl8zTt3kHxnWswxEHbOu6fYdzee9uPwA/HLrN4ptg1yfTk1JVzl6ajGaECL9qGFa1dL8Jzg/d
	Nei812CVv3slca0iUsshlSTQuHnPAJBUXcGO/YHVPRarvaQu/HxlzVqk3tX778QJoJeSy+lLvIY
	QG0/Jel2cU90WpxvKvWvL1d67DwHcrFcsYWbhU505afiQLvNVtnLFSlZw2B8XJ0LCMNZ3eHi9Us
	JRBA5/IVcQNyEMFI6ltyFFtQyO4oPj6gvnw==
X-Received: by 2002:a05:7300:cd8f:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-2efb4d405e9mr2513742eec.0.1777910898694; Mon, 04 May 2026
 09:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org> <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
In-Reply-To: <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 May 2026 18:08:06 +0200
X-Gm-Features: AVHnY4Ipj2td3lDPcisK9Oy4r7A3v6-c04Xe-ovcQ91rWKS4uDVm6C_HRMmRODo
Message-ID: <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 5:51=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Currently, there is a "P" entry for Rust pin-point that is
> neither a valid ReST file nor an hyperlink. While the real

I guess you mean pin-init above, i.e. this entry:

    P: rust/pin-init/CONTRIBUTING.md

It would be nice to clarify it in the commit message that it refers to
a file (which is allowed for `P:` entries according to the docs).

And, yeah, ideally we could make it a hyperlink to the raw file.

Thanks!

Cheers,
Miguel
