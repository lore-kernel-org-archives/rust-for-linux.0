Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2823D291
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763334573; cv=none; b=JbNABxkeM3m07+vB2XgSChT+uCazFb68KN7+ctB4aoBPhJlcIzKOA0jR9DKQq6dirqAYK1TJhyNUy8rDSA4dNZ+xVyVpxVq8CXvSBniK8meFzmn/pceTYJGVtNWmkvmat2l/qd8nTyOP93Th3ECqUP0kpRkwjOHz09uPDqZxqPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763334573; c=relaxed/simple;
	bh=8L19nC4j5OvDmSIEYO56ledximukYDfE3QcjgrcWoQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVxBOkZG6kqw4tf9KkdHiTZ8Bc8CtJZsxj5zOjZ3v7f/h0+4QzRyxoqH/B70tnWGrR8q64O6yjan/PW4Yc972CMAoomRs8Ek/wbInwlTFct0yROqXjWtIhUQdwmJJtQPtwfw71Zjfl3RTHmzqCWhgBCDhAcXm1l30bjAP/JQguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUWoJVO0; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUWoJVO0"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b87171370b5so323169a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 15:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763334571; x=1763939371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpJufKQWhLvX936aimvnWD0Vs3rgof89qVToz11DHRc=;
        b=gUWoJVO0Q/YsaDlFQiv4+g2NQ8+Jvfojui2eJM1+a+ldg0br053QLHnzbtinGW2yCl
         og3HNgsfkj+DJEv5RO0NZzcLvz9WcJijVtZqoDv7ylphghjRSwH2b5mGEc/tHuNUsAzD
         XIHUL3coAECOFVJ5nSjp8YHMo7De4ugZFEbSmqnoNAumWoGd9myAqm4rfG2BioGcKbvS
         oIOPwmAeF++wFK0vS0RwjS2BU6EOWMFKNxpwf2uG9BdetBvsuK/jksDFJdBcx8iyVt2r
         XKcqzm42GxU18kq9Gru662F7Rw3F4ZYz62qSYIGTGPo50PlIOQx/NXddEXNNaE0hAFiB
         y8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763334571; x=1763939371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpJufKQWhLvX936aimvnWD0Vs3rgof89qVToz11DHRc=;
        b=XDMWc1uHdd3xqB2TFQjBrZ3bhZBLF+SeELwsaFBam5xp0Rmv1jb/7uAY9KsxkQH3+R
         ioPvCLPpyz5D6YKwpjTzTLbGV/pjSGqFLDGQcMP+4Lo14IrNgq1CnN1cs1uhvtKtd2pN
         lSOEuLDjFuhcUjdEYowcp6/Hnt95s51U6QH4GFmwMdA5ALmCGcrau3RLfiHYDwhyz+dp
         Rceq9mOhhqqC1Zdvtbd4L3EQSZe3+lWKTkH7rl2c9CHBO7WRE5JyNsdRuXVX/ndM4gdn
         x/z0mHxYGLatV6ZXqcTh2NEUcY1Cztn0U5RsBZMk5dlS1mX40i82A24C8xNuK8sjJQA6
         KKBA==
X-Forwarded-Encrypted: i=1; AJvYcCXjQSmc4AyuusmepAs+cp5iqScv5EBwBgJUp2UMAxdLaR0CwOBodKLwPH6JTRFuFB9zTV0SSyF6UlUwiTZiiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznRKMsFUSDPv5fKltboqSHakDfsOM6/ax8zxKV0jO0o0qL9GmE
	OznB4v7cYN4Em/w59J6CENALGWxuVpkfFIpJzdkxSw+O1N2KLry6x4IpVq3Ot/Fp7RCCqa7q+fG
	N+FTimmW3KkEjPdkANtuQ8Ron5SwK9Hs=
X-Gm-Gg: ASbGncu5j64N3FE16qeDxWSuzAHpGV5IcmwBzpG69nIn6eetrE/7iUBfwIwYj+WPZZa
	L/FoogIUcUjek1WlvwxidrtCf9k1kG3NczGFl/xaADp98SxVBlxYVak2gs8iJgono9WLXqM2xq/
	ltb1I3MRJU6oSUE2j4NfFmfCfSY6NeVZhMDqAUST+9hvhoYQ2YueVoF+BOWnYn+yrozegY6Ac8x
	s5od3R8umkmOYEi6g+K5qZahbSyKEVO4gi2yVINucR8Lwc0rOwTQGBEtcFLEVNhb+OveoRMbCRv
	4nQckxErAbWRO7s0+wQFYwtLbXFK7MMxLPbG2SZoCvKZKiL7K3yIAIn2TI1+hPTW1oGZZyhiNP4
	s6xNme8intLDRVg==
X-Google-Smtp-Source: AGHT+IH70UQ325wYVXkclC/7sKQgcKkGkeILQCo0Z7/+Sn1+4zhN3sg5WPzWxUEu+sbOfLyp678rfQ6h7RHY/mXLYpc=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr3494096c88.3.1763334571481; Sun, 16 Nov 2025
 15:09:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com> <20251113-core-cstr-cstrings-v3-4-411b34002774@gmail.com>
In-Reply-To: <20251113-core-cstr-cstrings-v3-4-411b34002774@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 00:09:18 +0100
X-Gm-Features: AWmQ_bnE2iEbMtFxFYydJhY-FPvC2L9BY1C0PQs1FD5DIKtlL5Y3Tpw0Rk2k8A8
Message-ID: <CANiq72mBfKwXEbyaw=pBAw37d7gCLVJqHcLcd6H7vNKey1UXfA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] rust: sync: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:58=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> @@ -119,6 +118,6 @@ macro_rules! optional_name {
>          $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::lin=
e!()))
>      };
>      ($name:literal) =3D> {
> -        $crate::c_str!($name)
> +        $name
>      };
>  }

This requires the next commit plus it needs callers of `new_spinlock!`
in Binder to be fixed at the same time.

Cheers,
Miguel
