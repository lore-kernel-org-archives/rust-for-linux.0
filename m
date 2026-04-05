Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A42FF66B
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417531; cv=pass; b=NIRD4cpmXkSN7+sy6wGrzgWmubJ8JECYCI2ZEcX0BJ/UuNEVw1Mccj95HkTLqo5cvoR3SAGM4U7I6CA82cK91rg05NhfG6KvqdvZNcBK1AjHhZ7cxT+m0hgKnhBMarz3Rjfryki763aSMf6QNsSreCobKUDugG3wt4c1n0G4EC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417531; c=relaxed/simple;
	bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2yEIn2UuAwzQcyVH9GhCTA98KDebhtHDeuK/zUo66BOtg6lMpihcIBr8gZbsTTNv3u1ekAOmHVzhG0L/RlLTkgYz4DybqNq5YxMBfvWb8u3+v4LBJiO0v8XXx/Y4Gq7g5CfROYCawiXqK3sbxVQhAPlJuFzTOPQGA19du/O3SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM4E3kMD; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM4E3kMD"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so144773eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=k1CcMUNuWStb5GUAfbpkK/APfZY/fan2/wPrOt1/AchcmvhU44ykLr4IxP+XZhLMcO
         KBkWmem4oihe2uojtAQ+sAMb8P3biw3KUnvkdKhRr33rF4ZXOGlNTfzuIGhyF1TjTKHv
         R9+2TGOoequDPMYu7obZeIVidQXKoD9AHOXVstQBaR3n6wFr0NNSo1bB49wZlmj9Da17
         sFCN1QQaPQ1I+D9BzmU1VfPYWEca2WN84qhw03Iwr29EuTDlNoWsJK9UYkL1N8RxY9sS
         F4f2rnHzhcj34TMSYjo0Y4+pssN12gbe6WTJ/wqluI4OlRXeJJ22Kgil+tQK6XWMMic5
         PfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=8Q41Ium20eoiPGueKOrIE1bvQcMQwdbvRTdJY7jojsE=;
        b=i1yVVd3VF3R20ZGjS+YlXRFO8T9gNHURGWu3ZAUirH5SAzDjbEbCJDBbFQjv7LpNoM
         bTZxHLA4+DF4AJ5Us+RrrV8ZiU+lyFzgCZzfT0aPf/V3WiZRglAneckCMv2nbV/oamnH
         913F1WAKe6LnnfuJ3+RFxCqI9jOORF4IpJ4rlRBTw+go/P3mUSyyq2+1saQT9yyoTdjc
         ny2m6v0KTxPqXiQGJghxrSQr987Akk5gkuBGDkeyMcnwGJGV+XJVxi51XJznzkspoVCS
         NADARwnpHE6BWnIgHTQ+/nhFcOhpAG6Vr13mZAe0/8RG4byozoeNVqHRnYuzZMa1oQyZ
         JDRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=jM4E3kMDqms8VNJHv8kbVSfyTEZTTKjtGooGApmTiF9/nl06mKbaW4l5qIrYswnwpT
         Kh+4uqPBEQCls44ciwK6q97c6RKkdhRDyH18GzzB3vo2S/H+Keo9XO7noiMkDp0chNkY
         oVvPX4x6uk8b0yagBZvRgeuVx38qA85crjHfPf+OpMXap5ch23Cu2O9SIacAvShK4RSI
         v/5nvGmWcIZ9XLN9XSXX/rtp3Z/xvyPg/yADjrkoUeFg7nDBaSirxtRcasaRJz6mxvND
         Zu5NAABnzR6ScrYjUxhifSEHfR1D8AOj53N9+osYsUGSSV8LyJ8h58n2OY765I7uh+ho
         g+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=nFLXZTQ3G1z9nCt/b1tJololx3ugretY3WTSlEpOZo/vi7XpFO0pklb/2Umhf1dZzu
         Bg9ZcIaGrAaSqLbfbzu3TUK810BdcHvu3XrhSWJJtcUo/hkggvAOziRS0PtXDfnXPlKG
         z6YrIzGvYLCS0G/LSQ/LTd+/9hIffIL/359ZtA4Emw0DJgCh6WFGDwXJB8slGbNwAhoV
         D1+CfKRwcoehZCDmnC+lAfXwh6XvwRwU6tIIY91SzsjGBwX5L+vxnUdku7A5x23/190f
         vBH0BgascpeesLqX01hdA7ee5RyDfkkbi8YdbpM+AJe69YgBSlaWi6Wo5SD6JeRKgHOM
         lQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj46Naxyf5q6PCj9YI9rk3D174sx4YDtzwbiCjZtvZKDRkJ7vLdid7KNoY3oB/bvJ0r2jNFwh3XY5sKNCFfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUiGePI9F7b7uCGuvRYi5RAhiWrP3vEcnFOdeL877AhA9BoSsP
	3tEiZ+GbLwWgZ+iWgJm2tFv5oCPKqVGHCDC6diSpznSQ1gi7xgiM+4fDCak6YAjlaEdaK8KmOrI
	PBjCgpNUco64Q70ZVP6GnRs0iaUKdrM0=
X-Gm-Gg: AeBDieub1HRYRQtlkyyI54SaStEy5AjBSwEntHO1PqM2HWYurKVUgSngOANgG3jRyn0
	neyAoyLJ9jAZTz/8z/Apg7vGTZ5uKwxuC0eEJcYy+bktGeUYFbcHz03HNa/MZ9/p662/Q4V7+ue
	V0H4cQKEntdxfVv7hEI48owElqzCQrnpPZqR6lVOMUkZKZEVx9XmeAFhLNCLBWvmqCzt/4IrjUU
	Esd7upWVBsobKstwH/ATJewTDYE85rRr3hIG25iE0eLHAOZyXeTXxZHENOnyKZfqybM5aZaX+F1
	jIy3CHQGAWStJ+ZK/6qlEMJdjitIFZwSKUNIw+gGuck+5P1YvsD57AbP0ciqKQDGKaaZgh0PBm1
	SZY8NG2fiWv2SYW64l6iD7Is=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> How about ordering this, the previous patch, and the next patch ahead of
> the version bump to avoid the need to mention it here?

That is reasonable, yeah.

Cheers,
Miguel
