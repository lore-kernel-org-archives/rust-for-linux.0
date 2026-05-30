Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CCA23A566
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 04:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780115586; cv=pass; b=r19vaV7C4beFpu0siinKzP8v90jaS2hBr1L1mir2sK8XTbk7/j0f+Qd8HBSVZjym+xMp3nVxlMlPhw5x7U6QrXLpjYs8G83JWQaEALkm9Hj+IVX/dlwtB4Ynlv7q2/lW9ZIe8Oc6suUS9U9keX6kgJE0LxEstdMI+OL+hzhDWQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780115586; c=relaxed/simple;
	bh=QFu0xf0kxAiHthAx6Gq90k1pQbq/2hGxGXOlrv3QzLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LaHWAk6SlnKpMAFCtkvGn9swDoWR4UHiJ7UbCqOJjjlS2PJxzXvsvwwcqjoQ0pxkIXkxCVaFDTFXno85FRrXxnpImpJS3gCAZYcBEl17Wh7K1jYEAvPiKtDfH+KZHygiAttdcZ/WuO/cMcfskFK6OJmSx5RR0xt9KhlLgJViWJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLP6IZ0p; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLP6IZ0p"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-132dd3cb2bcso305432c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 21:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780115584; cv=none;
        d=google.com; s=arc-20240605;
        b=H9uBsWXiX0D7aRs81n3VYFt/nvGKK+fHoY14+mZVbh2nZHzR30SCcumNi+nLL3oo8n
         u3A+Qabc9luBApMEyK+w+uLBde4nGeAgq4v3EY60DabwsFATTwZXigcfLSk3bmA11Ez8
         lwIcrUixKkx9dGQGdLqsgMlAR5olxDoGFdCwWDyZ3oK2vB+wbnBYKnbuFlUkkBGm3gbV
         dC1wdnJKx5RPEMueCAf1ur/JBgc9v7eLFaK+nMvS2ocwDOdtSeizphyC6yyeGkJFdYy/
         2HldC1XX4uHj0MxaYPBGVAU1k3ccjIutP03lvRTo8tAnmie8LkbEAFGPBlMaN/v/q0SJ
         iDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LdW8riYMTkyNsPB0scYxxqC5lofy8KfGVkA5QD4g4U0=;
        fh=sKaqXFoLrzZbdmUJTCxmw1/Ky0w7zlKbMcacUGr3d0A=;
        b=GDZD4UlOP4EzA3cMNgxcHl7g7BjHAcJnZtJh+vL5c8Dy5KDGPf3Kpdg5vSfzFBpCFv
         8WVSyoIsw3pGF32RHrYX9a/CpRcyFc7KxJ5ugxG6fGjwy/e/8H+y/wzpbj7WTzlzTzmU
         guG6VqYdMlkw9OQnFxnHTAqfVPgwfrixif7zW4p8ev2y/cR7++mnWVwbU2OGt7J/WI4V
         esd0XFwTCvPenk/LgQ7u53IscD/VhmXHkQ9mtc+G9A/7rrrx+aLMugJ7pqHKMSnSfw9l
         oxllg60N16oRil3Lfksro+7Pia43GgWyS20ov5htjUMl9Io7fZ0jZbbkQjaHVHXJgrXI
         FkpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780115584; x=1780720384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdW8riYMTkyNsPB0scYxxqC5lofy8KfGVkA5QD4g4U0=;
        b=rLP6IZ0pZNjooGTg2AkyUGG1d44D8XRqRydMVuT8TrGUbjqowyxr3PcvYUlU50ozfO
         4Jy3rDrWjURMhzIG+5I7vVK5jjswzXRvI6iqB/ZAXH2VT97ohDXdK8NrWJYZ1nwrIV5M
         c8l1XxHgRBTH+jo9Qp3BAC7mD8PpbJKZfumosbyeCZItx7hZBn0I6OvpcN/OqHwuk5fG
         a7vANsrSxf1u5U0pkzZg4U6usFazEb9iWq86Q8m5b0H+ddIiMwyE1YRN36CUlH24xfmm
         6g7ejjlSxHdY8eS5BIYctwyGFeQWzzfHwJz147Sy9a5QcmYxXKkrhfY+Sjq3/WNdR40s
         AEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780115584; x=1780720384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdW8riYMTkyNsPB0scYxxqC5lofy8KfGVkA5QD4g4U0=;
        b=Rwc7Z9gCkEJ+g+CUgcjLO0Qc3v/7taqYZIWfFHqaXcsbcdZre8yjmWvBxX6nNqKB51
         TmZOLRyYxXdCpVBxHSVgMnmLQ6edUAPGU3f9G1Xx/JbmGGr89Slq21izkarN4HmXcs+z
         Y25OcWTYjjwLT1wTcx7Hd9R2jmolADooVpCVHFO1Vtk1P/KmhY5nnJ1Z8GmZ5rG7eHvk
         ZKwEM+nGQGTmi7PixBhYBlsqZS3lWGlKJZ51NtgUyWMRYf2gQ45u7alWIZXSJ83iaOvI
         GWHmxhQBEhruoaSYr6L+PgGM3q1fWXwwhRKyVThlQO+I/q8Qc3xhxGd31ASNdcM+ASwJ
         TQJg==
X-Forwarded-Encrypted: i=1; AFNElJ/MrWjr0GGkb8dEzKgKTjdMhbztkdB2p8lqz5rFTg6AECOcYRdq5NKqS2kitvLTkxoJE5jzj2tZGSetwz7Udw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0YUSLbdJ95Sd0mCABqXE+hUr4FWnYczaRFIRvuISn0kZXTSf
	6RVJ2Ihmj6N9EuLgO1RyO6oK6R7hV2AkByDtVM1Ih/kfq4ljLG38tIBIM9LeuSy7zrPpJjdno5a
	ThYcXk76BkFQF59uuAW7uHG1GG1OKDs4=
X-Gm-Gg: Acq92OFC/qssnD3Kz6djZkS8c/3LTHGz+atXbxejqmFl5FNM+LHnb/8tXDLw3Gr0+ag
	1LtfMR26wVhXcU9EWfurdVTbaEerGBsyYu/FW7zQ+zsWIqhF3LvGC5aHUDgaa6/enN6zCD305Sn
	ERnwJ7KegCiq+nvT1azkxuZhCrksouC0M4yMkyWIqvMdSn8GKu2H6ba1+NHm7N101ceR12BqEB2
	Xsed4UbHxsK7TVazco0H9cSiODXI2tYqpWfB7ELgAGlmXwMQpsh06hsOD9XV6iC8wa+O5530iL9
	Ig6Z58SB6f91KVM5ZDnQNWdqgkKMw5uuTdOPtmUV77CZ9Utbo4Xy+gCuMxJ12C0navENZlr1NrW
	GA/xPxmp3UPrcMfCcOOLiALXeIxamSl8gGw==
X-Received: by 2002:a05:7300:5729:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-304fa6b7621mr568722eec.8.1780115584319; Fri, 29 May 2026
 21:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529205529.75586-1-contact@jkam.dev>
In-Reply-To: <20260529205529.75586-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 06:32:51 +0200
X-Gm-Features: AVHnY4IfLZfXYbhw88GifH2WhwO951OpP7mET1eUaiuSWxOV_KDmRIZ7h28aO5g
Message-ID: <CANiq72nO_qi7_Zmw03duP+QY7SssYS==FZ56zjkN57AtDAwbYg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: clean `*.long-type-*.txt` files
To: Joel Kamminga <contact@jkam.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 10:55=E2=80=AFPM Joel Kamminga <contact@jkam.dev> w=
rote:
>
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.

Normally, we try to use the imperative for the actual change in commit
messages, i.e. "as if you are giving orders to the codebase to change
its behaviour":

  https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges

I would also probably add "rust: " after "kbuild: " in the title to
scope it a bit more, since these files are `rustc`'s ones.

Otherwise, it looks good, thanks! :)

I can take this through Rust since I have Manos' there too, unless
others prefer otherwise.

Cheers,
Miguel
