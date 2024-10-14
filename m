Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B9156F3F
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728908046; cv=none; b=GAP4AesBzl6rbCYC0iMvChRyh6NNz4KK/ptoHnzrvoEsr7x7qsHRrbjOqNLnhO3K3LpYOZ1qSn5dahDy/o9WZggdflflv6bFG21CZ7EOUSj88JK1P9h8EBk6lQlSkmZ2HWSRGBBRtpl7/IUq3z2Pf2pbpnPDvCYxPeqHE8yTTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728908046; c=relaxed/simple;
	bh=z2XtgPgiZtJHGI73yuvzaAQrw0w9/DgWEBqKyYz4bAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltdhuwp4ppGSFmuUjNdlth0FfyqLRsvv0a9RHE0EJEeLuCpH7uRmTFIIfkdn/orOw18stsEBtSkRB62W4bdLU5kyUKP4ss02PdZ0SQD7Ns/SPiax6PU9gVXdIdn5Zp3T9sHsoA42XBZCLN8gAWV39HIn/ktF2w1ICmEOb9hHwho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AekB4qc5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AekB4qc5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2b71fd16fso759936a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728908044; x=1729512844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9r9lDOjD2OD6CIemGaqSnwDBGbWvKTzEirpZ8KJyD4=;
        b=AekB4qc5z67nYplYxMjqw2CTbOVYGeqU2OyH9ScfhrUyjWkhqI3U7RlGVYRqFaFpgb
         fwftm/nMPMEuXQbhdPkRAwAbEecSmNIvmoXVYpfwVnPXYUkV583VDU4kL05evtw7M2SM
         WO16VU43OfW3sMgyXOtuubTgsltU8O2b4Deu6o1lxbq/JjSTb/1ULMJih/k4EC3Oe9cQ
         5PYSx7ZYoA6gVt7guE0dEAHxmlFSxfn9Fhxq1RJPk+ahXdN1o2qCZVO3wvJqycmyE5Ro
         J0HnjEMFcDhf3Jwuqo8l93c1GuvvxbzBfhIxyp0c1XgsXUihqZIFk1Diw91mE70B8xK8
         WXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908044; x=1729512844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9r9lDOjD2OD6CIemGaqSnwDBGbWvKTzEirpZ8KJyD4=;
        b=nFhQZHbLd8Rmge9ZcdbnTxb25QjEEScrdRNQu+r2p5XFFfPFVD7hZKVJbUq6DrYIsk
         t8mu7nwoEVggcuZ3Vfrc1Oqj6BFCs/HOnke6piieUtLAHN0lFXXl64I0vrWgK04nmrxQ
         jbM/xpsdTWfP2fukL/uU1mHfQUZcU5SPKdflO2LONUkJT9R1A7mSne/oUc2i9mDD1Pq/
         uKyGXM8LhJptQY3GCApYxOihLXxhuVVejvbCKcAz9exmLg1ImCZxwKCf9KuWBarRIVW8
         1H/3EY+1MYrWdFym+/ysp5alZ2ER4SE915HyMPrt+XnmUEJz0viAvO7mSp26yRUHs3aS
         WmOw==
X-Forwarded-Encrypted: i=1; AJvYcCWDm3IB8xh3J/XeFdC01PsftuzvGITpfRPzR/GetRKKY7zj6X7OvJmtr2swEQa/bTeqgoguARu+OLPB/dDINg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2yg3cw3mYtq9kUBuY7/k5zjF6yOubi3rnD8duYPYvVr7A6Yl
	b/5Q4ydaQaveUSHQQCNVOn/DrR/xiCduCOm1ov1YE34DdUZagoo5WHu+pljpcuyZ0BgMYPboG6G
	rAgFOvRAaBR4tDm3CHauShRIqiSw=
X-Google-Smtp-Source: AGHT+IFy0q5F/4odMeOxExhzIb48Vss/mtfxYMRWAw0D+EYJC881jKxPwPxpLsOEcYm1V560jyA6wMTuOPhwl+C2tKE=
X-Received: by 2002:a17:90a:474f:b0:2e1:682b:361e with SMTP id
 98e67ed59e1d1-2e2f0c3b7e4mr5610536a91.4.1728908043836; Mon, 14 Oct 2024
 05:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918225115.2309224-1-aliet.exposito@gmail.com> <CANiq72keixz_kVpUQMEFQcgewwrjcA_Od3E5-K9jF_UYFrg2aQ@mail.gmail.com>
In-Reply-To: <CANiq72keixz_kVpUQMEFQcgewwrjcA_Od3E5-K9jF_UYFrg2aQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Oct 2024 14:13:51 +0200
Message-ID: <CANiq72=U+5gZa1ADjwsgsNenowbedpnPuZmNj6Gwv+v2u6RaNA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: Move unfit code out of `rust/kernel/types.rs`
To: Aliet Exposito Garcia <aliet.exposito@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 9:48=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Applied to `rust-next` -- thanks everyone!
>
>     [ Rebased on top of the lints series and slightly reworded. - Miguel =
]
>
>     [ Rebased on top of the lints series, slightly reworded and removed
>       unneeded `use AlwaysRefCounted` in example. - Miguel ]

The other day I dropped temporarily the second patch to keep
linux-next building and to simplify merging the VFS series. I will put
it back later on.

Cheers,
Miguel
