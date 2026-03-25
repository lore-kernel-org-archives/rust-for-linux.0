Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F43264C4
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426970; cv=pass; b=SWpDaHEIPXVVzomX14k7y3KDqjo1sdNn0Vrh0dWfcb1PYYZG795PIR4dn2PDmYCJGJlzQ6iyyBwPuguTJrBtNs4ZVE9MZBsEILkk62b+OtkcP+Ap/jgTRBKCyP3s/NWdgZaQptGHU6FQKABlhcDTP2JpREKt3SxDn8MtfxfkSio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426970; c=relaxed/simple;
	bh=otU17BfQbXkKxqfVxDndcTRgJjeiLdFij1rYcgElW7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSwhNxo007YKv4NDIVEKQmEiKLEce2N3okLjfGv3Hpgks9rDMdgLFGDnZWBuMbeAwflg8Axd3hLOhDlEvnObp9fV9BpHnbtTLqWuTyqwlFuhv/r/P105x4ohydX8M/YNkHgflU4U0dU7sfjDOQRA3YSezBZ2+ZzktxVYZPCQZPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b0l9sC8F; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b0l9sC8F"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4684512f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 01:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774426968; cv=none;
        d=google.com; s=arc-20240605;
        b=jqTb6zIGPnjqQbtgAUlZ8iUgeF5h3QgxfJ7sFrmN82lEe0z/D1Vv8F7XJlbziogjYr
         k1D/t3zk1n3ZbibR9A8e7sTAvfChfTENeTUb9WadpKS0iLTg4RH1PUfD6DA+g67nINoL
         RPCw/uvfImuuTr6mBXRFoG8adqEVRZmKU3eDaGfUWTSod4aS12uV/erqRgd4KE+YuLBi
         zviGBmf7ZMI7snnOGoNeRXamgqQ00NHG8vYtHmCnuwEzUl/CpmQYI8v4BZSU2hM44MpL
         xf10nSON5I1eGhRhU7ml4ph1i29Xtz54lXqpfNa5a6IHjal44LoLwB7+xw3tPCS4F4PA
         w14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=otU17BfQbXkKxqfVxDndcTRgJjeiLdFij1rYcgElW7U=;
        fh=apnYlN32vFPTKBgJP+DSGAOKlqaATyYVLWLh0rPi0Gw=;
        b=jb2RgDOxPC1rb+eINA/s5u954NirolkeqmspzosiypCsaj1eD8ZfxEsld8E1ZORFAw
         J/lV1inhjXVZNcBfk3VStFd7fQF3BDOzTk9ev7bg33m92Ofu1kfXFDg4RX4gneam1dTd
         fXFzB01Zb8zozTlLUnkruZNmCr7PAmpGr7nNOaDuhxa/YvaCz3FO59nUA+QEcH6Lc2jq
         Hr8mPSdhZYm3+R+UZFC+gbrN8Yj9hd9NIJWqg7kq7AhG2iOPCJGYnLvjF4LwUfZoqOQg
         G4aAqxKBweGJMDowAqmBiEpCA/jszBgtcon25tReha0Z9Y6U/EA1ZwrGR7vNPg9S2/An
         kefg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774426968; x=1775031768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otU17BfQbXkKxqfVxDndcTRgJjeiLdFij1rYcgElW7U=;
        b=b0l9sC8FwYWkWvcz+9YoPY3RaccLB9a1OzplrMKRTUYVE30FzJpLpfSbnJyhObUb8C
         floDl0LfR8pc500zNSgyQAgBUCkQA+a7dJYThAoXrTE80Wn33lhSYvcUoph1aOxDSzxc
         ID4b+XB6dB8IAbQZSuVpS8Szqx7hd6P4ZWmrqq6Pbt4TGA3ubbhQj8/dCHD5nkvDRDB2
         PaG2eAbzMnYOEmHC0o9VHHaouLXfydzGgIYAk80gzsghgQJ35k2LEFY+8ri3ScP0xJDv
         7Ri+Wb8vj2xDZecTPO93mSLr0Kncr9d1c7QlzYHhQEkORGQleXuezHATHq+IpaynXN8a
         VVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774426968; x=1775031768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otU17BfQbXkKxqfVxDndcTRgJjeiLdFij1rYcgElW7U=;
        b=o0EPgYTZpE/e6YzAJvc1o1hwQ2sR19cqcwCC7l8JMcNnIG33vl0M39tfI9XsFMX4DV
         HF45ktmO2/Sdd56j5veYT8psxF9DQVZgnvgQQTJx78YRcQuzyn3DnZokkw3LUxt2kHSu
         Q4hrKoRPMz5VOzTgUN55zIJdU0KvpK+pNYKZi6rxpUopjabSWSf0wk4WEj9IXOqhzpio
         rk9Hw3uI4aNdyh01gPYFK5ulk0VxRvc65PArxrbQvNquMwzMkrdO5uSlPi87q7S7uYXw
         cVXWcjzINfwWcY6UmOmub9cLbO1XaaQz//PPIcVOqqhxV/eeWFBeu+sVXqiYPEC9y4UD
         4wAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ayplpjfiT0SrhKo3WKB7wXpr8a5/N83ia2wbPaVkzfG6K6dCWzd+A02GhH0l3P5SXLta/vdQrVND4GB8+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Gedpdc3QiiFLWIz0DPEhkTraxg0RVZaPtBBP6Qn5bQmWkrEL
	55jh2wTdhkOynyXVimGGnMLfpOCzxMogmgRF46BL473kGnBjpqz3sg9SbM8rTyO98+DYcLqWpqb
	QgaXhfYXwNh51AP3mOOR5cQZ/Z5Q5HNlU2Z2YykEW
X-Gm-Gg: ATEYQzxKd/AHqyRb05le+mQUho/z1lhJ4falR3cNFHpXLUf4YvGTTrolkjqK2KcDPwY
	0X61M4yRt7oqPCJbdQap7Gm/X9gsymH0UBjzw3V5Og6JZb8DuUtBkK9niVc35KNnqA1rko/R222
	FaPknRidqqNN+Pm7TZmh9lBvuLn0Dkc9RYeuIyeWma+SiywT99kF2bgBoXRATKXRXhR/onP7iE3
	+jWIhkPwxsKNNZdyMlaV/kA4TFjp65uQp3gyvXJZxcqEzPSdJzveZjeCKqkTOvQjXLJ6THefi1R
	gfaFU0gz7307j5/zwQCKvIsj0KdS5nXvlUn7Oq7rJz3/6u1RELCfPk424g7Eu/pUegCn6A==
X-Received: by 2002:a05:6000:2882:b0:43a:3cc:83da with SMTP id
 ffacd0b85a97d-43b889861fcmr3428991f8f.18.1774426964341; Wed, 25 Mar 2026
 01:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325035242.368661-1-jhubbard@nvidia.com> <20260325035242.368661-17-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-17-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Mar 2026 09:22:30 +0100
X-Gm-Features: AQROBzDs7DjdXasaak416dkAS9U6UEH1mFCaptWGD-UX4gkOHStOPVQ4GdnbYiw
Message-ID: <CAH5fLgjxNxtuDywv=JeqSfn0BpbiS7G_HVvefy4TfJous+Nxng@mail.gmail.com>
Subject: Re: [PATCH v8 16/31] rust: ptr: add const_align_up()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:53=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
