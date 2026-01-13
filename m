Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77136320CA7
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343917; cv=pass; b=A97GEko4GE4a+CIW2Lq+LoixlrF8q5vtimlz0ez1IwRnlEgn/RbYCIeFH5QQCICAzGZzT0a+2avYfRwTaFRIQnzXOJwLVsh0ergjVNPWpQlj+9vY3cgWkyqzwkHla3qt4ZN00Ez1u2dEvvRjeLvVbNxccSDGCs7qU5mxvziPmjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343917; c=relaxed/simple;
	bh=yR67+AUGZ16n6bsHFPbTDqlbCyrjK+ZiGNgQypO4gAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUbo/6jb1MlMR3pUxz5rgMlBVHmhvhGhhWPg6jbQhUaNcfTePlMlBrBTP5evd0LipDGtdRZpR6H1gEvj0/meG7ERHYAMkI3cMVdC4q4N2EbrCPh4lB1j8QPrWUIsAMRgZ+8TITXcqqeoE0/olE7mGoFaLOmurlVK1IxNE0awFCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nawUPC3X; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nawUPC3X"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12336c0ae91so18535c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 14:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768343915; cv=none;
        d=google.com; s=arc-20240605;
        b=BdsaBtxQR6VOjZ2ILDBrjYS4l7nvE7azMBzNQ8QW9f7YcqYcPBqLAfDqsGlI1bF+LY
         dmtkXH0qqYeD/fOVUF33f1icw76UOeTZFLssdRfr/T23uYiZ26AMrYcQ15gxOxf5FRfG
         MX+Rrg80I/yFt/Mjf5d8H00ZaKQ5i7JRxolVjNMffUR+TtV6As9/8KkkfCUI5crTdvET
         VSS5P+xBPaa8HWdU7CkI28OlZ1emHeMLAcK0dVQcl2w2ZwpOV0paYJ+FOezk0KxbGxOp
         PIRwPZQcp301nEWzgBm4fkH/EG6Bo219SD8AkWv2sSussOdrBfgtLpMVNKoA959TlCqt
         JzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJHXh7vjqRtrAB2ClpI2xxPxM5T3xFfC+atF0zr/KPI=;
        fh=6ApVj6kt61ar0LAUakXhBu+8d/0ag/hNzqERQ/nJnBI=;
        b=fLCWplDz35LKpYBT7apfBFJuE7CsfLilzjxp+2lstRc/i/suiKbmspOjRqfXfIKN+o
         GGq1E/YbIl+DR2eE1oLssQF7eMsPA3L0PhKBzDk2zqUZvCI/Ffxnc7uKZBakPefPBRO1
         pXrKNCfgTI83rFbbuw3nZWqJfFfABMMSG1d+8p6BKCOCqPg8ak85AdKa12FHUJZQwuqT
         twDKOjFd4nHQ6nKHYJ9V2LqqQq/o0h+Y7wMtpNMa8F4ej0vTqcyRrtArpUXqfq5zl0kx
         ngSxTLXzz6xrxp/baTH4tDo0OIj/xTwBOB3BEVz1BgG0e+U0PmtcuvJH24XEYPd4BriS
         6xqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343915; x=1768948715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJHXh7vjqRtrAB2ClpI2xxPxM5T3xFfC+atF0zr/KPI=;
        b=nawUPC3Xn560POz3b9TUEwqk3k/rP/Tg8a+M6juGwdkutxHGsvqavNyrIb4NuaRx4T
         opQqS06DGVOt6YPIHe5P+u6cB4qmPlg/XB2xmZVtBHQr9MW3rDFM0XJQgz+p8IgE7Xkp
         Rs8PAHVou7En8u9L9xlGFzbblW/EtHDeVymDWSPOXAqZYJTaPGLk/kA92DH1AjzyTxJx
         VkXNcTqwnr58e48NR18KjuRdkyjjLZQZ1of/bH2cnUrAQQsU8WD73oHPICZGsoLiU8jN
         qL0w9brijAr7qqmyb9ElbG+GCM1IPIDvCvJM3wYhtXZB1KW9oLe0/7jzQ1bYEFmi1BeC
         aGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343915; x=1768948715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJHXh7vjqRtrAB2ClpI2xxPxM5T3xFfC+atF0zr/KPI=;
        b=OpgL6xXDMbJgV2CtG7GGYcPNrxBjSOILhrKCctyQ3d5TAOYspgiJWF8iMZrbZ5DJYO
         J9kIOvZdAcT+FVeOaIxn0wUyTYTqQBX3QkGYJYh3M5+L9VlMDjuDHBtizB+8+NhgcKpt
         Ok2Qlhsgt44p4agZkxX30qccGzHUUcpzEv193Pt0HRSwF+9R5EwQevruK1EkPzqCvPH4
         3vqDpHgMCSfeJ/tC1eeV4MjAWQJF9MtwKIqCswQmsG4+uNccAsVwqWPHEtf2KtDStpal
         KR4c76Cozg1MFZ6DojtiJBEjXAE3y7kn88AQ5SxtNINqN4+ME2KaGXhFIzRPEA+FZyxY
         STbA==
X-Forwarded-Encrypted: i=1; AJvYcCUB5ML2x9uHsJJbM5kPe8y8x8pIycS3LA6AfgChAaWFXf9+vqwtBpPN/wrlGtgfFd1Hf6Na96skuWCTByV8RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7B6WJy8tSjXzfJImtwtPsQ58RYZtw2gZFaA7OambAWYqvyDU1
	PJGJtaGzOuTQWi09nj0M44NVKj02FPUH8e088XMpX6BvrCiV2uW/0RoXAUKDQvTSdM5GcdKt7eN
	QHE76ZcD9JMU9EiPtXDOo7bHM0KuU4Kw=
X-Gm-Gg: AY/fxX4s7RB72MP8BRQNfgYz0L7JHDQZKncSSX+kRphT2imzn97So0F0ZCHHYwHs6a3
	Vz8mFpE8NK36fsoVnusROJLjLwtWz3/8SpqTrqZW1Saia2ct2lLC1qRfknBx0mpNmD9Nhm7KM9f
	K5FO+LhnLi0x3SGz7g7ekzfy4nHbJzOD7y7b+xpdjWLSilE8ULGMVVUIAYw6w5/FmjF/rbff0tN
	P837NxZW4+3vLQgQBKYH+pRyDwyxI0ZW2ANXTb2RownQeSl3Z1/dWdmetvzjtcoCe1aKSID4Bjs
	huB5vR8fe2Brzne34/hO1shOMw8B3QAaiXl9Y+roS33UQuxrQla5GFvjxqkcZuGQTrHfZdwi8LX
	3exWQLd7LCOrT
X-Received: by 2002:a05:7300:7fa6:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b48744d96dmr327342eec.8.1768343915380; Tue, 13 Jan 2026
 14:38:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113202138.565332-1-foster.ryan.r@gmail.com>
In-Reply-To: <20260113202138.565332-1-foster.ryan.r@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jan 2026 23:38:23 +0100
X-Gm-Features: AZwV_QjyS7QWxKXI3WbNw_JHVq7ZYKgu0jk6ViOqfoEUWtbOd9kbyWLhIeElQ8w
Message-ID: <CANiq72me+h3kKzuUpvQCUqnJS7CHp+xbn2xdDaxaiyAS7qEe2Q@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn on Rust comments with rustdoc links
 above items
To: Ryan Foster <foster.ryan.r@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	joe@perches.com, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 9:21=E2=80=AFPM Ryan Foster <foster.ryan.r@gmail.co=
m> wrote:
>
> Add a check to emit a warning when a `//` comment containing rustdoc
> link patterns (like [`Foo`]) appears directly above a Rust item
> declaration. This likely indicates the comment should use `///`
> documentation syntax instead.
>
> The check uses heuristics to reduce false positives:
> - Only triggers on comments with rustdoc link syntax [`...`]
> - Excludes special comments (SAFETY:, TODO:, FIXME:, etc.)
> - Only warns when directly above a Rust item (fn, struct, enum, etc.)
>
> Examples that trigger the warning:
>     // Returns a reference to the underlying [`Table`].
>     fn table(&self) -> &Table { }
>
> Examples that do NOT trigger:
>     // SAFETY: The `ptr` is guaranteed by the C code to be valid.
>     unsafe fn foo() { }
>
>     // TODO: fix this later
>     fn bar() { }
>
>     // Regular comment without rustdoc links
>     fn baz() { }
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1157
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Yeah, the suggestion was mostly about detecting docs for private items
that used normal comments (`//`). For public items, the compiler
should already be warning on its own, but it doesn't hurt if
checkpatch does too, of course.

Did you get a lot of false positives without the logic to exclude "//
SAFETY: " etc.? I suggested that heuristics as a possible idea to
remove false positives if it was needed, but perhaps it was fine
without?

By the way, to clarify, for this example you give above:

    // SAFETY: The `ptr` is guaranteed by the C code to be valid.
    unsafe fn foo() { }

wouldn't hurt if it triggers either way, because it is actually wrong,
i.e. it should be a `# Safety` section (in this case I guess your lint
doesn't trigger because there is no intra-doc link anyway).

Thanks!

Cheers,
Miguel
