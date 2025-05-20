Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D465610B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747712813; cv=none; b=tLRAk8cKOG62u+K+q9gDvj/aKTruFp0RS+L9PhmUQe6haAVd5q870DCLi+2yHIAVwyrxgYHsEm0JJmCT2j5V9ha2KNA2AflLhhgGx5t/mEVlKahplsQbD67atJouAr1G6fYNzIuoHosTXoek3Mg4OMo1JSbmFPqE4iNVJDgYjTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747712813; c=relaxed/simple;
	bh=pmf0OABuw1tiISrsIsaVzQVJBrZhs3leREMC2fZ3sd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UATZmN6ZYT//yolzW476IIQpz8/i92IuFI1BN2WY7X4+OP19gGsIJW7/yq46q3FtTGk060pKu4qawEoynQXphn39zYEmaue8m6OAjMQB8MpDujTt35svEVlw4f/tkVJnQQYprC6dwEpmGaEugXYKMLY5B/GNWtxDuiKQ9g1sVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYssbrFq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYssbrFq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so41242475e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 20:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747712810; x=1748317610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmf0OABuw1tiISrsIsaVzQVJBrZhs3leREMC2fZ3sd8=;
        b=FYssbrFqRYM1iOC/2obP0do/yOS6jKgbCH62n61DE0GZsszUiBnksjHVpeXq0MVhTO
         9vNlVX7qBDsyEVRh2InFe+NwyQr4PSkPjRJYCrQwNjeRBBaxtlblmqLUMT+4jArL2HqC
         kWV1HSLkeh2nJtGX/bRHwVqqEZB7RIW5QFCRrwa4Bz5QkQBavTLQ10RN9+4G55grlEaB
         z23JiC83LBVQBdJvj31AVceJzNGwfZ+CWsMYzzoFVaPTULlI1eIEbmVRo7AKXimRjq2m
         kNgLsWMIy8DXHobvLxsex8f5CSpcLsieMDD93AswSAG5RCtjdKwYnhB3lCSa4t2XpXKv
         Rotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747712810; x=1748317610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmf0OABuw1tiISrsIsaVzQVJBrZhs3leREMC2fZ3sd8=;
        b=m59KrXqXwcko1l0oDhqWOLAPsVlk9UwIQdFKtpH/NrmR39zMdcsg8niYTAxmvyPFNh
         G2o08HIIn+1jBbyG+i3Jc5/TNQbnQ9DVSOTopesO9cwDEwDCYBV/M1eewZ0wjzCG7HI6
         fCDCGKlRny6QgMKBtk0M/q6Uzn3LGz7wqJSlDEgOq1kq6q6NZ16707+wRZXDtzvld+sd
         cGmG1JyeSa9j4UNrpllkYuZ38q3BpeZTLPr820FuXgcHUz5UPKP/ucOqo17V4k70aNIE
         1hvSxBc9sbQpvAVEteEQ4T0qLzZQJidAdKW3T7B8CoNGzpQd08IFJY1LIPbeFg3ImXC9
         33iA==
X-Forwarded-Encrypted: i=1; AJvYcCW0+BIiR9Qw2PXX9XiAmsSpj7HjL66EYDZrLGPi/smvvd/WCAzIYMOScMU99Q2mgbbxrnsaqhTafPgg+p4kYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaAwiozFxcbPdoLIHrlkfW6cNkQO5RazzpMv4IKswhu4HhWaSN
	LQAKZQ123W6ko5D6ZUnTmSTdFWAS3NMyQxOOq/Dtz3G+c8qnwvlEDmoNFiKJCCUjiR9Gw9wecYY
	Gg09cuf5Dp3VncOavNIqhDsrCzjAy93tt5vgEoreA
X-Gm-Gg: ASbGnctaGowIYsa9RlJye2+AevKTrszqS4N0op01KDSwQepfz1FsTw7/R9oApQykJ0J
	lzmQCVJ3LVl3o4a8V5qkQoJfMLJ732ixSbBBHSFew/ZxOWwM0kHKrR7jZKg3kn7aFzNsbyxObRt
	+09rGX00P68IQ+BkqcBOMVq+j80KjlfESg7zEpwN3T+v3Z
X-Google-Smtp-Source: AGHT+IEH4w7W7HyODRCQeOS8w3rc69olaTDQwMXWcmtqPB6hsgHcREDGXnQIFqMSjwf1mnFEB4JkzVYh/6w6/H2eTcM=
X-Received: by 2002:a5d:598e:0:b0:3a3:7734:729f with SMTP id
 ffacd0b85a97d-3a37734746cmr2407078f8f.13.1747712809786; Mon, 19 May 2025
 20:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
 <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com> <682bc528.c80a0220.13f632.9ec0@mx.google.com>
In-Reply-To: <682bc528.c80a0220.13f632.9ec0@mx.google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 20:46:37 -0700
X-Gm-Features: AX0GCFsgGWwwT0ZDs2CF0ym3N3QEoxbyaDEBO4Jo_3EygcBDWYfnG-1YXAo3H3Q
Message-ID: <CAH5fLghNJYjxPFUc2E4-2pJpGT5umUr1EJstZvs88ox3MsXDGQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Jann Horn <jannh@google.com>, Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 4:56=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, May 20, 2025 at 12:51:07AM +0200, Jann Horn wrote:
> > On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wro=
te:
> > > This is a port of the Binder data structure introduced in commit
> > > 15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
> > > Rust.
> >
> > Stupid high-level side comment:
> >
> > That commit looks like it changed a simple linear rbtree scan (which
> > is O(n) with slow steps) into a bitmap thing. A more elegant option
> > might have been to use an augmented rbtree, reducing the O(n) rbtree
> > scan to an O(log n) rbtree lookup, just like how finding a free area
>
> I think RBTree::cursor_lower_bound() [1] does exactly what you said

We need the smallest ID without a value, not the smallest ID in use.

Alice
