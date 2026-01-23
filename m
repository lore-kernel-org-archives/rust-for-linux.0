Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959838DD3
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175384; cv=pass; b=WvPHwKdF0po1TDEZJRM5lMp+zSxa4oWcTTLDY41OJ1+woBZhOci2fNKrLaYCiigmkvnhV22fsx0G7M3RYCgxqaEfhoUSvkh/fI36XY1BVsBeWNixvGCMLHbBUmLT+OYlgcDGll6Jc5HcsQkZtKR5gvTLsN1PkIayoln97N0dx+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175384; c=relaxed/simple;
	bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsrPpm67TzU14x4x+iNRxcaujY9FaU0W7iDQjr2nb+P5rO9SdY7/raSRaETtpV+r/RW2N+E8tdQstb8BfF57khPqrNHfB22QoCkwEf7tbo98IFm/uN6swchDX3T0VCVCpqvKPkmyaPxPu8t4TQZVaDA/ZjRAQMONZtjUTy1FcIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHGo3ckY; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHGo3ckY"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1232c98f98cso169570c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 05:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769175382; cv=none;
        d=google.com; s=arc-20240605;
        b=LV+ho2+7QwO6oj/h7ndgfBDyKXwNm/918cc91y3UEVBfhyfX4P2PXo5LNyEMnIOKMd
         PM91m3IzTMNsshxNqVT1tAnm/N2K0kaLbsnkDw/tBJyRW6BVUFefwjVaBu6EVT05VHWV
         IpFHkNA75UMojgOKdHmQAaMFiSs7d+Oo77+aKuxhWwi0+0dl5rTyBUjoyWaTLtR5gmF0
         a8wfBsuPwpN3qfOo75e5Up5CJgIAXGFhThWYmR/qEn2p6aXSjYKLYE1+VnP7szTZhrlK
         /9HzMZy/glQjijZL5kFHs0o4k+Z6lBu1DfGwo2vPaqu3Vw36G0LlIaAjfFP4ltERZQVl
         cGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
        fh=f+jkY3drYN1mwmUfpc6XxIY1SxfVmuP40JW9IJ/wBD0=;
        b=TCaGSGWmLkkpEzBJNlgzUOBxQT0B1dhcCr47AEm3CXa6Y58R1Z+CYb1LFbZ9217IhC
         f2VR36Ii2vMmG/dyMCWKqj0fdQdAQDq0hOz5hCTTrcOmhuLIbkmPZ1fzZff4RJtVBCWn
         zNEhMNlbJCu1Isq0RqYTYYs0fDaweJK3QWd93cZnTGBlY6BBfFw0nyDf/mxkAr4HKiM3
         J4MuuqJsMeSKpWIKa6hI82PdThqH2gYogEpazgvBgwEBixqTPKiU+Ggp5U/5kZYKFgSJ
         kfBmvCZI+h32cuEObqcFaqCjLS2g4d6ptl6je1fFkhZ4LVCsbni8G2GLbZGETNa6jobi
         ldNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769175382; x=1769780182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
        b=GHGo3ckYuP06bYpY3kXUgtDO925aCjbgG7iBlT/9i6VMQ3bU/WJ9+mWEj9iHdN1eUW
         4EAyRLOaX+niX3Iqp3ih5N7bBrKhr5bH7zihAZ/HDWKGaj5cohL9Jr0g/wpFLa7EjgW8
         SwJny3WponxYLiwr6UfTW8EviuOml+fJGhXUe49v9QG0xgqSQWEIQ3MegJ3o267ysSWP
         +l3ZUtEq5QkIw4Lz4YPZ1nVGOR9oj7wnbcHazKWMDU5bzvLnaEOoH7/HEMdB7WDF4Gw7
         SX8ObogXmHyaX2xBzxxrKxq0cNbx/JbUclhpwANa2aaIXNWx9mBsL1aj9T040W5KwYoH
         TOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175382; x=1769780182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
        b=MpyX2YCa+bQ2bBmvVuvwlFz6V1petVXjJWXqdo0yh3masxeOLsIVD/sgV/Go4puoCL
         6LGrGylzhTZMdqzeo7SWzWGJY3BzAQ881lIH4XGRFL/wi+QIsqw4Ep8yp77OvEM9mFV1
         M9O2nLPNHo5mbnNhTPUCtOSmAbSYroOLa4a/N8x7P0Yi9nynm640yb3/zaC1uetVekAF
         fEDkxOueTZL2UBC38VVoPvwTB4ryYOX4gyv7aaoW/6J/013LkcBj/YSvqV6zWyr/0rHB
         JL5HiZ29DI6NLp9ldopMTELA9DovZ117KqVjTyxkA0x2GCUq/JGNBlLut5bqaLuJCyr0
         ptqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVww+L78e/hBk+4nv/6vINoOF8PYpAhuDbcDH8sAW0YfGxl3oiKnhnKTmMYsDX/UDKNsLQlb8DHtIfUfuRgfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+ujmL6PGQQGdlnmTjs9ZxoBTz4rpq6+e2lbtbpnFGzQmi+na
	KlVHFvDO64Ot6Qpau2OSrJWsFoUfk6IMfmGbW9Mk0beQ3qZq3cj6MSOt8PNjqn27/B1tJsy5+oG
	rDbO6fhTyZaxHiUsEmmupbvfEvgeAfuE=
X-Gm-Gg: AZuq6aKrsgGJUzSZqtKfgPUi7MH1J9Fp1rkgNh8Ldjcy3lkMpimb7gbZops853vavBz
	ajeN4iQut5Wsl+9mgIU2JO3TuDriSTc4ychjreu6i6MRc/OEYYRwTQIicAJAkXepV5KWps1UeCr
	AQ2z/Gr8nbx35aOHzfEw6O8RQpU9t0c+Oh4ddfDLarNv4hY2cwa13udLWKDLL+Hus7IGhu0Eppo
	I6zHyOPlTnpCbI2Xt32l4z0DLeIlHY4HAq2b8DEdT0XtxuEvdMmsLNev1lNIF1/g2A+P+sXtFYw
	u0dyN+17tvOu2m8vdbD90jiAiKWboAQjGmzenPYCTE2ewXxdMXsh6LEjS1BKMVvhYRWD5+f+0pY
	WrOSl1LTRi4xb
X-Received: by 2002:a05:7022:2529:b0:123:34e8:aea0 with SMTP id
 a92af1059eb24-1247dbb1084mr725593c88.1.1769175381816; Fri, 23 Jan 2026
 05:36:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com> <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
In-Reply-To: <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 14:36:09 +0100
X-Gm-Features: AZwV_QgIy0LaoigKp_ehPN0nt_octRcR3EaYj0Zb0FmNjvDaSnSLYUBqrmFsOp8
Message-ID: <CANiq72=tvkD2+0KOiL0AJXt7Hvz3khe1kBVs52CEj6PQyRj6Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	broonie@kernel.org, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:07=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I wonder if it makes sense to request a feature to mute `dead_code` lint =
on
> certain types which we know are there to represent a registration or reso=
urce
> enablement.
>
> Currently rustc's dead_code lint has a builtin exception for `PhantomData=
`, but
> I think a lot other types should have the same treatment, this can be use=
ful
> even for other core types, e.g `PhantomPinned`.

Added to https://github.com/Rust-for-Linux/linux/issues/355.

Cheers,
Miguel
