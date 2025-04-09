Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9036B265631
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Apr 2025 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208157; cv=none; b=KgvBZsvCyjCVKz0P8nJUAJgPZpoRwzhVUuaCXrzozGeN6t5rf2xuCFZvgHexnHBjAj3BbCkzo3O/ukWsbVZl76Muwks42X1Z+Ae3Rhx3fPh4gDitJ+CG7qwUFrWqbVW/j+WhPQbyvC8zKPGgK/ULiTO8uEem+hGwD0To2UJm7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208157; c=relaxed/simple;
	bh=womuuhN0y7ZIHGvHwfIh6CgJ8LdkL2bDAgdabpiVM+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DT+6X+YALo15pCp2sVoZlTPW4OYrObED7KDbox7upHcfRrSA8G+ew/gDwdFtXWsCPn5qoYExTC1OQb3H3KXTszKahNVLd1Bc9qh8JOMP+132O751bsXEcmz8rr2NzNz7Nr0mbVdTi+C0spJyYxs2xasVgWkTxNged8VyJpJRNmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9nPrZMj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9nPrZMj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30363975406so1194885a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Apr 2025 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744208155; x=1744812955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=womuuhN0y7ZIHGvHwfIh6CgJ8LdkL2bDAgdabpiVM+U=;
        b=Q9nPrZMjmJzWxpigtqz1Uqee4gug495PxKyFkW73/xuZs7j5AWZdU+MlybZZIJQb7r
         WfHTxIClSzKwvzqYTJMdTPbMxWquuPhSMq/Fmfp6sZ4PkZSGfDUh/WPqTeBwmr5N0Mdm
         W8tvIwF7MNuUIYA9zQBrwMq+JIi2gYXwKqV8Tf0J+kZVlmTiXvxlwR/p8LDjSqiNfbpI
         IVR92bWSpOO8OYhUkr4RydN9i/N9/MiveGcXn5PfffoGuo2Jq2GxCVocy8HI7hES6NOh
         +TmiOy2xnfWALYTevX2DJrzbsWixjvfHFeSn9bVyWWWUF2Fu2BJ5iznQcZr6o9RjWLow
         QnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208155; x=1744812955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=womuuhN0y7ZIHGvHwfIh6CgJ8LdkL2bDAgdabpiVM+U=;
        b=MDAXpj2fpiq74rhvnfloiyxppYR0nFy9gN0Glgu9rTZ+Zv7LRHKkI8QsKQWyiiu4yM
         XSjkx8K7GZYdzTRxCoCDVR3zrtiX1UR22GH+6EA3Qpx9OQCkOmud9nsdNbtBQ0SV7NQc
         viviu+M2AG8JGgUdR1sdFrMcVWbgKA1U6hW+6nB09sV/SXFpEueKS/HikGqUFt0dhB+5
         tGZM9OQSp1YnzmJvlPX4xZtQo7P7fc8W+Y/VAVsQ47AIIAYsATGCqcfMKioNz9cBm6T2
         g7qqXWbAfeXbVpdtdTXOIasM4dmVe1Kqx6O3Cgpl2057i8isMsgSXseKjP+Gg2NvZiFM
         4cZw==
X-Forwarded-Encrypted: i=1; AJvYcCXR7U/CaUfNeZeg/lm8NkX1y9kDofC+odWjfuYkNfozdxd9+UM7UGXX8ZITJgENseNeJalS+SFBEWH09iAH+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcnl0h3loAR824JZlRkGBwJJim0QAHZArd6NJdrM6P1kzidC3t
	Ov2+54I/E+4PHfNlIC1MfSeOUEr2gNTc5yqKjIwHMWnkXNitUT4Ee4jJmQ/gKsWgrEAyzL016sg
	UuHkTs2YlpWpcUzterCeLOUc915M=
X-Gm-Gg: ASbGncvrsroG21hewnLK/YD79VYNPWpqQ9eWptYdYfvdX1vyac01y9oY4Nyudp1CXfN
	fXl2X3wq3YnyLoEnAmoo+rAwXJ66BwiHLY0MwSu+bSx5oDWv9tese113/qWUWtxgDGf7rJRZEV2
	GSGbc99mRQUkJuU14p7YLCFQ==
X-Google-Smtp-Source: AGHT+IGRAgGXEBPsPOtxN7+9rtxKRpxeuIvNVfE2nSUDrdPUW3JDWPMw2QxT/gnOf676bsX5Hv0T9Vjl2IrgmsQtKbU=
X-Received: by 2002:a17:90b:180d:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-306dd172cd6mr1344302a91.0.1744208154489; Wed, 09 Apr 2025
 07:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407201755.649153-1-benno.lossin@proton.me>
 <CANiq72mQpU3f9vMsNqd8aqgxpUZT3GshHhtrCVL79oTM38tuaA@mail.gmail.com> <D91L7QI9VMBI.3LMLTCHBZPMJF@proton.me>
In-Reply-To: <D91L7QI9VMBI.3LMLTCHBZPMJF@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 16:15:41 +0200
X-Gm-Features: ATxdqUF_cBdzkCwDBLnKjiBRrnsV-3PtUmh0W6zQEDHjLOjIXQL9yNeauCAgFiQ
Message-ID: <CANiq72=hrMoL3vxRmSsC0Oa39xkG8pYNAnKBo6Dkgse1gXwPUw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pin-init fixes
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:49=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> I thought that if I add a Fixes tag, I should always Cc: stable.

That is the general rule, yeah, and it is best to add it than to miss it.

Sometimes I have skipped it on purpose, if I considered that it was
really not worth a backport.

> Do you mean the second patch? Yeah, it fixes a line in the example
> introduced in the fixed commit, but the other fixed instance is in code
> that existed prior to that commit, as that code was just moved there.
>
> Yeah, I probably could have split that one. But since it's only a
> markdown fix... I don't think it's too important, but I'll keep it in
> mind for future fixes.

No worries about that, I think it is fine.

Cheers,
Miguel
