Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FA27E04C
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252791; cv=none; b=dkBt4nOvLzqi8xUzT0dAJ18HLfYdl8HtyVR00qPQembTKLmNspq6q3EA63+hS82KDOY41rLtklvQO1q9WlOvIrdRiyL3J/QFmjboQm/X/6dPtgNRwa7Q5STh2IgSQHgjmaRMv77Uu44iseABm+5StTJaRhv9p7ar1yJHyLThPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252791; c=relaxed/simple;
	bh=lp6byP8KX4UvlQ4K2Wq2P6sqE+v13ArrwWrLUiBAwdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxkEzGJE4tZEtXnQ7qKgl1mJf8w957IMDLpFmDoDvDzsUA9mROWlIPLILtMvUoo+GRj6Nb+SLrJeaR+YU7PUZSL6Dw7T6JUHMeWjn2r0P4rRPA4i/kCEOpGqFeQQ/0hH353RFuBLiNnvtjX+1yJRFwQPGFbY1cel7fuEz9TWmCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np/L5Lfg; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np/L5Lfg"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-340c2dfc1daso508843a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762252789; x=1762857589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPEEKFqkF9DF1b8qIlfa56owOZLEN8s5W63mSioCmUo=;
        b=Np/L5LfghTcn5nteQ9O+fpUq84/PzEUWRQmPyux0A582Jg56FIFy1JOrm2v2hYHyng
         soD/7EuO/+mHfOqTEv4jHqPRzg5PKrrmaqq13OrIJXUqRg/ebHVGAIXqeFrssmAoWI3H
         1sPodO35SIG8dZ6uIYwG76FXN5b37DzHBDJUziftp8OWjzEU1ZBbBp+8rs9shdig3RQP
         klcnEdVa1gHRzAk/pm0oOMRqoZIuD2JSr0JG88T1Q3AdSkPKqQz3KowKlOu76UqGypQ5
         5hUkPT9AlSfT9PXdat0lE7PY24DV+hvi2wBuyHNMrpxKsCAjeY71am8yIdpobfuRMqg5
         oU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252789; x=1762857589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPEEKFqkF9DF1b8qIlfa56owOZLEN8s5W63mSioCmUo=;
        b=n02pgSYoeh9OX/wQLnzYDbNXrGaEgJg1Dzny7tV5z8VUcUuCJu0vxh6AdPE6NdO9DL
         s/Ruizi+/8+GpI7H6ihF78gb8zNuR8XyPn0kliCoC2m+doojVHTP9VbetgYmqGymm87G
         XFu4i1lANdPqYf5y+BKeMM4wmePKMvgUOe6v6xwr8VlH/KuxiLza0DfFg5YP3Aa4Jc1l
         QG/0mTReC1ME7VZbcI8ybgu6W4AsyRo8y7xY7MHMO6bO9pqYD+ySOl0YLZ3vfu35Ptin
         zxYaC/JS6rmwo+iMkrffEwyI3NsQx4JeLEgTx7WPDruD89Hu4eowHwDTtS21nnEC6nR6
         YgqA==
X-Forwarded-Encrypted: i=1; AJvYcCV5SP04uTTfWGlYQ8Y92UKyeG//Y5TB2rh5cyv47c2ekaJhTlb8AKchc1I1UOcf/v/Vd+lANsp8rTvB8F72uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDs3dtgkYD/PBz2/QEcNTZaNrF2sxX+MC2bY068ImGZvIQEKw
	ScPj11zMd5nuDQ8rjhoV68F5tiZ7BnP47r7EkGXPR+2yJYbtaQXyxEA7DJ4Ygp0+OKsHMXmzKOS
	FEvcCwWmZTzsv9g753lZHvuBqTWBbhgs=
X-Gm-Gg: ASbGncvJ20lgvXG6qSA8TpicC+5u/BP7e3lDK9qOXA3BcAnoo8p8kAb6+SW+72TTcqz
	89wD8X0d4ZhX7whO1lpMOLrJFfGFaN8W+4kPR3Xnx7YFveBeSKs5PjvuJHdDNtDlulXUhmNKtxf
	Xmf6aF8FGjM7hClNBsRxKePF1LmObZ5kDysjJg0CFSVM95cfMjZHuQjnho3CQeIPOlgh1kE2WnM
	0Jh0kXND4nuadHkZwcQDLyTehnD63kyZ6Ms9ahvTF/F1KMypjcWKprBwxq0W0UKluvdFa/du0iM
	SUNoEuDJavpvqjHoWPlYbN9Vtwvi7eOp87nKI591HzT/uEHKp7FEL8yMGdVh6fhQ5xEJESWSqwI
	suWJoEUKFhJy2gg==
X-Google-Smtp-Source: AGHT+IH8Fiza6KYQ8sf9gDk9a4DBHs7Df2Dd4QQ4vuKXna4QoZxXAl1Rsm451kOpHcluydvVXxXumCr4qwrlc6KoH5k=
X-Received: by 2002:a05:6a20:7487:b0:341:f2ca:bd73 with SMTP id
 adf61e73a8af0-348c75c7736mr11623522637.0.1762252789132; Tue, 04 Nov 2025
 02:39:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025110452-diligence-share-98d3@gregkh> <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
 <2025110402-banister-speech-7228@gregkh>
In-Reply-To: <2025110402-banister-speech-7228@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 11:39:37 +0100
X-Gm-Features: AWmQ_bkJj0B7r79XvO44DYj-gZm3gLzYhP5im_H_sCcBr56JjkstB_G_ABCxr1I
Message-ID: <CANiq72mENsw=uVUbMFzOor8ZmoeurX+0hiN49fhzBgqMWMM-KQ@mail.gmail.com>
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 8:43=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> Ok, but why am I not seeing this on 6.18-rc?

It happens in mainline too, so a few possibilities are:

  - You have the toolchain forced to an older one (can happen e.g. if
you are using `rustup` and you have an override on a path, even if the
default elsewhere is another).

  - You are not enabling doctests (KUnit).

  - You are not enabling KASAN.

Please let me know if you still do not see it, because that it is
definitely not expected.

I committed the fix yesterday -- it should be in tomorrow's -next.

Cheers,
Miguel
