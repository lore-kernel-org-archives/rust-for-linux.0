Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F29345722
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162487; cv=pass; b=OwJtGgRg3YHqFNoso/9KA6jmISvYWy5tE8dhcrNrb59nQAiXsjUd228s8ihxAa07ISDRmzBhrvLErlEpU9Ecq3qJroK2YYYIl/zVbnhMXi4H51UE33k+E1lVG3bWjjXIpIkUOCjq4RYN/FjkycKVd90Fakx5YpxajUcdI7/OTAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162487; c=relaxed/simple;
	bh=vRLuoPJ031UAZWN4QPV7k910lvcIIc9RzqczqIIuuU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvEhzS2TUVgMYvfrkKeavAS2EftpabpOrqO0rxDQp2clutlsUvkTu9vGnLq8FROBCTMxAdeWwH1iuDWIs0fuUNeM1rYunyrLSws9OJYeaor/oBwSvrgxPBOKRdD6OrsPBjMWZVobg4y7iXXDcvwaczlHdJVaMIR3S3YJz9j9mC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUAHpIha; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUAHpIha"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b7063004daso92230eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 02:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769162478; cv=none;
        d=google.com; s=arc-20240605;
        b=dA+ZEEYEWkuLKlQkf2dMGh3+x2i9bUIpxX1kWzUAyMXICvbrBSNpcyaj8BXwlVBYAt
         b2lh9eBGYdP9Kws8n+I6MAGmxZBdEFofChKV8/DFNG/Abkv3Yc0UDmj3RicM09EZYlh0
         eJ27sTASGeAthlyV4quxbvC+ot7qRFuIwOPv3hHgyoHNuTzvaUINl2r9x+LMQ1WZMmlc
         InimWQlkWyuubJPcqJLJ1siACOZYPhRoxhN9ARcLZgyAUsR5jsEXWiVm+FYg4zYBysGU
         NzF1pqAznHXIB7gYkpJPFoCthjXQZI3ojDV+1V+RdaE7WGe82E/n0CmebIcJEilHWQUi
         w3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZFrnxXmdXYNRIwj7VVQnaRXm6tfQtPnX4reBcfHoCE=;
        fh=3PlKinxHu8PoXSVE/zl7RDU3ooBcf3j+Ipz3Qf1Lp1A=;
        b=FzL6HB+Wi+KshOLeunaVotxMLLewb0fNqNEbGIqDewDJIEyFoFADi3dUQEKtXHW11U
         gK0I+wLot9FHu6FECAZ2DpnoThX6kNfgT5h5dHiOJKMGXz1VTCYGIBhOQ/3AemhyQ9M3
         8IX0zKNSlM5RERpkqEtIDtIWgEZgJQR8md+BCnPzy0sUnuCYWXWdD5vK2IXyIPNT8WDn
         Bk3G4J2qdQjr/d1Z3E09Kp1me41TlumChDpJxuld+2U94O7ubTbCu87JWFrShIXz2vKB
         C5k4c3JLYA/mil8mK5BY2h6co/bEbAyVk8bCIstudRm5jVkiu+TMvhYxAuADJY2s5s7I
         fmYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162478; x=1769767278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZFrnxXmdXYNRIwj7VVQnaRXm6tfQtPnX4reBcfHoCE=;
        b=JUAHpIhaDlqr1DKFJp43YAPHbpX5+kky8ovfWGZo6n9zbTOod6ifoFAUYnEEUIh7Jn
         OM6H1wzvgNUk02FhONE68JX9r/RpcOVpB95RNsS0J1ap42ZjmvkH8chNu6CDwfoHAIya
         Qkfy4nStofs6FqVmp+DX3OASjkXIdZ3qEnIjeDgThM7AzUBkBv6eYlyeby5bemvk7CkZ
         RbO1wZxe5RHsmSfqp0r1PV0ana/5GD9XqHESp66S5ArQ9EfcGBVWBnNV3iGhjQIs2QSR
         MTMjn0RUKN//yLfc/8E7cNpuV8MjGvyG9Ibk2a0WxenlcZFGDvorEcSyEM5rLiWepLad
         DOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162478; x=1769767278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZFrnxXmdXYNRIwj7VVQnaRXm6tfQtPnX4reBcfHoCE=;
        b=A7xdUm63LeysZoPz621mCu5EmeeAbdzJdHwsPZ/oaLqRrgsau39crhGlbfglzftmcs
         AjqeIJg2bT+hSaGY26VZkBeXpmpjTwXthsvYLdYIIG3uptPd9Dw34gLadBwXJQ81eQ4a
         uHcPXuL/CUYeYaCOOb/NBq8UtJZs9NcAgeFRB9zxEGs1BbYk4OJVQUCG6SHFaKjYUFqs
         QVZLWCOk316CYOLUDwL85b7uxcjMFgnY1mIZ5fX2swC8sytwzBXem4uA8cMjJluMEiC/
         geDTeXWbNnHCc1vIjIqll+hv3LkslbTlnavZwFP8J1IudNWHZJRxWV3PbzaB5342VWAr
         CE8A==
X-Forwarded-Encrypted: i=1; AJvYcCUrBJ5WEKyoJdfIDkT5AMFFTbDphuIKCz7e3h3o0GT6M3DsUWYtpmDLBxQAOekknMO/+Q/8L9okPLzF/urJBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmEqefQa6GOh1MCwvmUBW6wqzTvoORUvNL8PJJFe+7BZxnPQr
	xdW8NLRTZh5YTPvT6UBgFlgu2hUhrEfqjCxwXFNPDakgNrcHSdluyCshf1E9XzOjWoH29SdY7Ih
	9PP+9WdwZEgRn3c3DOkgwEh/JPHuvqKg=
X-Gm-Gg: AZuq6aJ0Tr5diw8o00o2bkal8F6zEKAwYBjKqKMSd28RxI4/HJsU4sFfLsvquG95JL+
	IRFKTV7vJYFwj6EflWAmib4j6hq9AXgvsW+p8oI1xWy6cTmxeuDlUuFu5unWrA53L7iv5X3ehfM
	yIBAtY9JgD2xa23hP6O0+ChnNLw75EFp/niINUbOCh2DZqBwFiF7D+uiRQIpC8u3GFxGUUOoLh1
	JipjifnN3OWwf0GbZ9akTtENxCenBJtSmzRmJmPb71zDLx7duuAWnSHg1PCNVsEu88IJQ/5jfE5
	1xFhh7mnNFNtpa9W6laBxLPSAD0XLj8RkMJNjKNzdEQ1sfPeD2GVAaxxOZMVqTYykQbMLNTGkCl
	LyBRNzteOf4rp
X-Received: by 2002:a05:7300:188d:b0:2b7:1c58:dc9e with SMTP id
 5a478bee46e88-2b739c2e859mr630658eec.9.1769162478283; Fri, 23 Jan 2026
 02:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
In-Reply-To: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 11:01:05 +0100
X-Gm-Features: AZwV_Qh_W2bZS3WbgGysf03vXGms7ROFVo2ljMLWhAL-NMot2CzariPqkFDA7Rk
Message-ID: <CANiq72m2Qk3EQKiPSmBBXwh2zeRBZvVR=QqKodbmj6LFs0FU-g@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Remove the product of pin_init cleanly in mrporper
To: chenmiao <chenmiao@openatom.club>
Cc: tamird@gmail.com, da.gomez@samsung.com, 
	hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 3:32=E2=80=AFAM chenmiao <chenmiao@openatom.club> w=
rote:
>
> When I enabled Rust compilation, I wanted to clean up its output, so I
> used make clean and make mrproper. However, I was still able to find that
> libpin_init_internal.so in the rust directory was not deleted, while
> all other corresponding outputs were cleared.
>
> Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: chenmiao <chenmiao@openatom.club>

Applied to `rust-fixes` -- thanks everyone!

    [ Fixed tags as discussed. Reworded slightly. - Miguel ]

Cheers,
Miguel
