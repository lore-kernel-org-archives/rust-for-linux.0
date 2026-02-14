Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3821CC71
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771111983; cv=pass; b=f/ug8mxNCxPgdig5EY9ZBB9TNUiN94dQamXt44r49iqS2T2ZemWOBi5iQkHOrHb6GVwoI1viWn38+7SmHRQc6TtTiH6MeHUls0BnRhBl/JdxFcc0exwowr1akOQ8PAGtHgqd4j7NkSIuCPby8jwMtn5RgEDzTlw6i7zghT1YWT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771111983; c=relaxed/simple;
	bh=cJFSPMQ8/lRGApAl1+RrFtZN/euu9pojbT3V/ngG3Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llH27qZD/4obau+pHoISPiOyzs5JJH/8SZXipdw0ockI5xXWcxrMiIFkJJdj7hGCm5CDeG0Ikw9sHihXbcWXjmTOQJ7guOqAsPU2UmY/S5yK5gjPrNSWm9eKWviq83zSDBiDcylvAb9ufxT+fJsl0cBFCrN3PBBaR+RhqtNRSOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iX/Fe3cf; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iX/Fe3cf"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2baa1ed79b0so85941eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 15:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771111982; cv=none;
        d=google.com; s=arc-20240605;
        b=QFbn86/xrStQJdbRTywltopoAZByJsnDv6/evJ3D8zAwhbqw/a1JDBZQ9FHj3WFeLw
         32BvLGCAmnxsuxeA6EVc7HX17K7wJCyzzmImcEH2kvlofa7AkXXSLc/XBLYQ9DMiCTjg
         IHPwg0pG5mjyvWorj3PU8ufmKYtKF1lRjNxoPPQiNb9AQGN6DSdnJdePrReimA64NK/d
         EN2M+dOYf8HgtsLhKQYBgNUFxGvx8vo49JcH3aPtPXp0bQCxTOcfuQHHDYlTwowEmCNR
         FmJTu6zaT1c5zFCvFmQrH7zMvOe2zOn/hyplcBWpyyyPH3lSnkhVLQ39XCXyKAdiD0fH
         WiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJFSPMQ8/lRGApAl1+RrFtZN/euu9pojbT3V/ngG3Do=;
        fh=F/abNHv0lmxmLfUVaEzj8Lf0I1SyIPMhHFGcN6/lrAA=;
        b=iLNzq/DHyw83Hh9/bFoc+Dz4UDnDrMOo5JlXD6MjLe8QMOVEe4E2/S25Py13Sg0Tue
         6IQ4l4q+23lb7oiXR9CLewVOP/TMjLmOB1UDF3xbO+mTbGl7Tw4VG3LivZbsihnd1AfR
         sagXoxWML36wsd+xTv6pvC6MrSKuGovOpOCOCA8R162dMN3bohWugDAhsRvht47WO/dh
         IcqUwD8VLBL++auz2sGOGcRib/KJQWBAZMPJh7gbGz1hggJWKujvUTmTFEyNQvCxQp7v
         DYElSUw4kaSYzAO0ENfuugy/G51qyxuwvbZsXiD7fBdQ6i0wM6PIi+Ck8s+QVNr8KoPq
         Iajg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771111982; x=1771716782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJFSPMQ8/lRGApAl1+RrFtZN/euu9pojbT3V/ngG3Do=;
        b=iX/Fe3cfW/Iu4pnZlBsVd1MeYrzOEYhwoVEGQdmOnsAA54snzrlvomKyQsKM8CuAPl
         ch8yqTwnoGhgR8oqoUIJkYrrItMGFsvmNKHjJWjMcNjHtTOzEOelrghwWcgCEVVoFAgA
         JJjvTW2qaXVAjaGXRjRQO+8ioX2F8VCaEsVyjjDLbdSI5qrPx4GTmVn4/MIQzDZZbVI+
         zztu1SRqQp5VvVHNeHEL36OHYIk2z3qSLMYBtRD9R/RDeRZrfKQA9aihRW+PbOTjiVcA
         ffThZ854fuT/wjTlL4qhMddcJ0L5Ek28rSnEpUWnZMl15NL3k+yDKH+cSHB6krkX4K5z
         U/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771111982; x=1771716782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJFSPMQ8/lRGApAl1+RrFtZN/euu9pojbT3V/ngG3Do=;
        b=bVJkC03/OpLBuBmdKt05kVsSePdhLWN36e8550hpGuGOHAykF06MaQ0LczrF8RM5TO
         QxSxQNf8bOB2GIjl5QDjjazN2x6u/BBXNyqP+XdwqDIH51jbKLdSl31K4cBGrOjR9ckv
         XZTdMFc8gxiApYZ2+cC5c+2QehT/OA+eyCiTCSoV1chBnfwqbwQ5K63Nu7/zDeZbPhlK
         LL8AQn4cTava/nFRjw6rw8/HmWaGhrnUIomeTZRl2bzZmT9RG47a3++dQEmjIMFba2hD
         ChKO2yT/3pVAOdTLvqIGwRG97CA8X8QW+wvORwDdz7zbkfjEdDZd6wEfI6784UBTkCE/
         FYiw==
X-Forwarded-Encrypted: i=1; AJvYcCXyHnsc1wI+9poi4Ji5opIFV/eIPC9Qb9N7dDjjyeniSgHvQSaTXcQCWelAgHDXqpAZFrwrTuY7xj70CrrZWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtMAvhUHJ8Fm/OU8fA8Ne7W3DJinNs6XlVRVVy7FJlcxB73/ZN
	3M7dMZ54OesY8W4FxwfibRiuHMv3FyyDoEd/JLJ+vWJDYLPuLc69F4Dp2Th30cT+iGUZeF/I0EB
	FjgBZRcY5/4ZWFht/DhDcBpECqOb6WyE=
X-Gm-Gg: AZuq6aLeypsqO32p29e3Z+9DHSrIYCmvlgexiuWbejtftWxUz9kkl/VPN0hrpvECLiY
	Flrritj4EKJp/B8DgT6/nJcFgQOe2NMW0PwQUMASsZkQLRnTVaCcjLDhnMS3o6LvSMaxpKqu7xi
	/ntzAc6IdiSot9kD/l+0Fby6GtQ2NTt8kGIhmOVGW9Yg7GFFxMVFwTmeEXnwX7ZAlGg3NBkp/uW
	X2xsVGQ/8MN+NNmGnKCVJn0Hor8JtyXDYZ20m8EenRsovoXk6bZS/FIU9z9UYhzBU1Zhs9QkqdN
	DCaHHbX9fT5K5REKf9SDpDSdDsEXB1ACCNpRIgvWofzN6cFSDf/J3W0oCMyLpw1vNXEatOf+6Yn
	YAf3HBklgMIYtDs+jHs+36bwzjlt5Ma9fY8k=
X-Received: by 2002:a05:7301:3d1a:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2bab9ee9da5mr1393677eec.0.1771111981797; Sat, 14 Feb 2026
 15:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
 <20260207224907.234815-1-jason.kei.hall@gmail.com> <ccbb3422-11ca-4a0f-a517-1f48b3004052@gmail.com>
 <CANiq72nm84Wmr+D_VS1DnpG+uVb3zZpCCojGPxJGyZTBj-Okow@mail.gmail.com>
In-Reply-To: <CANiq72nm84Wmr+D_VS1DnpG+uVb3zZpCCojGPxJGyZTBj-Okow@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 00:32:49 +0100
X-Gm-Features: AaiRm53aFSOH5Tsrpv41N8ilIUelXPpxwgQObIme9gMfcTVtx55i47gFA6zzlXg
Message-ID: <CANiq72k-gY-Y-UHBCm0v9hZyCVNpni5WqYbFHBKPAJL36qjkQQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] modularize Rust lints and add RUST_UNWRAP check
To: Dirk Behme <dirk.behme@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Jason Hall <jason.kei.hall@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	=?UTF-8?Q?Alejandra_Gonz=C3=A1lez?= <blyxyas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 12:30=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> [ To give some context, in case it helps further discussion... ]

Fixing Danilo's email address so that he gets the ping, since he was
one of the ones that supported the lint.

Jason: please fix it in your contacts (or similar) for future patches :)

Cheers,
Miguel
