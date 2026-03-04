Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276A825783A
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 02:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591661; cv=pass; b=faPD8KOMUadG3LhdRRhqYoliiUvDXCY7DAUbAxLOB3p9hOe4i5V5/GtMCj20H8YeB1LreaDH0pA7CAXqFQteo0x9vASkw9yBl2JDibLmSUcFvozz2XW2D+puwSvrPASqIkX6A+udb3XGIVhEnRx3xhxdomtabkWNFr3Z5OGPWBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591661; c=relaxed/simple;
	bh=wr36XCuOGKz8diftFMXTc83j9D6Lw4jMb/JJxdmwyak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYZmrX+hv0L2SsdGogMq3KG7stC6mecOTwQ9TzdVuOL2Y7dez/0tRNxLXdBdpNt46PqEmN9Q9wT3sQ17Dt4lRhuAdbqG/wKaEvtqYPwnPG1luZH+OW22LsOdq5H/0eFzUGWiFEgX8FTR4j+LC49ftdRbangvgRo/HyvMkVqahV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4UhDTZw; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4UhDTZw"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd801b4078so516924eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 18:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772591659; cv=none;
        d=google.com; s=arc-20240605;
        b=eM7gb678tBQab6gj/1PLHpW24pOGUuu0KLv+uk2TtDUanVZxwgmzkIz19rOXvCpRkT
         rnFb1RzoqY6gOUTdFLMhAnhkYw27lrlQECBDNM0C9MNlMK/H6Z5MGYOlWeuE+ejbkBLz
         23td7NloUCrXArJPOGV2SlzgN7l0Zz+SXSPio2Kxe2rg4Pn9FzJfPUjUrGutznqNlCNv
         3xCIQAgUifvni4dxidSRA8aHwnSp5j3lbceNMIQ2BdBEO9QLUl/mFmqH++kkTyQsuBVE
         fanUFfDexC+Cwtl0BYpazMLz7FMtYuTZT5KE79mlFR1V/1Xc88fX1kJLJmid+phtwbYR
         FF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7Khtfmbf2dDddHXPmr4I/alv71uzNwju3JJXTw9pXg=;
        fh=TUV0H9hMPP+cSNVE7sWJcKdq/7YjUPkkxgrRkjJ7pwQ=;
        b=dkRGUM0lWAOdSoYoQA9oDgP0NFP2D+DcphE7ymEuaqhRUGBtpPVnFoO/CNSrYa845+
         IkogPRCC+hXkrfbnwGfap4lFLQBU0gGEyScqiFVObOgtzKmFa/HyW1FDbg4t5zSO0viw
         N2uHBPiAoQt1eg6NDEGVmG0Z83QjrRmogd0mO/FrIaqpx5rQ4N1/UdNPm17+bSwK428Y
         eIYqOD+08WiI7hdyr/cSL8dJSQjriBEuUqmLD6sAn+N/iNk+rqcjtZ8h0qRDG1mS+3bh
         YQxDUOvY4rJxhe1PKVpgq6R0xwxeV2vu9mWaetBYvVcGvMfBtT6eoBoefqcnrUnQvt2M
         Zfyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772591659; x=1773196459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7Khtfmbf2dDddHXPmr4I/alv71uzNwju3JJXTw9pXg=;
        b=E4UhDTZwlxRgFp9PqZZXJlTROC9scbaKZrceIPLc6K4SvuX0nmSjUy/bT0yWW9ShDK
         3Of8KIcBMcFX8PUesu5OS3OlofADiSjQI9OqnVCJ1XjqRUzkzoqhqF0ZU1LBWxeX0ZoT
         mesOwfFpTaqI1c+WWL4aucTYBLUjCtPm0nRU8fitj7KZZ8gW3lJdEVZY/+eHCrZrUvxE
         8rJKsm99n9kEUVFxSZvkLCirPwVw1W4ApjTJQl4AszoPDfv0Q7A3rEh0d5j9+V6TwXJd
         H5ZfAr5hqsrLB/xQGgM63MtxDPlx+vWOL2ED9n6EUg82Oqx92z6nGdCKYyL4aKzON/d0
         lkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591659; x=1773196459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7Khtfmbf2dDddHXPmr4I/alv71uzNwju3JJXTw9pXg=;
        b=CDTGqsmrYQR9k585Szw9VA7JYBRw4c5W36AXjIH2eHLI1F3+WOcitGlN3Ren8QpCpD
         3IlUlTUiA7dJWHX+r4p4hnr8a/KQDt6bectcFr02T+ibyrusE8WG6bRnTbyNHFkTBxXO
         hS6IxSat0CsmG6qa8NXZ84gk1mWZOvRHed1KxzddUV5IayUTb8xvYrdDiGEcxfB/Mgqc
         aW1IiRnhRsxPX38kj9848023ktIsjLVO4V7dk562M+Iuiou/2KcnpLlARcyyhFtuBS5Z
         6Mz8SZ75Yo1W3UT4IAJYQAezQCFYNVMOEL2jJPMyoS4eAyhHLLdCfXo9QrcIXsGCRs1b
         qofw==
X-Forwarded-Encrypted: i=1; AJvYcCV0my4hYyl1ka3iZbPEx/Z4SfvvOGpR7Fulw+bYE/dV/hnp1X7Zvifv7m181UIYwBdIlmwP58/uljEDVosF8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCU4TdqD2jcos0ok18unK1DMoh+l6xg0u3ToCcRyrIdwFaRXIV
	/0QiyAkBgw0US0PowJB3F08cmgpZoRXKHbq1xp8u/3lhKhGIZMD+P21GiiggI73L4E2v/ixMOmJ
	u6Ywf9Tnll/9cdkyRE1jFUve8x/bbmao=
X-Gm-Gg: ATEYQzzeClwulXVpYWNDozBnrbo6SdKjqZc9mcz9RN0wy5HFngr8eLE7V3tTkK/pzqD
	KJ/xFnbc2W2P6szsMQq8QOkxyQPfT3Nh42uSRy4KMt3nDDQAfNAyJvLmedaiwE38U3oJ2IldnIu
	3KWZwapFRJYlkp4KWOVkWGHRVNWy62iFGs/hcH0fNFKMyz8hZk9SqgI88jwOZT8DvTxD9E+NkjE
	t4syvaIUDljzTIg7vhISO6Tp6YjwZbYxww3Bn4DDyauUVDtRrRinB9pFHviYqomSmYdUVMd7suL
	KIuSuCEMqKRtR6Gp4KyZvJvRmzvqsGaGkhUF99hzp97QmaUKotPi3d5E6ntwfdQsko72DET8gwy
	I5p5N0MEk7R96AW3m8N5H8fG0
X-Received: by 2002:a05:693c:2c0d:b0:2bd:db75:c283 with SMTP id
 5a478bee46e88-2be3121397amr91721eec.8.1772591659060; Tue, 03 Mar 2026
 18:34:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
In-Reply-To: <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 03:34:06 +0100
X-Gm-Features: AaiRm50x2gGWWmkvFDaow2DwD4W-85suwozy6vHXu3xP5Qt6D9AJPeUdxl5uEFs
Message-ID: <CANiq72nqTHR-3-=MrQhhWWdiej4_vb03HVD9qLwSFAVPCBgMnw@mail.gmail.com>
Subject: Re: [PATCH] rust: str: make NullTerminatedFormatter public
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 3:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> If `CONFIG_BLOCK` is disabled, the following warnings are displayed
> during build:
>
>   warning: struct `NullTerminatedFormatter` is never constructed
>     --> ../rust/kernel/str.rs:667:19
>       |
>   667 | pub(crate) struct NullTerminatedFormatter<'a> {
>       |                   ^^^^^^^^^^^^^^^^^^^^^^^
>       |
>       =3D note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by de=
fault
>
>   warning: associated function `new` is never used
>     --> ../rust/kernel/str.rs:673:19
>       |
>   671 | impl<'a> NullTerminatedFormatter<'a> {
>       | ------------------------------------ associated function in this =
implementation
>   672 |     /// Create a new [`Self`] instance.
>   673 |     pub(crate) fn new(buffer: &'a mut [u8]) -> Option<NullTermina=
tedFormatter<'a>> {
>
> Fix them by making `NullTerminatedFormatter` public, as it could be
> useful for drivers anyway.
>
> Fixes: cdde7a1951ff ("rust: str: introduce `NullTerminatedFormatter`")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-fixes` -- thanks everyone!

Also Cc: stable@vger.kernel.org

Cheers,
Miguel
