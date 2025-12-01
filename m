Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD23AC15
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 03:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764560670; cv=none; b=meFE+MdmV76g9dw5ljgBDnSwtBbTEhhsDENy615GpBTfsq4L4jgA+VQ9V9X77FGKnTinMe3uwHr9blqdPMaZSAL1GVmCB79CR8rM0HWNxtPW7jz3uxxQVT8qt8/Azf1QXMMvY74z8wk1P3PLuNIRd1phAP3J1B9JREQRsU0Y/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764560670; c=relaxed/simple;
	bh=Ou0gmbzMJ7WK94Bry/1yz4qCJlQddnWcuASNS8scssc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IX4km7bDidlOy4kRRk8R68fuDz8DzPVftkWHdA1W/TkinhVkL149iPWkgyunPCLHuvAIY/vtebsxuKcicajuJ7UrmQ5C+vxauiKeE86o4AKrecr8nrL9tyfgW2FrA8eiNEFgQaGRVDAWd7fttdT8FZ3wZ2LpQDdqGLXWN444u8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIgEajcJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIgEajcJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b90db89b09so325239b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 19:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764560669; x=1765165469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou0gmbzMJ7WK94Bry/1yz4qCJlQddnWcuASNS8scssc=;
        b=lIgEajcJ7iqMF7e+IesLpacF5hYzXZLNsdSzLaWqA7PUkIg6rJRgtO3bdnb9jrS/qh
         0X48alvfXzq891I50CKviinww4d4/CH7OS2TpAE4zO0TcyEEGn0ZFuogb8+pZGRU+pQh
         WHTKGD01Wz8sgD6uwDDF/d38NJ//svYN05m9qDBF5AqPZWWtyyVHPV6tiX1d8gHlJfp5
         YUwUXkdBYXbdlWcl7/Av6CbO3X8Qgepu/yY1GPbKPc49p/AbYw/La4dJZhdQ6tvI00oG
         aG4362CYy9pGQ1IT9nVSTCYsrCGE3KT+tGVeCItg1uMs496fay3p76THSB+1nxZu+7ID
         4lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764560669; x=1765165469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ou0gmbzMJ7WK94Bry/1yz4qCJlQddnWcuASNS8scssc=;
        b=wNsAb0a94Qmcv4lFtc9IvrGf2HND696V8FkHN49ZvmHVbnBGD7Psr7/zoE454Vizsu
         YggWQAImitreAcJfdIs/ed3CjggWx3OxswW8PdVXFL+0TyQRyAm+eTmEeqGybtIz/Gr9
         PhgvrXB5ofiztvTQDf2WbsArEskgPJPqLyaxB28kWMvpmr6zERd2UayU7ZViP6DQMiXo
         cj8YmLcS2x/94SXyTOaR906f46xinwojl17pZmFseci65i/BE0GJCH/BxXKODGc/t3Aj
         EF8mpp3iISZf6nRT2ZTd1SvtNSi5K5xRF0vXI12JP3Z83YOValWYz4Pnq2sxraf+Zl7g
         J8fg==
X-Forwarded-Encrypted: i=1; AJvYcCWI3kI0Y1eY116x+SXsVr7xKkNTJQYq30NRvEmNHhLsbXdFqImk7KSnYG4Usm7bP8+UC8xm8Evtjv0wN+VDDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAboX2vNMhKezemp+Dz7kqVe3DpwDE+Ue53JzGzlVnNI9ch2xC
	t2CuqB20+ad79mE6OmwfsuAc/OdgofDIRHMwz9drau5bouxt8aR+zeo2OrS81AHjFvdupx0gpnl
	xKE0vkxnqRiRxdqTwiIqLFE5obAgleII=
X-Gm-Gg: ASbGncs/NfUbMDm3kR8scvCMY+c+tPeW+J6kr2RBWoSZrTZIlLVQpw8gojCivKD6Ivk
	AWzsh6VRBAo5HShv+BMNFS04PgEVsmn4HVJgGTabyCqQ1QGYYfsHlZkiaiH7PwhyXcd/AM61eB+
	UoBOYLt7IL5nKy5ViILM9ixT3iFVZY//i7xDBzEW1BbfEJ9POSWHdAtQbPKeku+JTdlDbRfBFVv
	/lattv5vnkJ/prwqo6lvOHN5adFexkeZrY2Ey3H8KnS/5I0BJjC4hLBFoy0/gMhW8DfRJr+zCy6
	XrgT90HTH6TcXY7hXK2nJKirL3trta/MLBrkziD5SwN1sKPs/xTk0Ho5oVTQ0nlw6bAibATE8lq
	fTjLOdOQi3Vmg6Q==
X-Google-Smtp-Source: AGHT+IHhNcWqRjdE6WDbqGV5LBjVOXOtiJupgTDpMN/BHD5bvg+7mk/G9awEzawvfPY7kxZnoDvZNeO1VjEWibhGEyw=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr20563195eec.0.1764560668750; Sun, 30 Nov 2025
 19:44:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-1-a9ea9ce7d45d@nvidia.com> <db6a6b28-c0be-4bd8-a0b4-70431df7737a@nvidia.com>
 <CANiq72nGUuK9VTYJGob7pnXU5zuuCzqfw6fezAFpbqvte1sDFg@mail.gmail.com>
 <46b5eef7-2e8d-4801-93d0-6cea10f62dc9@nvidia.com> <CANiq72mhXajwj7HjiW_HQq9nO4o-HwBFUya3wjT8pRkWx3xjZw@mail.gmail.com>
 <7d157605-4c59-4e04-8c41-1f7a4c86b34c@nvidia.com>
In-Reply-To: <7d157605-4c59-4e04-8c41-1f7a4c86b34c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 04:44:16 +0100
X-Gm-Features: AWmQ_bl180v7rn5R3N8zrZku1MYd5WEe32glG3ozOy5Ktj495-Rh0sd4fp9o8pg
Message-ID: <CANiq72n0UkuAtW=2JZK9Y7TK4VO8rKsMSvpv52BsW5+C2z9Dew@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust: build_assert: add instructions for use with
 function arguments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 1:52=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> More precisely, it was already *hinted* to be inline.

By inline I mean it is marked `#[inline]`, which may or may not get
inlined, but it also has other implications, e.g. codegen can get
delayed even if there are no callers and is concrete.

> Then that is conceptually wrong, because it must be a runtime check.

No, it is not true it must be a runtime check -- it depends: you can
use such a function in some cases just fine.

That is the point of `build_assert!`, after all.

> Sorry for the fussy detailed questioning here. I'm trying to bottom
> out here because CLIPPY=3D1 is a very solid requirement before posting
> patches.

No worries, but I don't follow what you mean here. `CLIPPY=3D1` is still
required to be clean etc.

Cheers,
Miguel
