Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9231E845
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Sep 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617550; cv=pass; b=XCjQq2MX4EmbxvbSt/ehbondOSgrxIGbmPef+FnRmJaP2A4OgGKLAHCq8WcWmXdwhSmFzBWk30NBba9Wq8lMX+EYioQ4o4SXxhiYic8ihdhnkJKiyohRzAbLVxMopL/9hMTh/9mYRLFrzjvUQxYH8J1XH6DzFyvHAGb3lxkFR90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617550; c=relaxed/simple;
	bh=EFnYeSVdKVXMd6TO/Y43d+8KL3G7f3KpGkTiTDfCLDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsOe3DUXGoXk8YKP1QIi1/61ln4MIdTAN/ngslyAXZFIRIXPxhk425g8t/nGQpvcH6VCpiomVsqGCuYfAOSfo/Kc1bF3ZtA55913IxQXfD48tJ0ovYNfoMrYfVzRLDxWU3xxnOOc9Mmku997TQT+yM7EhJAVs6kWLNnozSPdzJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5Vxm4Ik; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5Vxm4Ik"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso80704a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 07:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788617548; cv=none;
        d=google.com; s=arc-20260327;
        b=o5Xce5N8eLh4ekGk2lMFZjJDYfiCANMwtXPJ3VsWjsQqvW182dqt8MIFpis2fZw6qt
         4B9O3VWkTu0//KHPSZZcFvgEvLtaBW2o7KhF7i/dN+8F982u2NSNxZ0iCHYoOZUsdKwP
         HuExQXZDw84oxAlbp0Y6TOwET8YGBqFE6a81oLCt0e9eKr5eIIPHNeJxAqxy9HBCBYJq
         8PnqNtAWkbR6Tz4Hil7Ti9poX++z5Nvx1G7NNqcKsEYABLhzxTPAIM3Rr0j4Tilz5ORb
         wAOMFU1ogvVvQOSeFhn4rgbK9uDnN81lEX5U84ge686geB44lLHwe4PSrGpc7NmUpicA
         dPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgPxNoeOKOJ/enPgDZxD2BJ0wdJ0wbTm11Fisl0xW2E=;
        fh=M+Z/GLKGmbRcodlsUU8X3H2EW9elxyBM+bKaV/nvbnA=;
        b=m7cIkTX0ptYBF/nllqurfGuwNbiGLsK5KKJEgLsiDabNF0OTgADxX2PW2ysAfk7ib3
         oJ6D76KRC4xwLSALd8fh0J+Lvb4nmLDwkyydSSKKzIuh2QBoVbuA4JX+jF7EN2SyA4xz
         JprRGXFHfpboYE7SHqBHA4KJ/PspP0k1o0wWbmSwCcMZZEwhAWH6DXvXgZEbTEVh3cKw
         mZwb3j7OAXbQBlwG1ecUqJRe73xWLVYJ+8rTeBXAnGUtkj5qJZwpa0QvAVKw9wIaamPE
         q5sKVP/pemB2oJ+RCks4+iPfXkVDT/s7zQdGqCTiywZwF0pjtK90xYG88Rj0RhWbXKZm
         qYqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617548; x=1789222348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgPxNoeOKOJ/enPgDZxD2BJ0wdJ0wbTm11Fisl0xW2E=;
        b=l5Vxm4IkO9uXIUrqAJnvXIdiw7nos12djVac3GoFNTs6SGkgygGMA6ECPSBFhSDh8k
         dkODv3NwVZJQe4y18YVTGvZW+oQxUvx/Ds++imzKLo7Ki78GNPxGWXnR2DH56QMjtJb1
         O1HEXCaJOhGI19ooUYCU/jwbCWUreVO8SJRr114GijrJXXRmOmri1INwcUC1YQAmYy//
         Qdj0KgKhPpQVTnBUDU3f8B4ks5EPTH0j6/fqNmtSrZwznM2dM6/kdPTZdla6U8Fm4aL4
         kLgGf3rQXSXXIN15t7gOjJz/KbipH5pbQQ8BG30fZcUc+6CVj4qSw8aLcLGIoCdo4wb2
         ca9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617548; x=1789222348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgPxNoeOKOJ/enPgDZxD2BJ0wdJ0wbTm11Fisl0xW2E=;
        b=TnEKre5IiswxNlCo1V+1uGQiXIZbAe42Ap2G5mcaYH6lQlK6BFlNbTs2vApc+U6bpW
         il0Q+vOrZTxgtX2mIo37yIl0CB+DJjcuSEN4DanxB1wE7O2IW90z4qK+ovCDex8iyd8W
         gOC/+bzL+MToOxdCFq7DbZ2BPeg7ZNoHGmT9GW0WAwteThh9aZNuE2E8Fju9QSn3cNvZ
         N9bIquos7FKln0WeOn7fsK9Lq56u0KYGREFqkEAPEc7W5ZGW48IZnPEPLA6m4NiQ8/2V
         a4ce1NsFGTU9dW1WWG4QbBzN73ZGQZmSf9S6p8fLuKArEXwSENGKVr7FkNama61AHfjz
         rX6A==
X-Forwarded-Encrypted: i=1; AKwUvBwvSNDzpZuiMtsroQIMqW8y97xmWjIqLTGpGdiIUZP5/fofVkDd7OXK6yW+ocxEWUr4yAx9gwQNtuvUU/Zs2g==@vger.kernel.org
X-Gm-Message-State: AFuF++lKF07XZnhO/02P485RTkKaJxD01UrC68v4yOTrDBGncq4J0Clm
	AsPvmX8rRjapWTM0V6ntvZ2LwA8hV51m27ObQWNtUe+M5IEGBnR0qYkzi97FWKGq92EWbG859YP
	3vvFZQTBakyc6vjumsFTHU5n876VuBcY=
X-Gm-Gg: AYBFou0uQi7LJ7BdwEH4jYkj0XeaG0Q+bg66CS7ZB8SuDaNEVplahZVxv1fFW+f1TLK
	syBRjPv/hvLq3gqyeWcmfRoVQVi8tRgJB6XXR1H1c6V+HOftUtjyN+TwQsEK2Xe5toA4p6xnNIj
	TBo60Wtr8Hj34WGm4VLl867MOrrrxY+PpGeu2ZVgImesQwaFqcfZguRdJYaGlXF/AVDW4Pa4o4E
	s6co3+YFeVOeXaGNjEWTlxerL6A6tdS9L2xx5KrMx8NqPpt4SCwJuqPjLiMlo374iw+vhTbvRaF
	eb+outRQJ0KzQ4Lg6TBprje+rs6nk25jgmhB5ZjEtCQA7XsRYcgnSJzpk1Q1NkSXVZMgZma9iPQ
	UtwlYx57J1qy/FAA0kk8ZyrLACN17YZEMxIfj0o2H+Wl/5Q3WpUVtibvSb2k+
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39b3d78fb3bmr5583794a91.3.1788617548109; Sat, 05 Sep 2026
 07:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-feature-rust-num-seal-integer-v1-1-83096115ad64@younes.io>
In-Reply-To: <20260905-feature-rust-num-seal-integer-v1-1-83096115ad64@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 16:12:13 +0200
X-Gm-Features: AcwNN1VugqNSp_8Ein0XE1Abe5QXhVthwvEHazcMbqXG-h6bVCGPCS19YnQwxxw
Message-ID: <CANiq72mMtbyBE9Lb0PUT-mj5pzOzauND8_j0Hc0mOGuMnHWB9Q@mail.gmail.com>
Subject: Re: [PATCH] rust: num: seal Integer
To: git@younes.io
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 4:17=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Integer is currently safe and externally implementable, so an
> implementation can violate those assumptions and make safe Bounded
> operations reach undefined behavior.

Ideally, we would give a brief indication of how that can happen (like
saying "e.g. by writing ...") or sometimes even with an example if it
is short enough :)

> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mOfR33s4y+Ueivd5NrC=
5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com/

Reported-by: usually precedes the Closes tag, e.g.

  Reported-by: Miguel Ojeda <ojeda@kernel.org>
  Closes: https://lore.kernel.org/rust-for-linux/CANiq72mOfR33s4y+Ueivd5NrC=
5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com/

(But it is fine, i.e. no need to send a new version just for that)

Thanks for doing this! If Alexandre is happy with it, I will take it.

Cheers,
Miguel
