Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8A145348
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 03:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397002; cv=pass; b=X9qDoef/ZyX8nR8K6wlVGqwmnkNrmeSBf7z5m3GGYnLOW5ljOFQZdu5cFCwNLLYIN1WvjuN67QDmoSK8WCeDhc7McixnxpYpw/ePX1Qtkml9cqhQgb5YrYnKuoOGTghqHetvwyeoHeJlLsg1ltLhpW8rDsHxbtcKmezS/uKyK4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397002; c=relaxed/simple;
	bh=FXuczcb9EQhfCWhWGikpLZ6MR2jhk5IsjGErDR8Lph8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiVSSq/EdCWVAo0bQvdvmrpO6eS9YRPu7fMY0RinLgW+aNslZo5ESHJsjV+F2BQKPfy2hI47LirbdFhA/EL/9pbV2eQ1xjnqy4QNNL93NoWZ6N2wDMsBlXOUqIC9lRGdvGYA+b8QDMMYXgnuuQreEzY/N3wF3YjZrzDGvWQ5wGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hnu5lPO5; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hnu5lPO5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b70b21ce0aso131184eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769396999; cv=none;
        d=google.com; s=arc-20240605;
        b=drCX+Fv0DiIXDH/TWkqOuPqP0NImEb7q+usF+hi+2xT7+HESmhwv6lhii+fGvRx+d4
         FDi5hiipOhAWf7lQbuR/hXIe0czwym6BbnEhJ1mZEmb2tweQNHMIpkHeEVrQP+oC3uhS
         bj3u+LJI8HCGWMdfYC/bq8w965EhQ0ndODFGYnZo9IpXetw7p2ri2gzgSc2gYHvFJjJf
         lu9K/PsEj4I88O2T1pgwu6bF3cE8otZXIXSM+YHQPyl7z0Vobd0XfM0XvVkC97Qpflsm
         Q4TGg1G6puyj/vTR8MGaKgmVueMuy/QyW8YZLi2b0oyn9/w251megVnIu1NZ0+D252hg
         JS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGkhlq+qSUrzulxWE4fwqd45d5ACCtLmrPVp1WG8FY0=;
        fh=Ppo8E98AkHl7Ma0fHLFLLTQf07F7YnpkgAH+GPcOIyQ=;
        b=K1IkBGuOvQOmsfMKhIC8Mm1YOSDhYXj9c6lcS15TLBox1nJPMGzmgawmqoZZG+TNep
         mJiTFyGOri+uXQpbYpjjf0nzR+YpX6/xIHeZ3Q63Rocj/+fdYkaGO0DocgpuzG/FWaVR
         EN8I1Kel50KTHQcMNRvAAUcWxsh092BYF8zYJekZZgGCIH40jM4OPEqu2SCRuXNPa2vt
         ESU2+Jtu2uqESrnxOTY7gToRkcjlgVmvES3DYi6TpEsM7MKMEa998NAPNcdff8cQRj2m
         CZwxQFaxhIZSOZ57AHnt+CKUV0Rrda7YSB43YVB6NY0IS20zsa9gxjMbCru86KwTqKtX
         LiGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769396999; x=1770001799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGkhlq+qSUrzulxWE4fwqd45d5ACCtLmrPVp1WG8FY0=;
        b=Hnu5lPO53pHGpJnMFfr+TJyQPv+iUYrx2Cy6RqxfJWAK+HHqNJyZ5zqLUuMZfeA26U
         U6VfOKgPj1IonJRIpgvEQ4o2yUZCHXOntNTMOjVhkvi0Wuszz+dNK6GQsWx0hR1QVMKa
         J+yFd4iY6my1G8o3NbJgDszU5Sfs+Ry9CZFROEJ3/Tpq1DtE4FFH5ztyAR/x8tND3bEP
         0QX+dWnsnHlXc2bo/FgNt8MDP1+WMlFk7brl/1I1VsuhbCjD5PhTsxmIpFZ29pztZCdo
         PoAQswowOlKsKQbkWKZXB0N1hiQQQenkZikpulMVJTM+FoBLINDcUKgh8cmR1I/hnLWx
         LJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769396999; x=1770001799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGkhlq+qSUrzulxWE4fwqd45d5ACCtLmrPVp1WG8FY0=;
        b=hEg2KhvUUb6UxW9yzkV4VzxiX+xhMYowc46KUCcOFTdKcuCwlvLzKvTthlRc9/KkOc
         BkPQ5pWq3W/eyPAGMZtAReZLYU63qgkniVtzwJspBoG03aliMJa6WcCkrqVjwNU4CGbI
         ZLTpekPEZbi6lNfRvoeR112S5wX7A4PCsD46hibQpKfHdmwsPFYg4XJTG9Cvb3kxF0zy
         ZKWBVdN/+dky6p4LIpDJ2K4wohkNYrx2pe8maCZhEFzHW4pJU06SORXkDHrJ3g4OtMLK
         FCZctPxeg622dBeYJXYRrbfHzMonhXzQXZrsBI2GxEbPENBytstWu5LBdC3AuXKpovE1
         hmkw==
X-Forwarded-Encrypted: i=1; AJvYcCXWjV98eM4TJvyvGzDXWJYfKV6ttqtqWtEzwH+sFbr1iwgFfAT+Xnp/gEw2hys84eWLzfmSX7R6V98vm5ZU8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWuUpFeYTVQLg9fABrqV97tbh7QPPiy8q0SR3Y6Ih398NNXgbX
	AR1F9rfNngA5YO98sCtrbIUQxnv+G8NXqFW+RpisGfzSJE8nz+nzTuYV5Mi/SK7qN/6uGf1XtwZ
	1J0NG78Z1/i85VfWxDW/U6AKsSTknB/U=
X-Gm-Gg: AZuq6aInfj7qC148zbHG1kjdzMewSGHvt73Pfq4YysYvAWwda/q8Md78wNmdTlK4ND3
	ItJbDFfvCwQyicg1Gbm6Xu+ePbv/qNZVySo04WSFsqvO4qf3rehG+b7iz90O5xktFdjkRy/FJim
	O8eIOdua3lPvMmX9FJykVQJKzux3BeP4YFp9y5WVZfJ/OZySA4Nm1rq9zUsi7ifpMZyaJKMRqAP
	EnQZR3oTaSFDULXJ1GIRcm3aWuYNOo2DYcaNPH2aY/2E6vmlOEfGvES+kiX7RR7TmNfWmn7RAev
	rpeKcHgOxWWmGxWqFIktXken4NL/BdnR6ivQDDgusdI+enyQ8zu+SHiJRu/akgjxNTPlRMGp1ri
	AiYEWaCJvqdDgCFac545wv6E=
X-Received: by 2002:a05:7300:c99:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b764525613mr694128eec.7.1769396999486; Sun, 25 Jan 2026
 19:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org>
In-Reply-To: <20260124160948.67508-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 04:09:47 +0100
X-Gm-Features: AZwV_Qj3CR4N7SBnnpnodYCqhXQ_XVvQxGRUJ728I9V7kk_y48uevULv4kIV_F8
Message-ID: <CANiq72=3+==Px50E+EA0fhe3pxVAGzRRt+6d+qze3cdeEBjyoA@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 5:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Tyr needs `CONFIG_COMMON_CLK` to build:
>
>     error[E0432]: unresolved import `kernel::clk::Clk`
>      --> drivers/gpu/drm/tyr/driver.rs:3:5
>       |
>     3 | use kernel::clk::Clk;
>       |     ^^^^^^^^^^^^^^^^ no `Clk` in `clk`
>
>     error[E0432]: unresolved import `kernel::clk::OptionalClk`
>      --> drivers/gpu/drm/tyr/driver.rs:4:5
>       |
>     4 | use kernel::clk::OptionalClk;
>       |     ^^^^^^^^^^^^^^^^^^^^^^^^ no `OptionalClk` in `clk`
>
> Thus add the dependency to fix it.
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
