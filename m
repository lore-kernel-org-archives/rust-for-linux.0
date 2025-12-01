Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC83311979
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593082; cv=none; b=Mj+jZiNdykKcxfFtODBzA3/f3gQd6HAbKAcUQh6vPB9sSJnJ8380s2mJBAaa5fSGnwcitffyw/l1BO36Tuc/v0HKLbsbbpVKc2GObm5kTtDaP5PbthWDWE2M+BGeo2F4ZplRPdxUSA46B9TwckgYtmf4ithxwp2/RKsFksPgj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593082; c=relaxed/simple;
	bh=XQBW+5Lo7mZallRp8mWLA9GmP+puBJoVHBIGjRx1fGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdQXzqA91IeO246SMWVqT7VphFhD+IWyFDir3wNGWKA2pYxbJYwyd9xAq3m8lfIKbaMrD973bntyXiX+K34/wsD/vZQeK91SOlHK4dY3TIlQZ9kSVQ9VQBro+1p1jFFjUA9/1dZtmzKBYW8YPsF8LS23ZMhoixmEJsBtRUekUCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5yi8kR1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5yi8kR1"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a4ab6aa55so2485781fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764593079; x=1765197879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQBW+5Lo7mZallRp8mWLA9GmP+puBJoVHBIGjRx1fGE=;
        b=Z5yi8kR1AvC9Aab4+FwQ90Dpa+UMjsr6h5ySBxqr9s8aLVZLnK3NGPtknNuBZkLbaq
         KNe07p630ecNR0+sywlVX03uB29L6VYepv7Ehrvd9YmzXh5CG4TK40g1GS38pHDJMkec
         RTuJK4V65WTwxHC4TR3nFYg9Y/92oCOvKheN20GIGGzHcUKNYj+50I9QdDYdwVIfgN5p
         BjidNx8c156fMYKEJtgK/qAMRkdK404v4OkrsbzKtiKuQnWvQiYe2dSRlCkvcckCyhIt
         Woi/C9iPjUrBeL9Ykxb8n0DN+WZ3R32j/TXHy9HsbwGiQczXFmRzW/Pa3Rxt97RRkNwv
         tzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593079; x=1765197879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQBW+5Lo7mZallRp8mWLA9GmP+puBJoVHBIGjRx1fGE=;
        b=LOESJgJIKUdQ5qEEHMBQJVuxz+LVc77qOsfyF9/2mg90elbFEiJi4FBT+y157IgDV3
         ugEOBAVMiSLfdtyui+OH3Mdlj6uzrVO3v36sTPop4JJLKKKjSIbHkKkwHzOXIPYm/nBJ
         E4fQtyd4rEGMiNZRKnXjXNZJOgSK9XRJ4rfoDz3D8oPgsKHb88KejGDIiETGJjchyhY4
         ALHTb2A9bT3G2KGa/x3wJcmoeCL82RG0U+DeX6X5AkMy/2JqblIvKQWCRKsXVz3oFJX+
         XDDowPTQm9qCX5jygq4JmRXqouADN7tgRDiI4A+9gRCUZhJwoZE8+j2LqNNOepzwRbSx
         ElDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGNl7zlooPJptEnhobZoR/FvN7qU9Eeke9cuoNr0C0b4YSQqOBTYGxjZc7DBnyL1k/MpdIWbiJXf24lbR+gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiTn5ic6zdkzQ6YqyUf+cGaiwhh1F5VsNj7UftQ41K3aOUPC4
	0Xh8K5U/1JWsTrcxNKZWnnQ5JBPZvNZ0OjuxjFQ/K1ceTZ9Kk34b0pouflWk+doG62MQxDTmj18
	Si9ZtPNd5xH4gYZGMVODwT/18+FZJpSM=
X-Gm-Gg: ASbGnctc75vCb3EN8t0z4xLURNwsg/xT+dkBcTyafz3qxFS79b7x/RnWMQz1P4w0XEf
	cMlhu8tc/qzf2J/URMs3Z7xSo+mFonoskal/n7+669CwW2/i3EdCtOtF4N9pgmqE3U5oUdQeeWj
	g/2OjNxsh3BRtcnbMelnDZs19eMYIwco76QoA53sci3Aln86q+o1T1fcXQp0l7LEL+JrrkDcXa1
	a2h8KgB9+6fdHxHVZip6YJawfbqj35lFnQxynhKpl8huLugMWf3HeQsDF48BJFubt/htiIqk5LG
	S8xSvLm2DEyyhPALlb434+wNdjFJenpAu6b7Ywi9VpGWfLPinpd5Dlo8ayyqXOkapVWIC0P/fJY
	poJ3T4fD3V2mOMA==
X-Google-Smtp-Source: AGHT+IFb0iNykWSVn6vyzICdxUboIY90obmm0TncBvkDH8UTb6KhqxQpTLdymk0nGoJQddoU1IIMUVgJCL+bj3NOjsk=
X-Received: by 2002:a05:651c:2583:b0:37a:407d:6359 with SMTP id
 38308e7fff4ca-37cdc33f096mr52002801fa.1.1764593079126; Mon, 01 Dec 2025
 04:44:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
In-Reply-To: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 13:44:24 +0100
X-Gm-Features: AWmQ_bnTPmFyhykt133eoLggPfeMauUVftYvjsv0Hge8ZwC0uS140sO2INkthFc
Message-ID: <CANiq72=MfmAKfV7GGwkyNVZfmtcxdvCroUCwC3D4Y0dN_f70CQ@mail.gmail.com>
Subject: Re: [PATCH] rust: num: bounded: add safety comment for Bounded::__new
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 7:26=E2=80=AFAM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1211

So typically we have "fixes" or "improvements". The former ones
typically have Reported-by and Closes (and others like Fixes), while
improvements don't (and instead Suggested-by would be used in this
case).

I created the issue in this way to have you think about whether it
should be `unsafe fn` or not, and depending on the solution, the
eventual patch would be considered a fix (i.e. making it `unsafe fn`,
since it would not be intentional) or an improvement (i.e. documenting
why it is not unsafe, since it would have been intentionally safe).

Here you considered the solution to be that it should not be unsafe,
in which case it wouldn't be a fix and thus those tags wouldn't be
used.

The solution to the puzzle is now revealed, and indeed it should be
`unsafe fn` (even if it is private), so it is indeed a fix (but not
this fix, of course :).

[ In particular, functions having unsafe code inside of them is
orthogonal to them being unsafe functions or not, e.g. you may have
also safe functions with `unsafe` blocks inside. ]

For v2, you should consider what documentation you should add to make
it `unsafe fn` (please build with `CLIPPY=3D1` to check) and what others
changes would be needed.

Thanks for the patch!

Cheers,
Miguel
