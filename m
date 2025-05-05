Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D272459D4
	for <rust-for-linux@vger.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447689; cv=none; b=griHzlv4brEapsG6+VJG8si21amm+BOXYg1k/Vm5RajjdqFYsXBb00jAS3/OeA0hAmrd3fr+shiI2w0fYdh1ijggrOw5Gic2IpAlrherzYj5MOsaifhW72nSn3ouhRHdzUjANEwdjpRVjQqq8TEMnCdra79PWlYBtn548HM6a4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447689; c=relaxed/simple;
	bh=Im1IPj+bDmZA9T37fooSkQu3rIpJ4OZzqFkHpGOgocY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWZwNmWc9yjfZfa/aILrX0Uwpytg8Kda9gDQpps6cq2ZEv8m2XcFbWvA8oqI4OlExWjNm6H/vuFnZzIfzp6WXqsq5zwSfnavydsJOd5ECbnTkwZ1nMzPfSUJnKjX0+GuawVO8PpBorNOCdPeLEZAgAaPXb62XZ8ZcQXq2uV1pZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=owTfBveG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="owTfBveG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5200823f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 May 2025 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746447686; x=1747052486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im1IPj+bDmZA9T37fooSkQu3rIpJ4OZzqFkHpGOgocY=;
        b=owTfBveGQPKTwJtOXkc0KC3KYqRgHE3UyFLSajxwgkp+2u9VryF8AfL0O/FK9StxN+
         E3XtTTc8kNgyVv5/C9K0BDIY2fc3/5aVH5Ezy4X/p15NcxuTW4OuH7Zc/mjYtJLQoB2A
         kuxx+BoswrVnQxWwsAD0idw4mQOc1JyMWGoXKfFNLHfnJPSaVH0/pUaD9/+hiQ8I5uHO
         4XLPUF9ngICBucNW4ZcFJVZSx21Xrfapdg8r5pAxiCNgXyuH/1pND/Ez1jDyhY0ELkZS
         n+m9QLN44g2Z2LLIwq130lCgqlCV5RtJe/P4ZEoV1nheFqUdCXPtLcAo7ZX3wsRfOAt6
         6big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447686; x=1747052486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Im1IPj+bDmZA9T37fooSkQu3rIpJ4OZzqFkHpGOgocY=;
        b=mP0EMp27AQKWEsuoz4Qy5FTOnp/ufDlDWCNPRifmOoXcDnIzlHQxMVyxByMSfkNC80
         vWG2Xlp8+8DCrhiy7MzaxzTDR7BtDWKk7+2H9WGZCW/47k8pFMLN5aWmg4Iv9XmyH+RA
         FFGRe1jodt4TK9WEV+17fCnSe14rI95ba5Fbr5cKZ81M/+hPUyx9X1EUDsXgGyhq3E+Z
         oM5d7R3ykA9zPeuNrAh6gE7ITXRzYd9qTi70Ea5IjsQ7jY2y/ug1W2ywlZ8GMEqTBnx3
         WbYxE8S8sJKoF8e532syv22VWPuGaCZIJy8YjcpddMhZ3EHof6HTCyqbtxrx8RSsIayi
         FBaw==
X-Forwarded-Encrypted: i=1; AJvYcCVxK2tRc2vtzGUeucLT6WMHUVYAxWApgo1OMl5PvnPtMlkUtYoJgZ98Wx5FGFcNib+ZGcrPfl3zLhuM8jzFww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6D815EApAaPk38S1qTXSsm7BqGXHA7aepgZ+SgjA9vDgFTpY
	IpHzYDIBoonbVtwTV99vMeTpA68JVmSTuki5xE0LWcZAs6vdHECwakDEk1ndMkDqMX28Iw4Nbw8
	kvGG7aiSfhsHU0Gth6918UvmW7k9fBRl303fZ
X-Gm-Gg: ASbGncsFu95qgTVjZkM0zMjXI5CIXpyhM1/VH62KEXM3qmqMQUsGDO6yfFth4Q+Wx3k
	DQ8dEE8XrKh0t4/8Q0FiJlsS8MsHXyHcb9Gk/XfoVSX/9+g8kmigb69hNX6IzDynsWdaHdvPQep
	cKZatdyApgonDueuT9VlexHqfYgwX/fTwcE6kSAYaF5vMGYX5N4vVF
X-Google-Smtp-Source: AGHT+IElySC8OTRaik+ESWXIBFnocNI0YzCxWhx6pDVOwBbkeQUT5b6uzjWIvVw0B3wT+bVAv9hCaOqg0s24m/7evm8=
X-Received: by 2002:a5d:59a3:0:b0:39e:e438:8e4b with SMTP id
 ffacd0b85a97d-3a09fdfc2a0mr4585112f8f.50.1746447685849; Mon, 05 May 2025
 05:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
In-Reply-To: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 5 May 2025 14:21:13 +0200
X-Gm-Features: ATxdqUENSeiUkyfFBFmJqQFcAbNdNhtjRVnvyrZUQiTdO3set9SdTBdmdfiKOjs
Message-ID: <CAH5fLgiP2pwxc6JCsJ481=0N7_q-Z=PFK829pU_nW+piN9O2gA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] strncpy_from_user for Rust
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 2:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> There is currently no easy way to read NUL-terminated strings from
> userspace. Trying to use the ordinary read function on an array of the
> maximum length doesn't work because it could fail with EFAULT when the C
> string is shorter than the maximum length. In this case,
> strncpy_from_user is better because it doesn't return EFAULT even if it
> encounters a page fault on bytes that are after the NUL-terminator but
> before the maximum length.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v3:
> - Remove pub from raw_strncpy_from_user.
> - Mention that some data may have been copied on EFAULT.
> - Add more comments to strcpy_into_buf about tricky cases.
> - Rewrite documentation of strcpy_into_buf.
> - Pick up Reviewed-by tags.
> - Link to v2: https://lore.kernel.org/r/20250429-strncpy-from-user-v2-0-7=
e6facac0bf0@google.com

Oh I forgot to mention that I added a documentation alias so that
searching for strncpy_from_user using the search box on
https://rust.docs.kernel.org/ will show this function in the search
results.

Alice
