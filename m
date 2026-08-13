Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D0442379
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615460; cv=pass; b=gOuT+epQx8m0QkmIHg0N45i919fZWN4EX5KEDlTM5kgo60vwyKckgk0BqKr8jPraatyt9u+QYtlABmC/A8ts2oiyvmp1/22FeA+TwsjUNAqMYZ7NKE00VuxaAxl+LE4otntnNBZ3OE2Bt1wuRVEPxsKNBCWwQZl/BSi1yNOAfMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615460; c=relaxed/simple;
	bh=izncAFina5udvh82qhiR9A/Ymo2QgJMmGzIkcJM+wME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPt/JDmOpuphN+WdZ5bULvCYWwAgrywjveQ/15n4mqr/efTmS6RoSggsZpOZtDkhxVHjOFYzzWQqx5eJD3hqN8zMW0zPicgqE1L6/l3fR6/vrA1ndW02N6wgw5ama0hzQhP7KLGugne6a7seEikluhcUaYPHjdNhKnW6unPJyPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFHTrXRV; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFHTrXRV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceeee8c46bso4816715ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 03:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615457; cv=none;
        d=google.com; s=arc-20260327;
        b=Fck3DkvOdZfNPqjwe1KPA1Fyg7CJQfMA4KvqlJHThpCddkvAaK7sU5+1oh5EpRU1IU
         Oxk/O8rE6Ua32pwk/9elcZxzVOTo3cBgFFSTHukSt5l6hqXDCd5UnRc96X1aIDMl4rOc
         ekGN+03HoIXN91PwZlNV9c2OfW8rVbA/kBmuy8EhLJ+i2x0ze/ZsjRESS7fvPXabAMO3
         P4OdY4EyDOk470xGQCfBwK52xqggtCbpvXID8PWQPpsD64EWOiWp+SifWEyn8UyvuVIk
         4p5fwuoItmKjOXgkG4lX+fCA2NQxaIYmd99cmpEKd6/TXNoE0MnWnRfe4OSarSTu8cEe
         HREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        fh=j+H5Xcj0YNGTyqiClQwUQ4csEpG/P4KjwGoRURNXsJU=;
        b=dPtcUoJZ6V4Q+rQuKBMJqOGNcdSIi1tbioDbx1IhuaA5ybJzxymjuZiyQh+YSFvKW3
         sKtZLDud2dG0geBQP1hgrZ0z7oW3VZNHd/ueqk7CL48KCbxgrqFAKnLChx8QVwnU+Vcv
         sEBATxAgfKKOgTkOZh0r39BylC98covRLCD0IdVbSHP0j6l+PejAkeElvlqMmRtFK6X6
         4wew1g9Ry6p2uREJhA/hy30AU0lJJg+sg52RIkR5JfdhzOuXObQKpiQ4e8lEJwoo2AL2
         5WMFn80TspQHN7IBw7aoJKohbiGlM2x/oaBZwUJXN6630/bPKClnTU4IDy+dffu58yU9
         ZtTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786615457; x=1787220257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=NFHTrXRVpZQTifaiiAeRhSGvfW/dP05MC4U1EuRQWVJr10hfFTND65+3+8jb93NkKj
         pyVgNvfrsAHjJCQSlBnv74kIuyAGwTSHOr/dBTUV0FlXohKVfuehKEUbu+Xe3QIPOuZT
         xyYOmMs01ckolTS4zDf1GolYHoz54YaFz1+Jivey5iRPUdra7EMw9Z/AYpSZUXI96EKd
         3/FfoMhZEcw+UBCPoCbiwXXB7S4RQ9x13SiLR20aVLYVohDLsUPCpyg8prA+dVsmLDAw
         h9GzD11ijNfTClaEZMVLRNH9dpACZ2webaPItG2U1BR+OiDQwMwbfXeiDxCLD+bWtAte
         hzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615457; x=1787220257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=UeKtVcb5VI2LwQHctR1igwq8+fq0saFHGYwLpqbTBgHORlTOsiuW7/XqOzkRcZc7qV
         8i0OK9Sj+Hi5hyjTaEXmLkRHVMtbIP50UXWJjR0qmhrk3gN+pmlfYaf1288bDuVxeaAI
         86uDAWH/iKeShebjBndKfw658tkT9NE0CNxp6JY3SEmtQhj1YzzcrMCDcDqkV6DoyFlE
         4D0PYYcws6rSx8PEz6eu8FdGFzLOfSzJN7QR3rz5pX9Nr5n8Cq2TD45O0mgO4sDTlgzn
         PKtlBq6GOKrMnUoM9KwedGscu8EGjyQsENQ3wWa1M0uPhRWxWmieQ21EgXUgoslFHRvO
         I5VQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqRpRzMHifunyLqyjV25Y/cJBZPb3lKUKqJ2+q3Ju1nDCMyP8HpjSR3tP7Z1OUqD8EsegprX8pyeEk1fap+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNISEOTyzgE2hZCpX1x+9ta1nB1VP0d6LHVg7FaX9R9zoTIgW
	KH4HEGnhnZ1OZ6roTlfHqd6ucDHtbhzKeEDutr99knffWu3Hat8Xbjc30WrrKbD1aeL7TKCkMMx
	UHcf5x01IeIxhuUAPIhxJdTg0/6Atv70=
X-Gm-Gg: AR+sD10qJrjdSCGzCZZYenYx33ZEVLJt1SVdFsW2W4KkpVnXI7k4ky3pi9iYF/wa2aJ
	XTDi7AUdRHodz8f/0dATx8yl2Os3NlPFHcDbYV11DUoH12KrrfkX8vNGZNIm8Np8eZnjEMDdaL9
	Zx3sbM4s1Y8oKyTW/Z3QgOwBd5naXmuZshaJoy/ViJ8hr8LEzA6l4zTcb0X4Sz5ItLLgFUZPGqq
	PDOcD/IoI0b1u81k+dGf9xE3wRRmXWlx5SZ7yiFfL2xZHVN5r5mbCv7y4Wsq+U/hfZJoUfjEytP
	ZN1ItS5Gwy6VeCiI3/eE8Vkm/jSbHTqBljYV0sFqtwzu5s++39fDwZXeDYFxm8mRpmAt13lJro9
	tSd163H60V76s19FUUMbwYCxQ2YcJl+aIZaUYvcF5h6Y2+Lk104LJzn/Xrdx+
X-Received: by 2002:a17:903:19e6:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d389b61bdemr35547795ad.3.1786615457444; Thu, 13 Aug 2026
 03:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
 <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
In-Reply-To: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 12:04:04 +0200
X-Gm-Features: AUfX_mxe0Lg9da-FioFXEgvJltaWUVJqtXi0b-R5y4sq5pbip1KqobICrYsDddk
Message-ID: <CANiq72=Whd+u0cA88++KyeOQQrsBK+NqK-586jNX7L=_Ocixrw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ok, done -- Danilo, I took your diff and converted it into a proper
> commit, please double-check you are OK with the Signed-off-by:
>
>   ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
> `#[vtable]` `impl`s")

We also need an `allow(dead_code)` until we actually use it
unconditionally: a2595ed13816 instead.

Cheers,
Miguel
