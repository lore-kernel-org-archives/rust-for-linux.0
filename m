Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F5342FCB1
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212139; cv=pass; b=Tdwk5xFmHEmdpuNwjgm2+MIAa0xf47cY0t6jldn4ilQCpY3jVVD/8KQZ4UOoVLkZ3ba3etCZr5rHZI9MWwb8XZZUhH0uV0hfsRCmu4uFe1WdEmI7ZtzKJ7mv4cptOQpmWcsbk0qP7326ZemTzEXyFtOsbRLjcw8QZvgmtl5njag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212139; c=relaxed/simple;
	bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxoPYOaBfglOv1RWC0uOK1MdHJT3JPPX3Iwt//LwcCkfRI5LZ5g4SgpQUOcFuzvQlBn0Yf2gDqStuYUhkhoiYaohR9NAgtMVZ1SHZiaHrKh9a8SrMRo4VWouXlA3ds2KIRgVYWihMmTOIaQ05BYbBQnrRzmcbElsPQHg8dRyG3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRCiUF2D; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRCiUF2D"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so960249a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 07:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784212138; cv=none;
        d=google.com; s=arc-20260327;
        b=XuxzhENC/68//mRjXxharBSSsuXPBEdZruN5kUa7QA/BBAcPMEWJwmyck1ZAZ4yWr1
         JWmPA0iW1pvOCEvW4RfSvrgoViNunEaL7ubj4ZESzlMuTisz5z1LfkzrDIJiZ4WXjL7V
         su/aIi1W553avZIJtOsTDGyZOeGsy7bLYZ790DGTsrEI90hdUxvbnByUgEhw5aN09tpp
         sVq7p6MYMssxsp/cAGsCTGPMRqNrLbVyvTsXs8aMljWQr8r1rrsku0lgB13jYb0ijHnN
         ZgdzMprhOIzfG/yiRDFqSxYITD//8uDpOt2uGuYnNVU6z/NZkoSJqSRGwFcStgdRv/Do
         LFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
        fh=w28rhadbbjvz+TSPceKtDDK3S0wC6rXgWbxBN+41dMk=;
        b=lTtqzpCxTdgpKRbF3bXApSCMign5vw061onJ8092laC3v6QB54paydXnsY9o7EwOiP
         EW71xLd82A7V4CgYT0ia4tLHvYHfnwsF78xJP+9T39WavX52J7f7qoQNDZVmIgFOASCa
         u+pCSvPELwAbusj6LvCDNZelAB6J3tSoniQhC8Ayof2vqXlA/QkfblS2F4InPdao5SVd
         CrQKQdPMUBbhqh9c2MOpeq8EvvD9eRtKP6UcvZnlFJG6Pbs3MgazMeLOefin8QhTc/iO
         dk5Leo+4Ru2ECjYdJKa6nwUM6buQlUNYw8HoCv5Jkppo1YvasB7NwGOga+nO/E9DDTps
         j/TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212138; x=1784816938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
        b=CRCiUF2DM5/uS95hYCih0DkwKqxsEZDgMN1zQl17dJ9OIi926tmKUJwT3h1Lcp8F6M
         lqqyWl7P2OmGfj5YhPAnH4YgVQfEzUBCgqBZ3nH4KwXmMNiK2Phgd06g09OXzlFQqXSX
         bbzrYI/QcGKdtnEXQ1TuEfH2Pv8+LA9Y/ytc2nK/8KGsqOjIHqKwW/eD5p9S9wTKIKoz
         uAO/AbEKpu9t02D5jNIYbvl+5WAxsYMshDw0opw69zShO16GArc2FZ1QM0tXzEwgQ/Fs
         AREcSrJD77qFJ2Q1Cw8CQEgW2N485Wsj8FdEOzTwBMkr0vA7B4IBSFgBjcqoGOs16nLN
         ecHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212138; x=1784816938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
        b=mEu8+BhuNqarA9gGPJaYA0baCgXmf3Lm84iwericOL7sn4Snaa4ix/s2IshMLsjP4D
         Q0/XZJ2+n9cWFtyqpRpRA3MGYtpeTYeQAM4mSSsLuT4bj3ywpLKJHssX6req2qA5UIFP
         +EnkRWPhlYMULZFTF+ZoPNoi+UzWlbgjvEdUygdBwOUyKLj8nAO2xHSVv1H7Klp3/625
         pg6v6HH1n4/gWAryIwuE06Bz8iogDk8XRZd3q2RkW5rzfv6R0y1p+ZTfFcSoXxX5P4nV
         2jHmIR5wCkw86T5K6gmyHFaKox1n8HWGHSxuTCb6QeysEDf8zihK4bLGzq7Q2ucrLwsU
         HtRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4x6eiowkWDKgEGBvYfEKMVjcPHWxmHZCY7VF+8jAYSUp5NdhXOAqgoYX+E+GSDDBTFpRAV6/ejoDL8O7V/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIxNC9EOL5k7PXc/eQCgIA3JNJPxEpHEnYeEt+p0hRroCrQih
	uoLW5j+mWtpb3OF05KZLdp0lFROfFwYG2xQjl0L6P+nC+nIpI8fnQE9KWUd1twHpFFZpXjTdgIi
	Kkg7KJ0Q6auo4bmfQnetXJLCYJKRqWic=
X-Gm-Gg: AfdE7cmXWegunO1Zsn07nmAoqF1MsR3N271rTBIbpACeDriczoFzgHucvOJjGbMSmKY
	O1AJpRf86GiVnidlWzNK7LTI0kibzw80f5gneRGs6ERdx9MWpfIpd3jl4tl1Fipvadltf4iN/WF
	KcKebcj2PfJvNM7VQ/fGQUGvAybqNEIlwd/asRhFdLYsv5/ed9+wpfqkCyMQHwjGuReZdcrEZ9G
	AlWxS+09GRK2PwmIxKfGYYFNoHV9JDNmH9jw1GyZC+kvFjgZc1ySJF6keE1mPPdmtQXYI1pgKc1
	TUARiEHYU2W8cY0EkgasTKhSk2mY6mCF4xvh3etUNLtjYLoM/GLlFTFl0bwTsJKrVSVphlOU3V3
	T8Q==
X-Received: by 2002:a17:90b:48cf:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-38dc7a978edmr14844482a91.1.1784212137665; Thu, 16 Jul 2026
 07:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
 <CANiq72n3BYGfB9VvLk4-bBQzGy9YhDxFvCrjkjJqBbcJa5YRYw@mail.gmail.com> <DK01JT88NEI6.1TTJR16A61780@kernel.org>
In-Reply-To: <DK01JT88NEI6.1TTJR16A61780@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 16:28:41 +0200
X-Gm-Features: AUfX_mxEo7Na8S_Zfjwk-IJFfG8hfJYcWvQK3HRVF7C8IC1nwjWKc-JhNNi9_Vw
Message-ID: <CANiq72=OKHJo0Shzb_h1OuzmTVLqn6qPJsA_AhJAWOfQATbYDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 3:48=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I can also take it through driver-core-fixes, I have another minor fix to=
 send
> anyway.

Thanks, no worries, I will take it -- this kind of fix makes more
sense in `rust-fixes` since they are treewide, i.e. it could have
triggered in more places at the same time since they changer the
compiler, and I have other few in the branch accumulated for Rust
1.99.0.

(An Acked-by is always nice of course!)

Cheers,
Miguel
