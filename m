Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D35E3FD969
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805780; cv=pass; b=EqRVow7bjc3mjp7txKWphirXEt5Skt/n378OTrl7MEKKbjSRJUs+dKeW+C/pkZroQVxvbHEkQoZPnAduYdPuLgQ8EE2O9s+2C6lhCQ5ArozYv535zz4ssooLxD590JEYjI9qtXhFGRowCfTVmaN8uAMh6Zdkc1jhATYkIWPvraE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805780; c=relaxed/simple;
	bh=vP0zaPMIbKqhvyxyqCPO4DwmVgyhZB5GN6q3P3VKB94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+BOwJpqPXq26yn28qezw4TwedkfrplkJEIBUVL7s1zT7fdJ9C08UP2VfNvAkX4/BN6xteg9jrPC/oXNRVrHwjxxJU2BmMWS+u1D4bUvSsGEUAzZS3XjsjA4UAOKDp3hsGIfqlB33t4q66FOi2VEhmWhpXbCLXMPBy2JgY20Rqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c36I0/UM; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c36I0/UM"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30436e8f582so553560eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 07:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779805778; cv=none;
        d=google.com; s=arc-20240605;
        b=IPY6TLw+YSOgGN2WCZ5ABSHwbt+5xQaY5wMCeDDIUXrW88ipU7mVJ6WFPOgCtGK+VE
         Wp7X5h9Xqo2aqderHYfYyup4iNbNvlMtpC/Cy/iVZgjI21v6Yvis+98BF+ubOntKLp1B
         gU99ttlG+g9E/3rhwJs72LetW+mH9TWdiJsyoxL8/ArX5DNocaMJk8WoL5Izl0Sdji3C
         +tvKJeqzjD4RHJW2okwAl9kubB3lU5u4mRjHfqOO7+Jmcrkhh49YhJwSCMl9713FFoUA
         TpydIQdjPaY1dhgM2V9GZxLZ6684Khg/1/4QRc7Vsy2tPnF62p+1FoWv9TTJW+993R1T
         KLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GkahTBY7DttIBK8/I6RaDHQR+ZL3N1RSmhZ9vt+Nxj0=;
        fh=6Prh/RPR6YAfZAOQcVbeWsMYuwadfT5NON12H1XKvoQ=;
        b=N0kMWxbc/I2DJrxNEJIeGzQIJn6LdGQC0Y65Ec2pUWUvAV8g/L7TrjGppXFdisKpyr
         3QuOmQBr9QNlionvLYEG2LgvZIoTJbUy+kkLuQDs+vj7/iO/rwDuYaXFZ6RdyL9kHCCv
         sT7NqOdCF5ki832FbakDzHcu80oauMjxp8qbcJyrC0Hssl2jG7IzM6OPuXHdy1Wwi6lY
         MfaX+h1poSf9MfjXDI2uiyVFYl6FE5LEL1AOYzZDOA1GEt6ZW8V/uXBbGRG1OAmOq0qA
         pNe7P/MNRD/7xPMbe2ASm4T4FMAelJ0bQ48iSggBKrvk4hFgJBfKbQLW9CxdFE4lD309
         WENA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779805778; x=1780410578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkahTBY7DttIBK8/I6RaDHQR+ZL3N1RSmhZ9vt+Nxj0=;
        b=c36I0/UM4iInio3iXPuFHOM3FXvOBBUjtuyory5FpOCKx9dqvU/gOoFOMVVm6+diqV
         F06f1oBuFy00JtynQoRsiV5r9OJB1GpnIoQTVyw8gRpSNid1roxTy0sgObdyCnOE3O2n
         WR+EODXfykiViQNZzXvJ0wLwqPK7RbOECftzC/J62dqTF8xUalO790FAdGs2yUIHpXms
         bhu28U4np6zBcppVn+r5irKbyoza6zNVAjPnUWhVrcv0VbaOYg00sL98yssaSxhR3v26
         ojea7a2WsphLpCakslJKQhpHJyVVQHzS7t6jGcZhXe+UuXluH7uCpCwwSnnU4FBwMlJs
         i+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805778; x=1780410578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkahTBY7DttIBK8/I6RaDHQR+ZL3N1RSmhZ9vt+Nxj0=;
        b=r7bZ2HZYfCZU6PjXGJIJYYsp3RUnyLObF9Qlu6Qc9mKWlRrQMq7x7WQV/Wi6WN1Og/
         nWPcimyWA0f2UPus3j896L9s0oyVVyBpr84hgCsztD8szcMExGMew/hBSdxyXu9Torwq
         R+x/t/1Dt3OGiothDhkpI+IYQBYOnmv4K1aomXyOsaFSWekQhylLbdmfxhWJneoifhJN
         5JRKWA03kGbocFxJpZzT98DLE2XZLi26DRqo9NiazjCsQ0z5VTVUhHNx+SD+FYEvhK+9
         GDKcLECykI7pq1NcgylXmwTyilQExoVkSQyndeTb5U4zru+baDM3iBiWMqeFkJdSsjOs
         C+jw==
X-Forwarded-Encrypted: i=1; AFNElJ9A+oE77pRWsbfEGgRrECkwgSrtvdUvcES9O/t8TeYU7lFTh1YUbCtXXeuZAn1gT6zhirg1YCYzhGQfStHEqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqGgmX6vhzqoPc0rlj1gZbh54F1jJibVBKqblCQPqifVZLQKu
	4wtXMAk24e8ZXpxs/X4EBoGWFiRRd99yaF2OqvHZTYdB4IZQuSADDpoBGefC1/oFzjQSEYvYkK1
	RkDinuy0L0Z329P9+d7wQFS60dMYhtgc=
X-Gm-Gg: Acq92OFQPuxj4rKY/RKtFq8TujStWC3T8eyYnpYTw8w0eg3S//zIOjsLDfL9cyhrzlK
	AF4fcUnCPH5SZOVATX8PLnZC9ytfx4i9U+WoUhg5W09yG0c827VyV0YVRyP0eumhsZnf6JJ6d2w
	WoBHoW/6tub6oxD8t08sXG6R6ROBxyB4JmuoHeP60IKHYO7ZNiX2o8sqPiLnqaCfxi8Ap6xcf7J
	Zwl/Bk55VAJu0vhNxdIfcUjo02BcHueiyLTrdhm7ejC39o8ENmaUjwbqMW1F4gwcT8rJwVj0ikS
	mUxRFFF2S8ZFqk41rN+SP3r/Za/9n/CoU0RWybal9GRes7i1fMW00fJpwgs7CZ0pQGp/Pdpftiw
	3zDTpz5gLjfrYaMrG+YGEH1FahknQkK2Nqg==
X-Received: by 2002:a05:7300:ef82:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-30448d0b97bmr3769857eec.0.1779805778357; Tue, 26 May 2026
 07:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-binder-netlink-v5-0-a90e2923ebeb@google.com> <20260525-binder-netlink-v5-1-a90e2923ebeb@google.com>
In-Reply-To: <20260525-binder-netlink-v5-1-a90e2923ebeb@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 16:29:26 +0200
X-Gm-Features: AVHnY4LeJi5SVDem9yk0z_BL7MLaNvMrDJVdmDpHefcP8syTnl8_FJAOfE4J2Ws
Message-ID: <CANiq72kRC_k1cnJLmG+AUSiUH6kDXVsox3nMJnV-c6HkNXOwBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: netlink: add raw netlink abstraction
To: Alice Ryhl <aliceryhl@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 3:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This implements a safe and relatively simple API over the netlink API,
> that allows you to add different attributes to a netlink message and
> broadcast it. As the first user of this API only makes use of broadcast,
> only broadcast messages are supported here.

>  rust/kernel/netlink.rs          | 336 ++++++++++++++++++++++++++++++++++=
++++++

This should be added to an existing or new `MAINTAINERS` entry, i.e.
as usual, either inheriting it if the maintainers want, or delegating
it to a sub- or co-maintainer, etc. depending on what people want.

Cheers,
Miguel
