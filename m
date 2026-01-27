Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163F82D9488
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526350; cv=pass; b=QOetKuNILvjlnt8eLe/KMsYcDwgHe17mHpDYEzaJBaza9ywPgVF2ucTwsX2oK5ufWpGJ2Jmj3E47cp3EgkHz74TuHA8LkeqKA+RicPFENZJmfyb3yYKY9ExX7R2MW1G2ZBjwe0Vp27x8oXUanbM7jukY4vjefyeXmUSKsFe5J54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526350; c=relaxed/simple;
	bh=IlGVy755bb544O918n3VdtulmR1lEGxJsGi3iwR5QMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy3XG3sxhrK8osq4pTv/HkEJJ9g0SbMeUvt80vVM96I11sraER0Mgu+cNUv/8XAMSMr1Q0GsMjellmUpDTKC8FHSXYBsFKDpcFCdZj2fG7N9DZ0U/PL6xFlpgRhWlSfkaN8XJ9IpCuDfDjfokhrlfqdT+gWRVjagszdqGZqo9hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxqmTrcr; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxqmTrcr"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b1769fda0eso640366eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 07:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769526348; cv=none;
        d=google.com; s=arc-20240605;
        b=a2xZRts3Ye2bx4ZPzXSImFVOSpbf2y253nsQgUCKvDQmvmWZ446r9d6amNdLTZ0W61
         rvortj6n5x6onYtgcOkCIfhVSPpfIHBumvq7vpxOww+19W9eUIQqgZN7T0VFcuEbhSuq
         VGDmUnNcCA9q53UfjJHisrWjZtklCXeXuc+dLRPNfy8D10sjmWMI+P8AulhCiDcfD/UO
         dsa/smAQBS8dEMeu1uJzYX4vPAmTzvtjtMd5cg7aclD8kxk14WalsjpKb5GlmCD6Nqb+
         4GVUIC2JlsrJZIp1JXRqUwnJSdAEB5M0R+R36I4YKPZoZX0FAXUPMOPRRWvzKuPzqOp4
         EJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypwr1/BdhU0FvM5egDV7iw7KIf86xx7TOrhaiOwiwsw=;
        fh=3UD7EUm4Ov2X3NjaGvweHvNysZFI8TJ5TuAN2aO0cU4=;
        b=RXGGYx+yRnjOO0jgxiTD1FSLIasm6pTjA8p2/N/4iaJquLBya7Q4XMnuPsxZk2vf/V
         O71CvMmQExMNypCMtU/IiG5fx7QMUtYmFD4JfRUtyGl9DtnqnOTBgm+uDnIy7SEfE9xH
         PIz5iXpdTZK7YbyFxlfRaweIzY2a+5N7JJIlJT0IgkvvS914CaFzEJcKo42vjz2LQ09h
         BagD7VFoAFQE3vq48x0rJOR9pN+iPd/NA1q2hFVBeiXOTiOQi7YWkLKNy+kP9w9OHGcU
         MkmyIqkscAuWuaCweKgFmLW5SXVFUL8YPIFDDYHWkJbKd7WKy3UbfGla3sp89kkc+ptk
         jMeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526348; x=1770131148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypwr1/BdhU0FvM5egDV7iw7KIf86xx7TOrhaiOwiwsw=;
        b=DxqmTrcrPEpydX5Qf5r6I9fxAj4Wq+6pLCFx+Avj8LlqFf3vCpuKSS1TRYy+MiwdsA
         gBFKI4bk63+42aoit3pY2QVdzqHtC3zsq0akN7ULmhTD0KRnNyljnStzshLy2FWix+5f
         WEpS30daMJ8zYWRAaEpk6M2viy1w1ReOCRdr+CX10tNVddNtjHK0yY6lLV2kzy7RcNP0
         bpypfFur7MidmTrPm8opA2oI3NB9Ajxiw7dRvc/lp9aPFTKcWFAUOv/3Sms1/72Y2Quf
         ptqsHN8hGzLLuhF9XeCxOPcJ3FephXdIIn4D/mr19jGDZd9Oy91uL0NXtEt1DmRopHsj
         JjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526348; x=1770131148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypwr1/BdhU0FvM5egDV7iw7KIf86xx7TOrhaiOwiwsw=;
        b=JI4N+H52T5jN7loRQb7DKgJC5Eoo8ZvR/t6+AVoIZKvbEoavrqCCvfHLxrxIfjH9Ih
         C8/qUR2lavax78XCo3b6eiVJkIk2x28a++2jZ5GCY/q9fxJiZOZsQxBO+7bDexGbF615
         4S949ApfPVmN9fkPG5A6JEh+p+47Xw7TfAbLiglFWRT/IBS86mCUEH4qIcuDVrZsLzUj
         OvMwBgjLdyT+6Lx6LdBosWu7CgvAA6KciHnlKC2BaqmKpQ+Xuq0up+s0q0cikCbj2iOo
         fiqLvY5wovJ1VZWgL/IemwA1Hm7Og/gqOVYOMBwhg84RegXLeFREAKVkVPMaGthvwUmy
         coGA==
X-Forwarded-Encrypted: i=1; AJvYcCV73IhpVlBHOG4pQrcduHnf9AnmFFHLwXainEAusuLGpyYIQJpHIlUw7qUKnEJMiNQZ7KUNLoYdVEXNtB/thA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgMbuCf376cMDXu+jhhac6GPdWE0nZ0gRQhMVur2Lp+SN/ML/N
	xM6uk3Hhf/O84TClxW2ryoMJ0TYYXs0kevD4kSz7uQxJqUW/1jQp96zjnIsXRpewqNBi24WUphy
	leixylNPxUIzBiHkbhAaZrugQ7zBWJGE=
X-Gm-Gg: AZuq6aK71omLK9Y1kmB37tyslmT81axzeqEd5AKoQKzkWJV/XSvsR3Oy0wPY/KU0yh+
	HY+F/9rC/tbg0MM00y+6kM23svN5OtI86v67hn+Mjo9Nq+irdTizIQHbHIl0gGFmxUVfdh/2dXr
	B5t6X9Wwae7dFZSGUZjxlxLkYm/7ikWeiB/lIATmFA9/n+2pGIOkunAjV4RXqRdm2+IK3/S6kuN
	/VE8VoPCqLwlLKH6joD7X4kkdMm9EMY/xfOpZmzKV6kCOKGfkozkziGJJ7iv7g8QrRxROjyAuxM
	K6y48N/wGaUhvT1bkUNgc1bpcSe/Zhpy0AycJ4V625dkq1p9YvVNmd7+gm2D/qDPoyG5qweWMT7
	g8DDfn1VAWrlthEMq0pvI6lM=
X-Received: by 2002:a05:7300:ac81:b0:2b7:2eac:40e with SMTP id
 5a478bee46e88-2b78da4269dmr612946eec.9.1769526348022; Tue, 27 Jan 2026
 07:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org>
In-Reply-To: <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 16:05:35 +0100
X-Gm-Features: AZwV_QgnpuIRL23qPbH8_PSC7FJjoRSuZ9zAdTG_0oB4nhMWxStw5A8VGRIfETs
Message-ID: <CANiq72kYE3zvZ2tdo3U0vBv6z8Oi3CuPtwAi+SzNZrKzQfzfrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 2:56=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> - rust/Makefile: pass `pin_init{,_internal}-cfgs` from rust/Makefile to
>   scripts/generate_rust_analyzer.py.
> - scripts/generate_rust_analyzer.py: centralize `cfg` lookup in
>   `append_crate` to avoid having to do so for each crate. Remove
>   hardcoded `cfg`s for `pin-init{,-internal}` now that these are passed
>   from `rust/Makefile`.
>
> Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
> Acked-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

I may still take #1 this cycle, but this one you will need either way
next cycle, so:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

By the way, the commit messages (in the kernel, I know e.g. some GNU
projects do it differently) are not typically bullet points, i.e. they
usually tell a story and make the points relate to each other, so e.g.
it could say that what the first bullet point mentions is needed for
the second etc.

(I am mentioning this sort of thing since you will be taking commits
from others etc.)

Thanks!

Cheers,
Miguel
