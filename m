Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC1E23395E
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810060; cv=pass; b=HQRFRB4ncX0xhYvco5xTM8YLz99sHpJaaFwUl7h9MKmxwXh69QQ/OFxnGnRah+SR/iplO9CZJc2/wnryxGrSZxduBgReL37EFo/G2Oe3e1diEl0VVE87f5iK5NZmjKFIRNf8i1k2yCtB9N5UUy0IREYMSlI7odp7aFvyAdH51XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810060; c=relaxed/simple;
	bh=sQ5mCIzXypfBlvbJeyAdboq0LWSgsgg7sji1eZMZSnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6RtixxnMfex0BCfs2Q6yJGahc5lF3cE4HWaflISQJW2NWTRRn2YEqFtaFfQchEoVf7lCah8KOc5SsIKUAqs+AoRCdBRVcHHGGhPT/cipzcp/RRSRApdK8znZ3HBbTA+QlcDBmzSNS+8xjgl14qt3eqv7hREnyav7h+yk35Dy2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRnGqaZi; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRnGqaZi"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-136af97e62fso48887c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 12:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781810058; cv=none;
        d=google.com; s=arc-20240605;
        b=Vw9NNSfmdXnU1iylsPekb6uwz3Kup8INRP96RR2t8NtRWMJW++o1uKg3jwAkabXXZf
         9CshD7zU4YIGNccO0AB4ompyhSzMzWIB5nDI2WdSnEYWEALxX5QuW1YhXZUvfRbvrvKJ
         YmQbUK5kqxASq0/vJ9J32hOQTJ/yKSvrJyqqzf/6jnSEiqBrAIkpFg2StV8nx/eb3Q3b
         rsPJfcgK+bajzjJCafOlzoDmum87/BHSVwiptsX3X0zNXheyfIfwr/PVgmVPO6hwseAX
         mOeQPBycQOd2abjygDD/X2HqWZrsMWrE/wIUc5RSXIZ3JLNDxmqnBJJ76E9FiTjtZh3A
         XIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3gIhj8csyUjzimg3goW3Pzqun4T3ZR1YGiH42Uwliks=;
        fh=iz+0vos5GluxkNVlyS7MIgn2R8Bvis15GTWJmhOxgX4=;
        b=lqfHEluZEk3RIaNMNr3Q3+f2i78WfyQ5cfBiJBW5i/iZCAdD8P7i6/Yvos2EpC5TbS
         o5aI3ytr9jrghyV8SYjI7CZxFDQd46oPucGMgw39xuIYMJtjT8SY+02hUUK1T7NAw+ij
         opV/jnek5xzHnkuzr1Rg9xp1fjafvhn+6IIL991Ctf/UuYLbXZALpD3V0kfNqH8cqoME
         +ftBtNdSHRvCe6sNKgnKw9VdBh9txdR1iVgeWNMSo1XLaM0XF0PiuYUjzTrXCLszE8U1
         N4MxLJuRLe6FIXsGBitRQMPyX9NNR5BwMyuDMVqEgMTQTUiIt+K/7MA19SmCKuaf9Y6U
         XanA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781810058; x=1782414858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gIhj8csyUjzimg3goW3Pzqun4T3ZR1YGiH42Uwliks=;
        b=KRnGqaZiH3SMfI8GqOnMdfnCq0OYZBNMuoMiHtHIIxBVbM6Uhgm0iTQZa7I5OHAfbf
         BURnZ5d4gLFtXUxk+a+CjEVq/93fG4aEuGeq8ut5Xd3InAogUdwGpILmcEbes2S2U+Dm
         4xOMOkfOCOPL0i3Ey5cou91+8ebPUWNmIEE46OIhhNZgjIUviSAmH5ZQI1J8TXdVJaPC
         64fMeVtQ14FsxCw+rPPm2KkBoBHXgZyfC30hbakkR1/5d2Di5GkTOxZ4/lJF1sTOGW2L
         MtIn/cEBAAc/Z1v+VO8XYVVuV0oJPej22IcERSnDD1awj/tMMKzV5CTC9vm0mg0mq+Pu
         zhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781810058; x=1782414858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3gIhj8csyUjzimg3goW3Pzqun4T3ZR1YGiH42Uwliks=;
        b=fTyM6Oo9ibfUKb6VU+HTgbyZWbTMdCpTBp2SktXfTXNtFUgtpAuHlQPfhyVCLG0qPh
         r3kSQ0g45CSyzdUa8Ia2V/yZM511I1f0Gwv0QNaLeAZkZAUn4v+upLv5mwco0eaEZiM3
         pZY5vIMaQeubqeL37ZL4ShZsrlH4dkusqwJRkXrH7ySmM8cmOVlsExK96zIibCq62l5f
         dxQUY7tE6Cm44zNfAFr4X+ZW7nAn8PA8AEsEaMK7+PlJrhJEccxxNFvO5A9xT1ZcRb9F
         qVIiKuOrzVV7AfwItxEKA9pPsoSft3W5pRLOysXUyN2RmvnbqBe4rc2C4Ae7XMKrpKXs
         QwWw==
X-Forwarded-Encrypted: i=1; AFNElJ9+UKkaNjiOLLYUNNx6NxR2/9yLr1z/xm8wR6Kzqtr+tiFO9sSuYzG8bjrxZjwDY3EcO4GwNYPxrBRjk+kXog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOzLrWM7fJJU0uD3NUbki44Gzrgsl2LvHaJujNb6NmDw5RhtL1
	9ycax+5cyd12HkcMC6XCIKbvhP13BV+i02YM9FIJtpBgF9EC3e90zuvaGsgqjAmRglWkvBPwsAG
	L7ramMKVL+CvsJzTWD19/FSpIvkjxIiw=
X-Gm-Gg: AfdE7cmHmWZAXLPrOMglLpJEmA3/YtmB2JxsqfHRvphILpOd/NEg2CAKyVP78kyslvd
	+ILCewRXK5Zwj5k6sIl+L9/Ht7FOhwkQ6hD7MGm7cGNVdhw9jB0vzANjeAuyM95ZSZ0NLvWs+Kp
	JyCfZfaeXW7+FlUhdrWXAE5YVkcfqFhepknP1AdZcjIMmvQU53+maWoM3Gk34WlnTC9maGHk9CU
	AvYBl8ojjTbfIA1yOQEIUdQykGxq0iIPaIdz6P0H28s+epUkQsImXXQBVIiA4YZPUwPG0BxT796
	2XOrzfafrUlrNgbcreGUnUZ4jNjVzgFaSuqL6Idbl1gYzafxvpsUXTkarGwM9G3+xWPO7F7NPLo
	+k4WP4CNinU86
X-Received: by 2002:a05:7300:230b:b0:30b:e4a6:1aab with SMTP id
 5a478bee46e88-30c074f8c21mr216868eec.8.1781810058121; Thu, 18 Jun 2026
 12:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618132628.3811068-2-phasta@kernel.org> <20260618132628.3811068-4-phasta@kernel.org>
In-Reply-To: <20260618132628.3811068-4-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 21:14:05 +0200
X-Gm-Features: AVVi8CeC-ql5SLxnogYN7t_D3e3IE25SNmVufxe0bxI6l-UhWmyMsdwZiyoyB5w
Message-ID: <CANiq72ke2pfkhHB-_x0dTKUbktkTvLsu7z5eCFYVyL1CH=O0Cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rust: error: Add ECANCELED error code
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Matthew Maurer <mmaurer@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Burak Emir <bqe@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eliot Courtney <ecourtney@nvidia.com>, Mirko Adzic <adzicmirko97@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 3:27=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> +    declare_err!(ECANCELED, "Request has been canceled.");

Please place it after `ETIMEDOUT` (these are meant to be sorted the
same way as in the C side -- we had a patch at some point to make it
more obvious, perhaps someone can resurrect it).

Cheers,
Miguel
