Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A477442317B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228656; cv=pass; b=am4NghXiTvCoXSzZD0oCMOf/pArDbe36UpYf8w8OVXEMaMdKtOfCe7SuHaeXjNbJEkG6ZYh1DR9Bddb9XdJ6ipvgWvbxCdWukume7w+H5tcXG9WBsvf0NhgPVMX81yZvobi9qDvkDmFDJbycJqb8XckSYRtUkBTSEHzEvvrBCns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228656; c=relaxed/simple;
	bh=wXMxZwcCCfHCysx5ZaboL4wCTVDAkd8l9VnH2J8HjK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDhzBcSMeusFJ1bXswZdZVZEgozg7Yiq+BX1ol+IVtJSqfQNyPeps05LIWDFQ+/1D521Y772KngVtuU/OjGi8lfBu2G8yDqNrTeXt1E0EFLlOHqemOD/9kFDerEqjT+FBP07HJLdL6Iruq5QvfUtE0bZEwpK1+jLRON13x4zzpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEY5iw8Q; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEY5iw8Q"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b7267ff06fso429401eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 10:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770228656; cv=none;
        d=google.com; s=arc-20240605;
        b=Nfz4dpAmyOOxRrje3yZtxvoDYjolEpiWgw9A5bSwVaM9MkYNeAXkMORQ7BVmJ4MdJN
         ymbnZf76uLFGBUJHpWo79BqjIjY2meFKMaOlCgvjl3tLjPMhxSuxW8RBBeJ5Btwaj6s8
         giP9+WGGYxRNwzdkOeQ3VpkqAtfQxk7k4s7z+TsB9adlsA++e9/hH5OxeqpDl9qV9EHA
         5tUtO+O4mFURjbU/nnraydB9RChWBfuKL3rX3dVZD6R9QxeVZ5QJQubcPUfvy7Ixqj5E
         q7JmqP04a/gPkmGfPhPZ1ADspXaOBhL7LfV+vi4RhIR5iUfiRNKl5VKqFxchzH8bDzFi
         WraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wXMxZwcCCfHCysx5ZaboL4wCTVDAkd8l9VnH2J8HjK4=;
        fh=EqlTMlyKa0lE0aFnAhvJvSN0wA9JwgUYS4vWpNpZRsY=;
        b=P1JWmSsatYx6RtupGrXOqvhP30Ymf5VhbrPcjBBT/lvNuVPKme9ECEAMurs69bE3zE
         EL0qtjggfs9dKc1wgwxIrgW4ovmfr/ybZ+9wiRmQz8BiOFBGo/NXKnFcGzd59OafEMXN
         6L7nsF7vebjBMfJcjlgwSBS2H7r8lNiIyN5nNKNYkdrDpwAOJRoMwb2iaHxNK5ShiB6d
         uVyMUoUWeCBd2xV9vp+PKLc4z24XjJfOu0hpsRihXPrUQlgzm6c3/zsd3CGpUxD1pQd7
         pUjRSu10VhOOmGmLgLIN1banP6Ugb+t0PG3607VGR+FIubY6yDKLJogZHvxzh2HgL8yn
         7G4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228656; x=1770833456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXMxZwcCCfHCysx5ZaboL4wCTVDAkd8l9VnH2J8HjK4=;
        b=hEY5iw8QKPNZsK/IV2GjTMss3vyPBLDDbbCwCpoUUXEFDb3O0JXTOlOaI0TdkIgMCr
         phQmgrzA8CKKxvozf8JsofiKY0g1CpVNa6jfANYST0prum4h64bd1dTXX4Dc2jRCvePg
         49KoNGX/9PO9/3mh3HU1jAVUUAXL0BbHJKFnIIDxXTCilk1YlWq++v7+cdo3/OpExCIE
         XeZh+jSdRVgoiDQHg5vW8NrxuCczseJT7B9tll9ytTI3jV/y5K5ViYE2drZP0l4pKCDV
         QS5ApfMHhfjU9h9a8X35KgXpOOarwJsS754DoGivxz4seX/kEapYWsxha2VznnyI2Jtr
         Yjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228656; x=1770833456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXMxZwcCCfHCysx5ZaboL4wCTVDAkd8l9VnH2J8HjK4=;
        b=O3lvTbWIv4KdyQgM2VhLw+J0cYVZTsePJRn5kUyH3TYyxILP5/b+BBBBeivNnlQgte
         VWLw1fa+wOUEb202Eo9T7BZDvCsrqMR6n2wBJQt2cDJpOZIAipS4iF2FD1FS8hW1nQG8
         vu7NRe3eaU17l9ZBFT7KA2QjswzQqyjcVfKIu0FvWVMfoBYNS2T9Wr9ET8LUA4GHKocX
         naNyFlwHVJVhBjrIXrYyajLZreqvvZNIArAv6XBJWHdUkC0K+R/fC5cjMf7w30OXHXr2
         i4L56zbP6tJuN+R4byynxTWauMmkHztPLhbjREg0hqsCT2skXYns2rtmDkETnsmDmnQ1
         FipA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+hy/BLTZpkaCgrALy0EluVUEV/TkSapSsE5L7b3VKtjm9Tn+buFd4hH3Yo5cuyrsQoy7H8Nc+GDnIeSFbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrA/YchQ3b7rdMnkIgdIfJpUCKjSMU+7ml4G1NH51ZlrDeeu9
	gZiPCjFuvUhKN/mvYTrw971VKm5BHP0Z7x/nDR5HasQrG3GC7qoK7NVCDeOb3XGSxDTesjE1qlm
	pz8mycbUnlZ94HVwfTmie2eEAodRe9bc=
X-Gm-Gg: AZuq6aKhA2q8GIVXL256GmYJqdHop3V0o3m146WL7B2JFjj6najxPb/j5mEWf3Taq+N
	Nl6ySRtlm9ttf/80JEKUeuzRha02t8V8mt7GcvcO/gQJ7IQFu+/cJ7zk3kxgO61YrIpPMhiEiFb
	jWyxjdRcS9w6khui8//u8OcRLS243wm5EQ31bwxkbmgsms5Gi21cQ/DKPqDKKGkrUefjcHGpCf5
	Nz/PpDllSS78d9OVUJLNXZewOmHw9KwnXZM2fjx8Y5/eMXK7VIOHON2OrZrfUpv+5yRfW746zO+
	D61IGNvGrczkEnYmtjYzw7223jZI3vsSTLUCgFSR4PjBi1wZbVFVh2EQXe6VTcWS9Y5NuU2gRe6
	mHqA0jkrIw1vl
X-Received: by 2002:a05:7301:2901:b0:2b8:2082:5bc5 with SMTP id
 5a478bee46e88-2b83296fa28mr731101eec.5.1770228655696; Wed, 04 Feb 2026
 10:10:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com> <20260203184933.23c92f8f@nimda>
 <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net> <20260203193240.68bb136e@nimda>
 <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net> <c150ba95-a60b-404d-823a-316710035dfd@gmail.com>
In-Reply-To: <c150ba95-a60b-404d-823a-316710035dfd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 19:10:43 +0100
X-Gm-Features: AZwV_Qgm71oB4NnlnfixXJK6w-jXwta4ym4tYmvubpIgP31HkYGZATPpSUxl4YI
Message-ID: <CANiq72=J5LBxfawu3MtQpcukaXcw+pRyMWd9ueDE=od4X99R3w@mail.gmail.com>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jkhall81 <jason.kei.hall@gmail.com>, dirk.behme@de.bosch.com, joe@perches.com, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 4:56=E2=80=AFPM Dirk Behme <dirk.behme@gmail.com> wr=
ote:
>
> The question is if we could find a way to make it *consistent*?
>
> I mean how should a developer know if the warning (he gets once, or
> even if he checks an existing file with -f always) is relevant or not?
> We introduce the warning because we want to discourage the use of
> `unwrap()`. At the same time there are places where its usage is
> allowed or even needed. How to know what is valid? The warning or the
> usage?

I think usually developers use `checkpatch.pl` mostly on patches, not
existing files; plus it doesn't make the build fail. Thus I see
`checkpatch.pl` as a tool that can have way more false positives than
a linter that we need to keep strictly clean.

The idea with the `checkpatch.pl` warning was to have something we
could land easily before we got the new Clippy lints, and perhaps to
apply it in more cases than the eventual Clippy lint (since false
positives are not as concerning).

I have some context in
https://github.com/rust-lang/rust-clippy/issues/15895 -> "Additional
context", and a few other issues linked in
https://github.com/Rust-for-Linux/linux/issues/349 for the new lints.

Cheers,
Miguel
