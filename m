Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC7372B27
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734552; cv=pass; b=QvYqgwQyX6JKGlgKUy1lOeD/+I8U0aglAPQknL2Me//iISSxhE3bzIoZ68pstApg6y9ZtNI1XEJNkVK3KQYemK0eEuaO77ZmGDS1aCL/Xq2JQ6sgIOqpm6nPxZT3QG9BFFOkrDPCht0GwxKuagHrk4aGu3AMb+idOoqCh07ClkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734552; c=relaxed/simple;
	bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzPYUGSiXh42E7odGG43NFNrD6SxbkSUKhf5Gm6cKsQmXfif2ep66Mm/d41Dz7dby2oCn0+OdV3wUK4OMh5D2pfWW18/PwkGCWW2vwjLk1LxQL9lsyPEkOATfEGFGHSc/YEVw6WBDfDL2Fx32NGn5R/bBzj9n+LqZz4kMrP2DAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=couwyBty; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="couwyBty"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127337e3870so279921c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 01:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773734551; cv=none;
        d=google.com; s=arc-20240605;
        b=hx0JHMuM86h47Hb6dwb0KKUZ/eHFr45Kqv7+2VFjk87IUl6lKxHS+qtwsSLOkdt4vN
         YD3B0d+aXP14WKpxy4RoIfCmtterANEe6nwHhmQ1BdiVHkV7Qlt9pIX+LOHe0iZSkfyN
         i1x3L/7uU0kgCYVLCPUdxiNkhN1QZYovNBqpBdV4SG+oWUz+8gSTk8ukZaPCDURj9QQg
         S+oOWzdf00VyIlFiQI4C3l4xk2C95LQjxFveEn8wZdQpihDA6fgxoqwnK7Ux2dHtcHcd
         Gg5RGjgZKsDQAWDxre5PqgTbdJ3WF0APJ2g4TTCSQF58jprH7g6P3B2qgBII1k0OLi+e
         k3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        fh=CUny6EJ01ALTah8ET9xErTVnNo27f2VO531HzamBuqs=;
        b=jpN5LoNPjCl3QgvggtZwQlh1MS8qmEo7GNbQGWQBqgU/H4SDJ9u+wRwu/8PXGlRbFS
         IoZJZ7O/qkgzCxgIJih6iIbubYdT9eqv+NIExuVV8KIQeus/fC7jOaNExvGCos76Vp1/
         kjQRjGZNvMR2Bfb6KusqLqmHufZE6WAB6V11Xn7zawDTxNXkSJuDDBy2g2wykA/Jd0K3
         77QbBVu5v4fj1ra2C6hDriKF1+JoIsmaZsrbN6nzfNejyK0P1mvMFQdyCPK2MF8anVve
         uAX3OSJwzc7Xa9GP8lH1q7XRRRbAuCxQb3Fk+XX+55v7J7VXP3nMPjBuhm9tZTreh7GB
         DN0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773734551; x=1774339351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        b=couwyBtynGBaImYXSeyyFbfDqGBmNC8xydtv8C+uh770JC3c14pSXt77h2/k7wzuJR
         hEoCP9T5mBaPDFkNm9cL0g2tsbzAjJaTtmT1MrvwZqcsKaDkTtZgFE1vpr0LkGjMTo2N
         bBVC2aUIewuKYO6zyT4tYr13pmHpSGpfKYvSlyYgmBpvZqNo6yRk2S1+2Jz9pudcO+/q
         wJGCVZr7zp+jN9mDr9d0u72awvCjUrCf66lYWfKyMG2dChwV5J8dqZfSS8L6c291U9+i
         +k1eHsWvZTdR/BjPc1PBnkyiILhYSvEz7h3ZvbYLzgXbjfPU6Xe1h4fBWZkoo3kmVB08
         mCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734551; x=1774339351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        b=G3lP0xk329I4XHZRhBi6Z4Iu4Df56rQf/3Px0WElJnY5UNHghf+1aH8vm2s602R0gc
         sD9vb2/0nS5WASgF+OhZrum7vzz0f8e7smV1XRcIr0sQ5Nok8G8TefmLRfTdWVS/r1uo
         M8ibCaONIornZnKKPXMkQ0pN9oq01cF8C5R59ZrXXVVLntxnj0Ykg1L6yKaRb1do0XNh
         2GFGz9+28cQL+Uc3Cr24DwTQlhO7+0QEY4sUmxdKKOTTjfikfsII4MGX2gH9q8g4VQPP
         RStKkJdBJ/2rrl1zM75AuAVcwIn+ecZywFsUEc2Qq7UAk1f9KIVYvx5sTnoWazeHZwDN
         0huQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXU4cY9Yo7NELWck0RlPAlp+bXGnUbvtsBH65oCpi3YtTmBMPNTukyAY4Dl1EgOV7kV6aIoAs/DQ9H8t5VtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fbjaIHflCGo6rAGpVRdYRvFYDtYKXv/1kfO6VCmFs9WrnoGU
	qhuqHFtNNqniKomXI7YZY1fwYlvfBTuqA2UwCk92HUoPuwIU5vLMHicRxxC67zAG+QHld1UFOqO
	QjN0o1kDgOG9ibXNbjmpCUibPYabXJdg=
X-Gm-Gg: ATEYQzyAELgNtUblLFwFkLLmQB+IdRbRz9TmC3xdYizR3QL2qF8e6OyL7EdGa8UyzPa
	unqyyxGPo2TeExwfUUiD25v0O7eXVp7CYSzygGnmQy9laHHhTk3C0woPDrTKmau6XJIlWqBInh9
	4X9TpRYnK6akayB1vaInNrjHUfaTOq/iCciVjXaJfo8QxjbD9VkVTU1ZKNF5h66n37Ikbw4yXvL
	WkYSdiOuQkujvrduHuSSRseUdkmJREMw9tUjc60PzunUUAnJcgAWh9Z8ccL/1IQYEnSAj9defiD
	AvUnxH/jmdHq0cwqZ2JVB4N51l09UkmH42HFoAjzDKS9F3EWw/SOE3d7wlljjDUYGjRXc9d8641
	RhjFCFH3qXZpqPmSYRfvFPZU=
X-Received: by 2002:a05:7300:e887:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2bea5590bcemr3462168eec.5.1773734550615; Tue, 17 Mar 2026
 01:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com> <aasPsbMEsX6iGUl8@google.com>
 <20260314004012.GD534169@ax162> <abVE6VWCzZfyMEsu@google.com> <20260316213440.GB1329928@ax162>
In-Reply-To: <20260316213440.GB1329928@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 09:02:18 +0100
X-Gm-Features: AaiRm50RfwFM9fMmqm7H6QEiWpid4KdXpZyBrHWN7l2K7PyOj7AradadNJ2iMyA
Message-ID: <CANiq72nEFH8onFqA-8qXxeT1izR+xJdHT3AWrAqAzjPsEMJrsw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:34=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hmmm, yeah, I suppose so. Actually, adding those would allow you to drop
> the manual inclusion of -DMODULE in cmd_rust_helper because it will be
> included via modkern_cflags.

Yeah, a week ago I asked Alice about simplifying to `is-kernel-object`
as well (mostly because I used it elsewhere in our `Makefile` in the
past), but similarly I ended up thinking that if we are OK using
directly `part-of-*`, then it would be better anyway.

Cheers,
Miguel
