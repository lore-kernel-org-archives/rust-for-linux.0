Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A170345741
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501495; cv=pass; b=lfe8jqTMoYD3gkJxN0Q+4Rb2mPuAtY7IOW8oFtNjm+IXj57oIGbYkfpTOY7LwXKFzAaP+WZxwzKkYpuJxOkmV038RvBl6XfoqcLbf/gMxsMt4ZwerRXJvO5Yzk5YUmMpXknFCsBe+4b+KWlUMGla/zj25jnNkG2dmD/+48gydWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501495; c=relaxed/simple;
	bh=TSK20oxFL4fPpCXh3LY+/9/D15oE9Tg/thOdDQh+fTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIuIZXCYc0O0eA8Cx2JvsyswH5Ez+jTveXI7s1p45HBNp54Vne0o7RbpO6dhuNHsUInmthzz9fRBnCRvELE2I/NhanaFk3UmesfhhZbm/71nxP3Z+4/ofgFawPnQX6wgmF6+GgmTGluaBwAvrTIJrQ+kXwTEQzYgI5Ol5dVxnk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWWCGUpc; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWWCGUpc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so35307a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 02:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783501493; cv=none;
        d=google.com; s=arc-20260327;
        b=ETksJwxpQODhckIFyFdQYD8TE1YP4T+dux43UsNlsQ8QXBvtyQRC5GJ6jaAya+/XXi
         es9xKRuIUz6N2NjbqQ+kMfRRYkAhSQXkZ7cJYyJlOjKgvPszEQg+cB/wocsCjLMzgIYu
         xXGhgU4E8dTIMJRJdvWotwr5FfasKkBshb225sUHbC2EBC3+yB4zNKfwdsiCvDQ9qKGn
         HyjcBazRm5gxU47Y2OY+r2ydXEv78o/2+mhXUPfrhGH+pS02psAnxD10JBjatNjQGICa
         kHDGOt+zXZXx6X/U+3gZ1HJX16ZJMjLtCxBxUhZTcrJ46ljqxXUqXSBaez/Iro/gp109
         crSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=guYA+I/KzG7Dz59dLyzD4w7QapXwzT7sJq9m8Mey8v8=;
        fh=oggnnajPm6vVQbRjLuR2eSuGKnfbJJE/eEVzAJZNJ8k=;
        b=DD1vZVK16TR1nFe4T7t2JAX1lUNFXDHYGg/eWMC7QKkhMsgwB47M4ZePYTeXCwaNK1
         O+nG2UwWYLdyB2ba5bzeb1xNjdvHYf5XqUHsKWB/2pwryID6ga4ZDhtJ4M/Xg2ZZ8NEh
         w6CUXmDviWNRcvThYuw9K7TqryhvXeiC832NJuESZxcbu+jnY5KM34yizOWqgHt8/QI1
         J15jPTuCNaRnrWHyhwIFLwRenOlmxLWYqE+u40306dT168t7kPKM5w25ijf17ZRwgJiN
         i02wqBXqyTAB2PgFZ6yS4TtucGPmuqWztox7FXrIZ/fK4Z/WxhWY2E3Aw8DoGRmamvVA
         k1aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501493; x=1784106293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=guYA+I/KzG7Dz59dLyzD4w7QapXwzT7sJq9m8Mey8v8=;
        b=aWWCGUpc3F5thwWI0YCvB/L2T2xSbjfm6qtFmbLE5kS9pQJJeduyT7xE1Rk95P4cBd
         J4scqP+sqr8hF1JMdWhfTht6ckOJZuaLRkxLKA/vBWukHUgxuT8G4NB98A0w91UaihOD
         EAao1tC/Q3AddgW6cU/Vj0nYFGOWaTBgtKWGbLMj2yHnUPA01NADG1f30LUQqMb+Htaw
         8lApkAdi0ef4cnqs8ofLMoUh2TTNhPF+drKUtGPn7KpzPk6l5kk1D5+NFSSxsPRtjP8y
         7Dh7nvkxANtzXnT2g6O1YplSgVvqY5NodoiVdvxVvdJBH7+YKRZlf4ZlIWPhXplzXf3t
         hLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501493; x=1784106293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guYA+I/KzG7Dz59dLyzD4w7QapXwzT7sJq9m8Mey8v8=;
        b=SgvRYITV189H3nISYYWQ+6/TAC22lmzNTdZRLlSlx7LPAUgY4B6l2xzWSHpqcc5m6f
         o1YJJWM3T8X36TAdzgD98ijPwYQ/AYY5QPkCglflOLhq2k+LKyvILsNnW/XFhCnVLirP
         TGfbkUeW0903fLgFpTVoDwjuwTyjYuC67tz5jpnbU8p0cCUFPPq9/xl6tlcN+xOfN3fm
         0I1jqK8E14vaSJABKLMiQjlw2Y0U7f0sT5ocCQ2hJlH0QQOoF06nI+C+XYxqqYkv2NmC
         wuhfdI7A/wAZrCJiXkKEjjOzzXcFQuavII6iT+h6eCDY4lG1tP+LIgph9TpFfgFoKiOq
         mIKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2+EThkrOeHRa/dKE1LIXIVapv+/oIK8iID0zZ3TDKtnYH6W5CFn5hmsfImu0sZ40ajcOZa0MY9dZInlbSJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sImFnyE5Jco185UuOSWf4UvJ9ROh5OG5HdsCUrhrr6JQqTsv
	mj9PqtAD7ByC3YcmA5vtKMmjLgdSqArjWZoU0K/zZtTMkCO0Nvi+PD4RfDyt68Ut7fLbFraf3y0
	G9MBb6XyP6NQ1O8L6nHuQ/WR16XN7O6w=
X-Gm-Gg: AfdE7cm1hYuISB7T+QEEVB981TNxXcLrfUvyevor0raFkcG0VLPFjE9BfFd6jOZttAU
	uou4+LboAu7LjHiF9f1hrMRX1gWsipgbgbTdVetS/8fgSZhKsSHJZG5vL0QdJ0ZXpEXoxCMvQss
	TlpnZs3uLMvQsyd3bWaktWIcBPHxr6sBya+Gc5hHVqa0CIF9oGS9Sbbn7IAdMIXE19Z6vdQQtiT
	vqHxqr/JbCDicHHOti4KKse0+68FAX4giJeONvtYwfzJSkq1C/kZFOB5VAHuV5bD7b8dwrwhJId
	3bQivC0s4wQt7XaZiHU/sWx6j4SruoEyGd6fil8MlEN181niXMoOvEk+yzFbMyfDyMwTFc/8dxw
	8NgBmDzs/S29j
X-Received: by 2002:a17:90b:53c3:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-3894249b34fmr1433674a91.6.1783501493402; Wed, 08 Jul 2026
 02:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
 <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net> <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
 <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com> <DJSET0S73YYD.2HCX79F9XAWF3@garyguo.net>
 <DJT1OEEX0LQU.H9DPHR1SBN9X@nvidia.com>
In-Reply-To: <DJT1OEEX0LQU.H9DPHR1SBN9X@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 11:04:39 +0200
X-Gm-Features: AVVi8Cdb6NxHFf7927_1Qu0u2gy3sTXoJPcVLX398UrqIxExItRjkOXEdPdZUYY
Message-ID: <CANiq72n2KwCE1DCp2HR6CJF-vR-VNBYFgXYv3j0Kvv81dH6rng@mail.gmail.com>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 10:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Done: https://github.com/rust-lang/rust-clippy/issues/17379
>
> As for this patch, I guess we don't need it then?

Thanks a lot for taking the time to fill the issue! Linked to our usual lis=
t:

  https://github.com/Rust-for-Linux/linux/issues/349

But why do you mean we don't need it? It is still reproducible within
our possible toolchains, right? Or did I misunderstand something? Or
do you mean it is fairly rare and thus maybe not needed?

We can also always just disable that particular lint, and perhaps
later on re-enable it conditionally when fixed -- we have support for
that now.

Cheers,
Miguel
