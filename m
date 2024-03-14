Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4DD6BFD2
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Mar 2024 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407711; cv=none; b=P3Jrsr2kzcA9xPZwmYz37fhpQt2YSJJ/veYogQg51pWOfFLzxdXo5Yq/+SFW5cBCy46EGPK/H2dBazY38qJuj2EOCHRP+h01rv6O9+5G4KpwqG78HxupLlxrDZeRaJHhDCmHmltYFp5cxD3dfjz+G8sDR63n7RuGbq6qlxsJ2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407711; c=relaxed/simple;
	bh=lE/ZP5Tkvx9YY0FpPfk+sLpzNiYxoj91aWi14jou22k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXG7TAEafAfBd6F8DR9XhdMKAUtEkhGdgBOjmyRhVkmi4RW0EyEtDXfxictuHLIHgXglNoweKqxa/AX1Kh4R2i6fV6upY4AdMUQzWFm9pnpVlSGwSgqzIYf8KfgWUZN0zBAtn7E6qk2XjjJLrcR8IEKQv6AsPC9GnL/SJYv/i8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubFCNPhe; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubFCNPhe"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-690edfcaff6so5608166d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Mar 2024 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710407708; x=1711012508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE/ZP5Tkvx9YY0FpPfk+sLpzNiYxoj91aWi14jou22k=;
        b=ubFCNPheSIZ9cs6MaZxKWElEVqfL+s3kamjXeBCi5TL+nFgDVocsEf/N34w/gQXVeR
         0LqK5N5L9cob0jrM+f06EPxadjMNgbXM10e4we3+v20YN4+oZzGSq809ILziIuLklVf3
         MBm43VXX5DXR9vpuXWhLQJkZrcstImmNuzovBiJ6kUS7KGdNafB6ePLmas1Yg90DDG03
         whRbVMEzHbrjEoARIstnlcsrPPjeL90l7fJUSi7+N1nlhc63QTNiYR/XCWHbWFoB4enw
         T02PnMckcF/xjSPGoeMaeSN/Mx2E151p/NulWThbpZmFZgW6TqG22w6hjIaIO52cbznP
         R02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710407708; x=1711012508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE/ZP5Tkvx9YY0FpPfk+sLpzNiYxoj91aWi14jou22k=;
        b=wVRHclVoIt0BUUvVNhu1RPCq+RIfM+/1/LZfx3KDNv98SZla688qbD40TMcIdjwJrI
         /dSzA+CyFJD59XIwtRcqnmKxqIxv3xK53DaJ2F+m89+vhNnIEPsudz/YQEiDKusmWmtH
         27Q+mJaSrTdVXD9AZjsOWnOV5xdn57KJZWB9WdZy8xCUAAkTOmLbaLmbQwoT8o1vVF3l
         xokTs8rQjhKfJaYVWIv6yPKvlFmqq1YNGeZHqW0WuswulvpZ8ooMrS+E8DvBi61bLodp
         UiEt3qC+IrKWatBJ+1LTLB3jX1fULHZdESUOIX9M5Uh5MIEZL3vlCkc9qmmHDIE/rjIO
         tP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhzy97scYtgi6bGe52iwpBXZUf27Ayb+0Ry7RLprCCkwLwNwegZHgN1GRyNrzWLjGBny66n+Vtx6Au5p65xaBJo7crX0QLLhKYUtx5R78=
X-Gm-Message-State: AOJu0Yw9yGCXCLHFNWAjkUE/nWRExAj58na53vHnXSHyPMKos0xkjArn
	e8ISXC3XznTy9jTIOcclnD4N1f4dbalVGAhK6fQFAYV9pjKUL5v1wY5/JhP+Qm86eET1YvuZkE8
	1tN1xvJHRUT2csInWrf4wQlZUwglUWx7nN4qk
X-Google-Smtp-Source: AGHT+IGfMznYIETWqpb1PprXePzqaigF18dojgQnMhgp1CmXhdyU8MIRSF4qLWE020QEL3knnSBFKCRcRErOBRLrkgE=
X-Received: by 2002:ad4:53a6:0:b0:690:d719:d575 with SMTP id
 j6-20020ad453a6000000b00690d719d575mr1324895qvv.43.1710407708463; Thu, 14 Mar
 2024 02:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313230713.987124-1-benno.lossin@proton.me>
In-Reply-To: <20240313230713.987124-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 14 Mar 2024 10:14:57 +0100
Message-ID: <CAH5fLgjMkWxqTxZKt_w+V6X1qfUzosTbwMxDVXUmw_qTdzYP_A@mail.gmail.com>
Subject: Re: [PATCH] rust: init: remove impl Zeroable for Infallible
To: Benno Lossin <benno.lossin@proton.me>, Laine Taffin Altman <alexanderaltman@me.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, stable@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 12:09=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> From: Laine Taffin Altman <alexanderaltman@me.com>
>
> It is not enough for a type to be a ZST to guarantee that zeroed memory
> is a valid value for it; it must also be inhabited. Creating a value of
> an uninhabited type, ZST or no, is immediate UB.
> Thus remove the implementation of `Zeroable` for `Infallible`, since
> that type is not inhabited.
>
> Cc: stable@vger.kernel.org
> Fixes: 38cde0bd7b67 ("rust: init: add `Zeroable` trait and `init::zeroed`=
 function")
> Closes: https://github.com/Rust-for-Linux/pinned-init/pull/13
> Signed-off-by: Laine Taffin Altman <alexanderaltman@me.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
