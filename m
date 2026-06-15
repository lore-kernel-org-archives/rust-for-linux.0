Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16413D3331
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535932; cv=pass; b=p+n7OO0Y96OQvC3o/tr+OJ4to47OfHpqMI5L46TU9uxRPow6Uq0P+zeitSI9Djlnr3+6WGYDcW+y5iEpGZxmDY7LsqXq3zwcXf7Wd2aXPEEEHelJ+yusbjWue7P1lbEvSiq4B5zwh+4ra9hmHgwOUyP2zV1j3E+DiQkeuhCcslc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535932; c=relaxed/simple;
	bh=dlpFKSgWsHzpEgCqKrf8pV0W7ioTa5C6Yydgp0t7GWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/6uIHTLjSC1za5TOzNPaOsMo9iDwWr5v7P3UvqRYi+3/kU1bJNAVWtpTR4pJilhDK0fXil/ppq489X85GibXb/NW0kJsjRhkR2O6mfsIsLpWU5debaTdUPfhr+uF8be6XDUaxIPemp2ELyQJfnv6Pcg3aqQOgvQuvCcvjV+s2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3GKH9Kz; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3GKH9Kz"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3042a99f0ceso422968eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 08:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781535931; cv=none;
        d=google.com; s=arc-20240605;
        b=Sjapbr4Mw1MqfeSebEOXkk1fiE3ROS/bVOjqJ90Hll+1o2jBvBdm0m/duU0IRdAkpi
         fz9Fm0YsF7q07EOK/VXB/O5lxZXRKT0WBakPq97SS8ixYrvDaFWffcru//qmQ76JlAly
         +HodxoUBJoWFNrzw6ZZ3MtmgRfArsoSRPpzcR1xT2J4v2yyECoW5vRXOihYI9KlOIyAf
         H+Gog1jGyXtTS2QcUbqpXPASiAGzit3hb1KPyRos83SLWOPxxpiLqcJeJwb7Z9cZg8R2
         ApEsKqzW5J2tRMeohr423nwVWHQNTWFWNTGYmhUO5sBkN9IUL/HhWuXA4fVpMnv+/tBD
         k6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlpFKSgWsHzpEgCqKrf8pV0W7ioTa5C6Yydgp0t7GWM=;
        fh=wxadkRnjnyu9NUCql84/ck11bx0zrC5+g/4Z4XDX0RA=;
        b=ApO6Y3n5SkTcCREwVsINN7UCz/Ep9vcwE9XdzDr2kyNxxs0iJLr9uk9axjxZj0Rc6Q
         1VqJayNz2pzUkdZKRjY6QQtYI9sdARIuOIKaGDAePntgAK4dKaxTQkzD+p5y0ok+a3mA
         qx9wqG46cI6ZKayKriwnT8oTo7QaBmHIXaHDTSdGyoFF3xjcMZfONo4KUaDJB9EYJoHj
         5a/7dc9hbYx53tyhrfqKMcBqmnXbbdGDypPKqjowVhvgvNCLjAdYOk0UI5kOylefXExm
         G4ngu0oePSBrQ89QZmBVT+HOw8JMAmLo2OdBR+V+teYILNu/I5JL/vncWrwgujthYYNz
         CVmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781535931; x=1782140731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlpFKSgWsHzpEgCqKrf8pV0W7ioTa5C6Yydgp0t7GWM=;
        b=R3GKH9KzJg5p7RdSRq4eg5fjYn8uAL0qsgG/8P0nhbLHh+AZai+/zDEomCYBd7SKph
         l+c6PgeReV/sDeS0mllgHA9yFnk2yNOEGtPCxSfLkDspIY/SIIrIpWs2VDO1Tzf9wXeY
         TZXPSnM6QtPHKoTCApQyjBJJYprtmAK0xyPXzTFxyAOANRfkn0Mu/wQxjjD0wNLXPT0f
         cM8bURixgXRn1a+V2PROgX1ftWjrLz7hkgU7FnVIA72Ti+X6r78lj3Ctv6+GsJr5VZPY
         YsmLIj9Od9yyOdV0VNQWuZ5cjZR/Gsk874/5fckRCklxcCaw+6jalJdTyRT+s25Wgfsk
         BZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535931; x=1782140731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlpFKSgWsHzpEgCqKrf8pV0W7ioTa5C6Yydgp0t7GWM=;
        b=lsDYNA2kOuzYL2tDuL8qL3ikDkpZg7J4GtwL2m5LvwBHKo1YJTXnABNsM8OvOEfgf4
         mvTLw91XyqzopBqKGrh6go1f4prIFK1LH3Y7CcKKHuz+TUWRztzsZBPEh/wBH4f1rM4w
         sbVdSSp5OWhuuBy0EQVZEEViSOII20oPjpZEyzNMCZ6w3/6S1V+pi6mYmiKVi6aKhf70
         tAPaxIJTtufQfYHh8roKU/RY8gxYqRjWgnQJk7nWAavzqgizqW8tBqqpWomx09NK5aGs
         Wq1xlqbYqm/U78tPVIB4eaMqJXUzgfgIeYGe+f/MAjtz6EikOtEcRNub4sdWvGIhrSXu
         yl/g==
X-Forwarded-Encrypted: i=1; AFNElJ+2U8nrIaZFAhfGmdBAh4gzkvARCW4oUhyUQvZ0aY2j50TDbiycE4vAbQzjBU/Uqa3iRmOSlfiCgw36lm14qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwszcAIYMF2i4P4PduNxw3kK+pV5feyZgDFt7JAfBZr6Z/Q+flV
	xALK6JiDsLKkNrWt21ALpL1EyRIRJ0858IlZcpgjmeiIDbgF0u4Ce4drkJqDcdvX9CYw3V9exge
	SmL/MiQVCUdjn2oVKCiqEoVxosPIXLKU=
X-Gm-Gg: Acq92OGxgThlGcq3WxJB7RONzFFp8asZp1pIyCf2B3Ss7FVhIRVjUtLWe2QnFdYSyJu
	1kbHue9wcV/G6Aq7dmOHW0exe/yM+FhG12jIwrnz3H3YRsiA6jZJcmG8XnWMTyLAldJ0UhQljxq
	NWFmHqKiVGKIIQ8yxi6DvgsFWeyQsGBSbcX9DFl/tBVA1PpWfb/iYP64v6dR3/tE+HM4SZ/M4SK
	TxgbxbdhcWPhcF3Iz7ke3pra+3rPPpn6neCxvJr+H3S/E4z7WH/nW/9oHdMpA6ZN6tcx6rH07re
	dgholRk3ZlwVbh5knizdoO4EUzK4N9FkXRvjrXICORDgLjb2tkjk8C7hmE81UD1z0tAodnzvz+f
	zC3FRDdZ4DAvP5xXObVqgTIc=
X-Received: by 2002:a05:7300:2318:b0:307:d4e7:b178 with SMTP id
 5a478bee46e88-30820054649mr3303750eec.4.1781535930726; Mon, 15 Jun 2026
 08:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143225.471756-1-ojeda@kernel.org> <ajAO6V7Ki0QtwZTl@google.com>
In-Reply-To: <ajAO6V7Ki0QtwZTl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jun 2026 17:05:17 +0200
X-Gm-Features: AVVi8Cd-RVq65Jh19y3fF_ocezvDQZzNJuNGdHGbk474dIcO_pNTPQHvlAqp620
Message-ID: <CANiq72m_2pTrG_N4u0LPCtUboN+QJ9wuGdC7Ax17fgugVcW-ow@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `suspicious_runtime_symbol_definitions` lint
 for Rust >= 1.98
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 4:40=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I'm wondering whether the cfg_attr is required? Is there a warning from
> specifying an unknown warning otherwise?

Yes -- please see the `cfg_attr` above it in both hunks, same situation.

Cheers,
Miguel
