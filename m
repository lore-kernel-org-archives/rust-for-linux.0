Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE752417D1
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405674; cv=pass; b=LKcyVweZBmuGFL0q3zFBL1wNlgi9E4OaybE7sG28IO3ulPtiyLxHoOw1i+BEuSdZzOKTEKGwQaxXT0KfsHKd7et8HzMMhrQ1vNAVd7/h+gbOjuHiEBH3r0/K4lqoA/6zPx9z5xwpYJMB7XpMxkxPi9mIWCXknRgviDDEHNXk4FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405674; c=relaxed/simple;
	bh=rsmERmzp5RakfD8fn1Sx4Rk1CQjGEQAbJPZwguMRTO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZ4XQSrGfJl7vvSeovHVMKFVFnILXzC0grwTmTbN88Cjw2RumChcfMVy2lRegevcCsL0nxR8it23aKXB6y3nzE4XA/cMDK+pYcne+IeqsT6yu8aspiYEO5Ss2IiElasYBpJvS+cUvqNCsaAHMss8itfmlYqgjWZPy+OYdGh7K0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbLq17/p; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbLq17/p"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b07583340dso561913eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 07:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768405672; cv=none;
        d=google.com; s=arc-20240605;
        b=d2m1NQ8S4x6VRXA0uEfjMYcrn8eYxIegKJokDktR7VhxMUKrZDPUQPJRTAqJoxlQ8i
         KZnwJTdQWiF1HnTZeyM0sbxL2FkEZTbL++P7NETKQwD6AY80/fHtEqLAo2ziRIA7LmSB
         +wkvjX0KoQT53ha09M0TSZJ1gKCZ2AvB4fnW3Z+gq2oxfoIIWVpsyihObIxZg/RpgSav
         lCjoU+i7N9NlSSwZOtj/65/rTPiHILqJTjTd7n1+txnxls5wzagV/+p+ee+y4mLZopE0
         shhTGV+dIUChC1LXL86i3AeSvdXqPqD8LoZPcYC7FjOpIpqZCVYzUDnuYFMqjWq4NHKe
         vAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsmERmzp5RakfD8fn1Sx4Rk1CQjGEQAbJPZwguMRTO4=;
        fh=tf+TLGK3eIbjE4e7H8hdeTOPay00FYaF0YvBhT7v2j4=;
        b=htXb6W6SnqqeYRLPMSQxXbMPLCj16YINTA5MP0FeNzMLZe6rCiu7x2Hc2B8AzEfH95
         ubjwOtNXLu7pdee0SJbFGhu9UVi8Xj+7eADN4aJI64PeDcAynff3sOaCGU0ayStcW2DZ
         AaG+BvKcptvF0wsyDi4sFS8N8yoEXrMoWbxbFGCMF7O3xpI9INNwcEMiYeS9nlOLWqHu
         ctkgtgqi8A4/+pJkslrW9TaP4pPtbIFoS5oOhc4HqDAHi75smMVDSfVplP4fcc45Q229
         E3opVgXxeUWiSOYeRLtFoe5QlITNYp1oGgF7N/24GsjG9Av+wqDHTgDpPE4h1eug+xaX
         dS9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405672; x=1769010472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsmERmzp5RakfD8fn1Sx4Rk1CQjGEQAbJPZwguMRTO4=;
        b=bbLq17/pLx3Rk/y9zecwIlpR1pfZSihRLCstfCfpIpbOUYR0/1DwZVK83zaIyd78Qj
         b9bfNA+cJtEe4VlZIsDm9tWQs1biaSVcPT+KfLWamiIQl5iUoHA1KXW7VLjooXXwPUJk
         LvArg8VFKpDTTa/Isi5GRhFKy+r8Z6ZAjoSXE8qAGUFy/z9BeUWKvMSaI1jjaWmRw3ft
         RZaRc/Q01NC+7WrRXgnz3iZgK4alCCDKdesrsok14QEDg8qoiVxeKez05+jqUHFhBmPQ
         tWyABxN0sSd9GQKOxetJDZJjBu5WiD7DHRm++toYac6iM/Umbi2WFIzk7mMdUZ759beT
         77og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405672; x=1769010472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsmERmzp5RakfD8fn1Sx4Rk1CQjGEQAbJPZwguMRTO4=;
        b=T4oLyhM6dCLjnPShzUTj2UoTiaR1SZRO4sMh1zHgl0Mp6D1PMrnSjVhii55zDA1yj7
         nO7cEpf+7pSMKP8kBb3VQ60AB0Tawp0xf4wMmjV2vG7smekG2JlIvCKV5uSNpc1nUMcJ
         vtGF4uiGCsDSwAKFb8LRitZmOkVAJJ87E5nXt82xsp38yRypBYddY6I1D7FJE8H3LGPU
         tfsrlNMoxkHUNfaXbE6ExqDIRA90TiGUSuaHSDbu11jfhCev0AIYoS9991vhz8rsmhxB
         gFX0wuZ0HVXjqz5OK+8Q/Aobzh+0Ww6oCS1xnGSj4aCAgdKEHd4OW1IJA0F74Sddru7K
         0LJA==
X-Forwarded-Encrypted: i=1; AJvYcCXfljYZNkc9qmI59Qg2gDcuURgzD0wrzeYDsbwA51qbyXGNofZKi4UlAXANsLNd1PMnykuCCGijqGRIqLBlhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEiVPIzXCkUux6kI/QfjMEDPX5QdogKVbVUlFBlpLvetaAPS/2
	aVf/3mMnfM4PhJTzschU2bxV/T2bB4TM5j8DJe0/+gPi9dghQYBITdGug5X/PxKy+5gYxPNagvf
	fvPp8y+ygLCjIbCwB6fV8o3BxV8QmZG4=
X-Gm-Gg: AY/fxX4FezzEJUSDzwRmWUC3aWMDJf4Td6HMzdzFxIKSnBGh2TOjXaHEFD0SpGHVMRc
	g37Xpdw/0yzGNFF9/lNHt/GJw6MSdAyxoM7q8IaAn97Lpf1yNxPwiBvRrYohxKe8pQs7tQliY6C
	4KWjncgQwO8oODbPPyDtB4fZWyCAAdmM4nQCT3DAwgvC73l472lhujbA3axffxCypdtkBCGo4wI
	vT5bFQaWVD/wyIIKFi7ToLSFZTF/O4WP89JNyWCbB17LeWcpIaXSIM0aEXfeWHmMVYvfdaZ31x4
	CzNv+TrkytktRrMnlocLjAW9zVZB8uX+jXN1ZgGA+5DHry9DJa/hyKZCDs8/d7nhmPwHwSzLD3r
	TTjDHJaedgyX/jZ9QbPsdxrE=
X-Received: by 2002:a05:693c:300c:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b486c998f9mr2022406eec.2.1768405671844; Wed, 14 Jan 2026
 07:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <20250723-rust-analyzer-pin-init-v1-3-3c6956173c78@kernel.org>
 <DFO7DMI84JCC.1IAS0JWKKLNTZ@gmail.com> <CANiq72=rs4vu5RMY=hf7Q3MZe34tbq4XyOAMyDy9Nx5D6EhFjw@mail.gmail.com>
 <CANiq72=vbcntKJWypj072qrV2T+CoGRow0QQwh1Yrv8W+M5+Dg@mail.gmail.com> <CAJ-ks9np7J1rFaaMfxW1j5Yi=Bd3X3yy4OCVPRt38Zat2Ghyyg@mail.gmail.com>
In-Reply-To: <CAJ-ks9np7J1rFaaMfxW1j5Yi=Bd3X3yy4OCVPRt38Zat2Ghyyg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Jan 2026 16:47:38 +0100
X-Gm-Features: AZwV_QjqJGGISZKyzSnNbNk3maNiLddVTIOcwJhnKpy7eJlK3iPqCyimx6xREi0
Message-ID: <CANiq72kuLRCXnTshgOL=x04jv_KABN_de3hGmn413oC47VdsDw@mail.gmail.com>
Subject: Re: [PATCH 3/3] scripts: generate_rust_analyzer: Add
 pin_init_internal deps
To: Tamir Duberstein <tamird@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 3:57=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Sounds good to me. Miguel: do you need me to send a new version with
> the Fixes tags, or can they be added in a reply or at apply time?

Yeah, they can be added in replies in general -- I will add them, no
worries, thanks!

Fixes: d7659acca7a3 ("rust: add pin-init crate build infrastructure")
Cc: stable@vger.kernel.org

Cheers,
Miguel
