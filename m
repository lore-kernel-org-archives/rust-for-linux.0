Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537A3009D4
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100502; cv=pass; b=Ejl0Ltix9/8i3Zk3PC1Ob1hHOOxmv0U6MV4h0bzuCEY02miscJD+GhiOwtO+Jm7rsX7iGyX3RIW7v4rGQwpHFOZDIp3OJS/B43CMEZR+fPKIgHGZmBlklFGtPkhst7TEWxVsKjW21A47UFnifciubLILvHiqSSf6sw6E9gwIhE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100502; c=relaxed/simple;
	bh=E37BO8hDdA+Rl7BL4jzarWentIvaF0FL23SOtM4G2kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlShvl8XeGQYJbeRl6j05GAVKtDqViNHrGVbEQ2/xIrrQz28ERlnN2OiG+qSeacp2A8vcj0DABmP/Jn5T4Aa3NEBdMT6BzZFv8IT2Ir9pHded4PS7jlIrap8Ij/kr53LduMMGJMue9I4f2ojcXkS6smjbl1EAQ77cXBJGehwK1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZZZduyM; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZZZduyM"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b8095668ebso186756eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 06:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774100500; cv=none;
        d=google.com; s=arc-20240605;
        b=VLMEwnLcV90XJkzWD5nph4xls3fRlXiBz2kMRw1Oe91oTj5DTjSQlGjqgsMN/EBAZ8
         3o5n5S7G+7if5PoptIxzPNtzEaQF6WcR56N7rDCEyEUZUWcSz5DPkZvQ4ceAXZNxdF9y
         uAHR8OirFkumkKiHI/TCh2gRrOvm2uR0Bwyrxj/Tq1i84FKBkPPp7HI2pfn+fVd+Vuvv
         IHCBBROS+XJiFlW7XMx9DIKGei7H9GpBIFBq12cL0Ofn8ZUu5DNkxbJxXYn6qC5+Rwhx
         Qbu9kxv5yApEN2+Uz8Cj41a+M6W3ZylWyanPw2EgEZS4q18COUJapz0Xtftp+kJ3H0m0
         y+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        fh=qBuoaO8aZ/B/9QoZ+2TxBCI8x8MhrS+5Cya/5MOadpg=;
        b=N7g6O2Qq4WIV05NZ9hP0sLc8mDlHUxWFCQnHDlxpBc83J/DpoA/3Xd+TMDHA3JYmck
         h8kXvdRACP4mEDyCY3hyfd1qQKRn8bnwqbYSPuKB+wkHI8ZBsB6z2gfBRqwHviy+Lclu
         WPN7KrlTaw1gFh2AIcApJcmfYQ5d/tFN9cDDAP5QX7FH434pOJEO+ToWD2XlqRw8y74f
         FeQ/w1A8nx42dBnaN2u8p9BkptDIqVMwTMFP+dHq/bprDYDFke/XdRLFo1lhJ29L+63N
         xsTd6Apmc8gwCObU+f0fyddPaSoXJvTyd9wkS3en2lFGyCII08lD2Jy9DP2v8WnL65kv
         1Q0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774100500; x=1774705300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        b=JZZZduyMPua2CEFOIXBWpm54rZVlbfXVB1DgxchOM5vj4q9iA3zQJ/60i43RMqVaXI
         +MYGHtosY9TqOzHS8W3FyZRwtS3y9WJ0gZIe0b5Kp5QKQ9sTQBGoiISafGCT+1OhQHvZ
         7+0dmkdTqJF11jgmK1uhvyOwflx2ngeidAGoZOXkAcHeV5KzswORWuUTi0jx6dU77OkP
         +YoDPMgBydUZ88V7ydNZQqT61gnuCg2K0ou/oDwg0Z4VLJlnA0T+yImGjs/7BAtqcM6v
         XQGbZ9DzU90elmvETgXKjMaVrfw3uYoc80tULdv7FLVjvsRYqPXbz2IwLqJFOR7hP5kb
         KJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774100500; x=1774705300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        b=Y6AC/TpzTcY4EbTSysCmxRlhoUSGwKzEWuaosP1SUmWo7TEs2lR7WO3brx47vIAj3f
         zG7kF44idhU23tLxXMjnb2veFCKr2hvqbvLt0dNZRRZ4A+3kIaHW9DttN7KYOY8t8Exc
         g86KLKb/cQfAGIS7tvJKluSCReokJqZArk7UQJDBM+Hb4gJwUScfb31wqMOx99g/Z8kE
         kSy6ZtlVjh99OXeF0bA9iFIVbtkT0JI7dEWYhqpBmoja/QD8Ga1B/fp3jfkosgEY0hky
         lcxxnKRuLkAdakITrmuI+bkCk1IimQGf9Oe6764sWJ68xnG6YdAULNJVMqgDMHo3hLah
         kkdA==
X-Forwarded-Encrypted: i=1; AJvYcCXQcVkEHzFjkZS/jNX9unZ0sxf4qjhHFEr48EpjeNUhbgY0cINKxIG8jxYql39U32lCj0L+igrgw21F8y0HkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCcSOkmYRk3IiD7Q/88zE2ff1+kyagYBH4AEtPTPaCE+OeTSU
	aEi0fsez1t+BmMfyIiv1kTi0I/AFEjKn/LS29xWvL7JfZ2emMw9uasA/RAe6sMa78/L0U9J6eeO
	a0Yl1Iw+R9nvZNfM4Zm3+5aJvjld9Ojw=
X-Gm-Gg: ATEYQzy0qb980iFagRBgMu9tO+jXSthHL6Rp+ZIe0P7MkxVBW0PYkjL3vABWLMQ7sb/
	OZY7ijT4tGSEzEaRizu1C+TJcK2PXwxQxsT0urldhCCiyFo2mHZ8j2zwu1ZLu240L7ZxEs3irGY
	uQoy81mo0rtAtQi9J01HL50CDaqEOvTlidnRzuQr8ewpikj1INS1GBXimbg9i4LmbR3APBLSBLp
	jkw4Dd9uoH5QSsq+1FU+lO9x/63BUwb5Hvw1CPTagJU9B7FPmGtmaXCA2MeIkW6xf2no8k1HTmT
	JB5Z13tknuxhV7jMogaitxJakDZ2Q/M0zINxsxzhWwblmEv2FOY7NNL5cs9aB7GBwAwpu3slQGu
	OmEpW8A/TD+ZTviBgI+PVLwM=
X-Received: by 2002:a05:693c:3105:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2c1097cc851mr1504671eec.6.1774100500037; Sat, 21 Mar 2026
 06:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
 <DH8HDA6Q6FU3.3JR57W97IO1VE@nvidia.com> <DH8HYCAIRCZD.2DXSNBFXXT6ED@garyguo.net>
In-Reply-To: <DH8HYCAIRCZD.2DXSNBFXXT6ED@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 14:41:27 +0100
X-Gm-Features: AaiRm51Hwdlg5eHPgbbbJ8KEe0n7xAmw4NZpb9mUA-Y19mwW6yxZqTznI1K4o44
Message-ID: <CANiq72kamU+XqG8AisK8uk9A2vkJeo0xcXZ7SJiisb9KMLK6ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@kernel.org>, Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 2:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I personally view them all as variants of BUILD_BUG_ON, hence the name is
> `build_assert`. I thought about `assert`, but to me that feels like it's =
going
> to host runtime assertions.
>
> I won't be surprised if we're going to have `assert` module in the future=
 to
> host families of
>
>     assert!()
>     warn_on!()
>     unsafe { assume!() }
>     ensure!()
>
> etc..

We also have now `unsafe_precondition_assert` in the `safety` module
which is essentially a `debug_assert` at least for now, which could
potentially be moved too.

Most of these (both build time and runtime ones) should be in the
prelude anyway, so they should be easy to reorganize.

Cheers,
Miguel
