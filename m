Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5C31E832
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014441; cv=pass; b=uSZ3s3sVcpPrHoAjxfRTsWrc/pYU9SCvrl75z/svKLmEhc2rxqnBmnWvdslZKaJLB4iZfjzLMXCT4C/v0wrgUi4wYchH94qDZX00kdgWRuoX7zP/ttDkKqu1k0kSaW5BsPSYgYi1cSzVKFDvAtXSgCbh0Vsp41WHyq1Y73DPduw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014441; c=relaxed/simple;
	bh=YJHFnZW6km3rmzae07G8POd6rLZ/foGomFNbRoSS+dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMFhnf0/DZRGdWcPUt5jTD0tdph/hRR0dxhwWFwfEh2eYeg3+bKncbvpizsqaEdspoJE9pzpmooczuq+xa3pEuAIgfNBTAg4q3xQ4dzKT+6wxBQ7WH9PPuP2fcjuATa+RQUAgtGhuLLNMS+jkiOAs946poSermi0sfgh4NuzRB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0CEi4i9; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0CEi4i9"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304eb0fc233so478393eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 07:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781014440; cv=none;
        d=google.com; s=arc-20240605;
        b=DI/IB3ZgJ2DQBAFi/niRLrz7hXwWf9MpsCqxg7UWh2LDPZ10SG50jJ26IPJNQ/4/le
         qYLdOMUIwsRcWPyy9TW+Sk6YBF3UwFOjhTxsdC2ZIML5VHLn5/ESL5ZnQVhuT+G2zj+c
         31n+pEbEVnj2kocl9PFVU555HafMsA2sKPgC0sj6DWAw5oY/6jqTvNpIEcgUJJQym/2m
         +lqjCOWL0D7Kr/p1np0pnrox8tHW1lxfWIt/p9iO+DmPJ+4+T+1WBmlaxsAxD3EDHyjG
         jPQ84uL51eDCQN8JTwQ6NgBCZaudG+hd+8+GRuA07evTkWti9zUUNYrrnPFvAMjvkIIR
         HV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJHFnZW6km3rmzae07G8POd6rLZ/foGomFNbRoSS+dE=;
        fh=1nr5BxCfVaupw6BzUnuDXIABPXGV1M+OlHhjsDCPf6Y=;
        b=cvLLfZyJF19iFHUVjl2NEcPUmUCMyfvdFJ2RsGG7CdB9qHhmI2BobVo8AeW64+KXbn
         hoB3RBmVnAoVbzZccxKc8DILLtLWjfv0KQxgYLUz88awt8SBDk5qgZw34MMhNqaepzw6
         WJxAuTbTaqD7OeK7sHF3qptv8Ydv6VIvmw4+zsRgyQRbfKRDDoTcdyk1MdrZ9U+F8Vwf
         RDWNwPXCJX7kA8HZOiPabxu/yWQbMHB/GgK94gigZ91CNWXS0M5MuM51HjaYqHJVLj6u
         CWSgoA/U/36ONFaYfkYN8AJSymeOqtdn7/UJQWCtnSVHRHav/YbaDR9C09T0aIkzIWME
         Qf1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014440; x=1781619240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJHFnZW6km3rmzae07G8POd6rLZ/foGomFNbRoSS+dE=;
        b=A0CEi4i9hu0hFK8X31NRg7qxE8cV7bJwgCy+9M7yeuYuhth/dy4djdu+J6Fz0Ac1NW
         XSLbbf8fVcRXIsLYnJSH21LrUQP0CFzSCLmLKfj1RioKRRWlZUmetrwG4zS2FJ2PYDld
         a5x+XkrFvYGgaWlqf6FqS2n1Tf54zVdz54jwVAeeNXK5V7urSfUtj4Wpo0SRq+6u+W7N
         xptOpLobktdtLH0KLvtb35qgFZSE+ZY7y13sYKU5VBjFiHImgK0kdImK/M9wi50TJfpw
         IXzUo1vK7jTVc2LZmlNBSbd/jRXjnTt6dHqw9FFwhmCRWATvf0dIlGOUoztS0QJcm9L3
         mc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014440; x=1781619240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJHFnZW6km3rmzae07G8POd6rLZ/foGomFNbRoSS+dE=;
        b=TBbbRte6MHmwensXiqzj02fDe0ewi7/2gDZPKt7MgYQUb0t0Tcs/3enBEwxjOdQG1D
         n8Xa1P1nic0T5HYtj5drkI7XlLJD5XnsOk9gwHQGmOev5X1Wc7iCA0P0OwY/FaXKSAak
         /jTeuS93qwsUCbzaTrxLrcWOzzJtveX9T580pruQ5V404z9j9s48UIZWnItpJz4WAtn7
         azSQIouVX5PZzx3UNMuKjKxeFTWW0TNNI5d/6/GPua+mLL9cxCM8vQeabx30wVSmTAx6
         wNkC3h5K8hH5MTUxJW4GEXzKIj1HKoHW7J1LTQNyEdWi5+LIEKIlOdTWmepQfAXID8mQ
         ZGsw==
X-Forwarded-Encrypted: i=1; AFNElJ9o7r+pT8dj1USuvQDtGn78wmg7i+Mx2CqhwntVMSDFcvaSUiBbhEfXeBoQ3/B66vCrJOC63Ok3ZIld4vqHGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBIIAnjai0YaC0jhcK/QiBvcqO9MQH8RFupU8zHnfJ8pgddi+I
	C5jUIIvTDlD42u2cEU3VJkR70oVhkEWFn5vsgP+StG7LrI0DPTjrZYweA1A1v+7AQBTj/PUTfYO
	jk1k7H5pir+z/wGXLl5KzINnEW6pu844=
X-Gm-Gg: Acq92OFqjvM9mNuTurLCPc+TpcZdqcL8mMLT++4cUOmqvo3r5wcjfqUuXrnI5mIaK5R
	8etM2ub32ltqJ3UNRgDiXwMYIwa0UydivbQ6zgM6E41QZCML/Vov2uacWCuGFXYC4Lyn3pToXkx
	rmzgLz/Pu2tKc6AjLUZGkq1FYm//7nD8eb0yBrqo5uO1FJvvdDgA/2siBbjPYwt2DtlMO0fyf8p
	SDsMOvNTQQlLVaKbDiIB2ci9hJRA+55fShr7Sf0eqdYrdUU9a9LQHzmHGlSL0PiEx2gn5uuzo15
	1ismbWQEy6VI5RaVW3bbH139P25LmqCWeE9105ELNXyKr/lTBmVa8W3z+pU/Cz7VNgGPv7C3E1C
	O3JcSkmHgIZ7n4J4JPCTxa45HI/qOGZ1ieA==
X-Received: by 2002:a05:7300:f193:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-3077b40053fmr5395305eec.6.1781014439458; Tue, 09 Jun 2026
 07:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609104152.261145-1-ojeda@kernel.org>
In-Reply-To: <20260609104152.261145-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 16:13:47 +0200
X-Gm-Features: AVVi8Ccrv4HI3KX6vPjxBnhwcwuLxLjonqQ5eUhFdTwNlF1ffAfFy-t3vhY_CMk
Message-ID: <CANiq72=oT5TkD66XCgh_G4mfaVpmCmghGy1Yt18fUc-vf=n_7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: str: use the "kernel vertical" imports style
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:42=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Format the Rust prelude to use the "kernel vertical" imports style [1].
>
> No functional changes intended.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-next` since the second is a "fix" for nightly
I would like to have in linux-next -- thanks everyone!

I fixed the description here (and made it match with the other two
Andreas' patches I picked), and removed a spurious "[2]" in the second
one.

Cheers,
Miguel
