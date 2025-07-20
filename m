Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F42110
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753025242; cv=none; b=kxEE/AVfjn0TeXvOSa46LTEGAxjaRgZJm2G4seUSjFD5HBeW/nKyQZEW61Jlb+mNcFUVYk1FNGPsJZJ3A51+IJSZSiyn9/EraIBZocMgEkCO2ur1wLWIBZd5oRUKuiMTKbXgKpQ+DfKR3i5VrAB96+0l+zka495Q4JLJFis90kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753025242; c=relaxed/simple;
	bh=v6IL+SeWBTCzeApHNfxw88oSvMyoSjluMj0wCOTIClw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia9Cx5sjQYHLqjUJzK4vnHEqsHf6t0LFCcMy8N5UZhvcWSCOv9dqFUOewoBByR4PlldUmjEDmL3yDCgGs9z88aR3r6ZYV8GvMeI2Pc7SixLWsWHEahLIgEHGp/c3Z917OlubT8p0SKRJz3CHLTjKCgwlCcLcLyh1MVjkq4SgQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGkCxhnl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGkCxhnl"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313290ea247so625579a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753025241; x=1753630041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBcv4xY6hLmfGRTbY20Hf4LFm1jAqoPNbLEEZcIP/Pg=;
        b=IGkCxhnluJO3ghrbu4H/ToEjsONzAvUqCL/D2zdhU2ty6okZu2b8eygfrIxCXXMti1
         QAI+eKqvSRH9j6zMi7Ez5pmKwbWnxb26u6CA9ZQMyI/qS5sY3auqtsPHXN5rHpLW9SbB
         iUGVm0tkYjmEynLHM8V1cR3jCvUtbTDLNOwkUhaYaPJJYIi8aFsx07drVio2wJea2dU3
         U9a7314cl7sA+BBXwhzeNlWUCFRXKpCIbKSGpOiMlJqkR1Ji9PU1B199tDfcbC/NgUwS
         vK7yfLjTuTxs+jd7BqsDb90vJZjqdDCGObWgeDYcOpJk6UXgqxVtPdI8E8C6aDpqPDkp
         MnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753025241; x=1753630041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBcv4xY6hLmfGRTbY20Hf4LFm1jAqoPNbLEEZcIP/Pg=;
        b=jJ9MMSAJjXPf4g5EwDel2LL4Ust+YaqoP/oC0V5iwuc36AaWl498n+mXbpvE3+CFn5
         yz6PnGyMfsO31DEBKMLVJrHt0S/nbLqS9UVrpdiVpohyuuxLs9dcF8XaZ/tv0uNzBjiF
         La2y7axoxMbEXos05ZMpN/1uL8UVpFxlJ6/EB9WRkyyYwoUhPgbYTiCNcWX1Ux+4lDcO
         2lWqh4PBotLV82rekEr8McldKU4+3zcg9l4pJ6ElQrxS9jwfzaUzGQIPPT0PQL5R2yGI
         ONsDR8njUzKceY3R+E47JIoMbjHNMHX+mBO7PrczufE4HMXT4VRiogwmL46q8kXRpkVo
         gfaA==
X-Gm-Message-State: AOJu0YwbeWng+1XZJPY93MV18KyljRQVVJ9KsMiarPQuJKe4YxcaKW6l
	Awe2KR78ShPsbPASgtkmGYtMU4c65o1CISZWHzxp5+CwyfEv0bAsoShWiwlG3Ar5KmVczglEoXE
	MbIXgje3Sk1y0zijDvMqpKQuKmIrEAmb6lM2C
X-Gm-Gg: ASbGncs+BELsYREx/jPiWHYF9t/87OWtbU+PZux5mEGihbwfh0A6wZj4gB3QfeoNAKn
	GPPDHYAzFKJ9/J+pMlic3pAdK/qC9Zo6hdvmhMawZQg98JWK++nst7j0A98Ym6jn3UxUVTtTX00
	MjVFsXEmEOyFXWj9bHbNmdmnR8aTsPqfUALZvE3qzAXLGJA28MQ/UHlJwXrbPeQlumgDXZCAoPP
	3j698yZ
X-Google-Smtp-Source: AGHT+IEhd0xygk3smLVcBJ8Q0XF+ODeBccVMCXKfs2wtg9QX+UJmXzos7YLlIGj7JJR8tBkppvWJpuq5AtrQgCYmMxY=
X-Received: by 2002:a17:903:41c6:b0:234:c549:da0c with SMTP id
 d9443c01a7336-23e24e2cb33mr108214595ad.0.1753025240740; Sun, 20 Jul 2025
 08:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c187d747-4a47-4c9c-a057-8e8394f3134f@gmail.com> <CANiq72krjY4ieQE0UW8q4kPSegorc3qwKaw-0BZh_0dTeG=rWw@mail.gmail.com>
In-Reply-To: <CANiq72krjY4ieQE0UW8q4kPSegorc3qwKaw-0BZh_0dTeG=rWw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Jul 2025 17:27:06 +0200
X-Gm-Features: Ac12FXx-fQBO_ISzc-9Lq3C4EDbfPTlvAhaaVztSwZIJINeY0uDaXS0s3w2bV70
Message-ID: <CANiq72=fBQi2p4C2QZyF-R2SVViVFY9F6muqq-5Uoutw-7OLzQ@mail.gmail.com>
Subject: Re: How can I get involved?
To: Nikita Krasnov <nikita.nikita.krasnov@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 4:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
>     https://rust-for-linux.com/branches

I just updated that subpage and rearranged it a bit, since quite a few
things happened since last time, with some links too.

I hope that helps!

Cheers,
Miguel
