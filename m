Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E3175A5
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316064; cv=none; b=Aedx7pnWO1YpTBrKfExpzEjz7CP4yvBeB7bCeCXwTVYDa8w/rHv1aU1yZ940NmH/e+w8AQLI8yWkMswR0Fix5jfaMAFEhVuaWOS2zhgdD0NRXorlsQiBD5T8FC65Aq2rlO8m5qhqrO/L7wmECq4JCAhW2gPxs+xRgs8zD0ts7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316064; c=relaxed/simple;
	bh=xj50R8mQAnC3oGaChPzaF3Zvfpm/dUSewHJdzEkPpkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo+n1FSTdu2ngg6zsZMJhNPYBWW2zqzvHTtz834VeTv0pmP/nHr3FYvrrDMf2qkatDVBNqpcD2wK1wFlP0K/Hlu/B1sOJF74LFUMwWz6NnQz4Kn/0akKhN/0AIn0fmYSEzL0bq6FM6co3Z/WoOmmpuwOl83eDbMd2TysFD0g5o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sPccDVhW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sPccDVhW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so2216117f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316061; x=1754920861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHAJM8FSmnytalA1wMLubAZ/HMmqzJD/2hbTKluoKzQ=;
        b=sPccDVhW6QEy9awym2yIacqxD012cjYckZGwqm++41pMKdopp9Kw0KRZ49zh+Ut3rz
         qU+s1bgtX7YqYE+EowW/cd6JP0JTYrQT9w4SgtPobxZPo0z2WmUWE0E4F/1fHId4O8Pb
         EqNVtXoJW318Drb6pMGhCcBnfWVWtpkgGCItkesLpkfPoQBCxhO16jO52J3NbhqK1SOU
         fubmFj3G91IzH9w9r5ATw3XO4cnYOi1dMt040KTkOKoo9jsl80rm4dnVUH3THHLXQqC2
         kwAYsTrotvmj+gDk+3+OJaHBCTd3OS+6aX7QSsRCVX1ceUTab5jfOOYUEB06K5hfdvit
         8M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316061; x=1754920861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHAJM8FSmnytalA1wMLubAZ/HMmqzJD/2hbTKluoKzQ=;
        b=JlwsuID/Cs55cI0++m8l4N/bxPh6Eue+Wluu3NAkhyghhUGp2W3xd6n+rCSWNWdbk+
         EMM/dIXTd6MsFJGjf7D9ezZgjAhdU4ocORJqBcp6Ww7gmxg97LMgN9ZI3Xxb9xq6JW3/
         tsu8yGfNKnxn1jmVRlIoQf89KoWAUSzRk5viTjvvBf0RAzMMT8dLPqCOSEB99xhLm/zw
         XXbnNeIAVIzfmkN304SyG3LDDJqQd7jTD0XDvyiUvxfjRN0Z7qd7V67ay53zJskV+GzQ
         TcHBJKQCM86Lpb271/R48fqkMdTomKf+wHfIJcw2LS6nk1K9gXlJpnWM8q05484dMFGX
         YZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXR6T9I7U94srcFTDTqIyfZsfqB2LDW1YPcQU/vlvgfryD7Yowrt4doWQ7vwaCHA5QMyGKRB+mtgkKxuVoC7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0ffXl2AZNKXHPxDVyB58GrJ/OyrjjCmH0z3EaV/OBtN5wDAQ
	P23TQzttUTTINUiFzpG21P1VcEvA4KEbOzOZYQ/aUPDUonidyvRnFgpBRX2Nt69M6kTSe0PnCLo
	S8Uz8ryvpGEVgkgSpKpCf8kOGVl+x3A/iirHS86Es
X-Gm-Gg: ASbGnctDe/vECJiUMbTvc6duYkr9rRrVTKVlUTLUmVvpPwWCifrBImbQH+HSmxAEgCN
	0vSksY0XJ11/vEK5Rg03z58jM0/XnVXqHcnIONsNHFVnNE8nNImw8vhhtc8EakviCrN6yMAFQto
	MmX4GymJd2cwlTh5+Fw09yRRKIVrJvGKukmclMltsyVyutj8lT1FofYEURE8Y1Iu8oTaJ0RROFl
	xYVFn2y7Wp+7bWALJwmqgMOqsQxefRnUEUS
X-Google-Smtp-Source: AGHT+IFUU2uJR3FAMs1rzBe7h/KQbUHKICBqcp27KBBBta/zTdWvcJkLu5KQlclilix6YlZPh1K/rMJS83c3Dckdneg=
X-Received: by 2002:a05:6000:4305:b0:3b8:12a6:36b8 with SMTP id
 ffacd0b85a97d-3b8d94c1dc1mr7155506f8f.46.1754316060342; Mon, 04 Aug 2025
 07:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org> <20250731154919.4132-3-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-3-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Aug 2025 16:00:48 +0200
X-Gm-Features: Ac12FXwPaFFtfKIfOtRFAm4bgGywLjC6Y0YkcsOWje9_NdO2yRdOYYS_hnAnRbE
Message-ID: <CAH5fLgh6x9FYdURedJJSB1nm9n7=HA7aK3Y741P=1g7cLKEQOg@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> drm::Device is allocated through __drm_dev_alloc() (which uses
> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
> initialized in-place.
>
> Due to the order of fields in drm::Device
>
>   pub struct Device<T: drm::Driver> {
>      dev: Opaque<bindings::drm_device>,
>      data: T::Data,
>   }
>
> even with an arbitrary large alignment requirement of T::Data it can't
> happen that the size of Device is smaller than its alignment requirement.
>
> However, let's not rely on this subtle circumstance and create a proper
> kmalloc() compatible Layout.
>
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
