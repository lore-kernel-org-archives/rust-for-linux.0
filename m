Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FADB165FC7
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714599567; cv=none; b=uOU9bJ8Sqe5vYiGa+L0pk7EdN+jZQuVkwrxt5nvLdXg4LPcJIbq/4ZSJX+2SMZV7MdIncxz04rQpcJU67HTrL76ZRL/hIgVxMINXcRGr8UG+27tJHdhxkScwGvsq0npOje5xyR4izlDlJVcQJf0YGFSkyIZPctP72akQhSCdik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714599567; c=relaxed/simple;
	bh=R0rUin7F98ECNXXV9Y4BPlH+ia0/PO7J7O4OO7ywuFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0P8I0J+Uavus3j8zk81TSOMPjFecYVYJVH1P8SXPAARHmHgJzc5qqax8b/HuOJ2tpJzSiZlaY4IeJKImFP/qBg+kcX4sTJBfBFtw+GfdAddF9C2d6OLGxWGCzAkZp8FI83C3/hG5pM5MsX/t5wlc/gVlxHZHCATAqgYxLlyZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO30/BTl; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO30/BTl"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f0b9f943cbso5908783b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714599566; x=1715204366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PozQ0MMtXneyZoR//pMOKDIu0w9D8awIxXzIf1dhfXY=;
        b=kO30/BTlyMKPfO3JO30QLfveIKT4Z/kdIzyo8EYTwhOWUd7ngG9tfk+o1VjSGfOjmU
         K8K9CCh1WnCMOMS1dJiX6PAoruXcnAa2Z120mwrpbPdBWekkAz8JcAgQCw1DFHdP3Do5
         98qTt9xwB65b6K+K77rP+ATokJme+ciVIbDmE6AlrtktNzIqRnhlW9hQ6o/3nr0gdkgl
         pXqZSyjHaQeGE5sSVRRJC+2CWVvesuJMxZi+tNB+H4vabTLpK6FjqBwiLfUrsxPbVMLq
         Hd6LLC22O1t++q6ubMI5/anr+3WrrufOfFHd5ZeexcrnP+nhdW4Vf6Ou8iotFaCT9ZQ4
         USJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714599566; x=1715204366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PozQ0MMtXneyZoR//pMOKDIu0w9D8awIxXzIf1dhfXY=;
        b=wEt3PTxdRGZtzpQ57nUfT1prvcQjLOXWbUkMcwUoWoa+wRSXTGWIChjUpAgQ9m/qCY
         KGCOqzUf0c21dWBODqspwrOsWeU2FwqTB2aTsZkChuG1Q/xJ/+LmHWBWu+RCHOtHgtuG
         yeiJwvlnpqta5hLLZcnWGRdUevznQ4cswDrerWdkxG1++R/lZovpbDp9yL34NQeYZdkp
         50hNZ5EU4hCVMX5Yoe277cpRMVAq9EGtnMmKUO2jP3DxV700ye1ngrojFjKPpQQ+iAks
         UH0uARZyFB3LQIOHmG2oZoBlxKuBKvWYJ/1/PpHdmExOcLM+TSf7KJWBU8m6psYdX8MJ
         Z9+g==
X-Forwarded-Encrypted: i=1; AJvYcCVH7Bs3GgkwDk1jpWaib+LRAcLoKRJu3DhljwXUF5UaHLEStNaTsKHHfhftPi4KxHYWzc3MX35W/dWg6rWtmdcEyJUocifsI/ofog95GMw=
X-Gm-Message-State: AOJu0YyG5DrIpijfbDY/oaJlpw84l3cwrwj/J35XAyNA3YHn0IHcc3Vx
	SkEhChjtaX88twWJarUEJZmY6MOQFZaTw/R303ygNcpZ2PQKBgsS/yVOHYTSw6EVP/VuwR+lrUf
	MHy4t67BozozE6uL1B1P3lkkC/dY=
X-Google-Smtp-Source: AGHT+IGz3zY+nJD4qvugDbyZpDw67VBfQRJSFJFHk6PoY/uXefzkzWgzUkNymo6nboU2Et3NnwAzwJ6aNv48/SOIg60=
X-Received: by 2002:a05:6a21:4982:b0:1ac:423b:7c7a with SMTP id
 ax2-20020a056a21498200b001ac423b7c7amr4166984pzc.21.1714599565815; Wed, 01
 May 2024 14:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429201202.3490-1-dakr@redhat.com> <20240429201202.3490-4-dakr@redhat.com>
 <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me> <ZjI6k4YUsdUA_LaF@pollux>
In-Reply-To: <ZjI6k4YUsdUA_LaF@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 May 2024 23:38:09 +0200
Message-ID: <CANiq72kG+X7W1RjNYkToCxstZBdz22xcmTmovGGANew+MuUBLw@mail.gmail.com>
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
To: Danilo Krummrich <dakr@redhat.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, 
	ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, 
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 2:50=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> How do we scale (as in ensure) this once Rust code becomes more common in
> subsystems?

It is easy to detect, so it is a matter of having the check in enough
bots/CIs/subsystems so that people complain early. I do so for our
main branches, next and so on.

> Is it possible for rustfmt to change rules unexpectedly? If so, how would=
 we
> deal with that?

Like Benno said, not intentionally, as far as I understand. The tool
could have bugs, though, and there are some limitations:

    https://github.com/rust-lang/rustfmt?tab=3Dreadme-ov-file#limitations

So we may need to deal with a bug or similar at some point.

In any case, my goal is to have the kernel compiled in upstream Rust's
CI if possible eventually, which ideally would prevent this from
happening to begin with.

Cheers,
Miguel
