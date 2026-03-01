Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF41F09A5
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360243; cv=pass; b=LB+IDwp+VO8ldeduZE5OvcLbBzhXUDAuTSWYtfgzvCoAFaT/1KpG25wvSrIFVQcB6oGos0inh5KSP7fewmappKEMBaGBr3ErI3wPy3xEnmHHOVotWELB9wR7VaPyrjgYNtYOT5XsnOCSSnDENwtSKCn00do73d4YvFde8E/rOrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360243; c=relaxed/simple;
	bh=cPv/GBYAuzG7l24u/mN4pb5aR1YQfHvPaGaOU5fVuuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDvl/rTBQmsFDzeGHK1OXQicftc81aBDPF/Q//qzSRqF8eigt76cBGlmgG9bmoFLQzUWCzSEcXZLEdsNjCqQZ5zr8nan0XECpgKJZUjfc8hNXkoOiWq3q1Ztj4uPD+gasAeaqQkQNLxN8NZH6ZZonxfli6CLUGpc3PejKheynZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPhrYxwA; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPhrYxwA"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be003f2d80so24822eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360241; cv=none;
        d=google.com; s=arc-20240605;
        b=WzqcecCBOWXj+oef6BhzdJfU+n6il994j56aewa7ZVLJNGW45keP2xQzB47e+yseOH
         fZ5aDXdIMN3gQVYrQE/bKo85JDUj+i0gla/OzmE/vDZIAhLEgdpY4xDKkuAhzRFKf6mT
         dimvVyy1vXxp5TGoW6/ZEPZ4SGIoB7kUxnWj3cuEkOArKdN8kwHClgzR5fguDgrCPa5a
         GFQn76d4jjNZN36jW1tedwuV2nqcaLMDaZaG5VlGSdB1K5LlwojRhAZNd5NJa+2InCBX
         KL4i6+EpQ0eCv4qABpBMb9/Xg+7eM1PPSV1grtqWHX+iQS6kk030UEPgEIVD7snuSdBA
         EeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPv/GBYAuzG7l24u/mN4pb5aR1YQfHvPaGaOU5fVuuo=;
        fh=7AdvDKCD8vpzEQd081EZZuoRTOSEfp4F+KooWL9R9zQ=;
        b=jkBzsG1cNsgRuN9wWnIPoROBvmbR/STeiP8yubLC4RQNvJXsK/jFtYaT4dST8CkcEJ
         fIN+rA5CKzhdn7oDSVaiBtloLVPfJU4NHcEburkd6av00YwfnCqu72ZlY3Yq86+/iDdT
         A3k6E08Hd1K8SbHiHSJmFmjZibcMU+32NIKRlXskoD9um05l9zc/d93Pwu5SmABnRV3v
         tVNiUCAcasyGyb7qjsKJImwfI29qLD92BgbwhaSlviOd+MGgDXvhEeNwHvWaVK2907wG
         X1G9lAONGdOHUYVKxtJkw0SWtGhrdi37UWTVal1vOpEoEshUvkBObB8o5Lth8cRJMqYp
         fojw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360241; x=1772965041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPv/GBYAuzG7l24u/mN4pb5aR1YQfHvPaGaOU5fVuuo=;
        b=PPhrYxwAoHMuWg7BmWGV5txSeTfhOjYUFDbIRK1rCDxcZT17iruUai9yFT3y6o8Tah
         5I7h+2XYt471XeTtfuK7W1ufsX7jMKKe+/p5LkbqsW8OvPW1mbjhp081sM/mpfzXQfLc
         ayLW8WiNOUV8CKz+IDORJwvnILg2nIiAwnlKGT/FQ1HWhM97FDCQBbJWvRC8ahdNgnhB
         REtw+znMXWog4fFi7wna5FrUXAZi0C4IJEcslhBqovTwMeQqXFU2Um5F4NB78rxaepaI
         TO6mO00Bzui0mEme6qwZ9wiLmqF5uII0e9shGrfj/0T2J1fbrX+Mc0W0vwjYPpiMq1+J
         sdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360241; x=1772965041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPv/GBYAuzG7l24u/mN4pb5aR1YQfHvPaGaOU5fVuuo=;
        b=svN6A4QrzM53NwlLzHESLlAy0SB4GmXCmby0zsm/ib8agb7/AQC1is3BEEf5z7HFH3
         YvlEpKg/1X6QCy2FKs9Sspc5bQkKGRLTrSioA+/8grjqhWy4xTh/QKyxLK684xBTRrVB
         PajeepSuUgaqlUg1470v1VSO124aDWLHvlZf9T0rzohHaZ1PhhCj8RipI0F23crSUbms
         Ybbb1VdgJCOtLjXozTeCwvRfVhA8w6+6thNyCg/4zpqPmXr/8S/b2U8yfyg9txumZtT3
         trxXpAgtlN9jS0qYBv0F11zVOt1PlwGK3+NV5OZK5yH1tk0bQl4Hu2Csj8Pu9pC9Ikc8
         0wew==
X-Forwarded-Encrypted: i=1; AJvYcCWVNSDi4P/XSF6u1fgCrtGvBbogiQc3OH8UygTil4Z5jxrwBQb5AjQ25jO90kAtzUMhlCVyZvOZEdxENTRaDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVcQVOQ/hydiiXiQACEYJQdAtwsDRtJsBWWFGKntUD8koLkNV
	OYZ+N758y7Z95Ry+plrcv9+0QORUNVOXBeVnjEV8I4o3Roi8zdMsrbw9Ne4uHsvz5bFJHlq6xL9
	N8/ZL/12OMvvaJMJOSqrC50XyjXVmDT0=
X-Gm-Gg: ATEYQzzBqbJ66yRvcglCuhtMuWPGhuz8r8SqkS5wrV5GIxJcHMULN1wYoOWCcKiOfns
	Rz0KDEefUt3PmMLepD8vDW6zxUPfOroelzsBrgavwOnR8xOJedfF/xO+d+1CWigT+hWr86WXIGX
	77qT8M9zzmsF5EcA3I5xHnGIO1iNGgBfqKR0W+edruvZpEX2BfgP1tlfxstdef8ifSl1EKoGffF
	XRdGy1S2ZdWwkwRlAvIwP6YfDhI6gzE2VfjzlWrdBwHrFAxLD13I76dzq+qolmZqTsFtWE9GTVc
	7uNFJ2/bA02GMlEFmAdsj3qjsXZZeAY/nZcO+Qq2f1VO7TCqnKVE3Nn3U9j2NFqb7Ayi69yYdf7
	X07zUopHZIQWVn4scd6XFmDbcUEL9
X-Received: by 2002:a05:7300:5b89:b0:2be:ca4:e136 with SMTP id
 5a478bee46e88-2be0ca4f0c9mr100775eec.2.1772360241435; Sun, 01 Mar 2026
 02:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301013801.1698337-1-sashal@kernel.org>
In-Reply-To: <20260301013801.1698337-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:17:08 +0100
X-Gm-Features: AaiRm52jYc0vjYJgL3xYEdwpIE8wMskBgpRfrhLlJoJ1O7X_jNkvuuuX3Zq7Y1A
Message-ID: <CANiq72=WW8MtuS=Mi5gp1S4J+PFYNLROUMprFuJK4d3An5zrRg@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: kbuild: pass `-Zunstable-options` for Rust
 1.95.0" failed to apply to 6.6-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, ojeda@kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:38=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.6-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

The Rust version is pinned in 6.6.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).

Cheers,
Miguel
