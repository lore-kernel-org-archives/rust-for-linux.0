Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D4F24E4A1
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Sep 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758702701; cv=none; b=c7JvUOvFUQICj5Vbsp8HmDqn1nrpUCtqnkNFw1k8BjTRGyovCXbLigBzEXQuKjceGHXaW7vn7afyWQnKVqnoK2vTD4Wjlueig/+iYbuxkRpuLI0eckGMJisUFWo3OhD7rRu+KBMtuHXzKbXbmv/rfAOcU4URydLdATPsubwTu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758702701; c=relaxed/simple;
	bh=8ywuIsGNGJrTZUPtWPeLv9Me+oMXw8hdVTWbMpY0Scw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwZ9elUSMxy4/GfPHGP3r1UxmryhrFANdWYKuF9X2qI1UknLdo4/HWKvnfCMbxKlh3JULu7KPNslR9i63TD97t3QUkDjO5mxnxb3M/pDpMwgW7E4lrymFgqUnXmyGWUWvUsXmArf5X3eF+EVDV0YbO5fxMZ7AuU4VWiD9Ljtnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXRVmScX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXRVmScX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-333abc4394dso188129a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Sep 2025 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758702699; x=1759307499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQBcQDeWQXOvhnNWQnvPLDHcG5VxhzKS8JQnGss5ZIU=;
        b=WXRVmScXvCVlqg8bNuIGWe1BKTTTxELENx6l0Ob5YLOBqy/ed8dggDKK6xyLutHxv7
         gL7dJvKmfis9+QY6x+0pP9Wi9AjUGHtxIi9MsQ4Leq3M55l7GGuxMdCr97IekmMaq8gM
         cMflc3/HzOhhpljFg7E+ZmQi477vglG+aGAiCw+KAFGAlHfRt+lwYYqoPyVsKoTfynkB
         Zy63KDClNu5bnXrAKK7RUu9ydxpBoykkiNMdJnELa2gTy0wmmzuwsO/VXeIbTPb3ePbu
         uHipKC8UKbic8ney9sH1Dr0gKg/hquapHx5cf/pmqUpqb6iu0RG/ydZdufbhoCA3lpNQ
         yUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758702699; x=1759307499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQBcQDeWQXOvhnNWQnvPLDHcG5VxhzKS8JQnGss5ZIU=;
        b=wKQ1leVNH57I4dAZEFEqLj8TJSutleIFTNnhLiu6M3hHfP42+19swWnI3rZ0Hb9Q7/
         jxQG5s07ozxvP7RqgXiOkjCyFyVqdM939xkNZHL2zInUlx+wG/L61rLTu+WdX+tSMGxh
         tlUMD4Rc9nMo02IKHTxuJ7xqzQDI6sGvjx7TA5yjXN5fYQv0x8m1HdJ8avEJdNhhE+GK
         N55U+a6vpiYl/Xfv48fDeB41HfTYmdY1qC3GKlRFdnJx24Mmp6SivjLZ1aihoxVQLBYr
         Q/mYKlqvE0HJMwtBxOC/O4hS/3g1pQ5SykUY7B9J4Wf6cZ4jK1qfqqhEs/PW/mKIgMfN
         GDfw==
X-Forwarded-Encrypted: i=1; AJvYcCWRoLu8cI7W76LHwl2qZlXqS7LRJ55T9IVuwBcOKbT1yjEK9A8fpm7qfZ553Eh6IboXek38DHPoJeHK0cc2KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0EGAQAsTblIBwbTpTFPKWeNqDoxy57Zf5swXbRMwUAEd/DMm0
	1D9/2T1BonnD/8YPIuiuC/2FKYu3IqsrIPDIRn6f5tRLJiq8Q6IeSPf7/1o8omfoIjwiFEqtbzo
	XFTTYnz9rSL36OuWcOQkSo2bNtM/Lcfw=
X-Gm-Gg: ASbGncsNGN9tWK7vffUtv1XD7RNslwfzQ85UOM6PPb12dvLbgEDgdI14SZ+lRieybS9
	7B8VrXLmsj+IqaLRLOsL/e3L0XF0M1XiH3wOfQoda6ZBvU1GwBEcmuTdUdBYgOnupB6kdUjqxzA
	UdUqhixv+pNMT7jU0+ipuT5By18No8VEKVYgVlAb/aEODrHMyawkrWHpaVbkUC6In9ng3b7ahvE
	Q3q1G/m+QQJAOAEvIhHDHal5mvgizHrZK84IXidortxoe1BhO+qNqI1UsnlWOC3IyJNeFXyOntW
	MuDXCBayb8Y3ekuDVfnCiO7DPg==
X-Google-Smtp-Source: AGHT+IEx9Jtg16MOiUKgSHP2Mj9T4Bnnbx5bfBl8Z4inDLV7AAs8QxDWzsfO8gPHPfRb9ML1vWr5iJ7qtTkWdKyxF2I=
X-Received: by 2002:a17:902:d48f:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27cbb8b9fd0mr40591425ad.0.1758702699320; Wed, 24 Sep 2025
 01:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924052442.9259-1-trev@trevrosa.dev>
In-Reply-To: <20250924052442.9259-1-trev@trevrosa.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Sep 2025 10:31:26 +0200
X-Gm-Features: AS18NWCTs_zcPJ_J2cfkU4kRa2p8_1wc8lYt0yktOgYRZIarX4uHnx7FmI7UNmo
Message-ID: <CANiq72nrn55Zz7wzwVpiNT9=kF1jJXDMEkhOfhAtKjgHMtjr=A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: Trevor Chan <trev@trevrosa.dev>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	aliceryhl@google.com, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 7:24=E2=80=AFAM Trevor Chan <trev@trevrosa.dev> wro=
te:
>
>  rust/kernel/auxiliary.rs        |  4 ++--
>  rust/kernel/block/mq/request.rs |  4 ++--
>  rust/kernel/cred.rs             |  4 ++--
>  rust/kernel/device.rs           |  4 ++--
>  rust/kernel/device/property.rs  |  4 ++--
>  rust/kernel/drm/device.rs       |  4 ++--
>  rust/kernel/drm/gem/mod.rs      |  4 ++--
>  rust/kernel/fs/file.rs          |  8 ++++----
>  rust/kernel/mm.rs               |  8 ++++----
>  rust/kernel/mm/mmput_async.rs   |  4 ++--
>  rust/kernel/opp.rs              |  4 ++--
>  rust/kernel/pci.rs              |  4 ++--
>  rust/kernel/pid_namespace.rs    |  4 ++--
>  rust/kernel/platform.rs         |  4 ++--
>  rust/kernel/task.rs             |  4 ++--

Acked-by's from maintainers appreciated!

> +    /// This function should not be called lightly.

Can we give a reason here, please?

I would also mention "... For this reason, it is an associated
function instead of a method." or similar.

Thanks!

Cheers,
Miguel
