Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171758;
	b=GMvGy9lMa+3d8fzrXxqC63Yq4z/0maIFbYXpuqsp7yZCjGcOMljJWvDKKQuETK1ilsI9
	 WKXyT29EIFXi34GKWBSK1qp6xpT9JR7f7LepcpVjLwOjTqKXPdsY3VGK1QDB+Tclhp8e3
	 ls9eX2hbr0Snowu7C+h01mXZs0LD2JRabQJnC7cru5CyvZSrc9y26a+rq9K3l6qhhWs6I
	 EniNQTaEL+jZm3V5rXp1wPD/gAOyDH06bP4/bi47iz2wkdga/Y/FWhSHUEzZBD9uLbAxk
	 vL0yssmuCc6AbwjkK/VU3AGyrgD5FHVGI0tanXCzNUDLYn8U0ZS6fPR2bn6UjCe0a9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
	b=lC0M8zZELG7uTG9IJ30L4fwUMYBeSeAEFnIt8IdHaUJsKEqiaxSbewyeur4DY9KDCh3r
	 btyiCaOkm8sWg84T48XWs/XwfQBjPE9Zrh8uiBOFUBInv+Na2g9Z0g/h/zeHWLtokyCoY
	 D9+TNnBUkO4Z72giKJzv2ewWmdZjQ9O74XB5GVy/xfqmFWQuviBJwQM1ylh+ERjwZVnXE
	 iLKzwmwd1vRb0PAx9qe7u5GHyAW0gpC//TDPqgPN3Jx8n7VfL3/sQnsbXNkKgomsitXmj
	 U9trhwZx6L0phxsB1Sf41MSRIpbWFRDyJQRUv2783i/5ehxe+tqGtrc9U0VxE7ieAhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PEsZh/YA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A82606A332
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 10:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A82606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEsZh/YA
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c00c727a26so67681e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 02:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795171756; cv=none;
        d=google.com; s=arc-20260327;
        b=VQ+5PgtV85Fj0lGAdcsrkqc9fJ4vtze64WUQ8CU9d5PTdHK313S8efkDlPcol1HrTy
         ejFM6tGjsaHAgifibzZ7JQUNYRki2pPxrQTCahiJEnhvuUYPmcgwIz3GGEFNol/vLRC3
         TIs1NWmEsbkXRX7km+KKFgZrB+DCtgwI5SnQsAYqeR5hsv/xS1jWYiaKvA3zM8RhHi3a
         cBdVbTX+mTHnaV+5R4bKGavo4l1fjSF0TE93G1agUJ+D15JPwvjM+oyeiRNh6n/Qhxr8
         loyG4hMeEHDrXkxGSfFA27Mo3An2hu+uvfOzW0Cex4RjUIh8ObvduqpPnH3q2FOY46lL
         wMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        fh=ewXBX0RDte8PRsYJUzaTvEApp+7fa/OOsZJ2D2QhZFE=;
        b=pztmCEs1ujG4WT+1PXhbQMDPQGrQyZm6jkRnU/bQqu0pELI7cng+7t1/slC+nAUZbr
         MGy5GcctWWmca08K6V8ksD57GISmcoK4Mer8w34quAXtlgAob/CASZr4sKv84rsI7V7M
         34Vq02VyptzcFS8+c29T5g0O5vak5h1g0HRUjiSDMdz5i8Nfd8Jw8bljMOVLhcK+jVTf
         Aht7K7XIezNu7yIh4/Pehezt2zDKEht3ByvVm1ZhhDzRPeWh+iBuJwiOULeSobXxig5L
         M937Vn7jrQDgWppk/5fNnDFWsoArxmxQXXyGawgZNsMEY468LGOe5EnlbnzN1jDqbGC7
         09LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171756; x=1795776556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        b=PEsZh/YAAYQUmMsoLTE0P4DoaYxjX0K0WOe3frsYoTr8l3r+nSK7sMDRX+LpT5WITu
         p5da11rIxNERXMD5GQ7vP5rHjtNAiDvJJ1IP3EaCgCiy+uIEDqg/M3B2qWZu33gr9z2H
         0Ntd3BKnx5dLbi8bNJnC6C/w2cTuMVdfAufG4YrMW6gJs5fkUtJkyKGZOAOEfSGC3URw
         mPL2nagnait/4H97dChQkWFc9nriIUt48kJnZskAOVjsNDXahY1zXAfCtf4wIzRSv1E2
         cn8ohWhoG0vQTsgDCFFyQQQuVWTfYzneroC/a9LhzXB34Z6ONgKLPfSMXLK8FB3frR1y
         T3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171756; x=1795776556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        b=NQ5G/6jHg3SHPdRalZBf5LOpjHSmG6uvMWqWNv8QkA5Ubj1N5dveVE/MGnUJyBmXWe
         PHWQh0yxzDF8p9tzhVYxIh2vJFcNCy36ENiemV+bM0hBq7AHpOYMosMcd8sa26dYGQ2T
         oL6tnKx/5LiDde5KNuTrbj4mV8Ec0MkUPo52XS5oFh+oQodamJ6Jda4fS5tpTJJajbbl
         W//BaA/Or5OszqsNuvpYxfCoXJwpnzb7oKSfvmlk8C76b9hC7waDWk2TbC/RRel/ZWxk
         6Fwu3fkN/EAoV9aeH10kg7heuh9uF2nvdC3m3Hyu5EaaOtLOkQyOg7od8Zw21kv2tTQj
         xCBQ==
X-Forwarded-Encrypted: i=1; AL+hErF/j4LH520WBlzR6urOOlODg7t21+P3LwHSbUw/gJwusMNp2+JhExUl++x0LYggr1t9WFrNPbWshGYWgplzXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XPt3d0CHb4CpkSGn43g1f8qtvaXucxd7iXkfNZqicGEolJVkU
	8PuHdr/+KwjPScGAs1WP34oQEl2mNAXxkO0M4hIi9VXnUJYkaEmOvEUjOmqsYT5zMxPQDQ/LFUQ
	pp+N3Z3m5AkgESqVDn60to07/pWAi3Ig=
X-Gm-Gg: AZFdTZc7i85/tZlvfQOZ3oT5Kpnfa+YC1sk/skLDsYft7RGUuK/qnsc6xR4GlPLzkRv
	5daafmK8ZBG3Y5fRCog6QfB9Zv8nz0l1SfmfaacWA5i6GPzadpwbjWxyyh3caMfLj0pPIjCzNst
	aGP1h1nBfJi2gckXz0CSiggnR4HMsh6aG5lAYSpMyl5PzFlRODnr8sTWtTd87DfNmMQ2gUeOR6e
	gN3xe0MsEmG2evW2LtSH7foXXUgF2ZMRjrsTCgdSEWnQr9YEHOmEbJPADH8fghh1CiDfuDpyTAn
	gnBodPY9lIdqn3SMayQL4l3xyKxkraz18TWONKdtFDb3OuCt/62xcEg/B8oIlnqnCmDapu5cdUc
	42qRW/37DrBAqa+vZ+Yu6Kq7WI57tiTKHkMZj5IPYwYI1xqkma2dpAUiGmWMRhyD1LQu6Edwmm3
	KAWC+xODQuXjd+X0pYJidbaOeMlEiKcRUWvcuWK/wB7I2wG7vRRbG/bU68kcuErkS7LSgvnshgi
	6XoBOBZ1uMLH9egxJBESbCGwtgSMye1T/VGVVl/d0Xxd4vhrWPOQyb20rLGSfb42W9V9M1i
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr1167983e87.2.1795171756051; Fri, 20 Nov 2026
 02:49:16 -0800 (PST)
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
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 11:49:04 +0100
X-Gm-Features: Aa3M54qW6il0gb-hxlX-Nj8ioiKgQABk89cMHbmkyFDNFAXmsl_FtiHnKL79t1w
Message-ID: <CANiq72=vz2D7XYNEHmAnbh5iTJ6T_qtSV3bosQrB8HOYsBXtzA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:19=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> - Omit Sami's v1 Reviewed-by because v2 changes incremental rebuild behav=
ior.

I guess Sami is still OK with it, given it is a subset of the previous
patch and the core part of it.

But I will wait for his confirmation -- this one is not urgent.

Thanks for the patch!

Cheers,
Miguel
