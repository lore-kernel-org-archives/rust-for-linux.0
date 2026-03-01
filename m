Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B62E7F11
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772390396; cv=pass; b=Ooz2vWHgta1agJZlS9+d4dpZ9BKfGog3vO08vVPMdnsffcPl5jH7LRjj5VzhaX9xzcFIFZ51PUyZL5Oob5qRE2N7bzvKHa7CH+x0EuHaeNOCRthncrC9dwhdqe++JpNPK6q51N08q74Hqtr88u5Vw8oVP/DSwCuZV7/CoT+hp3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772390396; c=relaxed/simple;
	bh=1om3Q1j85scc6BJunqU2D2cL+0qG4x9JCa59bu30MXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjoZDslVwU0bClsDwj33jMSxsLuKtPBNGVjAtDjOhXGaPIA9fy2HUUpDsxWI/8y59XV2qvgdZK7uMovt0aPKyR3FRKSLbl4unTJDpGTX7OTtXxWlNr1vM0eIxBghsjSsjMOdrw3lS5OfL/igkAsTi/fu59fr1ghAzaosmC0bdCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVv0whqT; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVv0whqT"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a5810e41so236131c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 10:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772390394; cv=none;
        d=google.com; s=arc-20240605;
        b=aoqWj72yvMbnKLTYjPhFu3106xQBUTYNp4fgvHSO6bmi2EN5AALq/7Oh3jCK0pbICW
         YXM+DgVtCwL3M+1fJ/Ndl+EwTrGmh3re90FLGiHB9FWY2TwayZMAHYxsIqnAYhFzMPgJ
         vbZxaDbMA8qxsTE0g/4eu++pzrStOYzwJa7tKWL/0UYdlrEa3XAcWggXQ6yakW6SVFIH
         4VJVQVtQWbzvI903pKhJ3izVwy7nyFMOJ7lpeUIeNa2rkZTMD72zJzMpV3Gxx2IYA90f
         XEkd4vL5KXEe5zZXgfw3vVOG1pMX30LWZrH/2r3HzZo5PucQv3iXwXNCZ6jmwqODSBLe
         aWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1om3Q1j85scc6BJunqU2D2cL+0qG4x9JCa59bu30MXw=;
        fh=3TbL3PmKBE2AV9+6ooevAtRioZsq3ZL7hyRH8g3Tgko=;
        b=cZ4zTUTmpQCCY0UwhQvfswSnqQSpNd1jduk+IyPXQC5dQhnXya23bs+u8uzJRuKz1j
         cWE/6Gim374azJZ91H/G4BlftoA8OsBsvOZysb3Tw/cQIxu6f+oYNhGTBFLX7JMoT/X1
         bVfbnqzIBZEwVLKnfSiCZ+GQo4H4YtxEcF9p3c8AGu/TxMtJ+R/5IqBgZNJYTGRFOreH
         mob9br3wX5QfYnljvG8uXrNiYmncWK93yafZ3F2J161M6vZx//gpCgw9S5OkgucUj5bB
         8H4uW4hoFJ7PiRLLRWnWMWyJKcF9Ilf4QS/H3DyIGhn6U6zzJxWCmMHbEOz2bBjmhkXI
         cOsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772390394; x=1772995194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1om3Q1j85scc6BJunqU2D2cL+0qG4x9JCa59bu30MXw=;
        b=HVv0whqTb7UVGiSATDvPEsXy6q0leAo0WIagPFNjkcUKaSqLTfj+hackUbqj4fd+6B
         dLoFX/t8pNTLUxhF4pJBP9AWJBbJSqQOKLkjP8/UN+0sjHEj6gBHNFZHx1EAEny3FFhh
         ljDyWVwLJ2NFN6XuKqt6cCOWcWlkEQzuBoEmAMqjso6JAAHz0/iJCNZVgyuXa/4++cB/
         vD6gjOuQ/1ZAKMoI4/IJtpzREtKKEbF25G1U3vwlnM0//ghSlzhyHj4AfC5I4/cEUTo6
         TPW0tHUaIFimyrJKWrreMRzbgsdkfRMS6TOjskCcifA7Af8qDIzkTh6Wokv0OWO0U8TX
         PAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772390394; x=1772995194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1om3Q1j85scc6BJunqU2D2cL+0qG4x9JCa59bu30MXw=;
        b=A3nrtCM6njg9QCsvR1b90ShO9y3ql+y7pUc2APQv2A9JE2jW+ayobXT+UogIJXsGqS
         HYuinyTX0N420gL2nxZg/LBjtqnSj/MQjO9VlO/zACuRWFqcW8wiFfSfpkUeiBABeph6
         8gPgLmV95xhnprxvY4UtidF9l27RtQpDurjsW9OCFXIccM+/1wH4wI8hTRtYUHavtxbv
         Y5tkNoURZYX7kM4XS0oJe/R4QfR5rvxCfeUe3Ob0Av6OplUZoEA+EnU2lN340Pj4bWnZ
         jTen06sLEdjZIoaMTKP8AiJAJ8babgVC7rdUSXheEwrJOsorZ3/Xr1LVUoVxFcoE3aTN
         ROsw==
X-Gm-Message-State: AOJu0YxcIR001h3u1Mqxp76/pD6zbzX6iJ6k6StTPEz+AnjtUm4Brssb
	wgYYbE847jSsIBuGqeaOpqyCd9r2XTO3TNDdWXxLOfHd4p0VqtDOVjDgsmTZz9VjU/Tz80ILIfp
	2KnmWdj2vZpxMALp69dK3rknSIWd9QtyGoSSP
X-Gm-Gg: ATEYQzyD2TsGNYbXYJ7NBqSfRQbrxvsTfiv7eDTtrhF5FW7TCkfCgm5hP5bptnoKon1
	5UST7StZND/m0j+16qpeGqyxSQtTp9Duw5Dd4Z91NvEtnTwKfahkst5X9sGFq/Me3ltTpD8a0Tm
	Dphlm7fyKsZC24ZBC2lVPMmcvHoW+nc/E1wJHnyBLPHsrbUP0gWi5r21I1ublmMafkZfFJvCLaS
	K35czCCFnZ6vJzufmdoA1mTDzDQwJrnDnMGW+j7g7S+nvQA/2p4muwclxec/RRer7OhYR+nAxPb
	hXUwJQLhvRMTWvw0J9fac+hoCi5fd07IClsBH21j+fNdDujLxPsHGWgm8ZFPj1IBAuWqiWu0Bi5
	s++GThxA18Jp4WdDn25i+V+NpPaDz
X-Received: by 2002:a05:693c:408d:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2be068769d2mr419351eec.6.1772390394451; Sun, 01 Mar 2026
 10:39:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
In-Reply-To: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 19:39:42 +0100
X-Gm-Features: AaiRm50z7l9VJpCYQ-8_GidFa9EW-br5bBrEhWvDNtKpxUPfP6FPU4GjIAQXsSg
Message-ID: <CANiq72=-_cCY=k77ok1Nu7ejM7b3MvrF90b8AzS-S+bPwaznew@mail.gmail.com>
Subject: Re: pin-init Clippy nightly trivial warning in 6.18.y
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 7:30=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Anyway, it is just in 6.18.y given the `syn` rewrite and not urgent
> since it is nightly.

And 6.19.y since the rewrite landed in v7.0-rc1.

Cheers,
Miguel
