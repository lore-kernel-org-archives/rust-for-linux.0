Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA71B4223
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528460; cv=none; b=ikArwY5Ttd9M5rjVtABZGunQqRWFoVt+IciPHtDQeDTzyMBg3khopMuY8rQmEUP0eLh4qv9KAliPkgljH4h+/DaCnA22PCRwRaaRTsZm3998/G4f35ABla6MQtRRE/bvBMVOVpjSCKTtzz5VMxe/xE8w4JnOVTsSfgNzaYnXnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528460; c=relaxed/simple;
	bh=8WPe4EtZF9PVPtEplVTrsX6Iu/noiguDsReJP49r0Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUkdIEkxQg/LxUPQRtshqdKaaWVshyzjGBSrEP1dTE+9B3qVyZR33B8lir9tP2Gk+Hey/Xl/kL2S/p8MHMZaljSULHW9iizn3CWErTsgOViC1Zi6hkmX42UnVB9K+I8AZF+OQ4XxYgHnvuDoGLeZoDv42tY/XT0fJ2FMJZ4Y3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnHzJgQQ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnHzJgQQ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34e949d6416so1493173a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 04:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767528459; x=1768133259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WPe4EtZF9PVPtEplVTrsX6Iu/noiguDsReJP49r0Ag=;
        b=nnHzJgQQYQq5NyTt5UK0CMhrGBjfGhUHIcT4BitDWhXXciv4YuRNTMqnHO+cEIW3vU
         Z0GfLaUNfoX4zoS3Z1rXtSAR351OHbIQfPixyZwlEE2YbCzcn3f5Ii4CwNmN6tUZGpdw
         BrMLWVoiaOOlrAaDgZL15iW8Lb5c2Nmj30bxc/6ZTcWVKdyeWqKv46UpXCtyx8tOykMv
         B8ltN6M+DUEDkveac5GbC0imJjbpdei/0C48D4yPi7vdPPoOWCfSnMYa18aVbo7OlDO0
         XI5BcHwjSJL46dYK5YVdiMrK2kWO3LO3Egj/h0tiv57RyZmBCH3DBGXu6dQnXYB2vYfR
         YzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767528459; x=1768133259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8WPe4EtZF9PVPtEplVTrsX6Iu/noiguDsReJP49r0Ag=;
        b=l2qc/7fDc5HCCXJZKXLdbPvGQQ1JbCXvuWY37HRnJXW3o7k9hxeR3EEAop1UhnEZ38
         Gc7mH4LiOgKAZVNOMJtF1SQpCiAR9gjQfXMj23AEDLkHlEfXEDaYLRbMafI/Mgcf2t3O
         Re1J8IJIOMpqISgiJFH12+G7/thkvmZJA8/IedBVyhn0cli+PTeVw1A+cfw5n5Tu/6ew
         TESjOT6UZ+U8zRq7V+otQ+hKODeoH4MG/8cIOhUVSBdOyBVg9esHHynKTwLTUCYpaXLA
         bs3kqZIRxvC/idjQJCqi4+laElF3wLX2CGzV4Snuv4nsfiXU2JDCt+bw2bXxx/riRqZC
         HPdg==
X-Forwarded-Encrypted: i=1; AJvYcCWcBBY9kWDgiSTxzJeK803aqYpsjEYzgc/g8ViTQWbGa/dWsUUoHj5DC5DW744au+zI7TcgTouy4KQFoHLF+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WdtRrwJyGTAJHoA9t2af42GDoVY2uIlYRMYm5IrKH1UR48F2
	7tCMijcZy/eozdvlkT0esZbPLLIjJbOKUoJRK9YJa3uoofF5BLLQYwy+ivdu2lz47pcwc6+FCOO
	hzGAkx1fvgUv3QKlvCHZSjq2F35bHzbw=
X-Gm-Gg: AY/fxX6AtG0W4C4LVv76WJE2Mnr+7KJ9glfpk0F6EB3zAnBp40GPLRUSNxjXLgDqsE3
	1YZcuDiK6Nc/s9J2EoDuq7GvnRwb+fpRwLrSRxo+JHA4u9JOa/GwmbeM7XaxmuOfYeVfTLQITAV
	Z3clfbL+4Bvfv16ItVE1PsSNnWoeYPS94Q35VoSrM7EjoI5BuGr3FUBeLafRm0FhRO++6ZcMyBH
	u5ACxw/O/lLddDHy6qoNNKNI91XytkP7qGXDWd6rYLu2pS6F6+9pPJ5u0eZfYEeCF5oNK7aPGXB
	j0Br27s7x8WdrkgA0t6jwhW78Epx5vIX7/ZzmUkWhFnBxwRT6XCavDRTgL6Isfj1EhBbGARehgf
	27cFPT1FbZog8
X-Google-Smtp-Source: AGHT+IGwM9o7xrK/tz9KLRjUBIXDcSGXhFpqKpX4LOwc9gJ+IuTJfpXmxlpq+AAD5RZkUI3trJaOU+TYum/SkotLQ4A=
X-Received: by 2002:a05:7300:cf84:b0:2ae:5a24:249 with SMTP id
 5a478bee46e88-2b05ea0b213mr15849313eec.0.1767528458660; Sun, 04 Jan 2026
 04:07:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101102718.2073674-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260101102718.2073674-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 13:07:26 +0100
X-Gm-Features: AQt7F2pG_lHlI2NIk73VUM3WnC4E6P21J9OPzN15s__U1mU6PIyqEuWDbRMX4xY
Message-ID: <CANiq72kRipkW-djNqUy3hSb9Dy5LJOr1QgFAaY8vT6KjrMcDEg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: sync: atomic: Add i32-backed Flag for atomic booleans
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 11:27=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> +/// An atomic flag type backed by `i32`.

A few nits I noticed while reading the thread: intra-doc links where
possible/simple, i.e. if some of them require something involved to
make them work, please ignore it!

> +/// ## Examples

First level header, i.e. `#`.

> +/// use kernel::sync::atomic::{Atomic, Flag, Relaxed};
> +/// let flag =3D Atomic::new(Flag::Clear);

Generally we leave a newline after the `use`s block in examples.

Thanks!

Cheers,
Miguel
