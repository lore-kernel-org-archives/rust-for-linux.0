Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B71E4855
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031387; cv=none; b=H7xMIam3/B69PylX9T+6IO1VA29bX9A7xBRt8yhlYq/5rjz5XBvTJVtzHFhYbD/3dBC0P53W0n45qM78qCdfu824fjBn2VBUWtMhFCIm4fGvkRWbuABdHZaZI3Zl+6TkWaL7YcgR5BtMIcV9zmDpt18yF5SQ0xsuoMpoifssOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031387; c=relaxed/simple;
	bh=a/dC9WYEQPdmFDxHth1Lwu8KV1JB3jsWpTUlohgSUHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ci1R2hXmsooXbYghqsvdllLma7uGSwSUAWhCo6hwtnTZngsuhW9qa8xumuzPGPYElbxAJLtbyyBz1mlFWzEXmt203kli+44u2I6YlVNQBef+Dqa9EVrd7tjAIOzSpI9Gznzgi5Qf2albqEeKY5P8xI5XPg2SqZv/t2w0dZERx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FEKNIGEl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FEKNIGEl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36ba3b06186so952622f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723031384; x=1723636184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/dC9WYEQPdmFDxHth1Lwu8KV1JB3jsWpTUlohgSUHI=;
        b=FEKNIGEle8UdU0r3AgKUFk14fuW4eAyW8P7UHRBDH6vwOeOpIDJyJoOTymY68HUtsD
         qwOHqR6s0z/B1vCivnH4DwOiRVBeZQSIUdTstjvvvPbhDdAlzWH3WhYcZbcI4O6CicF4
         0GZMpqDusJS2Y8bG1z0AthK5OyRpFE6MSrpXeZIyjibRqch9O7AikNPcT7ZTqP/+vRax
         94kTufczu0/XqsxqzSL6p2knT5+lrTDhMwd1B8EhNKkY0LHI1CGpCpomEfio6bCL54IW
         AxmW+SToRYa+fSGrLL4uNlfL3QVAR0x3r6A3gg7P4g3tfcrxH69/xtfRao7GmOVm2Qs9
         VE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031384; x=1723636184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/dC9WYEQPdmFDxHth1Lwu8KV1JB3jsWpTUlohgSUHI=;
        b=YHDLAegl0pAJw+fZ5nSs1R45HAyuddj72O6JsuO65yP1/D4DVBtJ+r5oNnWZPPknpy
         ihexwdSnjMZwf67plkp+z/ooObYkESACxJXN8qEijIXJ9uSK7FWqx3i3YMHZnMFzqT+R
         CtkeR0emjHyNr6WwcJbJ2Ljn0lGovEffhRXvGcv1ncVZIVbcO5cjEQxx22ujPUMWS568
         SRRVSVVq8eMMBad5S01N0ueT5G+gpisV1W+Ro4pmAgR48z7Auagqu/1yFLi/Th8KYh4l
         QCXjrI8lVxDjfk6fhuj8hzsz23MgmtGSjsDoOs96C4aVMPqFSOvfNukTHpbHsttIUXNQ
         zRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH4GRv+oHGnFkixKSgfBAmtCJB6/rjcM79//91T2yXKzzbgQzCNbJro9I86R0AcF38RZNt/9SZFHYq0a+P6Ynb55WJmIXPTu0fNPQw5ww=
X-Gm-Message-State: AOJu0YwyJMbLxilQ9LKPkS+DjDIkDNssmrLpzVVfxHYaU6Px4wzcF0im
	FijOTxUiDV1cyBVbH5ErGvxpVwHghq886/Z8f/2BL/BNZKoAYc9/5mCuHAz/gcGIZcOrKBxCyC8
	NZKnNwsCugt2CGYJ/D9rziil/Y+oJ3L0nSwA+
X-Google-Smtp-Source: AGHT+IEtTOVqbzU4EcqZnKqzn7ZHQ6dJC1In4BJyyOOt1USL9W8GtpPF1PcUdjk686l2fHYBMyX04R1GUZOIR9Bydzc=
X-Received: by 2002:a05:6000:bc2:b0:368:6ab:ba69 with SMTP id
 ffacd0b85a97d-36bbc1005bemr12210634f8f.28.1723031383491; Wed, 07 Aug 2024
 04:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806233559.246705-1-ojeda@kernel.org>
In-Reply-To: <20240806233559.246705-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 13:49:31 +0200
Message-ID: <CAH5fLgiVwsxrY-PmwCntsx2=9u24TfFkNuJCJ4aioGD6V6ddHQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust-analyzer: mark `rust_is_available.sh`
 invocation as recursive
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 1:36=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> When calling the `rust_is_available.sh` script, we need to make the
> jobserver available to it, as commit ecab4115c44c ("kbuild: mark `rustc`
> (and others) invocations as recursive") explains and did for the others.
>
> Otherwise, we get a warning from `rustc`. Thus fix it.
>
> Fixes: 6dc9d9ca9a72 ("kbuild: rust-analyzer: better error handling")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
