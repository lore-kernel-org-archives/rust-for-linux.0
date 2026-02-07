Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49F25E469
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770480457; cv=pass; b=Acw31OvkwIWac2Is7GQLvODWWBMwzlUeHucDYfANFBWiXegS9FseR3XmlgoMahAETWI+q7oai4Q/4T11aUm/4sy1fgt0mG/zwGsS4gZUemJUITlQgxz9fsIEn+zdkmXVlKB4W88IbuuOlRhElmFqjAHRx5+JINXjTYFAjN9TP+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770480457; c=relaxed/simple;
	bh=anftC9EM0kWxitza5qjb1E3hES8y6tmwI4vTMU1hVf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdtA6UuweV/vFThMoHh2oPFBkjUJlAbrJRK/KAKx/mvslPxhquIZXxs/yKN+5QudYxE5cek1k6G5rthnuKgZ9sy/ygwBEOKwWJAIKCxHrxjfrfuIbvVKHfMiiiJUYYKesyeCJUTeWEpuBJh4eAWlOqoYRKychnpWsiFvnwkte/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdgFWfQO; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdgFWfQO"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b718524994so150540eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 08:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770480457; cv=none;
        d=google.com; s=arc-20240605;
        b=SarSQw9hthD6QdS4wAVeeMT33/YzfXUHtMvYCIcgPnmxAA8JYX3jYLtfriVVKhxT9q
         VCNaG8xI/j2AhkbfYyzWn1KrSqj+bn5e9HwVznKGP5Kq58l4mtHfJbtQ7HKFEqY/oMmJ
         qkZP2VvDwRRxqv6+XrlnpO6jOtc0li2EpLxQ/MLdFXWR3CVAOISg4tNbmRlhIzm/J7M6
         Hl1LwHWptA9+xno6E5kAI5TduCBQcofysyr1SeAaz5m+stnd/WpFSmML2lTLWJ4FEbl8
         u42YOBKJwgox1qMTtQUYO84bgJX+jeo/dq/mZ4dXiagf3yhwwT7yCwety7oqejcE01sX
         NA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/xLTHLvhH4ABVQGZBZII3nj5w8X7CQj+pCAINiTFMw=;
        fh=aZWmkU42ZxUm8cyqvOyvO0pXEblDSEPdEpK+vxNrgsI=;
        b=lpPGgzhWSEcek0I5pKcpYDWdw//ZJiYrRJJzVBVvzBLfaWBT5t9xPbIBuSoDxGxG4D
         zZh6hbX0CqBSJNLFLdgrj/i59t7tzqHeyN1VMXkJBxIh82m0pt+l4chSeOqkVZzJD53j
         cIkb/DVUXjbsYzdeBG8z4fY4OjUpwTUXw9ia+mfUihD//pFfZg719igvr9Pl+6yhcqZZ
         LQguHS8ScPt0ljU3msM6gh3SlI+oRyRZvY+6hJLIU/DgslLRg7BpciBee8FJS8d1JA5C
         20B5X+aP/gz+076bqO6OsFKwb0XSphqIEwM55t93IDYto1lvj/DiZ2gTs/2t9AE7yhOh
         AQEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770480457; x=1771085257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/xLTHLvhH4ABVQGZBZII3nj5w8X7CQj+pCAINiTFMw=;
        b=CdgFWfQOWuid3e3cJ8QY1fVENiUIfr9H6qyWNIGp1NOU1QXrbRcdifLcKaMjzH2NT4
         KwsP01BkhhyKRAD1Tb4VPrBEZc8rfSzzsevv9xtqWlUSZsoR0u93L9X7lPS/cwncJGIb
         inKywqUvGTqTtWRInQXV0A4uUl4uk4N5r3PsZf5P/CYufzC+O7XIJ9dsbBBJVVy/HAvS
         /QQlHM+oIMI5T6Ltoe5SFyJSLw4j2aLKvip390919B1fFrT9+5sfs+O4TdY+b7qOntzD
         9VJO6moBnx9CH56+cT41IPPmcRHW82UawZvt07K5KRCaDGFG4/juKtoMmpoeouKxA/0h
         Jv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770480457; x=1771085257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/xLTHLvhH4ABVQGZBZII3nj5w8X7CQj+pCAINiTFMw=;
        b=peh9zYpFdXE5Yi3dxDKCa/UMtBdDPAir5yja3b1LfoBg1r3Axho6ZAs/QSJsUQ+pnH
         7Wglxhji7eNaTcQKvvX+XYb30P60Ww4TDE5qP6Y9iLpPRmk+YB8J9auNP4uX1oyiozgk
         NybojasTLKbHF0n9AxhNJ49WB4HZdrCD9K8t9EJEls12gSWuQ5Qpr/wCKzfbY772WBqZ
         r4BajHSJa7gD48rXJ/FGJ2OaGB05FAAnArviUNbNRwSbY1Dy/ASvAoaBPNWB4jX4gnh4
         d9L12KxFXn6zbkiE3tIlpUzwl/bIxNjAlpLZWrKKiemvcYrvhQ/LJsChP/VVbmj+X5vx
         tSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV36sMO39Wqz+JFVDF04VyP4S6JTSZK4mOsRiGFr2nhl9XZIWMvDppFiUqOh9zxeIAYsdscApR/tMSLS9iKKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHdMehrEWik5RHFSnY4vKm+Jh0nStguQapxqz1yMLN+kG5z04
	Z4WbtRq8NyFLbDypAUUlvtwaw77rDZ0d4mUwCMHH5YtP6t+ODbzSAgq28gCvbeA3855RQ0wvFvi
	WHCahkB6XdtY2t9R5+m4C84f1gJDK3TQ=
X-Gm-Gg: AZuq6aK4hZxucl2Oklt2KvUstvcfpXxGHZvU8F0yCixU3dTzkTSW37/t6Egoiaf+z04
	CdIWqF0g6nLZTKPWesEcnNRCHr4Ex6ewtiPj7WT8TIimPX73kdfGCzhB4ZIA3rrin26cFfv//8j
	t7HAzEinlZEoDTR7I6J4jPevoslY06w8JSCBnPXXBTAsL6T44a82K9dlwMvCZYX4dWjDgViROa0
	SkUlyjDrVqBPSCaHNcXsE0eymaj1mwrt7UkrF2Tnq2GngPoR5d9bCHumNPOKNi3JPIK+ZvPMNbm
	MkuPuLa8HoQ6lE7ctTCGsKGch74pPSHCwnKXQ+shFjqc1g8qVAHLviXYM91YTVTbN6TdIVV0tP9
	zBsCmN/QxNhzLMLX7iBAy87Y=
X-Received: by 2002:a05:7301:37c3:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b856d709c3mr1468345eec.8.1770480456780; Sat, 07 Feb 2026
 08:07:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=68-daT3J_NVvp+7NkGFWFPGQmwoXn4m54VYeRKPUkbA@mail.gmail.com>
 <20260207155627.122810-1-jason.kei.hall@gmail.com>
In-Reply-To: <20260207155627.122810-1-jason.kei.hall@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Feb 2026 17:07:23 +0100
X-Gm-Features: AZwV_QhSbFTOypbrwrXobPDV2vs4VLSBuQHptGA0PoPmBtJREejJKHQSUcvga1Y
Message-ID: <CANiq72n+C1xU43ZjiAE35rx-NHWAOZyNHK0_kuYAGCpo4BkU_g@mail.gmail.com>
Subject: Re: [PATCH v6] scripts: checkpatch: move Rust-specific lints to
 separate file
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: Joe Perches <joe@perches.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 4:56=E2=80=AFPM Jason Hall <jason.kei.hall@gmail.com=
> wrote:
>
> Link: https://github.com/Rust-for-linux/linux/issues/1191

I guess the link doesn't hurt, but the link is a bit tangential for
this patch (unlike the other one, of course).

> -# (c) 2026, Jason K. Hall <jason.kei.hall@gmail.com>
> +# (c) 2026, Jason Hall <jason.kei.hall@gmail.com>

Unrelated change?

> -    # check for Rust unwrap/expect
> -    if ($line =3D~ /^\+/) {
> -        if ($line =3D~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
> -            $rawline !~ /\/\/\s*PANIC:/ &&
> -            $line !~ /^\+\s*\/\// &&
> -            $line !~ /^\+\s*assert/) {
> -            return ("RUST_UNWRAP",
> -                    "Avoid unwrap() or expect() in Rust code; use proper=
 error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $h=
erecurr);
> -        }
> -    }

This diff seems to be based on the previous patches. Each version of a
series should be a rebase, not a stack.

Thanks!

Cheers,
Miguel
