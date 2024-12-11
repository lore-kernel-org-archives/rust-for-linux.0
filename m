Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1DF1BCA0E
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908646; cv=none; b=l+a+jrT8C/OInEdH7p5k97R3iNHQlksbY1i2guZROkEVfBJt4mgiCJSsegH8Sjno6/LG2H3G5leNbdGdGzWNCW/1HGzMop3LrocQJPtwuQoL4HxKuWeKIc2S32V0FrXQAejs9mIdbsHNnz6pFfV2n1n0YFBKn5qTqRa1ArqeT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908646; c=relaxed/simple;
	bh=KXnRs6c/+0+W5NsqPbnJXSN30wa2+Zpa4g0seWgmQW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifXCiHHYby7h2NRY+jfzP5reTlZ0Uu5EbMsO1uqFB16wsTyyWTCQ5KoU96/6GY01mVHQcT0gIoaZhcK+S5EULmPey0CSI63CYFmSy0AMaEIZm5aqln0Xz2gRVxh45VBtUUdyzwZCCytWfVX4BsvpfxwpDThLl/NNrLycUsgAZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WhFLtS/x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WhFLtS/x"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862b364538so246217f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 01:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733908643; x=1734513443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qAmFS9OuRYNzUrEfP9v5FUQNDR6q7wH3T3JyyuCOoc=;
        b=WhFLtS/xse1hyhVTW9zEHXNfReTCfDJkfsLySHIf6MP+SERfpuPnJsUcxfZRo/3PJD
         +NtFrN6dVSeRfLO2+rn5LLUl9GkY0Cw0eANfC7epEa+ChFjmH2MOOEVr0QjUp4sD2Wof
         DYmijB9sHC1X8BdBFyFQoEIckpv9daA9raMLaVrjMwbPSg3Uro0DXiOOQ5E87MwYR1CB
         8JOqYWZhi1Nn8Ey/vB9167x62MLdYS3Ja+lye2zCUjN0w9meuTlHU6du9XT27BypnuXn
         6chh3oOcQSeUVHvrrgDXzTTSs+ChEkBjdpY2NJoEAvLbd16JJQqDSqbRcRfPyt21QNkf
         qHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908643; x=1734513443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qAmFS9OuRYNzUrEfP9v5FUQNDR6q7wH3T3JyyuCOoc=;
        b=ttHlSCQiH5HJ6fHmmm7gMNhBAiRjKVA/nFdce00uOTycuHkhqSi0nGvb+lhN5n7IMs
         3dJnvV5KD+97bGR/dSt98e1nZRW6kpl2RoslN6Z/ZcvBbX8i/lxGEsFgYILLP0kJ5+G0
         kwX33HKDB9gTIDrikugNj4WJhkj8rKpuPlFDEn19JehFPDRq/B9PHl+MzBkr9ClDu333
         JalNPKxvmMSWAAvSIfalmiX0TDZOksAYibhVfhOKOZaz/ariwbqYys83d1dYLCjS31f6
         lIP2yg2fM4hHDnIs1bbcBTc1Htu+Y8Me9Gcn5uFFcmFhxeEv0v+9kZzl747ftWvxJwhS
         5oCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk7vwh7y61WL0IwhiCX6/ZkHmq9NJ8X/epcHarLqAspVBi2VdXwApbEPVA0JHUu6oRXR7HQTWiC18pmc5Ouw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrT/MnRqmuqhtFl86cQ6i2QF68oy8lSE9iV4UMiF+G9myhFRvh
	gpe7rfjkGfT52npg26YqfCV0QzYTHJ4jo14BeifrmAbBrbivJc35RqI9GXzalc9mcULNqyaqfFN
	XImzcGvaa1nsqc0gQma/QxJ1H+FoPY/EQSoGr
X-Gm-Gg: ASbGncsT7acpexxACvw9mrMk+2agEvfaspBBovVHTgGYMiBwDSfYWJd9Uh735G8ddQL
	I+llfK/Z1GDZkfqPw2KTpyA7mkx2XPVrFX+Ro/7cjaBrxwFkKMs20C2KxhvTY5KAkWg==
X-Google-Smtp-Source: AGHT+IEx+tmkolKmM+a69ZpAHvw/20jKyI14hK/hltzn25Hn5cLq6dwep4+c3hi4L/1G2oyXHIPpQJwIxjjwG/OiDcE=
X-Received: by 2002:a05:6000:4027:b0:382:45db:6a1e with SMTP id
 ffacd0b85a97d-3864deb511fmr1164059f8f.14.1733908643013; Wed, 11 Dec 2024
 01:17:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241211020507.103687-1-dev.json2@gmail.com>
In-Reply-To: <20241211020507.103687-1-dev.json2@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 10:17:10 +0100
Message-ID: <CAH5fLggicAOYVafSxBXSu0MvVpFEp-qhctbyRcd69HMg9xLcog@mail.gmail.com>
Subject: Re: [PATCH v4] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	boris.chen.czy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Jason Devers <dev.json2@gmail.com> =
wrote:
>
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused.
> To avoid potential bugs, the `#[must_use]` annotation is added to ensure =
proper usage.
>
> Note that `T` is `#[must_use]` but `Option<T>` is not.
> For more context, see: https://github.com/rust-lang/rust/issues/71368.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1133
> Signed-off-by: Jason Devers <dev.json2@gmail.com>
> ---
>  rust/kernel/sync/lock.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 41dcddac69e2..39f8c07d2287 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -147,6 +147,8 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>      /// Tries to acquire the lock.
>      ///
>      /// Returns a guard that can be used to access the data protected by=
 the lock if successful.
> +    /// Note that `T` is `#[must_use]` but `Option<T>` is not.
> +    #[must_use =3D "if unused, leads to an empty critical section"]

Can't we use the same warning message as Guard?

#[must_use =3D "the lock unlocks immediately when the guard is unused"]

Alice
