Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58918B480
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722415108; cv=none; b=gsMDqUT7268al/7kyiqWvsHx0tRZ/rJXCkSDf3pdz8qD07EGbP/R/W2AqEJrK2mtRrdmCEvxfMrum8HLas+eZBV/Jeq6iiY/zsDdbJEb2tpJ2dyvOstAfyLk3LS7Kmv0EeKjbWZaeOvEgbHYyTExnzKmOng7QVGeX7ZwFfhwLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722415108; c=relaxed/simple;
	bh=KrkpRLGXwMPeTnO1cuoTX0YZtM8hhHfKx6+M/35Ial4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7/HlCZxCol7CiFNTbyjxAPvq+VVVikCSq0DhD9ZcudYcqdOZ+oGeibc6JUhx54DWql43NMNJ+IPDCPG/96KwEPvDs8Uvk1wRMC5owgVAzWiocvpF0VgoknV3rYv9bQgS9b3exogbJw3aAzsCFT4emqNW/rEMqyYZ6iQpcWokkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0mkEreAa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0mkEreAa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-426526d30aaso35475045e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722415104; x=1723019904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUr6yy+lOaLgq535LzHGwe4Ax/hcPJ1PxEP3Uha7baM=;
        b=0mkEreAaIEFHgYP0RXe47woAqT3gB3P2J5j0sUGw0Wt2YhrwWH8ksfIb1bqWGiKL7A
         dmBTEX13rGS8wfVCK+fe+3F15p1UJIra3ZWlx09efJtpqlzwJ03n9HaxrKqAZdXRxWsi
         TsPe1dACwIG9gzdzTAmTGF97QLNjTtxSF2MlT+eBW/8AfDsemOZ37IBlXUNWqB6tbpH3
         /R+TEmTjK7FiEZ69HuY99/mDIek0kqXba5VFdtuxUjXLhJtm+F5z9B7NDdpTgys5maDY
         sxDQ0yBe5DMkbGioeXXEj0yzuyeDEh9ZmOq8HryBCeQBhLEzo9O1hU6dvvN4G0R7Mso1
         lgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415104; x=1723019904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUr6yy+lOaLgq535LzHGwe4Ax/hcPJ1PxEP3Uha7baM=;
        b=YpOhAmbkJSYxgCVksb4Z06m456omkEqKRpUqFL5CXV+bzyfAgYAY2ZTW2vmWDIzJzQ
         +2rza8cRBRLl55ObSdzAMY1yW5rEQpvri5nZxCDx9NkDsm303kVdhvlH9vvbCWRnHXn3
         Bx3XMSRLo2wYPqFrMve1ZDtRkVQL+omJxO2MbTbAi98QMaf1tOxDEAn05HV65H2DANkH
         UyTd1apBs7SjhcFaFHjN091Wx0LLkS18OmMMJLH/wLsBAy/NOqAIZoOZOtcqrPUkA10j
         vx4u4k7TudP8KLYYfJx7DWcwBCCAsC2eNcedLFyX2PnFEjwBpfBZoeDiraT7hFCrdqvE
         an5w==
X-Forwarded-Encrypted: i=1; AJvYcCXLJBLAAsL9tL/lICk6O7Snk/GuPmD1C8gQrLKYaM8EfOydXmy8jIP3EV/iZe2wkWMB1o+vr0T48NBSa5ZZoSEP/Uyhjzf+nOiQcEWu9no=
X-Gm-Message-State: AOJu0Yzf7+cHmt1f7aMqyhjsD9L7Sd7UfaEZgB61GD+8KgZV9JXFdXGV
	b1Tu9zAI3KspOoC3Ns8hzE5CpH4SHYXYrnk+VEfUFOxNOzBnOiPoVH70BvRbzntM6Oj0Q1k9HW4
	cmRPJQ0zK8o6JJf8U5MpDJh7XY1jsIst2Dqb+
X-Google-Smtp-Source: AGHT+IFdKritOWJtOHZT8CahFthL/8Ped33LgmAWGrwbVmaPgY4BVDnzGXk/rxwUjPs4MMHbLSRnzC1M4JVS1hi9WA0=
X-Received: by 2002:adf:fc8f:0:b0:368:3ef6:f049 with SMTP id
 ffacd0b85a97d-36b5cee2e36mr7709805f8f.2.1722415103716; Wed, 31 Jul 2024
 01:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731042136.201327-1-fujita.tomonori@gmail.com> <20240731042136.201327-4-fujita.tomonori@gmail.com>
In-Reply-To: <20240731042136.201327-4-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 10:38:11 +0200
Message-ID: <CAH5fLggMWrDU2U81e4Cs5dV82VFdWC8+02sR8RTZisQGnFgNow@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/6] rust: net::phy implement
 AsRef<kernel::device::Device> trait
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 6:22=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Implement AsRef<kernel::device::Device> trait for Device. A PHY driver
> needs a reference to device::Device to call the firmware API.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 99a142348a34..561f0e357f31 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -302,6 +302,15 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>      }
>  }
>
> +impl AsRef<kernel::device::Device> for Device {
> +    fn as_ref(&self) -> &kernel::device::Device {
> +        let phydev =3D self.0.get();
> +        // SAFETY: The struct invariant ensures that we may access
> +        // this field without additional synchronization.
> +        unsafe { kernel::device::Device::as_ref(&mut (*phydev).mdio.dev)=
 }

This is a case where I would recommend use of the `addr_of_mut!`
macro. The type of the mutable reference will be `&mut
bindings::device` without a `Opaque` wrapper around the referent, and
the lack of `Opaque` raises questions about uniqueness guarantees.
Using `addr_of_mut!` sidesteps those questions.

With `addr_of_mut!` and no intermediate mutable reference you may add:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
