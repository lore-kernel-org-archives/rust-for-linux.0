Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E572EE260
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753386211; cv=none; b=KzWmr1s3oDk3NW+1P1k2Z56JQJtL05RCeJnpfhZP8HOFg6vE+6v47tBLvLxoLyqqIXKHjQxlwUc9Pz+VN9RRJWNKE2TkkhXAFyR1rc6khzh+t1cC+8iglcSo9rdm7LkZmv1fCQrTzaW3896B74N+OcnLPne8P0cP1WiMHlMjjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753386211; c=relaxed/simple;
	bh=N3/Qfff+MoqPwHhtX3FSg753RB58bl1HwzaHnvCqAwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3Or4XyfEI9XoOCuUMFxGmfzJdMU/MuyB2MLoPIsQ3EDFLT72yflWif0EKCPC19HuwYWm61KWdPAu0OFHNCuecIWkNwDRl14W01OHY9h0+8QuS+GLkKbaf0frTNQ6jBvMvw7rSW0S7i5cikSNFtwkt+mSCkHRKHG8/gs1XG7pDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i4AKkCYH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i4AKkCYH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a51481a598so756907f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753386208; x=1753991008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3/Qfff+MoqPwHhtX3FSg753RB58bl1HwzaHnvCqAwM=;
        b=i4AKkCYHaAGTBNBRqPnoJ0EQ6hto6LpYbJCUBmgLmvfQeuZTp5p3NLcrih/10DyIpz
         NhSJ6yK+J0gAzLMCxkwV7Zrfeqyw5oUhD+EYNZeViV6FYRfHTvwddrSXxmk/L2ILJGiP
         h40H0gbKyvRZprHlImX2DqogXzDtA0QFZniXaNOGM2YGkl6hbx7P/5ADlZllLoZnTu/x
         qxXgZQb6ZGMEIdmZIIK2UP0sB8L31cmeyiRG4kjj0bYEIi6iQHo5wCFdZexQGcQHwrz9
         QllzkoafHCCVgm+2gxQSALVXI6qGA2rziT7QKYlKA6f35cNxkU38+yBeAcbQLIfZJgbG
         oIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386208; x=1753991008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3/Qfff+MoqPwHhtX3FSg753RB58bl1HwzaHnvCqAwM=;
        b=YPKGjIoHkWZpuERNiiKjsvUbcWrvwMnQrwbkfeaScPOlcIoiuT0lNOk94ohKVi3LG7
         fDb4eitbpe+E/GeA4xN7mZpsi2wsf4Vb/eymwW2EYZXp67LVsMsAOLAyXukSl+uh1jLe
         k6+urzRJpXXD6tCkHLX5F4jC5gonKn12KZbE6dixvnwkwmPPdgirpTxDZTsRg8PgEsx8
         sg40GsBM6gMx/VKRFEY0vS2g0oMOVCbKUNCU0/cpxG43uST/JPZsCHZhzoUh3SzINjiU
         ojLLdNM1w2VuYFE3eLj36daz550QW60OoUyXX3UwyAs0wpO06IUbd9Jap5XUVZ50HHRH
         1soA==
X-Gm-Message-State: AOJu0YzoGp2IZy87SQ/+3OpxRm6XJThl6ROUwHsHIM7sYeJ29JeK5yBu
	TwPPvGek7G9ruLtan4DRLj/G5vQb2llWxiSgQ6/DMSs3BFLrMsPh4lrcPmsX/vkfiSa0/PF7OA4
	5n92UeOZPBJ8gIUslI6+WWEehGJ4ikLvszNZgwdqp
X-Gm-Gg: ASbGnctmUcn0FlsIDH2gfJWmmUYhh+YTonLsKke+pAIpZhm/c5japSBvYM1w2hWugS5
	sDe9T96tSNSh1n5M2R283PAIJO+/nf/zGsT5YGcGyfcQEcnlgsp3/RNOgx6mnaWDwd1/heXTrEw
	y697ARxUUgKJ4Tq+I7PyUBTTAljhEBIn20agsRMlxT88hACK29umafR+LAezg8YnvLkpzMVIt6/
	VvI+i2T
X-Google-Smtp-Source: AGHT+IEJXTUMtKf9WUEYieIzzqOgdbbD44V9CUoTAHleAc1QgRFRzG63MnoYVM9dHoyIuJNxvwtK0SXAQAcx9FqkZIk=
X-Received: by 2002:a05:6000:420e:b0:3b6:d6c:a740 with SMTP id
 ffacd0b85a97d-3b768f12c2fmr7238924f8f.54.1753386207467; Thu, 24 Jul 2025
 12:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724172005.11641-1-boqun.feng@gmail.com>
In-Reply-To: <20250724172005.11641-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Jul 2025 21:43:15 +0200
X-Gm-Features: Ac12FXzSYxR8EsluxdqS7KPCR4B8Ka9Zn_z3dos28qvERgIXeElszOdjjbfHGcY
Message-ID: <CAH5fLghU_3V4xS4npv3YtL891pLGcp=rp-CcBb0Tq3g4gbdSDQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: list: Add an example for `ListLinksSelfPtr` usage
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	I Hsin Cheng <richard120310@gmail.com>, 
	Albin Babu Varghese <albinbabuvarghese20@gmail.com>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 7:20=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> It appears that the support for `ListLinksSelfPtr` is dead code at the
> moment [1]. Altough some tests were added at [2] for impl `ListItem`
> using `ListLinksSelfPtr` field, still we could use more examples
> demonstrating and testing the usage of `ListLinksSelfPtr`. Hence add an
> example similar to `ListLinks` usage.
>
> The example is mostly based on Alice's usage in binder driver [3].
>
> Link: https://lore.kernel.org/rust-for-linux/20250719183649.596051-1-ojed=
a@kernel.org/ [1]
> Link: https://lore.kernel.org/rust-for-linux/20250709-list-no-offset-v4-5=
-a429e75840a9@gmail.com/ [2]
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-4-08=
ba9197f637@google.com/ [3]
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
