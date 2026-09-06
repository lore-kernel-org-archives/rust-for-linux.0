Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74F339368
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 00:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788652911; cv=pass; b=YoWkhgm85PePPBGhkIqvbZotZxthVDtws0276iuB/2qFLzatjzcsNZmcSI8ZR2/bzRorsb8Atk93+zCOsDknTfjI9s36ozLn8O0DmNngMByWLUlEcBCQ91vYcm4VIOV1j6ffvpv5ihO6RFQKVw9CT/FQ4l6c05cE/QDn/Qadbgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788652911; c=relaxed/simple;
	bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPqgvuBCvnExlp/L/nOXPC+PjVo3nHazDeHKAZ4FjR/W4SNsoZxlPlNnZtiRNNmRcGPV7MDCPLIiFisn7o6zIJjJv6IyD0dSA3lba1nSHjktgeI0tY6auvQxubjUOIHgt9Pi62jYb3ONx06vey8r6cu7Prmtf+tsMpO1J9Y1+dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aO5g6y+O; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aO5g6y+O"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2566so298702a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 17:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788652909; cv=none;
        d=google.com; s=arc-20260327;
        b=EOX1L0fuWLwUK2LDdJHlWZdJKPOxuhL2GXHiSP+i/Z4YjNyUMkVGBkWMO4mxTlU6eB
         fqvWCwAcjxRgH03OSa2jyvizQ2A3tZQvInZveLfb3C/X8WZzh3h1V1qxQtb7DPwplP38
         57W7+5/aS1x3a158+rUVWi/TigtwQ4bVIR5mFZbZvWHblAESdpqISmlc3ji8O59SXyhZ
         qUx/tcyUNWyZhRaG3aZpbeHlzOjzow+wuy/LGuzs7Rov4kFAQHCLinYXPjhWMrbSwIY/
         3FMemf50JPRAD+Au9onBMyxVH1zRrHGxPJaFjOP4z9Fnc+ZkAn0NyEo/HxzO3sGBzFPG
         eL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        fh=TRY/wW/V8qJ6ZM6gkRuJJnPHbUvOaafw8cRzE7q+hR0=;
        b=darzqE2D72UdKJ++YUosQTZ2yCnHsgbyWjFUYDxtcF3V7JXNBFbpTW8Fw5l/YG25ab
         iLsdiLP+Ia8fH5LXBkF7aey37mODGkU9McJiWOtwxZGfBQXsicgCUAQ5h/BEZdBskDqX
         qzKytQOnowsmnp+IsuvRaqjuz4z+PU9cWhLLv3b4WKKWbEZlDQshvruT7C5jSE1fcntW
         VLIqQ/VGXCNvOqkHbJtedHnT0wZG9aZW0gKpGZ0JbiH+nbyHxR5CqTzxKRSgAEq+Vz7f
         SAverp3v3tlJyh+SthX6kFv3hzPxvGbMQ91d0HQkcJqlRM5d8cIv/lh5MpYIZpB3jLSh
         a26A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788652909; x=1789257709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=aO5g6y+O2I6KB0wKZYdrmuO7xdEIDcvgIg7DX2ejxj49oEMw/7Rj8Hcmej2IBC6qwa
         VDlvFG7+PF0JwCaGXi/6gE6u11/NmiwsPz1xFV/mV0MIwoHXpr+/T3y1REveqBv/xwNf
         ZGJdXaDXucuptYOO3fH3dU/bIRTXoP7munpqn2zy3GGixzYLwBUy4awoOuzaCVamG7VV
         PF6JfRrgpPgWYoC2G7PW/Q55A+nnu3+igXN2xLNh5xI1UIxXfcvv/+XBYEYFa1kve5L6
         xzJsY6/rLXwFAXmfyZHjJv0RPDODxdY/vLHvet86DzCNQuj9RB0guNdNuHNksSNNXrrz
         kkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788652909; x=1789257709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=K/UcSpTIjeVYI4v0N9yS4uFuB4c6AvE761VNfv4OfIMiOhjrfwy0UCBjtbPllnX5jv
         C22nGEPQFC5NSt3Ui6TxeLT8V5OeuwoFMgHBUTeH/o34ahpPBnoikY8GxXiAP0qlLEPG
         x1+VGafd+LG4f7IETkJTfU2Xd8fMXCZm6L7/MMzDsjSgniHK8anhm96Ddx9z5D7xuYv5
         I1E/IVWOa7a+lP93h7YkYKcV0Cusw7phXeLxdztvZ755uTUFj0sv3zOAIlcHQ5/zF8A5
         W2U6sBHN59VRqnDOnxQG1mJKIhD7JGV0PY0aXa0vQI95GjAepm6ZsIIPz5OoMSpjuVCY
         gTtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzk7mIhqxxeqB0K+80bE6jY+aUHQQjFxrnIfna3G+SUnlBLU5cWKw26Tn3J7f12qOjoDhSBG/jvQhavNxGFg==@vger.kernel.org
X-Gm-Message-State: AFuF++kF0XrQyhxxyAD89EQ44+JSl712vFc+BAFBUOdCvO6xsbFmgAlO
	pk/wXSCiMLnY4MAFK2k+vcqTBpmp4mRyte4wUamD9vwg00jKK7WSfO5qEEErFR0f2XlVFaGpa5v
	F6R2bPc9tqvwof2eKNZnrIRXlDyuCTmY=
X-Gm-Gg: AYBFou1U4Dztix5FCHCsUmLVmg3jkcobwhr9QfFA+sJhO8fK5IRdAiV+i3bHg2rxmj4
	T2tsYf2rBobTKFJnVZkc3vjniQG1X5mV+BpXe1hSFMLZHpvGW7/ffGOXEiubcHsXENrrqoZwLpY
	m7t0lZrtl9KdQ1mpChooFsEzPsQM1eO7D+AIUk00WGKJQbbp7cKSNgrtmrW8xkrW9zyRFaAreWu
	Rvt8/btX35KTSFnCgeQYbeP4H9cg8pjix4BJOGUC6mKpv9FX7xfaI7Cf/FZmqlbCsqNS2OpzZRj
	6vbSgwRi9EeLjIluKsW25C5/I567V++jfJaRcDSUxHmOSCEiaLnxyiXmYr4IZcDtGIy7FIDMKjX
	95W90xc10gIQe4cQBajKtXNYdIsB9T2YBBdsSZnvFgphXDtjieucNT1/fcB3+
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr7786501a91.6.1788652904655; Sat, 05 Sep 2026
 17:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260901-typed_register-v4-3-5552b1d59525@garyguo.net> <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
 <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
In-Reply-To: <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 02:01:31 +0200
X-Gm-Features: AcwNN1XKuKFBV9qEAm_z4sB5Fo2qHcAE7av8dqRfbpy9oR-6X3rQ---1a2fINJY
Message-ID: <CANiq72n2B=7TXtmtQXEC-VZQNZ6NQTkPsxnnNCiWWYb=U4TyZQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:32=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure why we'd want a self link.

It is to follow the guideline about using intra-doc links on things
that can be, which prevents mistakes and improves consistency, and in
this case, for huge traits, it may help readers of the trait
implementations section a bit.

Cheers,
Miguel
