Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2B27A122
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769255792; cv=pass; b=JVkeQY6m0w9/bCvSgVOOXeLSBCLRpT6QRRV7Jyg2AeohLWcagAyu20+RtZmTnnIly6aAGM3PiAvCFuz4/w9tcO57y0bqtOQaNqOLAA8RCF5WjdvMNITRw4xp/bFLXHYVMqqrThOvR87/Q6la5zsnp3+cYILEvrpxL+TbWiRktPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769255792; c=relaxed/simple;
	bh=Jb1MEUym86II3JeoalJcP6CbDtlbLDnoD8H+yjHmp7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUmhTVf0yqyb1qAT33CypvvcHbFzxMzGiMfjTkZcigQVqhyrXujE2JIwwZWygzmckxlEBW6WGh9jl89W4EkcE85dJYkvRLWpdEdLy2wQ2Ow6rM4/CjgENoEzgqRInOoDP0UcIsXV4jlU7LGHCA1YrGrN7YWC3NC8UT1OZDRyU5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFzFe0Nk; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFzFe0Nk"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b7267ff06fso264732eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 03:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769255790; cv=none;
        d=google.com; s=arc-20240605;
        b=KkcrTQi4nydnVzuKoEx1VkiSeeijGFJx0wSf29EDrI2OD9AGNbsQbgeLkP4KLyDzHU
         ZJTipZjgeD1ymCTj3GoeNHwU0GC0bx7bvH2o/TGW1icvHimCPJYqIix0J1jRFeo6bRA8
         gDv5XaqeLSFaaQ87Lw9MAHmLzftq9lfr8DodWD8UKhXWiYb/rSAYTqTgzbDU7jPWtsi7
         Lsoff+ct9EXMBrw4KjSRy6IE6s4aLGXkyub1oD/4qUoFFrdc79e1FdytOt1nFzFOBz2j
         IUAeaYdv/KrC7Fm6zW608Nyhm/Sb4hYBm2x7p1NZ0/hufGEvJ5aVdYggYp0i/ChlwZI1
         TKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
        fh=nYJHqf+zO7aQ7ehgwh+kODoFXF8UUML+G0YU1g5+BS0=;
        b=Bb3Ikpd3GR1UrQpgf2QU05eQm1u2NuhC+Pl17La5PUEY9dmRYRNPYcQl79kkBqZ6bT
         gOJO7qETBdF13hrBJw5lsmHzkR5Z+zDMEpWVZo7q4HweomQy4Vn2VtCPH9PJG1MszmNL
         roE5irlxoyr81BBO0jNDoMQsiKo/f4vapX8peEqMupTRdXpNCzG5iWLnI56KkyBQiBj2
         Ae1zyhQrxGwxxW8CEUZfChWEt7jP7i8kzoyGoq7LeSboqzuSqzCwB7yk9RmcD8lIFlfv
         vhwljF8wZd2gbQdGe4kWwK8cl4HzLUx930ZXOU1J/5w0x7YRI4dysuDiRDzMAlmbG66p
         8Rog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769255790; x=1769860590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
        b=EFzFe0NkGDDmdxVoV+o+Xh6i7PKIiIHRb437zEggU7Wv//Z/XY6hBB/w6IHvwf9TdH
         QdDczXYYCFlbnAsLsU4WXgDVfjmmvTPZ+loJAFAda4BXn6dUp83mNR5OfWFFnTzzfnes
         1MmFeQvZUV/1WiDncKao53JaUF3ekbfaTLur1++11ua9FSSbRQSNgLXqfe0ClxrTSGzR
         5WC3Aid8XWfX5sSKiMLNLIj6Z+nWzGUDz9aP4zHJx8K99W3rFAkRpvJFYxmPaPn9Aoio
         HL4qDrWd13QTyIQGYJQ3fOvxDbBvAUG2y0+PKXnd1PxoN/2SAtiKpw1o59dqJ9gBTEUK
         WXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769255790; x=1769860590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
        b=kvHWQg8lmGDBQXV9/0jVvNat3BXxR186aGS3RrMO1W/YbGrA+fHKGslGQq3W417UAX
         KkHaqTVzPyMgKKt/KUzBT5lJQkGvsWTTW5QvnNgMOShM6C6FHhpoGn6uL/yPncgmfzbr
         1K0jjQTjp9F2ysKB2l4NyRlAzSbet6A+R4iHCoGup2xdd2Xv3p50wKSpENs03MWWg86t
         0XO8psPwgHxzYcVanNUuE18BMMk+wsrCFLBeoykFoLRDmU9BfhyTBC4RPDvQXVLgzKSk
         ecgKiNN//J8xsAG/yQLHPbai1E28zTGbIxChuWxNo9xIBbIDhDp4F7XMESCLip3DiVEg
         G9kg==
X-Forwarded-Encrypted: i=1; AJvYcCW+aejOYxJ8kx7pae3Uc5/v9cfVT22gathqx8ExEkL5GqTSket3j9J7GakJXmPzl6uFnJzuKdpFldoJBvoFTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS4fM5dyOaB3eCNr+yaD4kBT227AJhPRmD8uoAl5gmIVjuxBFh
	GajRV/w0Zmnu5Wc6Qs7S3sIL+HO5Yk4xvd3ERqDlUt0dmIGbtgLEUIBESk3xoqmnoemARNVe4Uu
	TcsNIp26rl6WGFXG5xQS1Z4BS1E6YJ/Y=
X-Gm-Gg: AZuq6aLelDwmUxPaXgFSXOEw0qQ0C0lRPTOfZE2OFGyVQgFt+rl4lb+T2tvyOrjC19x
	P5QSigC7ZICiUolC1y4df9YGLX/6Ph9Wa0UdhaZbtwCCHw738OadRogjE0r+nrwqQt3rNuo8ggS
	PWTgMWMhygoGlS+t3tM1BXqq//5kUohJDZjQm0djb6l+nqV5I1GEYHAPH/15M6TVDZMFsWCmjLn
	HilqHFCRoHABAR3cDqlHnnaXORltdFvsVcZOWisA6YQ5kN+MK2fiv9UcMj9YXxV+YSRuQAiyMS6
	EOosWxlECzbE7f4nTK0Ac/+noA5sEyOToYvTiOPnJqDKAX9H1ffTz5YBPeuSRAkJPk1ZcZWthEv
	CoxDrjIggut9Z
X-Received: by 2002:a05:7300:f10a:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b74e8d14c3mr739336eec.5.1769255790487; Sat, 24 Jan 2026
 03:56:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122222848.2555890-1-ttabi@nvidia.com> <20260122222848.2555890-10-ttabi@nvidia.com>
 <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com> <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
In-Reply-To: <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 12:56:18 +0100
X-Gm-Features: AZwV_QgKIEDy3cfZCnl5AFB8pIE-vu8jzEFx99HFmFN95gSlAVACEbFHVXhCDog
Message-ID: <CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method load_method()
To: Timur Tabi <ttabi@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 5:56=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Should I downgrade my compiler?  I ran everything through clippy, rustfmt=
, and checkpatch
> multiple times.

We support a range of compilers, so for complex changes / new code,
please aim to build with at least the minimum supported by the kernel
(currently 1.78, in the future 1.85) and the latest upstream stable
(currently 1.93) before submitting the patches:

  https://rust-for-linux.com/contributing#submit-checklist-addendum

There are developers and CIs using different versions, so eventually
it will be caught by someone (likely the maintainer), but it can save
time to do it early.

Thanks!

Cheers,
Miguel
