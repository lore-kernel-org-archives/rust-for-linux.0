Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908041;
	b=ZjcYlXHCYaP00ESVpAkKxXrN5haR7Sj4VDYtOYG7nuRYQBoJI5+Mod2mJp7jmXsaJ6g1
	 Bl0kEZuMqtHOVNYYG150U17KpN/mQe8f21dgaSqun+gFMdOh7Gx+EY4CVqhSYDqUANNA4
	 nZFUiARXtlswSXNPFNx2QO3Gl0txtZTS4B6+h+P/tZrBPR95Rv21CCryVkQIWdaa46WST
	 eWCqV2GBFOhZ6nW50GMZihH8TTia1BfKdaJA0WMahBUnYr+SxS0hLEcohsZZPvIzG9LPZ
	 hn+y9+9BevVeFL6tP5TuFc6PGxi1ZO692TgcT15j2m/Ysq/ZPn2DzQmeMuXruEC+wOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
	b=YxFAULRFB1aa23FbF2vNUHVG5dRsXYeDAz3QVvFi/vs6bvdzeixwsYIHWWX/UhSCceWK
	 eiCotMLtaHmXHkuDnOMDW1/qwOHD2EikgGNSOuGBPcNdyRhw1YtX7gVBF4cbUm0HC4Mq9
	 j22SnH9C7q42nrnzvVCklhmrr7C9AN3T6r56pcWay4Ztui0hcTwn33RNRevYeSowmgKnX
	 9ZaXqyBTFYoKZLLVUO/zHpfaiFyhlOFuyuOQXhR8CY3aFNep5KGFKJiyAommBHoK3L6R+
	 UpCCF7v5bbsB2/nAabxg3LqVmWyc1M9LQ9KpQtktARusS+0YOVvfsTCEs/Tl7siP7Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVKv3WCh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD82606B069
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 19:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD82606B069
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVKv3WCh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35fe9477e0fso24387eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 11:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908040; cv=none;
        d=google.com; s=arc-20260327;
        b=GJk0m/n/jJZFTwPgcfSg/Opl8h88/RzMR2J2EBlXb5x6AK+Lp1bntZIA/tqWCW3MlC
         fVKRNy6Ax2rDYibJQDUJqPpKZqIOGcJT4i+NBHvQu2lemzkmzMX2sPPfjErklT5s0U6x
         gtHFgyIYh5M9RMneMbN3682TOtBX7R4MpVgSpvbuypi23pvz78uypZxB06ZonJdcBl5Q
         /F3WKnXr/Bn6Fb52Bph5PNaSDpCYs2ToO/51503S7b1s810zIkfaNPH51GtkzRRZAyNC
         sHTcdR+I5MRVAT0/fzso9zQQpcNM3FIwvfSTTwx1gxmNaGqd5gcQrccKNwS5HULPQU06
         S/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        fh=sQYz6SamlIZVREcOvxF2ZS8UAKbhCXzNJ3mXrAD4g+0=;
        b=eppjFqzkLgG41mcRBbGKVPAnrMhKWv2PFpzmKOGPG1va7GAMhoIUgDUpWr96y58rtl
         1kaLUTRkHOdTnGW2+lViDfPiOKapuWTgAw9pvUeYFLgYz5mPIOm7W3fiKUADylHVN9WO
         QqA0Fq66GL8HMEUnMmHMWkvEU8OxYXs08QmSkPDu1HN2kVV9xpsndLawT57cCtUaAWR8
         col8AHYoxDvwXIrwM8vR2wUr1jBnu3FdZE6Uc/rlNK2uU4BXY+kUJOS7QlqYJkkTaxJu
         e2gBVik2ssWya1CzamgmL0rC/NJbeoq0BLRdwgvxB6LpVXOdw3d2krJrPs8LvU8aroqU
         ocPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908040; x=1794512840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=EVKv3WChu9Kx8aUKP6ZsMkpRgy/gQHndf5kOtV41bsorTaM8Z1UhhPBJpX5Xp3akwb
         m6DbXgdoO0mYT93BW8uSA4Cic4KWk+CeSFU1KDrozz16EuBsPUdJkpQUHx79Vr6kes8l
         ZChdIvBwXDjpcLyIbFrGAWohqEuZtB9OsnS+1L4YXdOrxwzZd44XLmFUYBYZ1vjYqEBe
         tBA0n5JoNGmZJyLulSDXQ3amG8GE7pWM8//7PXIJNbcJ1Vn+Rcdt/ZqTzbOqW70MDLPo
         LCkqIXIu9c2hGgJ+kaWM5WShLXaPJ59BMdE13lwF+33HIBjOHz23S6VfAne2MjBX8kwA
         w79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908040; x=1794512840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=kwSii938K+jVqf23ULHtTVApOKzkXfScgkgEOWl6qRbozcUAj/ZL1aBm2pCvmI3yWb
         VPWqlNhVv7Cu9lcTiV2KXo3O/zHTeA9S07rSGCVrVFbCamPd5vvgBkfi74OrOiu9fKhO
         27N0bHTqtLziD6IIJ/WHhohx6lBPmqylIH8KVqjHR2sFa2x43rSyKamKV/ePRDwgAHNP
         2qKtJtx4xOyK309H7wtqJVCYtDoQsqpjO3o4Avd33MXiu3UP2XP1tDkFpoE7VipOLSc9
         V91RX+tXarrTR9vCxVqhErT09p3lWRnn9rKOsobduy7t8vsWEZEgmRk35TA1xhgcLfxC
         C60A==
X-Forwarded-Encrypted: i=1; AKwUvBwcXe940lnqpG40uyNEom7XldgBUYuVbAgkQblATwLd1YfvxhxvckUzJ0yXPVDbUI3+FDwS1qYksDojmW5CsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nh5Z/euzsAWIHnCEOrW12ULsqb1xjd/Cw2sunDWqHvhEpI9pF
	cGstgZNLCWNu89ixJaQQun+EwqsRDsbq4kROswwRCBqZ8velkYdsXiYtj5hSySXvnHD/KqG0Ep9
	wSgv0ep54TiWw8kl/rOVwP3QX4+ZpUwwBC1YJ
X-Gm-Gg: AYBFou3islCIBZhXWZQlVvH8jceh59nbk0KQhFtKhGJdxf+VAUar9rMhZ6+jWOrTt+C
	LWIv+qdahs1HrbYcVgObO0s5PYwOP9beWo3JRLNvl3lYUBwpNjAe/NWl/XS0v5BLPfPb5Uk1W8a
	S4kit897vA8FDDVfFsMlwzfoz5aRYJQmoZ/EJDF/pA62zScKeDq6T/uql8T4sxFhn3Bge0vgRth
	i+ncLxkqLMTnfwKZ50Y4h8MuKthGlM5VENrfpLSZRT1E0cuj6f7oFurejqPsF4gtWu+ighpggAA
	QQYzd7GR343ABytia/211sxvtZEAEA04Iysk+IGAAUyZGPTaPsF/V9yWLzxeuPJQLJWKngQep4p
	K4gNov5mmgM9J7e2enExYK+nZBOpwJ5raaDlxuT6tr4/K8WlB5SJO81x4GdK1SRdWmUio2jMtOD
	yUsWKdp2/JxlnlsVSJvdglzJF6bPDjoVFu596dx+615546yyRGYb+Oq/rmTIIg//QB1K7X6ESon
	GA/DM+slhIGLwh3x1iG5PlSpu0rSFqOv/2a
X-Received: by 2002:a05:7301:da07:b0:36d:cd5d:d809 with SMTP id
 5a478bee46e88-36f75831c52mr274847eec.1.1793908039634; Thu, 05 Nov 2026
 11:47:19 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
In-Reply-To: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Nov 2026 20:47:05 +0100
X-Gm-Features: AclHuK8sCw5nDzEQ97QtRVn9Wki3tWu_M3cQQh4H35CVD10ErpOISlcCaQDiaQU
Message-ID: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> since LLVM 17) for C, Rust, and ThinLTO builds when

> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile

I double-checked that the flag was introduced in LLVM 17 as the cover
letter mentions, and so it is likely fine given the Rust 1.85.0
compiler (i.e. our minimum) supports LLVM 18 as the minimum major
version, but if the patch goes ahead in the end, then we should make
sure it works well with that one (or probably you already did, in
which case, please ignore this!).

Cheers,
Miguel
