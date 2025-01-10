Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEB720ADE7;
	Fri, 10 Jan 2025 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505898; cv=none; b=Uko3cFVJQIKHstbLsT10htN5SqUDKAyuFsIMjmusULUhKQUJ+JcBOHzlxID+xMu3qHh333570KxJN/CQOaX64ULcKPsEaBpuzT6L6mXTZRy1CKoLkIOXZP3G+ej9d0D5z3jgdQ4FE94qJ2/PJagzQUEjgBzabfFKqQjhCNzVThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505898; c=relaxed/simple;
	bh=fOv7coRlriT5GANzBwoZW5RjAdJTGUO0YETEjUTqeco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxgkNx2Ww237KE+Ge9X6ZiQDKdg92ZjKxShfvEzK1fz3z+cve3P3Eno1BndhqAhzIGmacR1Lg+vU1cm1B1cSCTHl4qy2wurwL9UTcnPaMqu4eNBwVfAPV4wMeX4QHOZTeMNPPaD43nrvnjLAAQ49TZiDG/1cCU38BFcPi4MgTTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HToAc6/s; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HToAc6/s"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so370222a91.3;
        Fri, 10 Jan 2025 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736505896; x=1737110696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOv7coRlriT5GANzBwoZW5RjAdJTGUO0YETEjUTqeco=;
        b=HToAc6/sAbZ/ZpCTwm9g74bGArWO8z6G7KKKgGwtsPXKZF99TeFtKwhuxlT8F+Bv35
         dsE5bSA89gUdAixOUzEEt4Kzwcc9zuB6pweT0edzIxzDui/0Vr+dd4bqWWI8wOOEQwrb
         hD2NSIVOreUueU4cFXHIyTBhXg1xyyez9236cdARr5mkiqs6GgHQ/kuiK2A/0HjrlsJg
         KlHs3CzQ9rZpG5W3zoIj1w7loAkysG7peGhj/s/LPdhd7wCwAQ4/SCIlMOS9Qc1Qp6Mt
         H96rnZdKN4GYkpL7a+nxNAD6ryd6BRk1C8ic4sAWHPs4UuZTaSxuTl1WorNu0ytLxM//
         SePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505896; x=1737110696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOv7coRlriT5GANzBwoZW5RjAdJTGUO0YETEjUTqeco=;
        b=LlZzdJt4F7F/zpXvEfjfZmx+sNxIxiUE1/8y2avjDwRLgNEGYN9mrAib+O8RyXcmA8
         3HRi3qjhEst6mjE6vvZACJ8AMEiQMCLNPZFLQNZcJ0XkFPB80GmK9KgJQ2takh6G0jrc
         zkTr3k9VHpzCNbiUYj2Y7x9yuGvoKeyUKE8avF1vVTowAKarARdTF5kESE0/UyAzbPzg
         vQCGI0ojRoZen2UWlotx9IZlHG7N7rMf4DV5ZhXnxf3ygYQCAKK53H7VQPSYw7KVot5H
         ykx4GpirBD/soALppV2OwTrcoITyDiYl/lPzkwyjikojv3lIwJKGZWaccdMZBgwpERep
         m7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMUWapIBqtFuGAfYM2Dnould4U+Z9ePt552UofD/nOFA1suizvavGarbsg7wq5Y9O7FOu4WEj/slVyd3U=@vger.kernel.org, AJvYcCXPbKPzgShiTH0SH7NgG6A36wIaCy3NdpGOu9jqTsewycgGf0cu1Ww3V1a/0vrybUkXSjWQtrjhq13YTeGzy9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOzIr4ZddYshJU4EReOb1sk18LUY9zMmxFVydICkpLtEL47V6C
	h8fyWQHd0ZVZx+PUGeXKUXakKQIOMkA80Ui6hwInkxwWOSWXC4g3S9FzmlBnIfHArxIG9Ik7XSd
	PfvOutJ1Y0rF0Fhkn2WQh3pMCHns=
X-Gm-Gg: ASbGncv3IB9Gh+/9RzrKkxy7Ci94sXJbdU79cRRsw3YEXfBQJXbnN6Wh766egwnZlNs
	vtwPMGJMlh16abWNtaPq5QXDQo4PSsOC6DPUblQ==
X-Google-Smtp-Source: AGHT+IGNLLtPuhByhtmusmNLB2QossNQCJC7ro42TnrIvXjLtSadskn5v/LaUt8bn6GUFk6dcNI9dIANJeOAzCIQUOc=
X-Received: by 2002:a17:90b:2808:b0:2ea:bb3a:8f09 with SMTP id
 98e67ed59e1d1-2f548db69e5mr5302153a91.0.1736505896347; Fri, 10 Jan 2025
 02:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123222345.346976-1-ojeda@kernel.org>
In-Reply-To: <20241123222345.346976-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:44:42 +0100
X-Gm-Features: AbW1kvaBvWqqb3Lx-vPEwf12VHqF1zxLTLPxMzQsbxNmtrbNwtOPae8QLNhIWTA
Message-ID: <CANiq72niw1ZU_97PsfGB0dgcRQNCo9LiFCjaHWCTY1A3qe+O=A@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: give Clippy the minimum supported Rust version
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:24=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy's lints may avoid emitting a suggestion to use a language or
> library feature that is not supported by the minimum supported version,
> if given by the `msrv` field in the configuration file.
>
> For instance, Clippy should not suggest using `let ... else` in a lint
> if the MSRV did not implement that syntax.
>
> If the MSRV is not provided, Clippy will assume all features are availabl=
e.
>
> Thus enable it with the minimum Rust version the kernel supports.
>
> Note that there is currently a small disadvantage in doing so: since
> we still use unstable features that nevertheless work in the range
> of versions we support (e.g. `#[expect(...)]`), we lose suggestions
> for those. However, over time we will stop using unstable features
> (especially language and library ones) as it is our goal, thus, in the
> end, we will want to have the `msrv` set.
>
> Rust is also considering adding a similar feature in `rustc` too, which
> we should probably enable if it becomes available [2].
>
> Link: https://github.com/rust-lang/rust-clippy/blob/8298da72e7b81fa30c515=
631b40fc4c0845948cb/clippy_utils/src/msrvs.rs#L20 [1]
> Link: https://github.com/rust-lang/compiler-team/issues/772 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks!

Cheers,
Miguel
