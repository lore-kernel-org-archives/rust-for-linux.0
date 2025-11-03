Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86532F778
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181665; cv=none; b=Ca5FqGJDpzGWllxClPbeqyyKxNrGZLO4rbtLwypI8HgBDzFwgR0b7OBRVNoC+7bkyAE5qPaOs3cAWo9kXkI4QZ9NBBKe2IQpdr2byMBnkWqZB7aWE3tYtmjZjXvibqBvFqXxYyTZnlxkoeGg2Hyv99rrJeNdOddHrROAwj28E3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181665; c=relaxed/simple;
	bh=CfuwIHPDQmryroqS5zJUoyuxZn1pCBzzOLe0OXbOiAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQN094U7nIBUNrLe/gjcbZ7ZBbAoDTO6RiOUFipq2XO4s+TBxDbvL11MAzTa/nvBwmoP1patnvfGHRQFPl/uYDR2vHPCbeipDTGv2VL130h4rP0UdvRIfC/s4HSZb5y02Rts5YAe1LjpVw78zxoFdNFOI7Atf5YBoobqezBiT0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJY014VW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJY014VW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295395ceda3so2106795ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 06:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762181662; x=1762786462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGcJLqwF2c7XiGCzl/4Dx0kZfB4HHUCiMyybkRLYqWA=;
        b=aJY014VWhdesFHneuyewR8bEzcB23WZLZK3BsqQ4eGQUJYQRCgxYtkahTK01Mr5SNr
         nCCLEcTkLt9yo45B9mQVzNGCSaR0Qyt9ffbYRn1oq24KKIDHTWvK6vRnd3jz6eZBoKpP
         ssbQmmb1+aRsqjI/Iap8kDtZA8C/pETeBLl+VW4+0heb8y8bALKZo3j6FuvD2iKkEEFd
         gZdiBR1XXRAt3oGUlbp9IJFR+xVHqtwcYoQXZAMUW46SW9XH3juMdxx3khIGd2COrWsE
         qcfRSTJQFUtSqB6aLTKHWsetQqXbQiBrYMbNMNLXtEA4EBzW7SzzHDHGPcs0Ee7oYw4O
         5HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181662; x=1762786462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGcJLqwF2c7XiGCzl/4Dx0kZfB4HHUCiMyybkRLYqWA=;
        b=IaG+l3i6TQ2WTIHMNhnHRSzZOHQjVMh52PwMnUD7GLdBzYvtQdfXcgrI1q18EFgpv8
         gcET2MMcjDAiI/1tXYYzO0vL9QRZOwzy4ugODBidR8Lu0mUssM76yKgDYul9nq1DVfnh
         oCpuQO/868PZ+2eiEj9FPzn9HHyW4J8evBfAp85p30vOgpQL1qp+TJUlTmYkkgnikYgA
         k+XD+sCSsTFc1zPLMBWM1plmj9QEXgX1JGX1p6lBG1yk8LtYhzCaSTRy2WltUhcLGLny
         MNLwbb0pe/Yb5dQlCLGupN8JydXtSsUtDg8j4iprp+7ntmS6Avv2uAf+j5vfe68ekGTk
         YzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCNPM3naXsdR+yIpBI+GjWvByKr+qfU8D2wYIjMyH70/Mp52UBGMcpKKrhU/TYjvEo0KIXm1E+40hVsEo9Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQTyrwHyztlElbnubQragWO22g6BQZqm20ye52oqqcvsUGHu5
	xGMy7oJMgn4H36bPFczSmW5RLHyQsqQ3UY6xzALoA7uXd0PDEbNTpVU2RG183gt9jpquLFPiIv8
	mkELt6udjar8jkPoy8aoeJLIQ7iXTlgg=
X-Gm-Gg: ASbGnctAX9t3pi9tloAamVtd+rVTJ+lq1DcUnTHxU8SGzgQauqdG6YpNKP0NdCXgNMq
	7CE7UZKFtrgt7gniT6GQsUevxSepv+g0oBZSadntgNRnhS4rzsXDoFo6leytQfDY35TglfsYmPd
	7F9YP10SiHwLpfWIn8bomCWuFkjSfBGW3WCMpFgyAqZW9cGuq/8HbZHC+3GOyMB2d0A9oMOerXx
	oy2cYt4tUkcoznvFMHb8traYT4U6Lwa0Cl4pA+R74NWRcpbbztABuI3I6kv70I+k+6+3sqh18WM
	3TJjOMFbKbx3uA+UhDVA5WQLlbaFTfysL0uuFpPSpCDdMo8hfMvgmDStYJvIM31vzp6qb8v4V80
	Ow7jWcfQ1GBKA8Q==
X-Google-Smtp-Source: AGHT+IF2duoky+NM8f4/33jjIQnYvFb0ADfwWmZJzGiMMxqRwi7/BedNBWl7f8IPHRBvKgr7QLnax9M257phzS375FY=
X-Received: by 2002:a17:902:d48f:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-2951a40cc4dmr90644255ad.5.1762181661810; Mon, 03 Nov 2025
 06:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com> <aQgQv6F0Ao4DH6U0@yury>
 <CANiq72mg-NntJLf_jbigz++0hK7G3WAxbvejRq1EzOc7GE+doA@mail.gmail.com> <aQi7e6VgFsqpq1Rn@yury>
In-Reply-To: <aQi7e6VgFsqpq1Rn@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Nov 2025 15:54:08 +0100
X-Gm-Features: AWmQ_blCg000_2OneJ2R30enMvqJWPDFlAOjeiP7bYGOSrzFcFJ8-nZgZdW_JUo
Message-ID: <CANiq72=4UXemR3ea5nNbqGt0Zh9q4hwiGVAn+hxfcZ-Zqa8y4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 3:26=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> This is exactly what the patch does:

No, there are no arithmetic conversions going on here in the sense of
C. It defines a particular operation for a set of types.

What you are seeing there is that literals, in Rust, do type
inference, and so the compiler picks a type:

    https://doc.rust-lang.org/reference/expressions/literal-expr.html#r-exp=
r.literal.int.infer

Thus if you do:

    let v1 =3D BitInt::<u8, 4>::from_expr(15);
    let v2 =3D BitInt::<u16, 4>::from_expr(15);
    let i =3D 5;
    assert_eq!(v1 + i, 20);
    assert_eq!(v2 + i, 20);

That will not build, because `i` cannot have two types. But it will if
you comment one of the two asserts.

And if you do:

    let v =3D BitInt::<u16, 4>::from_expr(15);
    assert_eq!(v + 5u8, 20);

It will not build either -- there is not even "widening" going on from
`u8` to `u16` in this last example.

Cheers,
Miguel
