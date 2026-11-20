Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192876;
	b=Gn03JPkWF2xbDOKAOMyW/CVquxQnGBrSppA9UvDgFAWn3fj+vhhqX+M/jUi+/p8PmeaT
	 tfQIVOCeS9gTCaQLlOpEaCUfo5W1aUJWw2eKgEzXze6Tg7sZgMrj2HjSdlvj27Y+erV4q
	 nXFAaoLZPimyz8GnOIFAX6xYOeMBvoCBnVyXYI71J382y3tpMs/HwTKTZLVad1a0Rt7qf
	 xPoSRiSWiXssvfySkPWEp5OA6MSx5SOJ95jjG5qBYF6bwhMueV2CZwkpwNofzHQ/FoFjS
	 +5BG31GUWwylyK4IplqHWV44ml6fOiW7R5KOndJMVyNGRpNQM/WCh1AKX58YDt+bjLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
	b=M6T/WV/kEAgf7Asc1EsfebA5gYrvDKcNPKqWcST+G7AMozX+0UTZjm8hXSzAUHxrWR6Z
	 H6wvextIbWGoKKdAYa1d33zCxsOsbrFMBi9HpnhTSKqXS/jmVToVTPt2IlFL1N5VW0LLA
	 LkdG9OTlEFa3BLF4JVrjL3m+kFJL6AvI/5Z0oRt5BbnXlNmh2WdwdVZz9E6WQWNkKMX2j
	 xtuda9rcDCqNm90undl8Rmr/x8pwni6fRmk3EiHY+d56RWmQ+n/IHKJ/ev1YXtPKkuaFo
	 FjgHPYw8sB/UdBUcTNKDX5H2pPuM/8hwoaUNCcyRY3hJNl2LOCuECEsaTW1UqcgET+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CR6kwwm1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99120606A631
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99120606A631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CR6kwwm1
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so61175e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 08:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192872; cv=none;
        d=google.com; s=arc-20260327;
        b=ncWptX0fphh0Jez6cMJpgJrQm63ijg4kqtHEjd/gfX7wiMoE3d7eWAx7gPGqz87tX7
         U7EeX4Bf3q4m48fei56ryEk/wBY44tK+M9TNekEOlP0nPLnIjC9cw8rH4KSgl5vD1sRi
         GdmlcjQXepC/M+qHPfpDIQZweLq9WLQfrinbCI43nPLPMqt3GxVUPSZFxSySrYbZGU21
         qU7ZGYDcDZ27t4u2pJcQvD+xHHQJN8f1G7pruDSW/yj1e4QvAN39Igr04wdCcTTMan2a
         lxIx6/SXf/TseO+4cObqbKNqFkYPRBHF8OV/zkAkHqQ8DvdEO216QB+DAbTmfFZsyJZj
         H5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        fh=buD33/MRO/qYqeKZ1q3lLQDzqx9dN0X45o7U6mR2NOc=;
        b=pBnfMLWd5q+s34sZdV6b9ZJ1B79duRpR6WFAqDrra4/faa1gXk2/ridw+PJGM95kf7
         AGGjdbu4fV71QICxnCqFsEOSr2pbZm8IANcBW1N1CR+L18jgpcm/1v4GXQi/ZhQ3NcFF
         MIstF0G85TisbvbnusCReQIQc9XmNAiUET565uhmIrNmuGuaoMM52FJnq33asG2hx+YH
         /bPnZvFH0ROS7jjAFVRx35EMn9O8WwVO51ciso2M/8j58RMTe3ao1GObSXYqsfgO+qs8
         Xi2N6rgvVAQhpUVkpiUBBKpG61hlqkQHRSg8U2LIty1X0ohG0G0Bbr0etxsesE5r6D0y
         ED9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795192872; x=1795797672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        b=CR6kwwm1oHbSxVATbOmkl8qKoYaBhgBn5D9snZ0tnQQ3Mum6vvcKkI/UYRjN3sbMsU
         Q3lP7ctTQ8Lb7hgMXk7ZerlRr75y+f4aYQidLl6z3oJYiMaKDGK3/R7U9pbJ6Y0C+4OB
         UKhhnMEVyFTIgUtmL1tvROIZwAd2MQkwQFMbsoAeySbHFbwa3nzNeVShfEzrmGx/jv+o
         Tj4RmDVqM90h5lRnDknyA1JU+t8COdH4pwqC/b9DqLWfgwD/2mKyrQ9XeJCVEaIOuWsj
         x/oFen3mIU0fyVzeYnYKAU/8YM/lNctAhZmTQ6Lp/G+PeuM8bChEd+t4yQXKFCshyHwU
         Um/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192872; x=1795797672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        b=q7BJmvXYxIjXfqQ1f9gVG8t44vtU3EgwWcCNYVLmN0WMQadmxQ6eVpRobeq1893KfM
         0zSGPEtRhp91DgXSXHEDVlSSA7BFSbgmfLdLWuBcD8AO+U5xk12ntsQL0bArYfqhpT8V
         XacTjysP3k+28Ykv+UxpqWquF2qwGcziS2H8IF6/2ue/d5YW7C2VuIT/TM5x0KjZYb2T
         ehWpKRzrwzm9c5kEWRcNNx+d+xqwasKhBbaJD1NwtnC469Lrikfvkqla5AimmWaq7NMq
         QyA0a7Szvz3S3bYG8rYwPTYr4dVfU3Pvp0QBz9GCWdva7/OiWp6sLklRpztZcrEeFoJz
         gbmQ==
X-Forwarded-Encrypted: i=1; AL+hErE4Bg2Z69FcJ1YAO+YyekiDeref5PKCqn7kNB+6Wk+4JKgwA5a9bHasnSjiceTbR3L6RC+AKo0K9Ec7ONzbvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9usmUTwjwqjZp+JFJJuBZ/J1foRkBFExq1BZbFJmqrvOIcLFb
	MC+pbcjwhjDpu4qUXIare7KUdH+9N5K+5AY+lYWK6+GTgmx3wMZxbMdm/151PoP6YhsdtBriQ3K
	POQwFEFQWPKiSrPyM8urkBqJ0pZE0W1eBBOR/z2QO
X-Gm-Gg: AYBFou3vRusLZG+CzbNpUcls5IZz5k1JD0hqiu7X7KzQJzxwwm5aks7zg1eOxVY1pET
	UOG/KyfUxzSXRfoOB680psIOTHZAMbV4wkh65fMf1hRItL96oJPPn8hPVeTJe9tkVPI5agNqcUM
	K/fa5og48o6XoIqBVFsxoZ9WF9XXNx3eXFYb4HiwsjkO+UIgs8X60eaNDjc95S8lEAKMyOgut64
	lMmKPNWqQRt8rXC0/uC+7YRjG1JONi3TfyAdfkesKNiMw4go9UJ6uPrEg+FEgBTsS7Wh4ns8kj0
	ewX99QRqI1j+qYUs8NBgSp6WiDHFamySnnNy5FvrKpnFJ326p8S2tbmjnKu33LIVTxL3DGmQuVF
	AOBS1y3kKlXW9wffPVKvA+Iuk99+n0F8qYA==
X-Received: by 2002:a05:600c:3ba4:b0:4a2:bd1:a80a with SMTP id
 5b1f17b1804b1-4bb89619133mr1203705e9.2.1795192871012; Fri, 20 Nov 2026
 08:41:11 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
In-Reply-To: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 20 Nov 2026 08:40:33 -0800
X-Gm-Features: Aa3M54oct8MRe9MZBWMaHsVotwxFhMb4AgWLlWpoCWN9GDOy9iSx4jSZ3IW3NJ4
Message-ID: <CABCJKufYm_PXLzoTSyj6jFjz9fO4hoUQT5eTqxofg7ARMg=2UQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:19=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> CONFIG_RUST_BUILD_ASSERT_ALLOW exports rust_build_error to modules.
> When CONFIG_MODVERSIONS is also enabled, modpost warns that the export
> has no symbol version and records a zero CRC because the build_error.o
> rule skips gendwarfksyms.
>
> Let the existing Rust library rule run gendwarfksyms for build_error.o
> so modpost gets a version calculated from the Rust definition.
>
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1201
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
