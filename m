Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B25401486
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540178; cv=pass; b=Bd/StDVtfFKFC98MyBiNI/3sPV54UWCZBrn97l+wVpbnLZCUoKIXXvHapYm5CNmdsRhRvqtt+VUpUNj7jFuF8H4ivhYjA5qC9TYJ1JQB8zUeLKoLpTDPN8xcknEcSBqQGR7pwZ1fOcjv5LDxZhLBwgMbgm1gyWdV+36HNUx864s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540178; c=relaxed/simple;
	bh=kLLLcSHafKj5Oa2SaE8DTaaQDCqWKIlPRDWWRTz7GAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzSiCSFlXopIddk734DvgsDOMaeuRwPtqm7MpKA7LqbS8WFAlY7kUxli512ZHCt0p/eW/F6/DuY5xi4L28iAFeBojcpeJu/4DBVm0rSUX9an8RvlyZDA3A2xgUsZJZaUaY2R1tWzlbeKOU9vCtJYqkHnBAHFnmZoExzngy4oo6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oXnJLmOu; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oXnJLmOu"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b949bf4easo656603f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774540176; cv=none;
        d=google.com; s=arc-20240605;
        b=c4hBPoC5hBFeaqYsoYqEIc2hDRy+3QQ02CwxsWUAuJ0XqYhk2G1i2bHQAbKuPT+kSM
         1jE3vIlEUYBTFS1HSOGoGHPmUHazaDA06kyfHQioxvEVbkVWKbXYCVM/u6hx3z2zdBb3
         81Yw0nMu0S3Zxn5GBwnWH9AmCfuxUTIEm7vIEH/KpPavVCNXfXwxBq4tBzZu02SIIaA8
         IqYAE31+CwDewPiUMkvObP7GscdA3wyIP9fH5FnjpO3H2zEqUQ3dIoxaruvqSFjcnUsf
         5Am65tWpC1E0kRvbPcjZjydhDIOVOkKFjQIG8CCpJwn9Df30+P1F/0af6eQkFxiFIxCo
         XtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqxiEEmSPUC+jwOexatjBHdDcPhEBeaDQL5wAWmGtEM=;
        fh=nh2+Vrt0IrHaLi0rxxpB6boJVQaWBaUOzzo45TwW1is=;
        b=JQm4aeRwNZR1zzTZZoKxen2W9cjEvjMqPhHQXEHUazUMUohoGQs2d4+68oMAhM7WnD
         LITvjnS3GO/pds2GkPh5IJJPZBZFfJFJfvwDvM4+OwvaMaXn7cYeutdNMyUyuf/Oz0tj
         43H3Jgx0KJFqllRKZTqmOfZlBgpRlnPbXg+b+Wy2yia4pAUFaoNKrx0I04sihvD89kRh
         rUTUZCpQf4vNlUzt4Gr0Qr/DsRGeHE3RNsEZuqTNdXBhKW6eD1M1RHzaU1VCHMwkOlMP
         X88e0vJTfCwFb55bVEQ8HFAx+9l4PpGGeC+YWQk8ogaOz2alkgq7l4p5vEDNLC6UD5re
         EXwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774540176; x=1775144976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqxiEEmSPUC+jwOexatjBHdDcPhEBeaDQL5wAWmGtEM=;
        b=oXnJLmOuj6CdwdEyYism6KxGGp2xxdy+39N+lAWnXQljtdpU2kV3KTyC2fqHFTbCm3
         a0yzZmEbrHHHgsKanLrlOIVOeBcN4tHAWraYHlHxqKboLlf5+KOWYngH//4oNBn1XKyb
         cZmYs+YH6ajwuli3FPCZcS6JHHrLP899h+S6I1bEA9CUWrlULOVhyiQJTu/CPrffoQob
         QlOqwOjTpGbBzu5z2/zqidqdz7hamS9TK5mf6IPuIK2MjacjINXSb0+fOcjOJEmW3Qkc
         fcZcU4q9dhGi9ftCfzeMEuS2a0IcFyVP8EVXNALK1ZFRzSDSdQX8aduhoMbNtVr+GblP
         aPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540176; x=1775144976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqxiEEmSPUC+jwOexatjBHdDcPhEBeaDQL5wAWmGtEM=;
        b=T2i7LC7LZh3Z2UIgDd4o8XkaevhpTng/yUqQbFqnw0R+m/cJudUK1Ww9jNWKNuvhX/
         gcA4ONFHCTlN63tdxnlp4W8rosP9aVRWG87+vrvjKxVmtBvsdmGnP4u8FNi9LosAMCsW
         VGXicKYyePH6NuQDSFe9Q51jUa/sXcpYRx9lFoUoAO1xiq1Fo1tpnZBlHUbJs3RKdBBb
         ggXfwBF1rTHEOgMLrT9DMLnb+u3pVot+pmHrVBm7+pMohh11BUjEgJyrTLdJ/HrpVMLM
         jQtsgLN44hOoSbvvGd38sr2vsJZHWALWPiQS5fzO/AwU7eCQ/kAI3VbvRkcIx/PPtyGF
         Hnkg==
X-Forwarded-Encrypted: i=1; AJvYcCX+qudAbT8TVfjp/nyL02hPhQwE0MD845ZUXAD24znBILu+Evh4eF+gMg57xxPsUpa5nQjKhBSDkUvk4/+QoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLv7x+Ca2bxxmEpksU8zP5obhWoNd08G1CeLdsXXK2yG7MPpE1
	6We8b8eP6fDiFyjvixVae5afLodqd99e9oizvwptpWV3XT53ZIp7cGO2E1Sif9hfbME6PRwZqjK
	Uu4gkcq0VQvG97XF2BeUljNAhkmRyUVkeShJ5Pr5R
X-Gm-Gg: ATEYQzz1qGLou5MlTVDexB/vAAHOyHpF6ntzdOEFRT7DTu6uAtLKTOHwndDsHPgG48H
	gjUHc2G5UK03+0t7cCPhNgZC53cTUhGw6oGlkne4MkjTeOEap5MSfO2MudmdHOkY6AQ2/f6cWNA
	/rw49195dksCDJDEkx8EDemJPcFxV+Hxh1S4LO2gz9WRqTqnhyI7Fm8g2JtBie8h2njWjo9xv6g
	rHVPDV2y/WqiFf/Km5Z/P/nqFjM0lM8QQoF0zzvr/U0lQV1cSFXJ+M2xVrdkSVRBMqERvtcToDt
	cgpWhj3C8xEo0HbBAQgCML5SRssjPKHHEXH5U/r+HbCV+8eR
X-Received: by 2002:a05:6000:1786:b0:43b:945c:e557 with SMTP id
 ffacd0b85a97d-43b97a1f474mr4141498f8f.11.1774540175323; Thu, 26 Mar 2026
 08:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
In-Reply-To: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Mar 2026 16:49:23 +0100
X-Gm-Features: AQROBzATTslqsw2j86jGnm7n9q_dPLelyscJS-8dyeA6axRzEYbPwPuUtl774ws
Message-ID: <CAH5fLggj1nFqQ6yxAgQxrTGJ11pzBdObbu7WNxv7YZDbhkCE2A@mail.gmail.com>
Subject: Re: [drm-rust-next PATCH 0/2] Fix sync::aref imports
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:25=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> A few imports of types::ARef were merged into drm-rust-next, but this
> old path is being removed in rust-next this cycle. Thus update them.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Alice Ryhl (2):
>       rust: workqueue: use new sync::aref path for imports
>       rust: drm: use new sync::aref path for imports
>
>  rust/kernel/drm/gem/mod.rs | 2 +-
>  rust/kernel/workqueue.rs   | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

I'm applying this now to avoid a linux-next break tonight. Thanks for
the reviews Danilo and Gary.

Alice
