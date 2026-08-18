Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25DF3EB7E9
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051420; cv=pass; b=L9WgEMjgR92+SYc2uKBuQalVQo190w0AY7VylcP4IUf8nSN89Vqu841O0H5LMJM31/fuVu5WrLaN4ubMhyKW8qlFE8sHXcb1N1tnJFafP4zH3D3ZHMeF96RQVNQR230gfsQm8lU9OklZZ3jfABwLxbCtuoAk+nLIWGPhMIxyxaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051420; c=relaxed/simple;
	bh=iKNxGWQrnCqgI0vSxRKMoQVN8/Ne2cBzOcV1g9q5VyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjLuW3WQJXA3K5L/FcfvMyeHLS+uAkivH0N/Jdf0wJH19UuX/zKaKA1PBIBJsNSQtUNjTc+iy0H/uwtFMaFtKU2YSKH268HckyuOu5Vn3WysH3c42ffMvj04Qfs0Dn+sZslhTTe6h9AAcy81is7Ef/Rf1w4xzGsWH1yK3oa+y9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncjazPNR; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncjazPNR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d30c22b1eeso7552065ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 04:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787051418; cv=none;
        d=google.com; s=arc-20260327;
        b=BLXt9u3rU9T9q1AQzE7zncK/vNAOLWJhtleSdTcEWvGDfMBM2EYjVSO1ohl9CPHFOu
         sM6Id0GO3ZMnk4STfG+2PLhQnMOlqG5yLTGHzg1u2vrCesxmV4nf2sIu67/Soi6Y5Uht
         62uunqcd44qBrcKFEGEcqRTcYokJwsANwS/Chp6ApvmNVAJVPDU1kUPCbSErTb7nd6Dj
         6ZCwqLRGniVkzW/yNpO1QrODXd3S/4EPYFTZiZsG1QAtq94GME5P/Iej79rYFe1d2TCy
         mI4sUnxIaHyGvmxqbTOhXGKzj6rCRo7a81UfGSyUC12cYe9nOWJoxMGr7gB2X/zx0iHM
         +tyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h9+VpGjv+XOqI0bisDlvMipONRrQ9rCvicF4i6R/n6Y=;
        fh=bF0xxi9D9MIa/5fvtXCjAdfXSfFhyHnI0ZJy52sbOok=;
        b=gFB256BE7QCsaoGE2hpXAeJgS5AB/uijdMDUKMlMp+jHEiNejavD8mgvHFbG0VBCix
         G64tYwcp3V/iknaj47rgnNPOheavPYrZ/zZpDfnCZvq8rCgCOKJj6lEsimeXXpLDvsOv
         oIzD99czdomsPH9QoUKYJzy8BVyEbXwl2e/FNZl1HPsFr6NnKfe+pMEwmgK7YjzVfiuS
         N1GmhEpU7E1u3woZpN4UsbnF9spn+pz62CX3LcYFvra9QaYo1so8xv6Rgxp0eiDyKf/k
         KC3nS9ESFWRZXCCmUGdAx6Q+W5zdi9AoqkyaH6dYa1ESDo7TrnIjUfjRNqw+PZykmfwo
         Y2Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787051418; x=1787656218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h9+VpGjv+XOqI0bisDlvMipONRrQ9rCvicF4i6R/n6Y=;
        b=ncjazPNRudIUF7l45iXsDdD9B86XLrzEMzAq9gZO15cJP1153KwKXCnV/H8UDVPW5x
         EKfAFbI7afxemPQwVdH0GqOT1Ml9edEHti1nzGHNGr8XUZ4xis6Y8chfOF5hzKu/zVGO
         +GcA/UFLzwgk+XLiA2g/SGAGTGq+WXVt8olvPV3kjqLjd1BqyJxsCASXd9qg96s8kAmm
         ibvGk8n++rGlehBXL3JD80+mmH9VAF9v+hlPxeiNzTUZmfmNEU/Iit1cTizYOEtB4kfL
         kM/l8PiSKXUL+tJ++ssv/i54e1Zk/wNTxtFO6cz1ElDOfhMsve6DTxDQaQFhfKqTLeT1
         4Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051418; x=1787656218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9+VpGjv+XOqI0bisDlvMipONRrQ9rCvicF4i6R/n6Y=;
        b=KNj+jl9e870W+qnx2Ov9xSRGhfLtlAM0I09sg1l1rJD3VXV48qHQj7YKfcRVxyP9H+
         0ySAq3f5yGMOMdQoJDPBqwk0sQL4twXLmcQF9Yh+R/B8xy3zwtCr/KFKSORsHHTFGDUi
         wERgQg82OfZog0hLO6C2C0apMAqeIMTuRr1GSmNaO6oeeTPWveve3eMjCeygEqb7fCLK
         MmF6jSRJQRpKN4WMG478gNK/P+9+kvV8psAt1OYU2wK7tJ7Cmv31wxTK+AesgrGtu3ti
         fBd4PT2+5RhZzcq4apRBQ2EdBUTruupB68cDOnw3g4B5+q+VdNdVCkVmqd5AR0RSE9RT
         Cfzg==
X-Forwarded-Encrypted: i=1; AHgh+Rq76HUeDtUqu5UmuhuVgEki5gzh0OxkkAUET+7lmc8O3qBQNmEVxWZdniiQSESiYDiSXLvEyF9Tq7tbwWeJVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmA+YL2xax2Bt1EIOvoL98XAvUjvrtqd7+C13C8O7nl0r4i3F
	v/U//kOgR4Syy7SOTLNOj32YJWGm2Byg3ZVxAxV4xVYtox00p7SXOw51pgedWLJz0ijPlInlocv
	rJy2yKhBSSb0BsDVypPofn2wzzzgS4NQ=
X-Gm-Gg: AR+sD13ibt/n3kNRrN00SVe1hGgIJDlUO91c/CY6wdMsmzgP/g+DfuxVmV+kCFFTmkA
	LGCRaQnPqTGQhROGVhhgFD8gnIrmdTE/0FdMBl26T66TtTftNQ6oUK+ywJkOExOIHhqJVT1K0sc
	qVrSZ7c4y6hK4WG3WEooM0VG+z3lvmKZ8zM/so31gJPeS6hBc+vBQzIGs8pDKurwjcY2MVyg+Z6
	9OpD7olXPniXMrxK8VFmvik4k7SCtJN8NjCwoWV4ycNmplL9YtiGQhQoCRcA2KlQTlCqJatMYm+
	QFHoJiYgsjo8jnqRvnZ9mjbUtT+W6k1qFyJxf7wTI560Ikt/krXV2vJcXp8M3MWClMGH+mlDJ0m
	LL+w85YEmL6PuJEcuxBWloH85RRxfc13Zj6/SZyut5tRItwzwrYjm56CFFdxI4aO/cg==
X-Received: by 2002:a17:903:3847:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d3b0c9938cmr283213365ad.3.1787051418144; Tue, 18 Aug 2026
 04:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816191926.230123-1-ojeda@kernel.org>
In-Reply-To: <20260816191926.230123-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 13:10:04 +0200
X-Gm-Features: AcwNN1XKCkaQMRiU5hwllUOR_LVllB74ZN_X63i60vbtLI-IWrV8JinhjWVLY0w
Message-ID: <CANiq72=XMeKaO09PhYkwHwxXO6uv0dVpcxi3tAOLzrmnvA=EgA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for v7.3
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 9:20=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> There will be the following semantic conflicts with other trees --
> linux-next should generally have the right resolutions:

Another one that joined linux-next -- I sent the resolution at:

  - fwctl: https://lore.kernel.org/linux-next/20260818105350.361218-1-ojeda=
@kernel.org/

Essentially another one-liner, equivalent to one of the others.

If more get added to -next, I guess it could have been better to wait
a cycle to disable the method to make it easier for Mark and you.

Cheers,
Miguel
