Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29D304BC2
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761314072; cv=none; b=hfHi2nUolzAW0l60ZZXKac8TiHapuf8V+RJx/kCIZLhOFcGtcmUU3f73/3WdU9q3LjtvY6SfLOg1X4UB2bTjQ7+vsDIUcaeJ4TFo+8IGwLYc5g90timm7yKXO1C8C+B4QUZisuV2YT/xzt2Opgz2lj/GNr9Ss6mjgVKxYRVjcYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761314072; c=relaxed/simple;
	bh=mFPqZ7lcHU6mlGWmcBgsIkS8SwEYC/BkyAYxUSkXwmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BT6LjXMv+oMS8o7YD73tfR2z/tcIopY6a9CNBTN1o2iAycvnc1ZUQfT63b22jrtka47cqd6XhkczRBRxfTYbwso4dxSOpiqXyyoOkuxoqH1KvbHbcCT5LAACvNV7TxPMWgrYjpDcDr+mjNF9f/87SGkgjQVmX+2QgAnXxu3V7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xG7xPBUd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xG7xPBUd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42701b29a7eso1125724f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761314069; x=1761918869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3YVGaDHPIrEF0+J3rTjwqQ0+SMuiEnEMlyAprP2W6Q=;
        b=xG7xPBUdgLOcH6TVd2yzs2a7VfHR7A7Ez3NDCtuWkMXG3X+SrPPp+iVDIVKY44iLFu
         bWL+NXBE/VE1WQB2pw4X2XTPrdd773HlWxJps6Mpj1ukAFA4i4dLsZ6ZPXjIJw/KvMtA
         kKF8Hg4dyfW5af+wZT9rPCmG7l/rfiC2bv1nRMBiPAue6DbBglV1pWkjGtFjRoXHaSmM
         tL2MAGoci53APnQAtjd6uOpjqaZ4WQol0DecTbHmCvy/fFujZn3rfoJOZADGgN7Mff9N
         fUzAkee6AHR5H3P22gv0PdGlEp5OrZQHn/zL4AB4no0hIgjKNtg84sD4x9Vv6RxpNyoh
         XEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761314069; x=1761918869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3YVGaDHPIrEF0+J3rTjwqQ0+SMuiEnEMlyAprP2W6Q=;
        b=nBnYnaD6gPN2u4bqo/RF1skb9KzqoWWiDR+2fSAfJZc5kgDny+03tEnobWXTyWfX9I
         nsPb68OWzXO4YE2Z/2bWgMNYvfH3HJcICFlcBEtpa5cglrjndwON16zKkCgjk0wvUN9p
         SNR2FH9D6/ixfzaikIKEbYlZk0zYfXYNQtEtSbsSpvZELJYousnHnD2t13GXKbSLltFn
         zIBOw0N+mDdjw+nVTYbLSTfbWjukg6+kvi1zjXMFTcAtdx8i+WAGZb0VfsnD1WNd6LXV
         Bptq7BQBhrryIbHl6BlmHJIcSNBKBj+CQLW84DTI/U8trj9Ei+1gMk3UzW71wOM/OfB/
         0uNA==
X-Forwarded-Encrypted: i=1; AJvYcCVQk0UMBjCGoo0q4kdykJZowUPunbxlPiJUBMtqOBRyDGNnQkbFG5QRHbAOZcex00eMJoC1AFBNFY3tMdpuBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywds3aAAJLNU5Rm99MRrhlkzTaVc/sz+xP2iKqeYjuvw/z3iudc
	3MpfHEYCtYnhIjzB5hvBvravFSivz3JCl5OLEbMPntoEr0zz9L39t0tiY1QnZd7KThb2aGTb0hJ
	OX08VzGD1XxawAdAu7NbCmU9TcHV3XiCBa9oGT2Cd
X-Gm-Gg: ASbGncvb03Ztw9qEnTSVVzHFM32RXr9FNTpH6In4Meyb36jSGHsCroq+X0OypGnY9r5
	L74zR6RFJLYtkaHINsIygvEUP3+lrZ1qshbjPpDR4jUWRadr65HMUIjl5oWvNaueNjHAiXwHC0o
	iIc5/CA4G9zSHBhvkDop6Ec1aUZTciQVObMSZF/I3MEO/iEOOhPJ9I6I8IfCBLvjVWDbvdil/KC
	yJs52rdluoAwesEBZ7okVolw4PREllMmLSK5fvoQG16TnAg3eq0Fp5Z1HYB6AZ024o9RPBqx4YS
	EMyk+RRwdO1hO0pGDp1yNHXr
X-Google-Smtp-Source: AGHT+IF1N0olLw8fHHUXcLBLBTrI5wHRX9b98LtLqIwPO0KsTyMtAix3pFN0UXTb0/rflAGbmRtHLcOX9gDCgX9YamI=
X-Received: by 2002:a05:6000:2512:b0:428:56c5:b305 with SMTP id
 ffacd0b85a97d-4298f50e774mr2481458f8f.6.1761314068545; Fri, 24 Oct 2025
 06:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023171607.1171534-1-yury.norov@gmail.com>
 <aPtDGA0JjmfDvxXd@google.com> <aPuDAHzirb3Arl6h@yury>
In-Reply-To: <aPuDAHzirb3Arl6h@yury>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 24 Oct 2025 15:54:16 +0200
X-Gm-Features: AWmQ_bmARHYHLoEV_J-uEMCd6W0X1CxW0NvhAoJk5wl_hQq0CvBggKOiQaJ51I4
Message-ID: <CAH5fLgha=6v1voHc3pF9aSOUz4Bain0k3Xhvn0rh8m9+oL_7iA@mail.gmail.com>
Subject: Re: [PATCH] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 3:45=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Oct 24, 2025 at 09:12:56AM +0000, Alice Ryhl wrote:
> > On Thu, Oct 23, 2025 at 01:16:06PM -0400, Yury Norov (NVIDIA) wrote:
> > > Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user wit=
h
> > > CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> > > is enabled. This pollutes exported symbols namespace, and spreads RUS=
T
> > > ifdefery in core files.
> > >
> > > It's better to declare a corresponding helper under the rust/helpers,
> > > similarly to how non-underscored copy_{from,to}_user() is handled.
> > >
> > > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> >
> > Overall LGTM:
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Tested-by: Alice Ryhl <aliceryhl@google.com>
> >
> >
> > In include/linux/uaccess.h there is the comment:
> >
> >       Rust code always uses the extern definition.
> >
> > I think we should reword this comment as part of this change. You can
> > say that Rust accesses _inline_copy_from_user() through a helper, or
> > similar.
> >
> > After all, when using LTO or other mechanism to inline helpers, it is n=
o
> > longer the case that Rust always uses the a function call.
>
> It is actually worth to just drop the rust part of the comment - with
> this patch there's nothing special in managing the _copy_from_user().

Yeah, makes sense.

Alice
