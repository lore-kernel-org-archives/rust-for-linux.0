Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4196F238C0D
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 00:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775262417; cv=pass; b=Ak18ZQh2X3Z1MJQntYNQ+OudnSjy8FOWrbp8GonXktjRNEGObtnbk7TQiAJUs1wOjpKlmmJ5i8KrNTCjW/Nnof+SS17jr0pK8DqrEoDXnPFdlNy+6IGBoLN0u2xdUK8nMkR4PWG2sN/7i79itP7/MVDca523AeZOdK8jp8AUHVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775262417; c=relaxed/simple;
	bh=3bXSFbItG/hwPNPQfdc7ZLi9c0HF+GvjKPvodgxFC4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5Q9YyRqDF8HiRIh97D/kAZCEp+/RHpwGTEdfP3Zwmgq7FBglvGBr7ActaQUPZbD6DVAb0y83Hgvi28bF9KOZaoAgWYG8Gad7Rzw7e7EyHXEESPNNF85FWZelr6aMvXOeBDQ3gJ5nZ1IHUISjPeahrQHYLd1P3+ET+iL2YrXvLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoDJcouN; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoDJcouN"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c645e399ffso80209eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 17:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775262415; cv=none;
        d=google.com; s=arc-20240605;
        b=WQeGDvfUnFsWNHeYKHtun0FDbd50ixn9PJcZ1BO4evqSyv3dymmhIf+5kIlAsG4uwZ
         kRPq6VRVARatUVmDiqqxH7LzyndYQeFQAI2VA5VkR91FuuB38Qi6L/Rx9M4Psb6kSAt0
         C9vMJGbcv2RR9pZ5RERL4ARLDqiQrB9gLeT6gKHtHA+X84szJSiDIV9XIyywYp0p/nSs
         8cJGC+4in8otP6nlZZs/JRPHG2beOoWPqj7Wif5HvpABa48WxewDu8FkKBR6yuPG3TaX
         EOOIM8MudKIW4chr7ZHXBBXjPepzkDF3wcahBqiPv6j6EiWX4Ch0Tbbq8FeLUqy460pp
         ki9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3bXSFbItG/hwPNPQfdc7ZLi9c0HF+GvjKPvodgxFC4U=;
        fh=txtVgMA07R95rFa8O2i0x3RYBgXV64xq8oHfnn827Ts=;
        b=FLl8Hf7dEmY9OrUpioZ9qm0sb0HrE6Ev/vcrUJR9ZVXH6dIYzIPY/q/WhLoAa33dIZ
         ZEC6JYp8dx/K8XxF1QKMoikaEZrJHq3Pb/gvBzg+Kf+f8quFbavmniZ0WCQ0G1nWsywv
         FFJkJ5kJduck6WHNlinhP+1fPM6jJWSC4kGNPeKBZjlF/RB7oLz+8LrBcqRujdGD6WfE
         mvGEKVIRS8AQ7c8X4wJDQAfehgul70sUz7aPS9wyLT0S9UnDXWlWIII0F50nzRCgNvr9
         rjHJvIwAsa7VfNGDNfjze54Qiqu2xH04XBcSCXQMZNi/hCyl248efpWHfwbRFkezG/DF
         Zy4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775262415; x=1775867215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bXSFbItG/hwPNPQfdc7ZLi9c0HF+GvjKPvodgxFC4U=;
        b=QoDJcouNsvPnV6LgWhPFbSe1M5YGyc5Jnh3xSmq7g2mh39+TbYbG3sVUD7hP2j4dr1
         VOCXOvaBNj5W3VXwIgXEthQom/GouddXSTt/teyVUbVMqYiwfszp4CugEIP90LLFAk++
         dWA2+XG4KpmLzCsuQhI068iNkl9dq0DarcYkyKPMaDIByk0Kq6I6hSK7uxnMyOUOjCHS
         GBMyhzcIV4fRg21zGSCaPOq4RXVdsqsh0I54AemWbExfEZvZdmq9detfAyKNbnKSTtH8
         YaSRPwXHzXFskuMj1xE+DbcggPezgoTnlEq6hor//JcDWlnBY+4DftADyNRp6iibjrbr
         4u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775262415; x=1775867215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3bXSFbItG/hwPNPQfdc7ZLi9c0HF+GvjKPvodgxFC4U=;
        b=V2DQ53oFKF5mzc0GcAvaB8PrgWRBsglhsiXDY20Y6K/cclLzV4hzt3cAYVo9n4svz5
         HB1bC0YryYL0jOGVDu7svqEITxuBCFJkqCexOC0ALALPabunLo772+HyojB8H1IVT/SI
         AIO/usDz4JJpDg/Ket8SE/cR/ifwG3KJIknvNwmOuMyCfYU2p2+TnoG7pOH3PzhitSfU
         bn8T8/7wH6GnnZpYkAjMHGTBmTCS8UWO9gwFRxrrm5ocM/LdWn7MRAYtMJF3FSKt+FYU
         FtRgFYbGw3TeHoaHgn47bB4ZYRyDPSJ3wXOeV5uJ0sUexT1hf0/hqyx6XkKTYIm6X99x
         Fg0g==
X-Forwarded-Encrypted: i=1; AJvYcCXkXAAARQd+qqqP2wlb0HjwRqB9j//HnE1NyfR2UnKbGLshUTXJnOgzbOjCdd9N2Ex1q2FtmsJPNNPDTKMKzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUE9g7C+ItbtPbBsEOU8lorEOdxfMhMIsuiEkLSwi/TvMggBn0
	N/MPWcthg0TPx4JtsK25euenqDVb5+ODR5Ngf9e1330uSW+Q8xNB1ymP1clt9Z1bf7KKJAfccge
	ixFowwPd1IHXDTPmQWE4RdVC94Kl2B6k=
X-Gm-Gg: AeBDievT1SZbWM6rLSQVU4xg7oU53uibRL9/46MvD/Kirg0qceMo5rA2m1BN5uGntuB
	TVpd9DpEf7tAyezmD0OZ2FXjTlZR1pmSACFgYPgp8E/Xqrmvc/bseoABik2r+PQnz21LZsEEv7O
	w5BPtr46jsVUBl5g5BKhDq4Gd0++nYSRefiPFZWgF4DHG72D3h7Ki7z1UZBn2HvxtPqW8Q08V8U
	zUtPu2aXfHuq66SFOIX7Clij/c6pVsqcQ8tMUL7M9D0ls1bXFQ6Mp/cZSwy/KjKqh+C5Qy0W71q
	75JgwnqsEy2ivPOIqzdHWuWbkXC48M9QZUCyxT3UDFzu18yzO/bUAMufCMaT3Fd01I2EriWOYwB
	xud1JxVX2a3SYKaLV2oMimpP/751xbWI3nw==
X-Received: by 2002:a05:7301:5793:b0:2c5:704f:7157 with SMTP id
 5a478bee46e88-2cbf94ffb65mr1040337eec.2.1775262415320; Fri, 03 Apr 2026
 17:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404000254.284467-1-jhubbard@nvidia.com>
In-Reply-To: <20260404000254.284467-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 02:26:43 +0200
X-Gm-Features: AQROBzC5ZnF3j_EyL59-LuMONJ8xL2aoijKpd23vGEPfFl-MKB5bKrQgqFO31TM
Message-ID: <CANiq72nZv=yPswYJ4anOxhe2Vt7rjBF-5dxvawsUMWDrq7jMqw@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpu: nova-core: gsp: fix undefined behavior in
 command queue code"
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 2:03=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> This works on LLVM 21 (rustc 1.93.0) but not on
> LLVM 18 (rustc 1.78.0), nor on LLVM 19 (rustc 1.85.0).
>
> The kernel minimum is rustc 1.78.0.

It will be 1.85.0 this cycle, but a related note in case it helps:
`rustc` supports typically an older LLVM major version even if they
provide a newer one.

For instance, Rust 1.85.0 has a minimum LLVM major of 18, but the
upstream binaries come with LLVM 19.1.7.

Cheers,
Miguel
