Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301E3314D7
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514257; cv=pass; b=DbR/13wazusRpacJliw5TiGVVO4+4et1HgJax0vfyOfMrO31W3qNGWCq0MJQK549u3IIqhfy8xLuPM8YdTVsyrBcWt6yzKk6H00bVYLa5ja24X0vUqbIeuzi+3IHep2BMM9E5CkYrfcZ/FKlrqnZcBKqUf/1bIthCIGrUDyP024=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514257; c=relaxed/simple;
	bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggJHQHrjSWR2XkgMynYOu6aDLebPr6m2AutYifluDsO/PiPDYHbFQHdj6b4YgYsc07weE/DyjqdwlkbVE1Kkx15M5+DKEIUT0dPYDQrA5sUQeqSppyuJez+p6iAkpPypWmUfG5yQeDBKqIqeGNrMjqY2YDx8drvVgN8AyUdUaWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF+WhF3q; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF+WhF3q"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b70b21ce0aso225081eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 03:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769514255; cv=none;
        d=google.com; s=arc-20240605;
        b=KVN7dnzr9R/tsOOREYDtIvv5FMUp7Ezc2Vn4JRtf5H1SzqE5X7sqGlTL6WBRhpTgWB
         Nzn3R42iqn2PrYnoTYhHhP0DoODx2KbFuGUXROCpB1K1myndTwWf9rGdDf0Z+cHfymQY
         0Ac2W05HApt+DD1isvFt2SQ5aj5ojD420eoLsBTRunngeoroB5dqtjfMmiud9PrF08Ap
         Wh2SFjJ2CsliY0uas1oY4HgxytnP/lNHAA2ZL6+ebtIzNQIjoFS3HDEJGI+8/unQ8XMA
         GtCGHv1pkeQz2tVX7u5Hu8bnY6go5jwvNZvWSvOOG7BJ2HiBa63U9hXldCbXx9KLLDWO
         qjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
        fh=W2SyrtqZd0miTzUA8LR/GlnSCO4CiIJPdzHpvtlv9b8=;
        b=lnkkgx8NbNLa0F8SmQyCBBvZdBZSZCwZ7rwxYdz7i6lLsenmDxwj02uTAhUN4JurnJ
         SNDgz7aoOCjZTA1vL5apw6OFLvlJxC3QIZSjf1o3Fo3QFaaGlSh9wyc96toSq9O1HY+l
         4uDWAY2IcJnycB9QD/4eVD/8Pi/sCtmUUZ18TuGNk396jAMizcNnz1HGy9Wajt916S6Z
         e79igInqAT5Ruds0WxXv/RFFRns1LelPqUEtBLuAbxvPCn36O3EBLDVyn4Ql9aViBtKL
         S2ccLx+DKOEM32BmJGlWpmdoAWkINaoniPyylMqrSJNvbPr8cKYfRZFlaOzAzVMPHEXX
         CdUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769514255; x=1770119055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
        b=MF+WhF3qAW3jNOnQHQYR8XKV15XXSNwtmPifeOvtb4PaqKo8WiQKzDiaedzpENRG9i
         gKcP5xT1bhf7yrg8X53eA5wJ5ArmXWKgjgFph2J7fPA648HR1Z3T9vJ8bK+GoJt8PHLD
         QxPrYRQ7g+n6oT7L8wf2zh2vOQZeYzpj3AdRO0dw5+lxLbpUlnBl79hSH8+I6c4upghi
         xi0ffLfbEUoPjBdChgK2Mdn+KV3qM479VX6zr09+e63+O9dzbU8t2m90EXHb9stDVnUv
         4NG1t0Ys3mTLcHYFmFMPDzc92iNkpEE2p1aUybaLTUJRaKQ37jgIntV0tbNyM0XpdXDb
         GLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514255; x=1770119055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
        b=u3C9ZS9sA4QdRFfnlVwPiOwOT6BY4mzmLLMzcktWVSw2mFyP5NisH02/Emm+ETz6qp
         XFTdc/x/7ktApgDf3iZpHAzaBu9cMabcvQxt4lr1eACdT8Sndg83GtC01C3zsoGB/gcR
         TTlwKFUSFTMWp38cAvyD4jMrqmQwozFkIgPlCftTq/NV7zTi8LxBZQxicKHujGQLhBYx
         iO7ZO/41c8qWaoNvvhWOv5ja8ESydNp3k3F12a6HAcykWsQDKT+UfL7nwyf09d/SReNV
         ZmDPMua8Nfuxe3jnMQlufjVdePKysmChDJrkucUvGHntAPE9gZuhci7SGv7WD/Iia2ta
         mHLw==
X-Forwarded-Encrypted: i=1; AJvYcCXXGSHXnoc8ZssNeNsAY00y/yu3A2zz/a1bjmpMLLNKI2dyfa+VWGOjTi1dBlfNy5hYbeUWIIoYRO2C5zbMCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9CZZyY++iqx6CwJNqZQKLeKR5qjXvp7xoS0W85+IS8xpqp4O
	UNgoIgLiiQd7Gm8yrMAZJJvJ8DTh4WuYdrJNScdmLJ/H+wAyjwXUPNlYV5QgI1ymHhum4VTZidx
	G961TlA9X5nJIMV0Smv9vcAzKUhmWJMQ=
X-Gm-Gg: AZuq6aLX0MF3fuhfAcW8/3Z+jQcJjAAYnVwom1RMQxZb3bQ1K4ZlLWN7CRgLfONfCAG
	UvzqpQZ3LtsRg19UoaOencbk3ll5aDkZ6Cf6Jfl87GhtLkLdJzXADpoEa9nw+QO9Q9WheNYSzOK
	DB31//9soEej3fHVMMU+qMiWUBwgcstiG4oiiaAQbnTLxLt3s4vLNFsFgmx4n713vfMn+LRHcEi
	w7TaEelvWX8eTJhT+Cz74YKIi3zhVr32Wd1qXNIVEF9dBnccpjvkIqVh+gx2L6cCehcE7a9JNLv
	hrh6uI/xKD9q/TKFhrdu7MTpi02VVBmzRom4z2YHd9dDYxQe+VoS0i4KnhuYcvJ//Ufa4hU6vv3
	hb4tyqRI6Vxkc
X-Received: by 2002:a05:7301:4341:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b78d9042a7mr423287eec.3.1769514255045; Tue, 27 Jan 2026
 03:44:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net> <20260123172007.136873-2-gary@garyguo.net>
 <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org> <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
In-Reply-To: <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 12:44:02 +0100
X-Gm-Features: AZwV_QhVvhR6oqwzeoIZPB0kvVicuxqC-P3J8xI9u_lSyucUndCsrBNFKiEvCBM
Message-ID: <CANiq72mo+RpsTxZm7vEOBd+JQ7DJ65JE_q+H2oa57MeyyaHeqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>, Timur Tabi <ttabi@nvidia.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 12:30=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I just checked and there shouldn't be any conflicts, so if you want to pi=
ck this
> one up as well, please do. :)
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Will, do thanks!

> Given that klint can do quite some convinient extra checks, should we con=
sider
> making it an optional part of the build? Similar to what we do with clipp=
y?

Yeah, that is the goal (e.g. `KLINT=3D1` or similar eventually).

But if someone wants to run it, it is already possible, IIUC Andreas
already did the other day.

To make things easier for developers/maintainers, I asked Nathan the
other day if we could have them in the LLVM+Rust kernel.org
toolchains, and he was supportive on adding it there when Gary is
ready, so it may be straightforward to set up in CIs! :)

(And later on, ideally, even on linux-next when we things are more settled)

Cheers,
Miguel
