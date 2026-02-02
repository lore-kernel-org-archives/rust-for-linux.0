Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B23659FF
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042015; cv=pass; b=UdxS12gGpHqEynephUDKWeeYCuAT/VKFHDSTqA8oIqw3AVlWy5BmvTwYib+XVEC+ujjS2kVOPNqWxgMQuXuuWKLYIZ7f6hP1CnN0TbM6CPBVbSAUyf2YH8ubEXVZNlFYwCCVUYU9vu7lSPyj8e8bJ6xDZ/iCMHNjZqIGqJZSQwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042015; c=relaxed/simple;
	bh=wM/nEgpnGOCWqET7XHWWKuy9A9p8+2Acnof+yAjs7K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+P16Ew+4H/qqWKaaCkWVjofNC+3Ocdhv8piuDibA4n4Shtkmr/ZmMVIAi5pGdOHZ3TJjbCulDzG5DUdggdXGXBoVGecDvF09kbiNOFvk6Pq36mdifHJXYcL/ZkaFSiaHBAqP6JWDXeWz5sanxz86G+fbPBVMTtqYOOMLt2KW7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB6d+VpL; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB6d+VpL"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6aa67a792so585471eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 06:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770042014; cv=none;
        d=google.com; s=arc-20240605;
        b=CypOBlP2IFu7SI7j2eCZNQPmQZoXg9T3dWXENhYYpfRjpPzIQQi71DRcWz7ZVPvGiH
         ECnquSVH2jLiq1Hkgxy2rjqc+qCsB9wXb8Y/B85PDrm22XH6mRKdFxWyPIkMMnhpbz9/
         Hkzxf3oOH0EIrZsLjqX8AQsoLRBZe3T91PTz/vzCwh2CGzu1jJs/mQ7x8cSCi7JogmLb
         NyZmTltNeqfilvy4HbtC0ltkx2rqOzqZBprWIJuw6M/1cPzcd1aFzJLObHW5HESlWoQ0
         TpBwlx1821dRi80Ep5D6+4vf2ycBCEtATLVyaqhV8iW8XtVngMVRY2zxkK71eyhI8fNY
         hEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wM/nEgpnGOCWqET7XHWWKuy9A9p8+2Acnof+yAjs7K8=;
        fh=r+XLzTNAiwdVweS8Se5YzV/PbalGbyCRNzlarXODtoU=;
        b=AK6JHhyDVHJSChMW+jgzkLC4Q8u2RnSr+7HpKtgNi7FBQwB33W12DSumMM6oSu8abn
         5mlcJa0lCBJqHI2kZdhsC3SjpD1/7cPyDpnEgB7V9w3xE4yqqXvF2dp6eyNTixitfWk1
         9NfC7nmDUD7gKjNxZnIrO3NWO96Aw+Tws4oqdsS07tNKwZ2zEek79DzVhijemnFFMR1Y
         iy1SAqDd4Zo64iNMTZSg+PD8qw8j0Uf8fh5/TgDuDmjFNMR3adItD5HEETgBMGmZ8tnB
         rZVbPPrujcFL1/wp3gTyva145BM98j7muysy5wSlbKrHLLzD/Gg4Lz9lvMkOOcQ01ycR
         gR8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770042014; x=1770646814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM/nEgpnGOCWqET7XHWWKuy9A9p8+2Acnof+yAjs7K8=;
        b=YB6d+VpLVndS2F5jSwIiGZ5mZXRMsEZ52NzyLeIYke40VRkM/a2/yD6SMTAktboStc
         TdKwy2q4r7gDDd7ydskWMD14xY6WrsWyCgEGw6R/vx2EdkVg6pURqHRbDMhNu4SHw1d0
         AjrmFUoJOKscau2ZHRG30wOgppxiNTFYOHhTbt0pj+IDuySW1u6oGG5f2S+5zeCzDzwg
         Ns3vjo3Je/xj+F86qDJTKdY5irvllV32CQzUL4357H/stjlCf3+rlVRpYK7rJVNXW3Xh
         MLPD4eP0Dumk60mapeoFEgVlncCmzaG/B+5uXIXRQNvQOdoSJKOBeC6sJH9mRXBDAmSi
         wkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770042014; x=1770646814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wM/nEgpnGOCWqET7XHWWKuy9A9p8+2Acnof+yAjs7K8=;
        b=LC0zbw/FaTKRI38gRsC9IsG7DBizSeGlB/YK6C5Rp+4VMlXvpoW0hungI0Icclmj/L
         LUf6UtBp7qi34XzHbQgakKKJ2HhThfVE0y1ZWRsvSqRUVCRLYS94Uua/JdEwfcICShy3
         YAThPvLYvilrnkJfLsz4d+XGWYNFH5NtpJbCadeTZs1MSGFwPtPBeugDG0O6XPiboqAG
         slHjQg+CoJQ3LTFKjKOmF8i8Q93RrJel2j3wun7RgYVQyxOPh0MizrfpVvIf4AykOvDp
         B3YPyJuts0EGamyi9zVEAFk0gvmtPBDapOMc3QqH3tDvCpZG8Lbvgaisrt5iBFkKMuU1
         MORw==
X-Forwarded-Encrypted: i=1; AJvYcCVdDYmV330v4wuGPksb9LFenLv//nUjVPqbIDbwO9XzoK4iJGz8oJbPWwDg+ZyStiNvShIJVZI8xhrMIz0TyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhESF/GeDdrjbKz3C6RS7Wzr10m2UAb4ljyUqfN7P4/M+lZD3
	BxsPoE3/0EPbNSW/gUDs6M4QrJOoXQxwWlmCwsBwpgL56OzeJQGXqYpzuUcWt9bD4CD6Kk1EKk+
	w4y+n/chaCnGR+1z7/ThRjgOw8F94FrU=
X-Gm-Gg: AZuq6aJFsBrwmhFoUIX8xFZP0hsk/HpaE+FfDvykrRrNL0fe6E5Ff3nrv5qO5KGFxZP
	+tf6Yz6AlSx3J3eM68L+PJ0AE2CW60SO4EskamJxQ2Mb7UoKeVMkpUrdK8sVVjGjLtIOqDrYicT
	MEv1YNQPXOQ+CpQEzcG0OqN1GinrJ/om2ZMUxaiXBGHi91QHTwtc35w5j7y3P+ntHN0CCsT+pXT
	03N/m4jlu51xdESHTOuXM+IE3dLq20qTrd5Im13U+ZiyXQQVon2bjCp9BNnVQ3GVsn3dEsorX8+
	S0xQI2iqiPtYaDHWYXLxWHyVqNGBHSZ59zsGP2TFYE7ouFjBceKZNKzzNO7lp3KmYFJzAVNQWO1
	di+d8qhcuy/pY
X-Received: by 2002:a05:7300:324c:b0:2b7:fdb6:ccb8 with SMTP id
 5a478bee46e88-2b7fdb6e6c2mr1009326eec.2.1770042013675; Mon, 02 Feb 2026
 06:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202222144.2689495-1-mlksvender@gmail.com>
In-Reply-To: <20260202222144.2689495-1-mlksvender@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Feb 2026 15:20:01 +0100
X-Gm-Features: AZwV_Qgx_RIbnM_0D3uzu7gXacVbYsV0aTtLtP-AVYcSyJGNPqOnwINelwrn5Hw
Message-ID: <CANiq72mD7ODa1n67vC-iPq_GKBZkDo2Jyt8fbgrJRPEfQuA4YQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
To: HeeSu Kim <mlksvender@gmail.com>
Cc: ojeda@kernel.org, boqun@google.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 2:21=E2=80=AFPM HeeSu Kim <mlksvender@gmail.com> wro=
te:
>
> However, `fixed-x18` is an ARM64-specific ABI modifier related to the
> x18 register reservation (used for Shadow Call Stack). Currently, this
> workaround is applied unconditionally on all architectures, which is
> incorrect and may cause issues on non-ARM64 builds.

Could you please elaborate on the issues you are seeing, e.g. how to
reproduce them?

The flag is only used to silence errors from checks that were added to
`rustc` and it is ignored otherwise (that is why the workaround was
written like that).

Thank you!

Cheers,
Miguel
