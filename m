Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20233F364
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015070; cv=pass; b=bjpBvM73nhSEWl5TbAT/dSyPLrIPu1ulOlFkMf58T7ZIXttpg3xOrUZBtKOzrtX89JEanuLYvI9h2nbS1i4J2IpDE2M6WNolbIJ/XzQt49ntECarE5/rinFanTIRWY1hpUxqYMGMTVj3DcDSPBnjpOrgC+cJepCluY62YyV6TL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015070; c=relaxed/simple;
	bh=hvu1ct+Bt6UixRjQMYlg2NLqt6uLbxa9QsOBP6IUINs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmGI62BtnLRAEcbIO8LHMMUFhZo06ZmOf6CyM4zYBohpMicUmWK8x6uL/2agdQCOZdSpKXB3mYB/RH20bvL3OBhWwFPggf35UDZSJQVvWo0Va1QXWgOVpvEpjolwj5kxALeSAPO7QExcgtg0wmBCaYAlehl0H8ZIwxOWEsefx7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXRhdOzW; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXRhdOzW"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b1769fda0eso632eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:04:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769015069; cv=none;
        d=google.com; s=arc-20240605;
        b=X0FRaY/WZcrAPxQS0v/rNsuWoq8aiSKDDgZojHlvAvfoq/PrA37bh63891MiHveTDA
         0ZNExMIHqwK94euT9U6YguouejUAjs3t1SdnxO0rerdfdBPRklyX0mkb3O43CDYfH9Gf
         xhra6U1vQllMQsemocc/BU0H8FiG8SVmWpnuprrrAJ6ihczBeNdZslXsv2Ryhcwj0yNy
         yK5M/zD576AnU1JXY12PmQpRVgMyvb7cSfA03EX82zuo0jqrJUXk3/8EjUkk5m7pN2y4
         hS3bFwuiUrn1rBy5Ab9jZO9NUufBHGp6pGI4ejBI4QOMfBEemq+Ybp55hh2JHddTAb+c
         3VZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hvu1ct+Bt6UixRjQMYlg2NLqt6uLbxa9QsOBP6IUINs=;
        fh=n+1vszCG+HQt+cbTF31t6yndM5XGpj74CQpWnC8sFAI=;
        b=FZ1THQGgKGtJjDzgf5RL/PFdZFH8F49sCeBEsOlBxLdEthPNPTh8WUfuTAX+3C1bnL
         X9YXjyeZsoklOk1WBX5g0b6P0toE/wlSn2bqr++dYBt1Q77DlqfYH8e5+4VlZ4EMcaHi
         grVDBKyrhcYKhPVczZzvp8t5OQAyCgCWffd5SBwpvkravHACfQlCcjN5R3YNt058rduu
         hmNOmVVCGn+zE0poVulYDYsOGHqkD///oCEUFMFQ1P4bgifuyprT3xaxiet4I47vTQby
         7j6w74PzZp9FYJUZLSwtni684QmLqSRE9Iccglchubgj4RDlNdyNTRoT36X2qssqMnOw
         bXzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769015069; x=1769619869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvu1ct+Bt6UixRjQMYlg2NLqt6uLbxa9QsOBP6IUINs=;
        b=NXRhdOzWrELtPFAPJPYe80IFN84o7duqN1bZfcWLfTmBnbD3eA7a2pAZUrArlshDJB
         h+IOmLKwpu2mgAgsMZoFiaR7k0TaZKJQZJilYNg1BVPlBYULhJmcFjZ2bL8uZMslb8W+
         FP55EqExdcIvY6JHtApFAIL4LXep9APMTX9jjXQfDmkZYiDboaFG/euWOEABMj3SXxML
         6/aQbPGWIwo8SZXhuYSoF+wwjxW/fkZC99nDtt18QSN38IvY2ShQkMI8a65uQuUlZqLf
         H5UlwolY8kZGfoXdFPv6N7ZZvBewaSYNAuHgL87Z7ufKXbseYbVAjpEozEmGp+cW42X1
         +SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015069; x=1769619869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hvu1ct+Bt6UixRjQMYlg2NLqt6uLbxa9QsOBP6IUINs=;
        b=LTBhF5zalKf+WRya27BeLpqm9WrHW+rqS9akOApWPi+Jx1i81JC8Ph9uBd0TT2YUCK
         dPqrBybKJ4HMnSNysfape/IcbCld3FPFQSW6jl8YPUL3669g64NE6Kmb+zATQwqxGHbt
         LDHxnmu1I5+FFH8fwXmek36c2lRFinwNaLkTu9qESEpbL6IsER7U8AzSySNR1jMB+2sM
         LRzxpuN8pQYRA/HbMz2rf48pLTH3sw040fjxhoUZDcBt6pfl5dEyO6H3dwy1MUN6m0bt
         GoBuexZho7TpzZjAcKgiRPyrZCSSy/IgvuAMLDyLnIpmpL04zLVqIlxtC60BwtqhAoP1
         Nrsg==
X-Forwarded-Encrypted: i=1; AJvYcCUuFqOACDehMg1K/C3uDEE9QgjHFLzC7x5GA2UnpJ7fPq4VEO4Rc5Hx7Ajk3ewq6ofJyxSQ7PzHS/o2uS8E3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXcHXUheKeXC0Q46Xz2b32zyGxapB2ditYrzg+SPkrst2Al1s
	xnQV9DS352+WcsJXUJPJd39IV/YCTUYCWEMlIvcZxvjix2lYlljIxGtX2IYiyErJLQfLyW2wzrJ
	7qNbhbk/xLEGDtSe5DwNxUU4KUJUnvEA=
X-Gm-Gg: AZuq6aIjzidKYjhVKP8rIX6m0w7vvoF3XeLDo0Ypi0O5GLu7nhYjtsMwvKFH9HcRs2j
	Br+05i2vD8uoIUKgpaqq5DbN7YwixHshQjEY6kv9UlJSbpN6O8uE1jHC9Yjn4CToAfxMNEQwreb
	LrMaWD5Zz71e6jQgTE84e6AJwDmBNOvUpG5xhk9Y80eLgCqyMlvFnYWaTknBnYpjTvcEEtReo50
	EQAZkltVsgmUi9RR8TgQWV/c80xVxfszFXAv3i8qK/hIQnwD2yfVRfSw/qpAAX4FUe1MVCFz1Uy
	dUozjpb9vqzmiSoZ0rtaZLIZ7zyExCph4P5qmQyHruC3ucmrbuI3rwyKiHfdfzhrqPYDtSYJdd7
	92I3iPp25o5YS
X-Received: by 2002:a05:7300:df4c:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b6b40e44b2mr7087665eec.6.1769015066907; Wed, 21 Jan 2026
 09:04:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org>
In-Reply-To: <20260121165835.4097975-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 18:04:13 +0100
X-Gm-Features: AZwV_QimXO2vExCS4Rh0dn3Cy372mZtOKMX_s_u0sCIsp5qU5ivzMzhCn1npWas
Message-ID: <CANiq72n7PTiAMHy5cM0H3GGNdn8BZic9MAyJCD2KRnPa2MM6Hg@mail.gmail.com>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:58=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> +#[expect(clippy::disallowed_methods, reason =3D "internal implementation=
")]

Should we hide them too?

Cheers,
Miguel
