Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2D2BE63A
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022448; cv=none; b=hd6MfZM1AwMv0rAaTrkwz4CVmp5DvL0Tlw5n+r9kyE9Wz2uKx+B+Txvo5Oas69S+2hkfphPy4UH0YXvQWNzUeIJo+4JQRlMz80q/53UDZ1Bvdm7IQCZNmxLnY7E16Xh51JZ92bzBUBgeDBdRctJkG2b/pUW/yiglsnSp+1ivOYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022448; c=relaxed/simple;
	bh=d1qk7FVWVfRJhE+KtiEvk+u0EBagMhnk/HxpVt1YtfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDRI7KDYPM1wcaVPl7noedptC9mbQzG6LOg5v53sNQVPJmjCdnnlAetRva+ocmPbDWL6B6KQKHNzH2h3uE3TOKnnjq8RkT+JzVHFn8R0jKbxdGsaLExiklB5dVAIXgSCOIt81Cmpi0aSpaPPuhTN2tVwgMvicx8/ws6Z4VbsL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RU0RMMAJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RU0RMMAJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297ea4c2933so294575ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 00:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022447; x=1763627247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1qk7FVWVfRJhE+KtiEvk+u0EBagMhnk/HxpVt1YtfA=;
        b=RU0RMMAJ9wpHrAru9L/W+udDUyeHe3q8RqqEClDkTbPU2m2+NIkxItBY/I1Upf/kk4
         2VGjgX0ShTE6d4GNhZG0zbYF/E+749jhNltSojdgEot3nXhbF4Kh7sFD7fVhkVOd2kkE
         wc3RyPcG1gVXuG3bJ7Oi3eDFxxdIEzNhnN/Se1ZHeJCZjVujdEMwTAR3JrniBZ8Ek8pV
         3KE2IrL3EGpn4tulc7q9anfApVtYRBbo36GCt1318i9o/SN1T+71oihsB1coZ1fXCZhY
         HmZwmNvyEJnIwVPNMuplg7/mNFDwHxi4ROFw45bxriMml7Rf1lKNiACzimViCJZpkYE2
         ikwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022447; x=1763627247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d1qk7FVWVfRJhE+KtiEvk+u0EBagMhnk/HxpVt1YtfA=;
        b=YOQUgRofTx4uzeh2v6sxBDN5cQJNkKv50m/+KK6DROxSAWy6oGRHg9GrJ/aZoMfhem
         WIgFZXHNYfdqKsEPFiRThoKjiXUa4SsFh5koa2Kf8E+srt0VSOuNXoBGFuSZMbiHXMF1
         QsN1cSpAjcZrgylPvccds+63Chtph0o1656FdL5gQBu4/1U72VpKkZ4O0P3NPUA2y5jU
         7Y+N2ykWPmG03ZGCqm5+0MMTNxIBGoq5xjdu1Lvp/n2My1L7uA3WRZzbSUYQocbtCaBb
         aWykg/WSd41iaUhWx/10TsIlTMkyaR+IEsd1palEfBE8FCeCw4L/LvMs+XosLtzkkpES
         OHzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMtjiv1SBkUdXPLZIY3TQmXvWeDw1atHccQ6ceSCQ0favR0vM5t+wQiqYJqc9h50xFFilyackV9o7KW+LXAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3PCPd1zxNdwKFRnGwjgXNYN0wO5kOsPXhM9w7TGxDSHhClN3
	O61fsVCy0MjEUj462E++nwulQMxKyGtuVQTLIYofE0IZe6sC/zUPLkvgnqkxkFZxtaKDDTejutt
	6DVF1javJccRbNzN4MZbI6ynOoFfrYO0=
X-Gm-Gg: ASbGncv66fvgnyreVFYK9dPLvQr47WYHcXqOkFPCpW4QNMB0vhYHgSYj4jfMrZv0kZ2
	CDmHoL8XrrcJjAvLLsgXxUI3GB81+lGVDGKObR4dsUafWIDy1s99lxIdY5Ln7gkz+qwQGAgK/m/
	kqJAqoem8FzCtreFZdlIho6OXpmFCOGKQpZDoafoZvdogLrfun1q7MaYh4ugGfffn3yOx7FIbVb
	HXRbEs22GGrYWVwWknwKqonkqzVRZ6Ye65+WL9PlGrK1FUk8wvATmWn20+C3fiRmUi3qvjGbPov
	57Ud4EVYlgGBz0z32RskLdq+jJ975Y6kne0W02Ytm/PRGjCDVeAmRUjwFw7WWM7f9ZjQPNBXRc7
	Jdco=
X-Google-Smtp-Source: AGHT+IGabKCaWKO8REK+43Eg4r6FgFxCqOu4BbB6BrKUf2h40WukUnS1SFQ2Rv/WiM0zMAyYUdxkiYVrqRkg5TTtI+w=
X-Received: by 2002:a17:902:f683:b0:290:c94a:f4c8 with SMTP id
 d9443c01a7336-2985b942248mr13558545ad.1.1763022446725; Thu, 13 Nov 2025
 00:27:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101214629.10718-1-mt@markoturk.info> <aRRJPZVkCv2i7kt2@vps.markoturk.info>
 <CANiq72kfy3RvCwxp7Y++fKTMrviP5CqC_Zts_NjtEtNCnpU3Mg@mail.gmail.com>
 <CANiq72=yQ1tn0MmxNHPO4qOiGm7xZzHJAdXFsBBwmFdsC37=ZA@mail.gmail.com> <DE7F6RR1NAKW.3DJYO44O73941@kernel.org>
In-Reply-To: <DE7F6RR1NAKW.3DJYO44O73941@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Nov 2025 09:27:14 +0100
X-Gm-Features: AWmQ_bnSp6sDCbEYJ3FC6kACZqmnj-bo2Avyv0Hf_y2c6mHRFhvWknBqrxsDf3E
Message-ID: <CANiq72=fr8tTYXz7Wd5AYr-1f+6ohggTfGBz5KWDE97675MP+A@mail.gmail.com>
Subject: Re: [PATCH] samples: rust: fix endianness issue in rust_driver_pci
To: Danilo Krummrich <dakr@kernel.org>
Cc: Marko Turk <mt@markoturk.info>, Dirk Behme <dirk.behme@de.bosch.com>, bhelgaas@google.com, 
	kwilczynski@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 9:22=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I don't think we should do anything else; the cases where we need to deal=
 with
> big-endian devices for MMIO should be extremely rare -- rare enough that =
there
> aren't even corresponding *_be() implementations for all architectures.
>
> Given that, I think the proper fix is to drop the existing u32::from_le()=
 call
> (that ended up in the sample driver by accident) and properly document th=
e
> little-endian assumption of the MMIO backend.

Sounds good then, thanks!

Cheers,
Miguel
