Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E12C0F6C
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941428; cv=none; b=A9iRkgOcOVA0ZsAoaSIqilIgc1oTGN5/sb7LLoO6zkVjIyDA9H98se4BelMgrgHiY26j14AMGJvr1ZngA1hgdI/PHcPwqwBgKJXa6N0VqL/r3NT+fFNajgJpDDVTj93/OTd/Dr4bTbNddOiGJxwrOJal8Js8BbAOBu9bE0OQBxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941428; c=relaxed/simple;
	bh=CIbkZoEcvxMuArEM88rMsYIiHa3ILLozzeTvmZfTtT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asI9PAaDCaBk5AKmFXZ7pRUuUW85mC4Dc8bhDT6gVDzn+zs/B9ucyD9xPfWaSzyZ+bpl9OBKrijegiJC2TsER05ZlAt8aJX1/VeSbX18tEpIy/uV3+16YdTBHEY9jANQLEHJ+a6KDjD/UiiQb9ICo1yI7h0zO1Z/mj0DfJsN/Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MytEszeF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MytEszeF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so44816b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762941426; x=1763546226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIbkZoEcvxMuArEM88rMsYIiHa3ILLozzeTvmZfTtT0=;
        b=MytEszeFd0wvJ/wuqK6NxlN1QefOYVAO9HXEowT45u60+HCefw/nIrfoaXUhufX2nU
         OkHgE1D4A9iOBTlIofrniMgpiqFrKF75GddJ3Oo+JCfYBQg72HHTIBCx3dE+fGZnTvTu
         1gwrZNUsThvakhEB+6FDzD4zWq8ue6oIWN3IHfKzurWTANuMSONyGxpEec4xQbQTS2rD
         4vSFASjxFFOsB6ledt3cJT0SLeildTq4VcMUJj8cseWdQYRqiIQGqT1qIN7qyGw/SQSX
         aM9EjLnf8wl8CvXnBxun86n+eKCkZ3Ix7JJfd0GlX73XpVzpFplnvKeZ9swM5HYITGtg
         3csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941426; x=1763546226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIbkZoEcvxMuArEM88rMsYIiHa3ILLozzeTvmZfTtT0=;
        b=kZJEJsm/ZTTJLUZlblrNt8KbpB//Wi93CqNTg0kFwYjq1UQy0Tlwz5VFX+bFY5Mpjd
         ix5K7vTUx1Ugc4MZBsMT0mL1BgqPEQeJfzUT5Y3/ufiiTVEPXxwh7tG8ImZwKYbTrZ25
         1rs2Pd6LZpk7//krUNTKgGfA+xGWc4XToIgicGD1/qmmBWxxnw0kF9CQaxVAPKjbQEDT
         JSi05AqWkk/PwtwvwARD7sCzfyPp2Inv6ODeV9UwAwYqs/4VTfVRG1yfpWk2zNMmhZ5Y
         9INLa3c++talfeumR3SzzQdBOEVBbbfinf43KkdfjinIW2pGDfGdAfmdoZINeHzGCOi+
         Xb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBX45ZdfGbJAm5cYt8o4dTBAA6LTcG1R0DFfaHrDQcLPQuEMpJ/4Ie2EQFkuDakU7igt2F0i/DXqwWbQG1hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZPLSprjMAhIASminy0/PVkO4F9PM3b59xyhp2VDet3iGAE3J
	oyuwDhUR/bXDiTHyj92mTBZ9kL/7zfncq/Mr3A5TysuLUovNCaXt1dYNIkPv3fiyeIQUxxHepf3
	C6iI4YJOykNX+dB27/mA2bBpdK4Sso6E=
X-Gm-Gg: ASbGncsQvaLFVrVvuNyNSyRrOZvzQLJVgjKFDETArAFp/w4MYqnxMNqcWTDGuqPtt/1
	MN/RspvxcAnaee7N0bIZiguK41jBfr7kfXHAigrLdVp1O/dHp6euIMrkthKu9/uJTuwTc7Ea5BD
	XDB2zrEeh4g6hsDxIdl2T7yO9fGi9MWWwXzZbGqyzsQ3djuSepggRWM8BccZuj2gU9vxeMtSTjy
	ZCcafIsRNeCpb47vqaKc4vwbmhzru4EAItnioatPEx5D1fdiguhvY5ybKk9ZF/QyvDkDdGLWGB7
	acwIpsF3I7xOqOSV0nqLkjxTKYhvgeWZXn5Vh6vGZcVyrDtpRyCYhZdVgHfiJ8cT2KZQHsGgtSR
	NTjZY98YKODiPGg==
X-Google-Smtp-Source: AGHT+IEhemJfSLH/p4Bhjk03hiHG8nPZMckQ4o1gzMhDR33YwdnDKqTg/WdwFRNF3u+gDynCToXBRDMfK6PTspqbdUQ=
X-Received: by 2002:a17:902:d4cf:b0:297:fe30:3b94 with SMTP id
 d9443c01a7336-2984ee0ca79mr17858365ad.9.1762941425924; Wed, 12 Nov 2025
 01:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101214629.10718-1-mt@markoturk.info> <aRRJPZVkCv2i7kt2@vps.markoturk.info>
 <CANiq72kfy3RvCwxp7Y++fKTMrviP5CqC_Zts_NjtEtNCnpU3Mg@mail.gmail.com>
In-Reply-To: <CANiq72kfy3RvCwxp7Y++fKTMrviP5CqC_Zts_NjtEtNCnpU3Mg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 10:56:53 +0100
X-Gm-Features: AWmQ_bmwDCOcARGiEKIpjIRnRae5yfDKTRIUwc3OloyDgPkRmaMpijy0lYQ_hkA
Message-ID: <CANiq72=yQ1tn0MmxNHPO4qOiGm7xZzHJAdXFsBBwmFdsC37=ZA@mail.gmail.com>
Subject: Re: [PATCH] samples: rust: fix endianness issue in rust_driver_pci
To: Marko Turk <mt@markoturk.info>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: dakr@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 10:37=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Cc'ing Dirk, since he tested the sample originally.

i.e. a new Tested-by is appreciated if you have the time since you
tested with QEMU originally, even if this is a no-op in x86 (where I
think you tested).

I guess we could potentially consider something like returning a
wrapper to force us to explicitly pick either LE or BE to prevent
things like this.

Cheers,
Miguel
