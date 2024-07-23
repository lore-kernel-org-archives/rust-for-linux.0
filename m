Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7AF153800
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721743645; cv=none; b=WehykXFyE/3g3BrY6c6zxHZTQO3hL3muH8+nY1fw1M8wpSV/sHGHiboACcQqcwmENYcXDb5h2cjikr+fRIyMmxzIrLo2PuV8OIY6nGMUfgIqKrIkwaivbJRLNyDm682lL/0oc6Y/1UeoseVR6UNX9j+T6t7b74EcQSwLYYN88Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721743645; c=relaxed/simple;
	bh=U1CVC7mUAz3TG2ikCTUyrlGxZHhAukkMeoD3pJatLzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ffa+rUGIn7DobqxHsCKkiDzr6Ha7OlHtMwHnpRe+2e5WIipzz6/WxRcjqyVZso1ZxJdQlNM7cue+02jeKzyAPXKLy3T3OuauSJpLCwifrRVP9dyZtY09AOrul1+c1f/s49nr4lV0ggGXWZxpi4S/5fPSJwNVuh1eHQk7c+wdT/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtQ94jGx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtQ94jGx"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a23fbb372dso619523a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721743643; x=1722348443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1CVC7mUAz3TG2ikCTUyrlGxZHhAukkMeoD3pJatLzA=;
        b=YtQ94jGx8AhEuTBmS6JAHfmMbVDiTpTbCMYO182zRVxCwLHZZwsPLNTSo+nypvCwqN
         NBPUXepM308/Y7cpDqqnUsi+cSkvu1AZNty7sTQpvmXfBwQ4cDp8gHW2SfTHrVuLiIAr
         920B+BaIgXfwxsx6OV1NMJU9w3e7Y3/iVTotURhK20rU+MpwgBSqWf2dwSLs42c1X9gH
         kumL6wTQ8KwigTcr5ZK59mW5laDTRI5b6rU4F/XUwgHQzLsyIyBJAPvJV7LmAqpbGs02
         t5QPDWZgRI6u1/2Qbnlw2uNGbML3Lrr/dwZPk6XVaPGwphWiodUdMvmUmRSt16gyjbKt
         Kltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721743643; x=1722348443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1CVC7mUAz3TG2ikCTUyrlGxZHhAukkMeoD3pJatLzA=;
        b=S0B339PNyifSpxVgkHzVgzkS4x5XuNnsu83AzGksxHalS58hSYnqhKY9c8PIEtizEI
         /WmCn/GOptGJdVhVK41XN7f54aTit27t6tnqCd1KbjcexLLsF4e20JuE9sxRcpfOu/rR
         zO7yeTzqj05wa3AEizciUv1NmPjOG+ZdmuPQ/rB+GiHB0JhYIVPhXier4tGZIqNURnpy
         P9IVgMByxlCnaE5iP7f58BuXPNDxuBf8yQaK4CC+JpDgafnfgD3C3Cabr8ZkKqGi6zLj
         78N+xR8TcVfCcZPOcf/2J/K0gZ/Do+3RukcrXR5MXyRTwL+RTTaqWeMx00eZhUF6bgQ9
         9TEw==
X-Forwarded-Encrypted: i=1; AJvYcCUbNkSMbiVG5tyPvSimX0UMzJdQ5D6pZscJvfKu7vclCTJ8z+LbGT+xmVht4v5iQ5o6hhBzsxoNXVB/3ftR9zWRi6XdkfAqnsAfnnkdQRM=
X-Gm-Message-State: AOJu0YyreCiDPv3oiVyEMKJ/5fbLPHMymub8G0krx0lanBj0kohOWlSo
	8Tbq/ALIx3/SfcjwDDkv1NyesOnmfWmtK5BSc9HA2DVUmz86ZJkjRTPo+EKV5V7z1RzZ8UowaZq
	793WPaibjmFS2bwWDzH3qBnRIp74=
X-Google-Smtp-Source: AGHT+IH5opMl155UUaMAQ0CaVo/A+tNxvKZQckY/F4zh7cZWp+IgipiF8y5QI8wViW6aYM9QPgOv/GdndefO+m2mATU=
X-Received: by 2002:a05:6a20:6a2b:b0:1be:c753:dc65 with SMTP id
 adf61e73a8af0-1c44f84ddd3mr3572673637.18.1721743643232; Tue, 23 Jul 2024
 07:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723104052.2924378-1-sarthak.singh99@gmail.com>
In-Reply-To: <20240723104052.2924378-1-sarthak.singh99@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jul 2024 16:07:11 +0200
Message-ID: <CANiq72keKdr7ZhufjdeM3g0tgDo80nk2NNBN5SBSepHry-LaQQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Support latest version of `rust-analyzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Sarthak Singh <ss269@uw.edu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	rust-for-linux@vger.kernel.org, Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sarthak,

Thanks for the patch! A few notes below.

On Tue, Jul 23, 2024 at 12:41=E2=80=AFPM Sarthak Singh
<sarthak.singh99@gmail.com> wrote:
>
> From: Sarthak Singh <ss269@uw.edu>

In case you are wondering, this line is here because you are
submitting the patch from a different email address than this one. It
would be ideal if you can submit from the address that you are
signing-off-by (if you cannot, please send me a dummy private message
from that address).

> Sets the `sysroot` field in rust-project.json which is now needed in
> newer versions of rust-analyzer instead of the `sysroot_src` field.
>
> `sysroot` over `sysroot_src` has been working since rust 1.74.0 (which
> was released on Nov 16, 2023). Since we are going to target rust 1.78.0
> going forward we should set `sysroot` to support all currently used and
> future versions of rust-analyzer.

Hmm... it would be nice to know the root cause, i.e. what changed in
rust-analyzer?

From a quick look, the `sysroot` key has existed in rust-analyzer
since 2022 (189521a4db6e), but undocumented. Then it got documented in
2023 (5da14237eb29). So I am not sure what "`sysroot` over
`sysroot_src`" means (and the current docs are not very clear on what
each does and their intended interactions, e.g. what happens if one
specifies `sysroot_src` but not `sysroot`, or the other way around?
Should `sysroot_src` be relative to `sysroot` like the default?)

Anyway, we are passing the paths for `core` etc. in `crates`, and we
don't have a custom `alloc` anymore, so I wonder if we should either
delete both keys (or however one disables auto-search) or delete the
crates in `crates` and let the sysroot logic find them.

(Cc'ing Lukas since he may able to tell us about the background.)

> Code editors like VS Code try to use the latest version of rust-analyzer
> (which is updated every week) instead of the version of rust-analyzer
> that comes with the rustup toolchain (which is updated every six weeks
> along with the rust version).
>
> Without this change rust-analyzer is breaking for anyone using VS Code.

Just to confirm, does this make it work for distribution and
`rustup`-using installs?

> Signed-off-by: Sarthak Singh <ss269@uw.edu>

Dirk gave a Tested-by tag to v1 -- normally you would pick up those
tags if you submit a new version and you consider them still valid
(before the Signed-off-by). I think you didn't change the contents of
the patch, right?

Cheers,
Miguel
