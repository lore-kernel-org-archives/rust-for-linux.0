Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091C30E856
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 04:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130411; cv=none; b=GZNFX/XmwxxZNdUzMv+cICYRbbdVXx+eDQksOgtFB6qVTg+JByjbQyLpsFZchxRchb9wfuigxuUflcEUMbOCUM3KCOFIF5MUjuV0IshmKHsvtYbGKLQ5tFy3KYx8mSEq8xHr7ZEJmQ2/KKSgn7wZP9loeGWhZiPz/qaDPaaV060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130411; c=relaxed/simple;
	bh=MGDxNpIloB5vIbvwQLeKPI+FxQVeoe2nX2rYlo/DI1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwGdeANkJJ7qeVd4D0w8Ksd455EJdU27dczILkNUK6zBlY5Cj1A60H16GuQxri+XiWGexT9ZUQeWinsfu1fCN0Ofg1esHhGSB9yWUBSQMjKLZCAS9L12DUrGMSglHgyQsjo21bm9X/qcNe5rXtnTdosQzGnTst/YiBbjV8jocRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhYtAY0V; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhYtAY0V"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-43377ee4825so29299865ab.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 20:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764130409; x=1764735209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGDxNpIloB5vIbvwQLeKPI+FxQVeoe2nX2rYlo/DI1M=;
        b=EhYtAY0VN9JL8Rhy6krZQ3BG4gns3vnbMLR4BYAkirvC7OaOdVCl7pWxNJNIPMA+cp
         EfgYwsaN3dicbMdA3F1XggV0XDj6esF6jSrdSEbbNRV1SGnc8axzhRmK4WzgPqLoUfBj
         71OLCFH0c02ppJBmTrlYPo67bsqNvliURPjWGLmASd5KXiLVucQzS6IDMpmNBm8kjW47
         OVESm9embwXd+4EKKVMSeIgWeM/fwGRTKwHYK5vKSIZVjr4iS17AAvXGzwqF2/1X6igh
         JxvBqTqvoplD+YpVwm1y399xFeum/sSPAZV/txHc54FFjIaMQ5e1jY3OVnnqw/iPcHu7
         dWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130409; x=1764735209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGDxNpIloB5vIbvwQLeKPI+FxQVeoe2nX2rYlo/DI1M=;
        b=f7BNoiklw3nxIkaEEe0pD5SEtug51eHJhpL4YTX3Xth9YIhn/IJpH9hLM9vjrMTX6o
         m5KZACJuvGfLzARLbdN/nz56a2pXFalA/I8onzdPu34EV7Xooy1Es9tSNn21vob7Top8
         OpSxh0lAubOX+SpO9b4ofDI//yS5q/XrUf6YsimU3SHfp7xUbfT8vFsF2rV5BLavq8oy
         MiLTsPN7UEoZwsmaRHQVknhc7QnT52EArGulIxAmm8wqlLQ0R7RLz2A1r+qFxVz4aFoZ
         6Jloc2gq3SwMQbMg4SsW6Em+J3g35XRW/XfKzPq2NbJHRa2FTuljXaEF2WbzlVm71cfF
         g2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXr/NGt4kbguUE11HFQlywLLoCkg+q5sFFwFg2HkOnmYfMU+Fx9v69829a1cuwF5qcCuStW7h6D1GOdRAtCRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82P2CzxaXV/4e6gp2lENx2TVxXwtNniKJc97QWYESLNXABl/k
	WdAAFsDu/wAfJ32PBs0F2Fa1tNHHfJlmmAPCp5N6lGT8B9z90qyBdpvrnb87rZF4+Lr4CfSeNOT
	2j2pPRVbNVsgG+VWqJ9bVqs77KKBZ/nA=
X-Gm-Gg: ASbGnctV1+h4i1ypIf1yIEvXcKJxVkEuNZQC9SmC7tsk6ydqedD26OjmNi542T3CEJI
	9WFXK6DQM3UwiwyMvrUhv2Z17TTsyzhYF8ZjIyzd/LBTEFTmzPpsFeqm1wKH+HyXbUig/Ani1YH
	bxyT3T+BDlninb4+Z441mTEBW9elqBk9vCL9BSDzMAyrGLKSp28EJvPz8ywDV1RKyBfZYk54E6U
	eJnILM4XsR4VLxDY37BBW934u/O7okrAivj0ttjix6Pltpox9LdKnlgJuh86yXYlcF6QOvG7H+P
	gsH8JG1HLl0=
X-Google-Smtp-Source: AGHT+IHkrZQbDTb5KIToQHK6gP9+ReX3wNBHpwbIVC36yGMZXuMJbSiF4Ed+xu7lxDEMsY7XmkDJrcaxE7y0gTb16Zk=
X-Received: by 2002:a05:6e02:1a0d:b0:433:773c:b5eb with SMTP id
 e9e14a558f8ab-435dd0fcc3emr45657035ab.19.1764130409086; Tue, 25 Nov 2025
 20:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <CANiq72nFu2vX7vOWtjutj8574Jy2eGvj87ryhhY_PxFHWSOh+A@mail.gmail.com>
In-Reply-To: <CANiq72nFu2vX7vOWtjutj8574Jy2eGvj87ryhhY_PxFHWSOh+A@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Wed, 26 Nov 2025 13:13:17 +0900
X-Gm-Features: AWmQ_bmZmZbzCg7LArTaQ4DhJeAMABr2KiZl97jLALYLSl2-vuIrjtsverMCSN8
Message-ID: <CA+tqQ4KJO4kHi7CEBQtebwSYEussf0s697ZNqsTruiTSpwhVXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: syn: make rust-analyzer treat `std` as a dependency
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 8:57=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> For something like this I am tempted to rebase, but given you took the
> effort to write a nice commit message, I can apply them.

Feel free to rebase if that works better for you. I wrote those
messages just to provide enough context. Thanks for considering the
effort!

Best Regards,
Jesung
