Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA7021C184
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545273; cv=none; b=rqjuM5edtfziZKH1WSoS6wlJ+fp3lDnxuaoGhc5OsRzUnGwV9CpEe3aCR9ejnca4JPPHKJ5PWDfSeYYugtHK9LepEuMZOqiKhkPdSxPQnSoAHKG37qzu+nhlzEX70dQW1V0TdZHkGbZhS+3hbNyr+DuH+aIcnDl8CVh8Pc/GP7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545273; c=relaxed/simple;
	bh=RfCn68tGpv/HdE58tpTxF3SjBDourcUufGzDddvGG/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxQ3tnANXX7DK3aSsxv4xtZWx2b+mhvRh0TxnWRF2fM0fzhXma3N1PFVaEf0jYYrjykzkaIbx8KG2Z8q3fifpczccmUlSxpUgyS6vJciznxetoWr3nzdoO8+yoPHCvF6KTU54KuX/bK97UR2YYH76X8uX2cUfvFP3IpijeNZ1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKk+BVK3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKk+BVK3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-312efc384fcso851147a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749545271; x=1750150071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d8xy80fLAo9cKJtXStDd79jQ0x3fb2bZojCsSVVH2U=;
        b=RKk+BVK3RT+6MwHUVQ1IJstw89WdhfCLAsujsxZ7lF8yvU5ve8rmCNcdkEREP6u5Zt
         qBCsNQ/iQGBqT5SbvPsO7xuPO3gjJS6lyO7UXWG0rgObvJ6hWpZPH7VGLICLXLU7Co80
         pU9lCgQIVtsL4fZQ9NWnV/mwW8SYwApYfJHjEoy80ap5LdgpSOFC6U2cmgDvWwF5a6ul
         jBQxMhieWJ7lcFJ5HYn5gUrMlwjcAUEIo0unHnir52Z4hynp0+tyFs6wvan3U6EYjsMk
         VATma86w0YLoxVrl6vX8/4aHNAGmuZr9rsJuOpcopYomGzrlvzJCSjMFeuQ3/3DvJvDt
         QKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545271; x=1750150071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d8xy80fLAo9cKJtXStDd79jQ0x3fb2bZojCsSVVH2U=;
        b=e7lL8RWy23+Z80ZFI+8pPvN5rdhlRYJcXTyYAT2PfAZ6DmkotXz/KJEGTus+JQKBhk
         9HThPJqsBheZmQrLs2n4hAa0P32wIH9Q+ltMThK9sxeBYzBBf5eJ7CCrdY5pOgUmjaPW
         6Bct7ouQCRDxwn5oxVhBx7hFXD8zIGLAijNfC+UtufN+OqsdoyDC1LhlTAvt9xWRY2E/
         NyhTgvDyvGzBR0UCfAb00A8K9p/9HLgHbZRAwQYVZ97oRgE0GQj//LASBqgXjBLBcIaP
         oE85J7vEkoRKDwAVKK6M0e7wP2JkrGvdI1Gyow4tTk32lMwfwhRssf/tja9PicirieSX
         R1bg==
X-Forwarded-Encrypted: i=1; AJvYcCXn0YR5ktg8atx1aQqYzBCLzv39iMCEDIZPhjumJSFCwCzcXMyQDdyMyjP0wzYnS6KVJz/7Eh7Chl+9UY8ChQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCd7gxqlcd1lnYRnWJswJNhvCPMWBlSyOK3rLqC6AFUy8/HKKS
	h5AARskt04UXaTbrS7uaQrdMVyTwfbIDCtxA6T9A8emfY0EteTeWw/CwQ/7s5aaBfPW1OI4BIzd
	+x98j+m+EH0mcO09Umh3NMBOU/QeSQNU=
X-Gm-Gg: ASbGncswW8RXRwKB6dUbHwC78wAch5OYtLl3ro5hF82DCnvGaoZB+yWlu9NeYwl3YCb
	AeqCJcLcAKq8GesA9UFhTWYFN8X2BRIHa/y27MwKgQ1bahH78KAJ64jsw0HH6SZ1lxe902vatgM
	x5VBGkP31xRRi+s5OAHPJ+3n2ZxD7pZqiH6+Dn+9MoJvcP0ViVRXWVtg==
X-Google-Smtp-Source: AGHT+IET4kTnn7eKZgH+x96ImmQD4PJCUrAkPPfq7k710u5F3g+OyOj8aQ40PtFLUrYSPo08qAeI2sNhsA3jAmzzijM=
X-Received: by 2002:a17:90b:1b51:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-3134708fe96mr9006366a91.1.1749545271353; Tue, 10 Jun 2025
 01:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609223606.2897030-1-ttabi@nvidia.com>
In-Reply-To: <20250609223606.2897030-1-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 10:47:39 +0200
X-Gm-Features: AX0GCFvKz09K4N8cDozkxFZBVlIFSySFt-g1uVQLYd9uJgBJkBrtLtLNiihShFQ
Message-ID: <CANiq72kKamUJTJX7PxmSdZWCWwFHsOoXakjRzmmX4+eQ679ajw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:36=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>
> +/// Returns the index of the last occurrence of `needle` in `haystack`, =
or zero.

Please provide examples (which double as tests) for new functions, and
possibly tests, especially for this kind that can easily be tested.

> +/// That is, the compiler can inline it when called with a string litera=
l.

That is not really what `const` means. I would suggest just removing
this sentence, since we shouldn't explain `const` in every `const fn`.

> +/// ```
> +/// use kernel::sfile
> +/// pr_err!("{}:{}\n", sfile!(), line!());
> +/// ```

This doesn't build, since it is missing a semicolon.

As I mentioned in v2, examples are built and ran -- please do so
before submitting a patch:

    https://docs.kernel.org/rust/testing.html

> prerequisite-patch-id: 4bfda16a333b9f00a139050b7c6875922961a15d

Which prerequisite?

Thanks!

Cheers,
Miguel
