Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8E61A6810
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775008112; cv=pass; b=NmCGRtA5YZwxri9X2Lwpece99MpbobymnC69I7vLXluUq325TkBtOvu6pbnASOTVGbTLDsr8tk3DWHVE3/IGiWmimw4xxbqVKfTv+FJAulk7cvSLsE9WxTunZdv8C57x1GuVzz56pu6UZ9gNDyKL7aqiz89sKQQMBfdbQjkfJIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775008112; c=relaxed/simple;
	bh=4HZTJ/K0tXpJ59NwQFrVHgQrpFf581z+InFkKZjHpxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZAYZ+GTbabYXQT3w21zPcfR2/Uu82ieQ6PwI1qZ6df62JeXD+J2/F1HwNzXrwgz7SWG4X+lA6zjK1OBmLoaK4qOlvb8EsKEFUT6AAiaUlJWJxRwdMtdoijTFxQ+Oz+rOcNfjYSt3e0A+svQKvDyyQmmjOJ1q97hJvx3ICjOegs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCgme1dX; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCgme1dX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso200462a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 18:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775008109; cv=none;
        d=google.com; s=arc-20240605;
        b=RcGTf6qSgdsv5LKNlLfqaQT8tRzZ8OCiGJWVpp90+AROduhRIiZlEDnLJ7TGKPudps
         Z4yeYjIBVulDO/+qOQRNc4al5Rdc8dgpziuGMZKVQKcB4Z2PQwb013gOmPcrmhvjT12o
         EP8ZGeKXD32TTd/NH682JANCJ/ZL3SYQlRcJHzHLxCqEksPVODahjITDSrY+xsQJA4Mq
         Iu7dyLrIE7/BcownZ4FKNQWt1DHVljNQagDrNAmSbDU26iNZBRmceO77Y9rpnXl51dFX
         xjVjqoxljQYLMGSfxq0kMj1HAnJRwNMTraeJFERnhTvJE5s5FZ2F7j29fUnXFYnKUvTX
         21Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4HZTJ/K0tXpJ59NwQFrVHgQrpFf581z+InFkKZjHpxs=;
        fh=m8SIsdaxcNgqTBbsDpXB3FxsZw/i3MapkBwqxeWgQSM=;
        b=KPav65RBWFxLfVG0QJHYjj9eMme0/Q6Gzx7idTI+it54Vr9dQbPf3VCp9/qOLYbEI0
         zWT0lrBEkdRVYENAwn5wgfWcBCu0JZkb2yda8L7T40pb1OnhoTr9okws+Ne0UD0r843N
         2isu8yESXaPeAMG47V7hUUmY58UNF13HFu7GacOdcTgPGW0cTnSNUlylQyXsh0IJO/A4
         xNL0l2VUbBOkJV18qidso9RIt3wNVHhiZKE9vatx6RThN1I3YMJyOgxfxwzKw/xTDwJd
         9OAV9xna719IR5w1tenjeylqFwfEWNHJ0OVytc/ozJNMb9nzYR2PRe3kcsWsNalBFAG1
         zhCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775008109; x=1775612909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HZTJ/K0tXpJ59NwQFrVHgQrpFf581z+InFkKZjHpxs=;
        b=ZCgme1dX9AyJySVRw0PgeaWcSiMrEGEV93Qgoxz7uOY2YLbX2EBWLzTiYaWOXSCKpk
         OWXyTz/P/97MrnWAOyqVxhMKZK9XbGfwa4HvaR9JPRv++U4FVT0MqaZx9V611Md/JMN7
         7ibtOoGaE/FQV/UsqNxcb81AsjM3wTnBRJsQ05cidHUngE8XgkX9fhSRd9+sXyVfilkl
         V1FxanHPYk62rHAWJY7kN5tMFUV8suhIZRadgvEgGf5U1MJzGr4z71UxcUzAFsB8JP5C
         cf1rhKluqfVC5KGMShgV8G3+lJnzb5+pmZZJPv2I+AzoTphrob0wZLtGQlKtHbckXm2i
         zy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775008109; x=1775612909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HZTJ/K0tXpJ59NwQFrVHgQrpFf581z+InFkKZjHpxs=;
        b=iEoOJD9PoJEQBWaX3h75KtkXLv3ZfbcJgwN1+3ZTJw1ifLxiEhd1zujioAnrRBF8N5
         NMeZyyQgLQyUmKFjrqu7txkd7Quxsh8G3HCW44KT8HB/k0Peou8iX1Ptc3/oysbBPgV3
         Q9thG25L2iYn4HZ/xCdHbLlvkrGEwEDnWBFWPKijF2mRnH21fWnRnnfH2jqNefBDqiEK
         gdebIPXBSgsMMeF6YLzITyH07c277H8nvevs5XFvdDke1sz9oZiXkSRlmTG2Z6eze2vs
         hXbw9EObuHQcLKyYbNJocNYF4Mzt5RrkCqSdvYlXaiCSeNHrMgyH7K0RkImQuGazuGiH
         FDdg==
X-Forwarded-Encrypted: i=1; AJvYcCUHPV3snGhxF3rUFe4XvOs9KIR1z+ZhCbWD2pXDEXKVJSxErAP6uXnBFfJ6m5w5NaoX3RsDKn9aK0m/V9yfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFqh7NY7GWK4e55dSEGkBjIlGdZ0qcfcNXaiDNiufOfVAZ84o
	Txv7zmza9o+WdqQ4K6O1MxFfECEvcLucfOWOclBZL5qkTvN4BAmE47pYKnc0+0U2EmFr92yAIaG
	1XfErdBbnljQZJt0hF9uGjhrmDF9kbD4=
X-Gm-Gg: ATEYQzx0JjxwYC5Qk9Bbmz6lGyPcWpfGLjUwf/qvpht0HzhfH1kYikAKOJpnEE3Nyzt
	GIh4eDuR+yviR6xvLh80mp/K/qzNyUccN6/6+5D05tCYpf3xXJ1Do2XoevMIwMz+efMoOPQ6lnm
	y0NzLJmAJrE1dO6eTARhuz5klLWM6eGgwZIuDm1DZ9ByW2e/qc0t+M1exFS/Olwqqpg6yI8AcuS
	h97qNH3JMuw1LS0R8d/FGAUMp96akE099W+aqGFLfgaWWrnj7NhodbAqUwnvJBchn1h8HrJ07AD
	6x85E8VE2xfg/b1pFDNGe1BZcK90GpX2RU7kJQ==
X-Received: by 2002:a17:907:160f:b0:b97:98e9:1b17 with SMTP id
 a640c23a62f3a-b9c13b5bb0fmr102635666b.28.1775008108998; Tue, 31 Mar 2026
 18:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-23-alistair.francis@wdc.com> <20260303150040.00007458@huawei.com>
 <CAKmqyKM6CBucDEo0aKZVWrKtozbT_ddk0PaZFtHyEMMMx558JA@mail.gmail.com> <CANiq72nOt1E8=GYdh2T5BWNvG7J8sZRF+60taghoxKm8fkadHg@mail.gmail.com>
In-Reply-To: <CANiq72nOt1E8=GYdh2T5BWNvG7J8sZRF+60taghoxKm8fkadHg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Apr 2026 11:48:02 +1000
X-Gm-Features: AQROBzBOwFmUEqf32on5JrU8aXHIhvBHljtpfJBqW29uemU4k1ri6P4DAEIz0EI
Message-ID: <CAKmqyKPa5fDmo1A6OzF0ROn7iTrBrhV1Q2L=1Wkb=o27f5fDSQ@mail.gmail.com>
Subject: Re: [RFC v3 22/27] lib: rspdm: Support SPDM certificate validation
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:11=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 5:30=E2=80=AFAM Alistair Francis <alistair23@gmai=
l.com> wrote:
> >
> > Yep, same thing. My way is the Rust-y way to do it
>
> Hmm... In what way? I would say it is the other way around.

I think it's Rust-ier as it uses the fact that
 * if statements can be used as expressions, which is a cool feature of Rus=
t
 * Rust is explicit about comparisons being bools (no `if (value)` for exam=
ple)

So I find the if statement expression returning explicit bools very
Rust-y and easier to read

Alistair

>
> Clippy should be flagging this, too.
>
> Cheers,
> Miguel
