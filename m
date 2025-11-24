Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B773148BB
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001410; cv=none; b=lGzYy+09KH5GocIbyAVjpbUvRf3KzQRIOIHqv3tUIIGRaKE2bXRZQFiv1C9IF1CUBfFUFoXp3jVZMBeg5GjNYj8Xdr7q5Jxn+k6ofCwfX8wuGxoBwJqGwIphb+CFlcDmvv8GuKXIhzjJwIkHRCX5m4HpoQgRmayTv9USoRKeTfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001410; c=relaxed/simple;
	bh=NzPDQKUXesN2tFTrxAWwSFcXk8odbWGEX8DQwzKHvdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=io6L0z38mYZQl8nIZH5d/CZUeeMQg3W4P0Pw30f8c9YlDs9mTrfSkHVflgcm8M+Yb4MflyX4+85tNan3Az/s9EXAZWVZmM5cDe6MhRbx0B9VvO2R/rvuj4azeZgHoEvE7nXZRljZZLYTzzukLila/4P0UC1pTvYdZPzYcFdfPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyWR6CqE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyWR6CqE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso397479a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 08:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764001408; x=1764606208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2J0sne9dK3n8ebmX/80sgM1htWpoO6vvwfgujnWbIg=;
        b=CyWR6CqEUBCtkiYYfaIyTWlg4VgvRVPKV/L+mK0Ilt6HFuFLMBsB0J4SuWZaCY2QBo
         SjfatR2pYwPX1g1BXvcH9e06shSsH9uVKqbpKj5UzgSpQAcrhsMr26O7D0j5gNHxvqB4
         agll/++b0KxxT70g1nfte+QeKWYceo0+wb4Okn6SR7VIuQfL6mlwpuXaKHbTDXqXxcXD
         cOUDGuonaHPHMkbjt2UBTnnFRXk58Aiy07k75QjJunIWLIUIonwxnJ3mCP/DjXO4Wf6D
         z4GgB3SuP/muF5AVkpFr+HZc//XslNqKk7dJIhtPcCl4mlLuCs4iJ5T7KNd6CmVPmfa4
         86+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764001408; x=1764606208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M2J0sne9dK3n8ebmX/80sgM1htWpoO6vvwfgujnWbIg=;
        b=QYqp9UW81AFRUVOmdz5WizEKDJXnh/QZACl5TSLJQFtHJnmgevwBXAdpog/7kapDca
         riqRMuRPUoXdb0WEkFPl5BUE/BXr17gwtsmkjTpnQu7NPA8HqlWlza53kgqitprL12Mh
         W6q7khvAuCOKoxG/NFSC/52RSTiyrRsO6JUZhU5X0Odxk+Y3gdwGY8TQGLrJTTxWZNXV
         SA+U4Q3WvwE6zhmEtjdL5OhDTlW2rtH40qCwQA3LX9wWMum0C+L1iHSV76UYTWmGEK4b
         zTN43xccskIqYZ3iS5LJ0u3W4UvtHXuXYGFcM81ZNfpgi/gbvoiHH+6s1+HT07M0xQXZ
         g+gg==
X-Forwarded-Encrypted: i=1; AJvYcCWoOpPZ3Y8DXtY2I6ZHHWQIf0rBmg/oLjEazJtfFKiHJAarbjpohnwzDCuyY9j5tRM433wW8z7zogq7bhKltg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMWkkVve5i+n7BHSPlsntWUiKFFMcqBZ+eY0QKG4+fSwhtSz6P
	NZHnXaKzrE6HzI4FqrQ74rb2nQRt1vbdwuiY2IDggLEn5kwp2SRVKkOWgtBpdAXaTO78MC6rwfe
	Wcdl2zD81lLbS2fHPI/cIMMz6kYFC1Wg=
X-Gm-Gg: ASbGncvrhehBaKL1adXTBoP9aZSyui9hsEGP4eL459knhs32tsTLqM+EtOYVEnBv1dr
	CIex/PptjHkDaoqOQBTUlJr3iBWN/leaKoBkf8BVLZaMEFdXOGfOL7BCT9mkc3LjkB6Y9DYh4J5
	6rkUU2wRnYhNusDG+JOAUAhTGQToWMRaqWGHe6RQPNk3zGmUNA6TVkOdBCGgs4VCU3OD6q/iWlM
	NuPgQeadp2Cks3zuXUmYW7BTsy6QCysuLgeIG4PBP2KED7+StndNfXTBEL+9iVEG4vYpXUSPYJG
	g4yDa0L/LxWyYnfBYkBzGdWcHGjyZahS5tWDKjiT5mf7dhdpEK7NZG8tEToPELS5aalI8HLcGQM
	XrYXTNPvV6oysLg==
X-Google-Smtp-Source: AGHT+IGwXl0ZV6sCuJIMY3nmCYvEqmx2yNHsP6C5DZXOUJriOekXZR8ClIwnhdXq7nRGAKTyK7rmfByoSAzp7B5Pcj0=
X-Received: by 2002:a05:7300:dc93:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a719324a83mr7221018eec.3.1764001408335; Mon, 24 Nov 2025
 08:23:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124151837.2184382-1-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 17:23:14 +0100
X-Gm-Features: AWmQ_bmjzzjuGyZbSwxV4iB0sa35jisCYH7BCVB9fd0FJ3BHVjVHicd2rDqz0Ns
Message-ID: <CANiq72mLMHF35UaML0RqiTOkVORr25W3Ug06uttYL_H4XCW=4w@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] `syn` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 4:19=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This patch series introduces support for `syn` (and its dependencies):
>
>     Syn is a parsing library for parsing a stream of Rust tokens into a
>     syntax tree of Rust source code.
>
>     Currently this library is geared toward use in Rust procedural
>     macros, but contains some APIs that may be useful more generally.

Applied to `rust-next` -- thanks everyone!

I mostly sent this to show how it will look like and because I will
use the expanded cover letter as a merge commit to keep it around,
since it has now even more context, and it is a nice approach for a
long series like this.

Cheers,
Miguel
