Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795040335;
	b=IwuJUxmmmz0kNywLsWLQBn724qF/ilI4WJTAaHH1ld3jEvn28G0/CQr3wvlzfzFw/Es3
	 kiqKeCY2vsWb8b1ijWgMggditVzYdxYDSL6sMj7YEfQMnFoRX8olLX0aeR6seiPpGTw/B
	 y1bCXbKM1sxNoiiOdlRT4oAeKYZmqvxVZZKIXBvZnGFrZ6nvQMNJvlM576h/iEDl4sLnC
	 QIY3we+RKO058kjBX7suiPyVYYs8GSy9MV+J+MEVQCUyYv6Q2OPd2Wr2GWGg1TAq++CEG
	 xOQuZ2pGlEBMbq44EZQKzzbvLGXqUqK5JjI7HE67CWQdMCcxB8jGDXZYxoEkiWa5Heg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
	b=ostgFJEC1sYeyMYG0zBWBzOK/2BO6T6uV1cL9znrOxNlIdf2nAOXYwEIeZ6nVugdHCB6
	 GyGPp6trpajKUIcNwwGifKr0tfQAwLGQqC1UDwXg/OzVSwYmvHbWK1IeTEDgHo66e4pWX
	 DMy04KhL5IR28sP8GXa5mGsC+mquPoy7zQ3eOHACDuVr65Fblct06HU06ukvl0THR03gW
	 KHtcYcVnRF2ZZ5dmEPIPDohb3T2MALLr3O0wceM/M/mIjKVPGOBxWRpyb/EhkSjzlE3GR
	 hlQwAPmjpmNmUptqLuePGm9dFRX4EsbwGTDRs1QNXAurp40eUYuv6dnzoveAnfZNi5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DhwrPv4G;
	arc=fail smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5C606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 22:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DhwrPv4G
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso5565e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 14:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795040333; cv=none;
        d=google.com; s=arc-20260327;
        b=A57zUV3p75NbApSZGL0FS+MNEx5gbC+M82UmViNpImfdGScAG57ip45T1JFRWzkDAV
         axtqTGyrvXAilMMO7cbXB3nyIgtmMnTs/wSB8Uk9l6lq7AaYxCUMR1UMWyykM46AiR2J
         0OS2yoAFWTZG+xxeisxk59QWtdoavCk9peqey2mjuvbAedxYuNcv70YWH1wKQ+xwtvQ9
         PSucG+IH+ha9I9wVXudFUeDDbARZqbvwtZ1FJdh1BY+ExspnXAmb6h0/vYnLPajzsaOi
         nssv5Gbi73xy8IpRZ5vy/eoqzwNNr90p2fGtAlDeok1nDn9uVwPjxegzDwQbDsoCyF8w
         augQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        fh=3BPona7kINB1dnzEfoximH6ZE99jLZgwnuN7mB0n8EY=;
        b=Lk1/zJJBA4gIK37qypazQfysRlYhyeFnSFbPYq50b3UmwFiBjcAm4wR7vFzWiO6O5P
         L1zzNkFoOvIoqPyFsePRgqpEI2iKzFfg/6zrVhvh0NV6uspqhQvsdpynDMog2vVRlGXw
         sVO4MTZIBRKRkJJ8kXqL/805EuB1kmHKM1NBbfzCJUQF4FSxCMvIqbG8lvLk0Gq+IhNF
         kOua9o74JqzI0tQdUsl/F+oX1JrrueSJxQ4CrJ30QB8WCEvoLZ/wEEcfsUpgwn2XmvAy
         06KDaVLdacf3CoVAZna3ZSCkwdXD5MOCdTGoCpPHpWIP0rZrF5nWP1D6bRdpebiZ7EC0
         qGvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795040333; x=1795645133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=DhwrPv4GGFiOVke3X6njuMQROCZZTT+xdWguHN9Ve4ls24tJInBkCDQToNg2sTOH/7
         9fkhOJ7HqD7c58NdQDY7sym37Km0fntvXNnHSLiComuANprVK86/akMKEQtOmRk1K9xO
         JES0ONp3tAzKlLidLptHk3TFMkYlZ1Hvyx5PdcqkASrzNWnsmeIBpBPXdjrilkGx/6cD
         K+L5mYzqtqK2/8ulA2EwqsRtFXiw30sGQybhL4DTr6C9ZWTA47PRumYSiqWHNmNcZW+C
         Byy1W1ngeI4hePMxMzk+5U3fmHmoAzAy7yzhoofr7fZIleSiMd01npReSTAdbkh1M6ZN
         KBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040333; x=1795645133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=xKWjKHLcdSr5Cil4sBLFxBr8duvawB0IjjehTSpZG+PSfPaabH22ROQ0jYS72OIOku
         MyKuFwEQl367Io01F5+z3t+3/awx8sz/LiMHsDKZ2XQZuxALxZwEtLtc/fiJeFxIKxUa
         rnAYaSXOeJcCigaYq+ozw0cP3HI8gCGBJ9r8s0OU/k1hkNoBxbnUxN7rGXXeo6IPrJrF
         cpYzSjHdc1HbSO3X1SiXkdtjPeyXXl0SPt1vZZugidWWbyyUdPacLbLd/Sbl2C8n0bSO
         RowfQcAuFgEMqL2tX34XEoR2z5onE8x5B4Y1DTHaTHuka+O3xHaMSAOVT4CJtH+DVrPH
         GPeA==
X-Forwarded-Encrypted: i=1; AL+hErFBjDyUHpzbY79msor6dzeimLFRvqM5Kyp5mflAA6VwQb1Vd4JA3aECdZNWVo+U5sUghS2pSUSxMzACe7LZkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9weaGmigGQ9Bx5QZbpYTAlVlWsTKaKQ30SDiAoG4hqyGcK3UYy
	4XWJBNkOaknoy+QHjPHTX4mt5F7GGLHun5vvka8oUc2REeL109OjCxB3bJC4UMwA+n9uxoHoEoK
	IpzfqFvPn6e8HulOpMtNvrtWO9us0nTe9gRek2l5L
X-Gm-Gg: AYBFou0Opu5Yffr8N/+2NRd/C76tVslVB9Dkp4CafqbLwBXXYg/EBLzdHz9VL1GREiv
	233P7qOBvjZZoJpg0XdlI+RB6WQTUO9rY5TefHw9DpehiUXcdA/SRBMI1o51Ca9cyQm0oJH/c3a
	vdDa4f2DwJGMnS4Wu5eNFOl+W6A6gl6Zk13ng2ixP8cAB5MzBh1yLo30ej89TKoxWV6KpEoYxUD
	PEQGMX8cU6rPesLpEcj0eMFaUd3/6acKCduVcelM4DTDcpdZxHSKuAogD0va7jrF6TGAwDigfxT
	UFVWGv1UHVf2eBTIZhD0aSnHs60F/dx+i0lqGT8hiclKd4RpoxavtXnimgpMU1EeCwSHmoJLuIa
	e376oiS2e+czqJmzjjCPlPJHhOneyANPr6w==
X-Received: by 2002:a05:600c:c083:b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4bb840fdcf6mr76245e9.12.1795040332631; Wed, 18 Nov 2026
 14:18:52 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 14:18:15 -0800
X-Gm-Features: Aa3M54qrYLCi1kdI6tOsVZ4Mm-8YCYtqxNVjxhU4bWLFHJjIpemXwQLKhaF114s
Message-ID: <CABCJKucCD8RTVTg=_PuWTDLVaV+h8T7=whx+kLuxKq1Bpi3NrQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
