Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B021335547
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580396; cv=none; b=jzChl6goDif7AzxGT3gFHhoUimP08ChhXWMfNKZSHxCp2MMvhg6QGckCcqLVDjMVPJagAKOpmpCyyiE8QqGB6Rx6gr3tkQwPLwHY+2Q/rgkL5whYpcUPOKXBeCo8lDa2az7CllEUVITJ1aCFinhfW8hZVAW3Rj5eMrG5CFNErQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580396; c=relaxed/simple;
	bh=GCyS+xU1BvBzvN6x7IyhpFE8pEgz9qXTKOotxVmmgbk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SZFvcQtFxjBzZZnPEvvfxv8RgUs2Td1wSvC1WO6Z9yUwgyWGCSTqIjFkSCvjCkujboZMGfSvTaquZngKL+DhGgNbmRG4YAKYXNwcs21Q6iK5//fGqhNDnx3Sv2NKquyN/TC8iTvJA/GGxtZLqtM39BQEIUgMoqkp0RRE9DnMnqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFMWGGQ4; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFMWGGQ4"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a76f90872cso33812075ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 22:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769580394; x=1770185194; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isdKh/tICJuZmXBfC27r52WHPLEGRtitt/l+6A+3IHk=;
        b=nFMWGGQ48PNoo4ZPXTIGYgTDEoJn3rsT83Vk6P5ilIp0mLxMBDgbn5zHnT9WkedIi9
         kKuiaLLIa9oFvgTTpMwkne6EAT0YdUSD2+f27TU6tbLO9Am7k4J0eGoFw9Zq2Gpm4K1B
         Zs388XTs5gmLbbuQnAeDGkcVLibDzRN8LB0Bud39rFwKJR97YGNBnFjtEpom4g4Yxh64
         j6Yf/ugezc/S1xPz27d6kpA7O7QxuOTLtHXrsRL98qUrff91c2AIb5llrXDXgYXpzfO/
         R9EbS90xyxUI2V8EanF7z70kFshltPEwxXPBpwr+pLMIosoNYnT0TJ445kfvAhB/7+ZJ
         oPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769580394; x=1770185194;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=isdKh/tICJuZmXBfC27r52WHPLEGRtitt/l+6A+3IHk=;
        b=lO0Yftz0cf7G2lHd8DUKJq91GZGqsTlnlV8tJc8tvr7mcacqRT3B8IEtxb4kgDcLDg
         jl+GFcVLkbB9uxopjbH+mffUYUr5xmfx15GwLARIErBrvksYu7lUQD02mk0lnJnbsAnu
         ZAmUdkVKN86k3CQMvnSwdrpyE5qkUyoJqp89DTSHxvqxKbFeK1KIFAcV5htNo8p2/GkH
         Ni1QxCZ73OOdCaSn5AbPn7vVrhraBf1vqbLPWCGTIc1092QZyzev9YjqjXuAFZCtu0Uf
         Foq8X+LlcuiId/peWN7qWIFZgIxPYpUPy7mFeBcT+x3C0Eza7z+JEGdw9+wbirVWRg8q
         VEqA==
X-Gm-Message-State: AOJu0Yxe9vv+6Wjmi6beKOScUaRCIzCkLWLpxc/aoLsnL1lwveuuSsuy
	O1zOxopQfTAiIsnUUxvhc67a2Em6S2WXWmIOThDc81uE9G5r70UMp9wL
X-Gm-Gg: AZuq6aIJQYWelM93fX7H3RtIrloavzexu8dN9230i+JdC03/UzBscuLLAjAPAzMQDqO
	/jdEDoG3e32VE/VbD+R2lpNGGOpmlBYiYwwiwRy72Zs1rit38jsV+nz5wfuzzmtVKLtI6yCgxwf
	ISKoypLA+vVdr7brCnE1cyUTM8AKusYgmIms4GA3xtRVin7bu3JBquUJZmh2fycEAPfxC2QZK6l
	aKvWEMcdLkqb5hHSBNVPKyfIMO5CaW9oWiBUeAEReHMZz1RWvS8NRG/AehVMlJk6O+jDTS9pJeW
	2aPgpD650Gm57IKo7+mUPj+0mhrazO5w+7p69oVzVm7vUSLU1MiKdRlg34f/m1VVb1cAt/mMTrH
	tZyso/4Qr/op0bxut9HWvBW3TA0EQnIo9+WlGBezYcnkgvBVS4qMwNtFZP0bTx0YR+Q1Mp/2Y2u
	pU6mjB+w==
X-Received: by 2002:a17:903:2b0e:b0:297:dabf:9900 with SMTP id d9443c01a7336-2a870c3e2damr41851935ad.0.1769580394337;
        Tue, 27 Jan 2026 22:06:34 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d9a7bsm11049805ad.79.2026.01.27.22.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 22:06:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:06:29 +0900
Message-Id: <DFZZW8ALVDW0.366DKMF7NGUYT@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Fiona Behrens"
 <me@kloenk.dev>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add
 type hints
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Jesung Yang"
 <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
In-Reply-To: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>

On Fri Jan 23, 2026 at 2:30 AM KST, Tamir Duberstein wrote:
> This series adds type annotations to generate_rust_analyzer.py. It is a
> subset of an earlier series[0] with formatting-only and drive-by patches
> removed (I sent some of these as separate single-patch series).
>
> The final commit leverages type hints to tidy the implementation. It
> could be done separately from this series, but serves as a nice
> demonstration.
>
> Link: https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67f=
e5c38a@gmail.com/ [0]
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Great work, thanks! For the entire series,

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>

Best regards,
Jesung

> ---
> Tamir Duberstein (4):
>       scripts: generate_rust_analyzer.py: extract `{build,register}_crate=
`
>       scripts: generate_rust_analyzer.py: drop `"is_proc_macro": false`
>       scripts: generate_rust_analyzer.py: add type hints
>       scripts: generate_rust_analyzer.py: identify crates explicitly
>
>  scripts/generate_rust_analyzer.py | 256 ++++++++++++++++++++++++++++----=
------
>  1 file changed, 191 insertions(+), 65 deletions(-)
> ---
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> change-id: 20260122-rust-analyzer-types-f90bda766749
>
> Best regards,
> -- =20
> Tamir Duberstein <tamird@kernel.org>

