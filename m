Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157633054F9
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767532916; cv=none; b=cLCXP1c7QQ70IPWEdw8tJYhAeAJp3qfqzIatJMg/pivX7uC1oPnM0mVVaPRPwInXMyIBa25tnQ/X3cMPOJ2Jn7klbp9e+sZy6cNZNldJjhQ8wCcjVEkpQuCSe5B38wmRCrTwvtQ/kGDfMkXb7btXnpU5s3nCaGeLGWnbWxgJN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767532916; c=relaxed/simple;
	bh=7/4ln3B3M3xHzo2N2rdI97Bjd2kDqGMUZwRxnytN5dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSEvnaQsAmIpP5S48AwMRAFAqDMIMmfw8cNw1DeX7sqMyw62YvRD9ENYI8gQ5s3OSGcLHIaFPRDrqgp5Widnqdx+sa9wRcUNthO6qOk5d9iwXGCQlyDALGhPoepx1tERhIQ4xCkUIlChbeWIyNIR/mOMxvyvfYjrBhH8saZZ+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/i4o4ZN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/i4o4ZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D54C19425
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767532915;
	bh=7/4ln3B3M3xHzo2N2rdI97Bjd2kDqGMUZwRxnytN5dw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n/i4o4ZNPoWg+ffmMZ+Cgo3V5BX9b++yPb8icpJnInB6t6T5oudnva+Q7cWjl5YbO
	 VI0cVyw7qTyMXKA4QyTgcMvic7qs8HQriAeu4lxnw0eiInWXfhr/YD3sAS/f9w63sz
	 /eljZRBowSKLflaWuOo0vw4ky/4xN/co53fnhJ7G5U+w2HX/HicD+j6lkoAR96SxtI
	 ymdSdCSzdptva/yFOz+9fpx//+oRO3MxIafRSy+D8Wb6X3aNYU6YUS8AX/i1OFcbjk
	 8DVXTiF7+zofAe7YLOFUqkcNCpFQBweSOJVHLs/5cJoqTLG3aUJ8inK5NkrM/VLt5B
	 vN+/XCsIKkKpg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-598f59996aaso15730845e87.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 05:21:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKUijhIbWtJ+EjAFwxUD7YGJR20qV/vwli0Ua/sAZunvtnOxrns4paP/MsAVIhiK2EgjRyd660HInIp4EXIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+LyRzWdHzG9j0j3JVWzEeAmrGvVwyS92YkNycriEeQlO9PRd
	8l8D5xsfhy9jLMCWt0vrxSQAX33Cq8t+L1TWMLRhy0jIWTz7kPBv1FbjEW2ja+YEMZndMoJswFL
	Wb/psRjMp7iEv4nRYmEMcilYeH7JTZe8=
X-Google-Smtp-Source: AGHT+IHz06GMI6VSivaxgLv3bz8e4RvKFFLGeb9qwviRb1fBV47pTEbsgCWQfcIZD9Ag7+qrB+u7d+/JZdUCUFfxqYA=
X-Received: by 2002:a05:6512:3b9d:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-59a17cff3d9mr14739208e87.2.1767532914281; Sun, 04 Jan 2026
 05:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com> <CANiq72mx6mpJsvd9MWkSXXN3tAT59X3_-o4GnZWEw33iCC8PWQ@mail.gmail.com>
In-Reply-To: <CANiq72mx6mpJsvd9MWkSXXN3tAT59X3_-o4GnZWEw33iCC8PWQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 4 Jan 2026 08:21:18 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9my1VQej9UYex_5hpKRWgnnbL09fCzdbqdk2VGVmsh3VA@mail.gmail.com>
X-Gm-Features: AQt7F2pL3X6VIhfTR1PMbmZTqyb3kUCcNpO9FrdkUr0UbW8aKMwmPIWc4j_F99U
Message-ID: <CAJ-ks9my1VQej9UYex_5hpKRWgnnbL09fCzdbqdk2VGVmsh3VA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix formatting expressions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 8:02=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jan 4, 2026 at 2:00=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> >
> > Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gen=
eral/topic/Custom.20formatting/near/566219493
> > ---
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Thanks Tamir, I will pick it into `rust-fixes` alongside a bunch of
> other pending fixes.
>
> Quick note in case you want to double-check your scripts: somehow you
> ended up with two `---` lines and thus the SoB outside (no need to
> resend).
>
> Cheers,
> Miguel

Ah thanks for calling out - I think I just forgot to SoB the commit
and so this came from the (empty) cover letter.

Thanks!
Tamir
