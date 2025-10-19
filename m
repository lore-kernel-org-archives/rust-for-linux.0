Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4688D183CC3
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909146; cv=none; b=bd7iu5GNzD2qwIAFN6OXNpJOY06GynYNAwV3Fu3J8FOZrpTLuOGh8HLiiG6vBAaP/EV/RV/y8MC8G2wEUi8mrrX+LGUJTyB+l6jOwLtufH5LtklrRgZi7sVW1c6tcSK3o/tBrHJM7b4rymJ4FIn3jM2R63PETHKcx6oUyDNZyNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909146; c=relaxed/simple;
	bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+alj/gypfH46D4JaQ5JSHcZ0BYWFFo6H/zuN5XkExLR8GopJyAK1ab49XziZYpJs3Gis26fQ4e2ihT6KaL8bj412xSkShAOHwFzLZ2OH0x2HpcduNL1wbXwoyFW+oY8X/WpwvKMmC6SYQm/dKvSWk++l1lw4rS4tkqmNhdTicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFVKCsLj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFVKCsLj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-280fc0e9f50so7005395ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909143; x=1761513943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
        b=iFVKCsLjZ9ItLLugnc3NOyWgR6LdhMQj/lhUoAGx54ScPjkNeKQ2UAHsHjOHAamQ2/
         xDrS4i3MmZ7dAf4jogvQ02XjPPAkf7FBRZUEFrnlDrNc1OceGpdauhfN3WWMOffyFOsn
         cW1K4sWbbT3wXOvP2fMOi73RSK4EW28qGP3jA4JYKg2Iaa3pJSk4L/CktLp3YJW7Gf5G
         fiorgLY3lsDB+31e2mVDFbj582klczwsIdfO0ZH7AD/vCsTqeOB2KpwBHq+RgR1GDo6z
         ya5WTV98cFuVNieBV2HztSxbHvIKViXB7T0g3CN1L9Hn9vf3NGmZUNBGqagWjha9IEZc
         UrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909143; x=1761513943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
        b=UDqiZfxkpx0OQroSGTj2tny2RqHt29iesgXNTcooKDqFgpCBac3O1z5T2rapPnY7xc
         xTjJ1wi9bscFZY4PYEHOMpygRQMLQz1i021SRifJnO01ORCD/S4Vj/PYfZLcjB/SMANv
         HBLENePvZjvLfVFapIPl7vkCJJMPqu5YDJu9EJH0llxD5dZ1oN/pXk6sGY7okxFL/lqp
         Jyp88kq2yvtgkbTLc+hOnFGnOS3DIdgWELa9LK+LbWekJtmhp35+QpWdxbEd2LtxJ5Ii
         IJ3yqktsENK6Cid9UIPc0HnEK0xvDdXvBJbe4x3xhDCDr51ctP9m0XhbC6baqlzKPCQq
         wINQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKgaLrzeI+lExyGzeedwBeX1UTzCyHIY2QoUgPWDPHlMrPrhN+tubscRgNlSjiT5JyP+lu4QVprFf5bFU+Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu6ePdEGN0jQ5710cO5ZvkglSZRscYE1RhYrGWyDwwrT9O3ECn
	2NBvwYmylqHOLIBX0qNEwulF7IPpj59IvY7BM8NbXPaX6uyYubaGDl6DWFlvqhy46gi79OeD6Mv
	DptpxE0xmwDmuItbfBJctBF/YlMs67Ng=
X-Gm-Gg: ASbGncvgGaOoxKFtBU1F6eZprNYbSi//bw1/Wx8lPkPwETuCke+JiH3/e6t6DgLCAfK
	sBLagBEtQluXL5VuOh7+CEz7/SiZAiRf+PlIygX7UaKNeg7LRt20Y2oHpUMOf6LkSTVooA9MRuH
	ge1IuHki8k3PmqjxgPijd7dq4LW3tZtsTFNF8Rvi9u52eOMWlXLgZtHwSvbzyJigUvlgg5Ni4F8
	F0C5gBK17D0pWeKavAM+Z0ims+vQ7Yzh140KMk04yD4oYGwgmbOv0KFbPuphbVVaQ7QFo7dwUQU
	vokT0lDRmK/weIAP4eFaNfxke01ykW100XARIAtODYsCaGIZvQyJ/1LAlX0KzRDOz13S7px4C+E
	+b7sDOuK4g3LxhA==
X-Google-Smtp-Source: AGHT+IG+Xq8GXKfGoMwbFFQSVjc1IKmL7pMM4P5v7DRrKR2eAYMxLjwbrDpo8D26g74EqZuNpH1jVIwhs5ozgrDthtg=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr70983905ad.11.1760909143546; Sun, 19 Oct 2025
 14:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:28 +0200
X-Gm-Features: AS18NWD0bEVrj3eqcMBbtrKdDrdonGG9WGD9YJjG46fNVzfrXtIBr4GqiIVIqEs
Message-ID: <CANiq72=c3Zs+mecvDVJ=cyeinzezhGz7yqC9r6FG=Q4HAdb98Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Andreas et al.: I will apply this since it would be nice to try to get
the flag day patch in this series finally done -- please shout if you
have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
