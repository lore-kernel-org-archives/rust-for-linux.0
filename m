Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03620400998
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156510; cv=pass; b=ogycUxeOuszrHgq5eaj8pyVNcmpg569ApC/J5lfAZbOYpWgAv47B1N3DaN8+0prd/xTHj/GxDQ3CT900DBjuQ38f9Ki/wiGMqS7tE/uHknRulI8wCjvaYavrz8WZzxY48/Nvj9IKK//Yjk2hkR2ymUiKYwiX43KSAn2Xg20wO9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156510; c=relaxed/simple;
	bh=62Q9uhA/ff8GOLJjW4Jxol2x3YVFSgjtImDm4klkvwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdHMXiV+NgZSR+B44KOKyhduoWfnpquGLCKk1SXDSaHu3MLPTR5tj8dHnvlW5IBfAT6orkqtTB9ibA4dZlvVCFowBJoaQW9CI9xUeNMyBFyBzMeBxM7KjBmOVMUCclWO5fL1xqoiUMYdj/xwA1tr1XtyOwk1jHwXu+e7nNirTR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gPIeXxoc; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gPIeXxoc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49548e01d02so13373705e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 05:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785156507; cv=none;
        d=google.com; s=arc-20260327;
        b=LIFPyXfpKjAipgbYG3EHxxp+uBeCCCg2H93H3ygak02dR8eC0AkawYqtXxNbcn1iX8
         VY5OG9TjdUIsUEcl/68sbt+ZksxtcaihgAFItmZJOZKWeGYE1qbFBf+/RrhmOv9kN8ks
         5tGSK1oAMoHbrH6axEKNrEjN23R0Df6y8odqrTVI3qHHD1HbXRGhBNWryJ7kYG330eDz
         9b77asWdgKT4y+teozGxyEvX7xIq2Ra0BuKvGX5ENK91Ud3xKU8ferZT65wgm2m54iOX
         yJftMnofeyMWv3mEIzxNBIjhCpgYpUBPaSCJ0BejhLkykE8AsJ2OU8hJfWX4KWBM7Gbr
         j8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62Q9uhA/ff8GOLJjW4Jxol2x3YVFSgjtImDm4klkvwI=;
        fh=M5OqmRkkuux6MMq11+QXBiqyl6y/RWhAxGu9N1lBaoY=;
        b=jx7XlH5blJ7USzwoBeIs4whRozckPEt9riB5zAj7TpJLVmFDq4B6O0mjRSxZUKyoGv
         s7S/h8bW2ZsrKYXXIjvVOHrAyczThcJrZjxyfu4/iC5brOgaaqmJdXqaQ1o7Rig5xJUW
         Y3N2HIorh7qq3j+5DL2TtF5DU5G8pYoig5TTZBfAgKdzxN96blPs+J4ixteLM+SgxPAl
         Do4OXbRV8duRFyIsOYbXZv7oP55lkXmjCLz/QSsh5VluADnD1PCWYpL7vWCQ8/ihT9JC
         rJ9NHusyNIWvjGYP8DoEUwp68ZYfFy0mQrLRlro3eiEGnYKzmdDyFPRkgYLd0C4jeT44
         hOqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785156507; x=1785761307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62Q9uhA/ff8GOLJjW4Jxol2x3YVFSgjtImDm4klkvwI=;
        b=gPIeXxocnjah0OSQHQCEQSiHiNwmZrEHwb3ULzQ38w/hzAZBgEwY0EnZfRfpbrImVP
         pNlI72LOO6WLNrP/SDsHBtbItGBjpga38eFd7T75fzeEwZ484ngaJ3LMam7lwJmY/OkV
         R+FOdGKYgDi8nzjcfHxDVJO9PGIFJ4hdrTHetiEmXIEePQ5lfNMB/9I7XJcW2/pNYEPK
         8+iRN9P+y2cqrIWBVuWcOWMC8urvDtOz+J+/8PcXD6dUnFt1WEfNACmI03w35HYC0m53
         fsQyTGst9nQeSknoaJnMdzjA8+jqBMPMuSw9N0VXcKniBr+0QfFeFZLb6fIHiToHXn0O
         74Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156507; x=1785761307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62Q9uhA/ff8GOLJjW4Jxol2x3YVFSgjtImDm4klkvwI=;
        b=CWrsTpPj9PSkuLZtJFdaYr+8qGzXHQlrofe3APayXx9cXvvHLhh1lzDoNKbyr7e3+L
         Tz9YKj35QcowcDHnE80ZMG/4O8rMUYmzgtYY3M6hPLwikt4anQE/ldHauQelg37M3bEn
         ERsghKWmpvb8cu7PL8IT5ylaMsYzhVu672ObJIYp3pRsvUFoNUVmHJLjlGDKcnjTQzxT
         XD9nAa5zPbX1sqw2w1Tc09vu6K8Uzz+z0H/4cYtgPhArEpPaZk/NUTnANVNdN69Cuboa
         sjvff+eTgh+EYDE9vApm4PcX+gOBhN1g7L2ywoJgDqSmmacZoGpH+PLaVnKdBpjJMw6O
         e26Q==
X-Forwarded-Encrypted: i=1; AHgh+RqAX+3RAYD+XF/qHjObZBB3ITz4W9EqarxkeLrNxIKUjMLGN3DIQ6qVGJZ3ik6N1f3CNxuPBixp9YeklF6OZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcf6FIWQj6sDObRJW1jUDDeXCUqlsOSrshi6PKb1ViAcovlMJd
	1YAr/h/PSSxKE0bjF1b7Lh2hA0RJiId7o2IW9MN4CPCnHLQmOsv4t8D04WvibHWtGVZFOeTyPAb
	Okh7Rh/Zzosb1mrOss993sWOnfDBcVS+XVIxEOllx
X-Gm-Gg: AR+sD10Fd6hNXYOoyxMFwSWBYB+TC7ILKUYfKkblRauJSIO5TUemm32q2oEf4kQzl78
	SrvnK7Heju/OAdzKTiqIRQKvhsswKfGGAX9RS/honUMOEdDrrHcdnZAEe/TrtHEAXDoFY/za0z4
	vroD2KLf3GWN3Aa2fF3OXdAaac60CVOz6wgv3X+IwffhVBgavzOVfNdY4FstTU4ZZW52L7eNhHi
	JOAwxSEXLWLlkXO9woiQRNBqjVyNoq1HqSUb5FFmbRFoGSoIOdVwVwbOQ3MrYYS2Nx5Ol3BNXai
	Yh6CuIc9osnEwdfh
X-Received: by 2002:a05:600c:4f56:b0:495:4c62:9d43 with SMTP id
 5b1f17b1804b1-496b747487bmr111662545e9.34.1785156506608; Mon, 27 Jul 2026
 05:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-binder-cur-thread-v1-1-8edf2b64e235@google.com>
In-Reply-To: <20260727-binder-cur-thread-v1-1-8edf2b64e235@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jul 2026 14:48:14 +0200
X-Gm-Features: AUfX_mxpHx_3oenVEh1r8peSDt-WUt6jHfN2YlwogkJgeLT7M6VKqvb05HXJmlU
Message-ID: <CAH5fLghGicr4SsLadpNGn3qwRTSUzAPxABAUon23sj27QuEA+A@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: do not query current thread for all ioctls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 2:29=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The get_current_thread() method is currently called for every ioctl to
> ensure that a Thread struct exists for the thread calling into the
> driver. However, not all ioctls require a Thread object, so this means
> we are unnecessarily creating these objects in cases where we don't need
> to. If said thread does not invoke BINDER_THREAD_EXIT on exit, Binder's
> Thread struct stays around until the fd is closed. For long-lived
> processes the Thread object is effectively leaked.
>
> Furthermore, when the BINDER_GET_NODE_DEBUG_INFO ioctl is invoked by
> libmemunreachable to ensure that objects reachable only through the
> Binder driver are not considered leaked, this is done from a fork of the
> process owning the fd, which means that it fails the group_leader check
> inside get_current_thread(). This results in EINVAL errors for this
> ioctl, causing libmemunreachable to report a false positive memory leak.
>
> Thus, do not invoke get_current_thread() for ioctls that do not require
> it.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Oh I forgot to mark this as Fixes

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")

Greg let me know if you need a version for this.
