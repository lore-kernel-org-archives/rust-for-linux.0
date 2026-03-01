Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F9236437
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 20:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772396401; cv=pass; b=kEcvAJskNDKfryh+9pMu+SAiPpTg01PpdPq5+sF/avIQaYDnIx3F9A2S9jh6YmDzC5cDtSb76PYkc/21wOVRCpi1sz6Sz9uAavlxGRQ81WaPkBd6ETzY7Gbv3T+gyE3HUz/3ezELblgz13Vh69sICMfuslGcUSRGAF2IKWRdw9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772396401; c=relaxed/simple;
	bh=P5CzLPIarGHipbQO0pEVjHcFfxMJNS6G9Wzveboj+8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbNkLf0ovQmt/r8LRAWKn3BieR/PT/igGOC2Gu8duBXIMP8hSIz1Bqcb6bHNiCs+mBzehWMd5aM4hAFDwB7zj2mm6AkyUMH0CiJ4E3Xba1uTWqeeM4k5QCQN2Vcme7P8MhQE+YnG9wR9yTWhpgmAeWaPJsQwNtbjhwh3Qh2BL7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeK0+g0F; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeK0+g0F"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be14f5827aso1371eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 12:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772396400; cv=none;
        d=google.com; s=arc-20240605;
        b=Efrr8l4/srkuxwW45k+YXMMQdzEIZ239HYOoQjvpbCdKkxoKfE011qdydpSFCFuMvC
         dmeoBz2hGo8Wn4m92eloYM5InJm6hxX8ShE4KqDjgxo1Df1yfniOMAxOpRj3R1DI91wB
         L0Zanc2r0xrKxENw69iIQNYomYqY0cVwY5HXWzRvyx0m7+n1iPFX9eQJgO2plFj13Bg+
         KMy3Jk/Y9L4bSzTaH+02RmQUoPtbOd1VITuVv1aA2XDAi4kh5h2kw9E2xQ5dXkKv25G1
         Cq795adcWTXwLltr6ULuTTOrI3i3DQ6Jsu+PNqZTZ2X5jZ37KsV5YYFs/12cyC84HEUl
         cB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5CzLPIarGHipbQO0pEVjHcFfxMJNS6G9Wzveboj+8k=;
        fh=f+aT4Up3ZertwIjqjq4kT6KQU6HoXHdjsDtoNOZFvBY=;
        b=Yxb8x0jLD+LdQiJaE2+na9U5ZKsHnRCFALx+D8MOpUwkh06vo4MKIqZqkQ3TuzLLjW
         Dsv+n0+xG5bVNSNk8Y8cfmFODip8jFt9enDeLwL7bMOAxjLYk1U41h49DfQl+yGbySht
         /6NchKR+z/7h/ZlTGl301oHaU4Zu/8S8XEzmOC7/UVKtBUhBttR6A2yDq+3HVyh/f0+f
         qC4oyyu7gc99auAOF4e8O8dws4kffnTOojgQEPx2+DC6KfPOi40qbVeGsXwEYKwWwrSy
         QJzqUjEWL95n55jZfDcSFLypLR4BnQq6xrHFzQVj+p0l1rKtpya7Vf3kwO9B7FiRKujF
         mQww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772396400; x=1773001200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5CzLPIarGHipbQO0pEVjHcFfxMJNS6G9Wzveboj+8k=;
        b=AeK0+g0FbIc1uy8fpZWFNMRqAD4dZg0tfdL7vOcF/VPvUYv+IOECfvGKWOSioPeKTd
         l8LtTmP1E7s7DnlyN6FaeCg7OwTvIzxui3kGXesDiOl/zVvEbgH2aIMJ4R55gtTd8myS
         uVWPR/LyiSHIj5bJqyeGnR5Xs+CRZUrZnmACNKwdryYL2axY+RoM0bboow51z9gYR+Jr
         v4+rfRTkzgCVDv5Ask2ivHDgyYZMpHkqV/5f/8DAItCBv1rvx+aLWVpQI7gYEeR4y0h4
         lsO2x89x9GyToTjXXzYZ7iZ2hWHAEYCbLwSvy0EawxQTQdFlyvaDcZhyL5pRvnZ9rDRI
         hLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772396400; x=1773001200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5CzLPIarGHipbQO0pEVjHcFfxMJNS6G9Wzveboj+8k=;
        b=io6qPaTpSK0QOOxxCnR1lgQ3TRiKKBkfO5ns5Fj5NDCrArH7Fiya/O2P29hPEUu+Wv
         HI5MCPRcX5YL4j/HKkNloUwQsv4cEKMHH1M5xhFf2D2C139wzPkycuNWbRHnBdlV+UVd
         pM0gqgYu7l4KsOgjEW1pyPWKj2kwqoN1sQxjJc0aqqwAT4m86GW7ugDJaSezo598MxPZ
         iWo/79p8l22QwJejxFNXmu2RmdQggyHe2gQ6/HUwCLQEwPjpjcWbv1PvfA+tuocxrqWX
         6TS8KjbnG4uUMSmN5II8/oYTss9tspSzWbr2rOuJPmXhHWRRW4BQwK4D7cfr3pBvgwTw
         JnwA==
X-Forwarded-Encrypted: i=1; AJvYcCW8PJo16gI0wdU2FZz2townXYwW/mtJnmTkBZo31cPDHctPSwpLQR+z+90FIoDPfcM4PD2bxAVQ+5Mksrtv3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWkk05KZ4ytgeE8NcqQlfY5CvTypxkjAizxqtcsxrN6d/JnNr
	487OhDMmkfJz9j33CimjqRdYniQWtVEzV/Q95/U65A5FKAiMnq2R/SfyH+bBZsDTb2Wzksm+maw
	lC5UnRk6MJjxljiuQf2khSJUjbeT1oa8=
X-Gm-Gg: ATEYQzxHh3ihsJ6zAVyxbf+GHCx1VFE4E0Hk8xKP1cop9aVYZSUMWfmqC5ucFWMaYGz
	5CyI9/+n9RyRHpqAB4hbHSXtK7XSOj7iVbhLPUwNmPBHYDKWPRexP+S3neGr/PrBHEPaLMH31eO
	I84Z0OLQiIkjYy4tQ2tmrLOg5IFcC1qCSGAnclKvWWI+D+TH6r2pcczB3tkkWY3UTAh4KEhkkQW
	StvYn8wYfPFLDjb/a9wTHG9YjaKkTpwNNdqEzV/OL3+wKFdyT6qIenUEdzjK8qhPe6viN6CfXI3
	nf+qZhS20Hc4uGQS+dh/HMlLSjzZvmtX/g3u9L7fkdyq0dOD+xyUrIfzHFWbM8kW6X8n2qEGOnv
	4C+GqUGmzkDHE0bkkgZV29v13/Wcw
X-Received: by 2002:a05:7301:3d0f:b0:2be:79a:69f1 with SMTP id
 5a478bee46e88-2be079a71bbmr466663eec.3.1772396399747; Sun, 01 Mar 2026
 12:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
 <DGRPSFTQAMBT.3CWVCXXAVET3X@kernel.org>
In-Reply-To: <DGRPSFTQAMBT.3CWVCXXAVET3X@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 21:19:47 +0100
X-Gm-Features: AaiRm516Bj8LNc93Zzfcec-XeAiMMVs_6kLDscNbF4iVu3fxL2mGGuk1RYP6ugI
Message-ID: <CANiq72kk16arR9YYQKsz1fPJJTt_v21Y7WJ9aDMA6OSc4y92OA@mail.gmail.com>
Subject: Re: pin-init Clippy nightly trivial warning in 6.18.y
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 8:14=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think it reads better without folding the if into the match arm.
> `collapsible_if` is a lint that I dislike in general, as nested ifs in ma=
ny
> cases read better. In fact, we already have a `expect(collapsible_if)` in=
 the
> codebase.

On Sun, Mar 1, 2026 at 9:06=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> I think we should just allow that lint here. I don't see the need to
> shuffle around stable-tree code just to appease a clippy lint. Further,
> I agree with Gary that if we were to do the fold, the code would become
> harder to read. If we moved the condition into the guard, the pattern
> could still "conceptually" match on the blanket arm below (it logically
> can't because of the `!skip_until_comma`), but that's a thing that a
> human has to parse. So even if we still had this code in mainline, I
> would allow the lint there too.

Thanks both!

I suspected you would both say that, which is also why I asked about
the overall opinions on the lint... :)

I also feel the lint doesn't have much upside -- when the suggestion
may be a good one, it would still read fine when nested anyway. And it
is the kind of lint that may easily bias people to just apply the
suggestion instead of allowing it.

I think we should consider disabling it globally in mainline (and then
we can backport that).

Cheers,
Miguel
