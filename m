Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67814B951
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717788012; cv=none; b=tFzqaf3iVxSqd0JY+J2xEYkMyMuubytHKFaZTME5EUAklsQBNCz0raiW0om5B6bQRpypOsA0L3uKCD1jOJUxUEdjQxp5kbxvmjY1E1UUdg1JLkzUbyTIhR74bTNrs0I9tI0hSBg/Pg/n/JjptHhUcwITu3OEXsh7dbM6U9ulrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717788012; c=relaxed/simple;
	bh=0ppeoBd6eOJmRIRSAftRep/wzSVAGDuBCsPNOOsLWmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=X86JNvsShUSjDEIujg7+9XR68wM/oZhmvzSUwX+xRKM14e/69CxGJ5p8WVl/zDfrnXGCqmtYIFrlVhSNpB6s4ROYODvcMVTQ6fIZkru/htuTQpAKS/jrd80qUlkzwY9X7lZ7cymlNuDtZttvWpMHrEcVxUALg1AN0Y0cJRZNVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDq+AUDT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDq+AUDT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6e4e6230f42so456147a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717788009; x=1718392809; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM2aNNGxfhXh2d3aWA1eN/FjYZRncFTAwN73rdb7vXY=;
        b=FDq+AUDT+xr0heRKGNMvAA1j8msTFgGmbH4D0djJu6SIlN86Cllbp8e26GyRbGTprZ
         7yJpnS7TvO3lyC41N5EuuEU8qr+Kw2RRv5lNImlWkkTk3LZt0PoJCMsy4GOEmcYbEr1C
         vbA844ZL0UJYs969sbiMyOb/hHWK6U/Z7Jm2VviTKxAJtaS3ph4dhfVn3WhCU62IteZn
         846Uzjt0zTKoKJGuEmmwcG4I6cFP51m2cXaYUUoxs/3UWkM5Wo5E7IGwIdln8Cf+C1J+
         rP1tLPlaEsqQRByNurEvh50QVat5H58+yx5tSFa42nKYORxHx0OGLz3jZPgwE3Bl4Tz3
         iNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717788009; x=1718392809;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM2aNNGxfhXh2d3aWA1eN/FjYZRncFTAwN73rdb7vXY=;
        b=jDCzCKzBwks0bPG3CT2zcNpop1Ew1q3M4AW5aHqPeylx2PB2qccKMpQDV6mkoZg0cG
         akZpOzudr8U+Ciztkyy57c1yLta0Z8JxoW0Mz/gCm/4WmFboh229paruApg6P2Gp7Fua
         /Ypp0xI2Uhs+zlX4R7bpLJokH0xIzqTRL1NKnLWULNufzf61uCOKf2rjhHn16v3/ZVZU
         QQN8MFZw4BOnv/WckZreWipBL31ZDPUc+Q+s3gA6OplqSpHuVKavXzUrznjntmgvrfXO
         3XwHGg+AraYnR06qNVRnrOmCAJh+BkY7jAoBKBGFd+i2g/LlWR6Nkh0Q8Ds1JEHl59I0
         LHaw==
X-Gm-Message-State: AOJu0Yyk9n/OOiCHCXTDGExPEP3kd84jOnTxwQwcwopkVpMT49WiSLIO
	KGBbkhWy0/hTvRFsO7FSsrrfaIganzwqmxxuiBaWEIrEX/DXuwXKQqip0w85XaMkyB6ui5aIZ/t
	T0Rmu/4GKtFZf2sEJZSI/dPhNyf35aSTDvac=
X-Google-Smtp-Source: AGHT+IFLuO/nNBq2B1csoss7b2RhN02fC0siWRmALDFvHPvy77umcuH8dOUg7EKYAg7IXrQOZkt5L51jpXPElWDNQ04=
X-Received: by 2002:a17:90b:3650:b0:2c2:cc03:a4ad with SMTP id
 98e67ed59e1d1-2c2cc03a5e2mr2583027a91.21.1717788004255; Fri, 07 Jun 2024
 12:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72koT5wYrYDvEZdiz-_-BDH4ZmaKeRjg=p=81=m46Z+PuQ@mail.gmail.com>
In-Reply-To: <CANiq72koT5wYrYDvEZdiz-_-BDH4ZmaKeRjg=p=81=m46Z+PuQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Jun 2024 21:19:52 +0200
Message-ID: <CANiq72=rrohCVhvGk16=ujP0ajjY0DABAqsDwK0RWSqxvMXr9w@mail.gmail.com>
Subject: Re: Rust MC at LPC 2024
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 9:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The Rust Microconference for the Linux Plumbers Conference 2024 has
> been accepted!

The CFP deadlines for MCs are now being announced. For the Rust MC,
the CFP closes on *July 14th*.

    https://lpc.events/event/18/contributions/1662/

If you have any trouble submitting your proposal(s), please let us know.

Cheers,
Miguel
