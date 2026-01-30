Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9B346777
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 05:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769750726; cv=pass; b=aRrCbZAl5qC9z8Buv0KKBCGQmzIY4TYJKqMD2DFN1ZVF+gX+Z7DC/JNKjuovN1Fpo9f1phWX3b10sLe+bL5TwnULWiWuNAixCbAZllRT22UsbcJ96R4cFcUceYtC4DqDq14BCF9kSWc3YqlSpv1OQnC7iBFtcrjxRYjBFfzqRXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769750726; c=relaxed/simple;
	bh=vauVHZbG0yKN4P1S1TOVYD1ZN7L1cJcpl+qooAWUwx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkeUcyiIbm90w+iB/qgcHOWQPXoehLqsObcRrFAVEsglmrlMT3/Dv5jMTQqnSdpQ6jD0oCsDGfif9VGtq/Wx/te27vIqW1yeLhDMBkIU6BjsCXvpjgjpiM3sw62DwgKpGcxxx4+26Jcu+I+0czJ/vUMVujmsyFFe1yxRFF6AuPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOrxBDRX; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOrxBDRX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b703e04984so30824eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 21:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769750724; cv=none;
        d=google.com; s=arc-20240605;
        b=D2oga88esteoFsX26Q0uQ+iCcZZ2ADmCxFAlnwg0pHDKdKTL6XxSsPQHAiLYK7hagB
         oDpgkK6+sUEd7I7+D8lWotGONP+CxP76qE5/srfi2SNkBrOw0ATGjvb0/2b5YvxsM+/a
         tqFBLwLPVeJ7obPkJ7M1EfBerTCiJrVUHgpbSdeGKVis8nR8vUptv9vJatD+ABzaY08I
         roCon5shkplMjOhXL/UzcoZbuO1JuEpmlglkZT57TB54HFmHp2nptWn4QG2m5lP1FXb4
         H8jC6r7J/ZtpCnwSU7Oet/6nL+hSdGr1xDFtYvUungWj802YmnDiXyB+snBhKR9b2FpQ
         IoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2XM34WKv/oX4YjwRTeogQMXIxd0hILZPfoyB2jH2DYs=;
        fh=ehVhKnATb6FjRLni78DaLUfouK7Edyjx3EVhh3tv2xE=;
        b=NUdmOTY3mnos01x5r+SGWU+2s9M6bq2YSDAxi4LR+5OSHMvjxb552jHMEc99r11o+f
         GXvJN4/durjV6gV/KDoMoABtUx6cdld2XwgHfjKzM7isUqPnZeWqMOGfYnS+93fZW0yY
         iBvLEGOOvR7dR9K7WMlBtDVPUsRaCdkIQjpmZnlVij3rrTqZNJcOgEX9SCmG0Cmzbldt
         y56jRAEoZwy6wp3m4M8ETmovoh4/x+Og9dp5FxhZkD1kw+ilzpn4JaeaLDLwd4acwk4v
         jYceTHAR7iIjrAcFb0mQL3qnr6tu5CBMxUl37MoqaK2EJBFJc2gV/4OXk2wpT5Va5JPw
         p0mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769750724; x=1770355524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XM34WKv/oX4YjwRTeogQMXIxd0hILZPfoyB2jH2DYs=;
        b=fOrxBDRXnKKg65ue3Huw5Nv4gmrwxwIk55Sdgm2UBzcnEyXTZaHP3GxpSh300yN+dv
         qjOn/vZvm6rI8gCQ0UO5xTTyZ3iZhDPZQPQevkxkDI4TtFMh1iYnd7wb78oCxJrKrjra
         bfBDd0lWul/wQslFEOHkwPG0Un8IBwBiREGhGzJSFgFUVSS9dI7OKhA4HFnNW1G/+K4I
         SSS49rEfho5lXS/oXRawWjCaAEPcO3BSEgOWzKrAB2gIZe3CUyLqxS6qf13uCNk6DAgy
         jAf/onCIg2Vn/syVl8fKdUZuBxKtQqPHhAoSYGfjIcbTTjiQKMmo5Cacdo2YWnpyYsh8
         LTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769750724; x=1770355524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2XM34WKv/oX4YjwRTeogQMXIxd0hILZPfoyB2jH2DYs=;
        b=HiS2j5LKvCJnFOsuQ3XhNPZMDjRoCJoYsxY0ReJREyduhceISfUrMi0Awx+MqFrTKI
         wZIL0NYXpx6RpMSLtHup62jqiWdRITXpIVcyvHnkDEWK0fAnrbPsDiYBH+kEn45vsPr7
         vuU/1EkB7Y+ByVwMbd2ueAJm9ty6AxnVeSIcDO8nCyGm7u3qZYe4eNd/pwuuEOu2OCPI
         UDGESUfNoa7/06cWzZmKSBHJQgP6/JEMVJ9OEgpVl6oL6OYKxDZ7CJ6OZX4NfsM8Dgqg
         rEKCFjohrLG5yA44te2X56t+OH8UvXM8WV/zTsFMtn7rW2X57NyH45gNpVwaM+rVot1u
         U50A==
X-Forwarded-Encrypted: i=1; AJvYcCXWNwUXq3wlAwDn4NeC5e/XjurR/MvZnHZdsiA3r8hLEPVyYS4OUwdg8P/x+69rz80Nn7j3n9aJbgIaxCfqig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVkgjY5Yxg8lAuHhG0sv7YJfd9muQ5QUQv/fjoJ5HN0qv8FbJr
	KT2m10P6iVI1F6dh8JAuqfR1GDSf5Mz+ee5SiNBRHmehfy0RBy00YS8C4C3avU4HDe1eBaLOvHZ
	B3x1h6C6q9lQhdlECH2gb2WvBWAKXTvc=
X-Gm-Gg: AZuq6aL0vLMOZ9OZFUY75+0/49n0/x9svoe5lTBCoCag+A5K23vrt/RitazFEqf0IFg
	uGtPB8eP/L3VKu+QlbDmPyZWLHVXS4x4/QSjzJI0CPBmvqwuy/pLjAOy8lx+TEhsRH8/28OHcOh
	OwnEHTMIacTHtRjtqwy/TQ5k4Sx5NZ47cTysJVay+zHQeVtszx0/+BM5dmrAnEkjyTrvdM74TN/
	RdzwtXqKxIJbIkLh/Isu+7kAy+cjbDNxm9bxLUUOYyOooRXkBt0lMuYb4HZkmZ81/01DRrz+epg
	Ekg25GFLwODICtRWlPNw5qozQ1vlR7B9fyMkCsMPmvGxvm8+jEU5XR5EdEN77tV74s7Nv8MYXQr
	im9DdufDYeytR
X-Received: by 2002:a05:7301:7c01:b0:2b7:2d5e:3f3a with SMTP id
 5a478bee46e88-2b7c852316amr482339eec.0.1769750723967; Thu, 29 Jan 2026
 21:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117-feat-add-bitmask-macro-v9-1-45ea1f00f846@gmail.com>
In-Reply-To: <20260117-feat-add-bitmask-macro-v9-1-45ea1f00f846@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 06:25:11 +0100
X-Gm-Features: AZwV_QjOyw8Ne5gZFbIaDIvwOR1rhQ9yymIi5LmEo26ByPsSbcV-16BRPKhaVuc
Message-ID: <CANiq72=GtVTbjuJ0g0+aUr-Ae91oK2PGVXqCkgch4MVL=ydgsQ@mail.gmail.com>
Subject: Re: [PATCH v9] rust: add new macro for common bitflag operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 11:41=E2=80=AFAM Filipe Xavier <felipeaggger@gmail.=
com> wrote:
>
> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
>
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

So I was about to apply this one and I noticed a few bits (no need for
a new version):

  - This was added to the prelude -- I asked the team and they felt it
wasn't needed, so I will remove it. We can always add it later on if
needed.

  - Is `BitXorAssign<$flag> for $flags` missing for some reason? I will add=
:

        impl ::core::ops::BitXorAssign<$flag> for $flags {
            #[inline]
            fn bitxor_assign(&mut self, rhs: $flag) {
                *self =3D *self ^ rhs;
            }
        }

    This is why I like to have tests for every operator... I may open
a good first issue about it :)

I also fixed an intra-doc link and tweaked a couple other bits.

Cheers,
Miguel
