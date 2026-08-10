Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951EC426ED6
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375511; cv=pass; b=XX7uDbWYf0kz45S4+bS9CqqvF3b1bBy04G+XHbtxLb5V9e//JOh+hhWKHszXY9Fz2E+CXo8K6Lh7TCZcUcASHmmm6ffrqm4XOUlVhcFTrmF1K4bVUGlLQtdZ6YJkdYSz/FUJRZ6hcOpOHrknWBNqWUhdkhho0/kXxmtMc6AXy08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375511; c=relaxed/simple;
	bh=8zBDICRMPnt8GFs11qbylQhJCwpuqapD/b0ZEoHAKso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOcs1BEuyx2vXnF44+7vrNX32v+rSx6kUxw/p37ybvvEGV5cCBRUYPFJQ613TbnAxJq2/ZcMhqaoOnTx0plAl1FiyNJfdKcVhEqMvcHcrzJYrtfVA3LnpOtgiUyUqlnBqV9PXu0ZEL0Zf7p0hIIvKOyHtTni5oZSvqtiTrPGrnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dm0FcOwI; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dm0FcOwI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so1475015ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 08:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786375510; cv=none;
        d=google.com; s=arc-20260327;
        b=qqUmKYNcXZtOiH2e7b4p5QwVygBZoRqYfiEt10eU+zeqqynE0owBdll3qPBnmNSrKS
         MmzUJwvCAcbcQrT+WC9B/zI0fUZqVfSvaItcOgJHRkR2HDaVSln2+XlvWkqHa77EtP5A
         vfQgSMDHR0kGgo5L0Q0lQyBhGq8bcZidHqtWmmWTtg08Faf5DpnZb3i0lP1fLSPBhcu/
         79T7vj9NXFTX9hkQ6KwF7/xvRRSB81kYPNFdU/HPsHSMbK7f1mNDmF4jLE7/tTWF0LgB
         XnTy279yYKrvJ7EKSqI0x+kq7RGW/AdTzgiGkkv5OFr2voG6maZfDjOxlwrkHR2jUhmk
         UCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8zBDICRMPnt8GFs11qbylQhJCwpuqapD/b0ZEoHAKso=;
        fh=mQMcwc35sdHwKwYcfxLYL23vRzijLCeY7o2t/0CMKvM=;
        b=gH3rL+cUOV8xwfqdcPRhAo0XKVPOHlaUMPisbaZj2+8iD7qCpI2I+R03u6mrBGJVPC
         u3jWlDhUYcI0zGoAiPZWbHkvxZ7/yeXu1nmTnllwjIgggHMuPzPzJXezz0IAx8TlIlCe
         pScQk+cjP4XJlBTtP7NvxSB4LqGIaSNsC40PtvShwfuCICTgnOVO/Hyx8zcBEQQQv7Fh
         9ZskSymvHpEY6xHqFMw/t9d63n7RLa/cndIMUqajnNEu7P/2ZEZTtlWz2a/0/TjHG1nt
         gL10dHiZUlRDR5fVDyzKtnHwrQCjaiNMPTFa4ClY81UhxsEVUyqIYZQQJaBI13odWZvf
         4asw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375510; x=1786980310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zBDICRMPnt8GFs11qbylQhJCwpuqapD/b0ZEoHAKso=;
        b=Dm0FcOwIvyVJGQ3AV8gsVIT0e4cg3u9bAdXpG9nJAfPz/HMbQlyIp9EgcL/wp3l3l4
         Fe3XAs21xiO0WpQZdkBnSxb0XllPOUsxgqiCl7IjZoFoRRvVvlT+64EDVfouhvytVLZf
         joXsLGsadMtdOPl3tkqQaQ5Bh0xRtXoIUrUeTiwFjHKL5SgV85qJHkhI5biFZvSm7kR+
         XNpBt6OVj2XnSaNMsA2Zwf30JtEqGQ+uWAabJ+76IpkFiSsvOnakdOgeBr6JfcKbi/ic
         Su+AozVNGEK1ZC0Wcu7VO0rQI6V9ZUqg9OD3B73VbC+SVQXBym9h1EQNtlQ0M6Zm0k25
         PoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375510; x=1786980310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zBDICRMPnt8GFs11qbylQhJCwpuqapD/b0ZEoHAKso=;
        b=qwZTkPHiUh17p8q7UeJr2J35KES//EW+1ijAeGv84b0+Lqj67BW68TEHE3nKxK+U94
         A8j2uk5mf96ZIJDumojIH4o+JiDOU7CxsjGvu9koWHQTiPEgjgy1ZUbnJZ2F+9THPudC
         OK1ZjKG3ZQxNAfVkmnhbNnICJnipQtTgEoKZN+atumdt42+dk1joMwPfRJ8lKZFo0diW
         mEQWlzNjVOuQDQMrTdrdrtkeOhmQKGk6iKdHWO7d71EesLxSvtAEy7Rt1OZp/IVIpQuI
         APMcJR+41dz5kffroJ2SjP7XrytjO1PeOuhUHWiDQKE+0iz0pRu+PmvSkbL+mYC3QK/A
         ejNg==
X-Forwarded-Encrypted: i=1; AHgh+RocKYmqr9K8dS/H/egSO2tVZ2o+YFmu4Xb236zowiPO0AITj6OTV8qyAr09CS+WiaqNT019zBLYtBB3yrNssA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRSyS18cBYMPBbPG6wIkbfZxd99hJlobcrJ0csCzXuZK4Jfms
	/znfNh7XGWmZv2pFM/v0yD+UpL9N2eCCBtBfq86CyfQzw8S6aps2+Jk7wqblL7VTApqQ+r5TtcH
	lTppGHh3BK5BdaP5O+nYEeFCLeBwNHxE=
X-Gm-Gg: AR+sD11qJsX3KZ1gQm43WVp3fUNIm7HxWRF8F4wXVtr8p0x2J7uKHmfs3xCYAv9TuYd
	CuDe3C6f8FkveUBJ1QirLQCsylbhzydg4O9odoHB/5EWQAfO7aJWsbcC7w3H6H/DhQXdZzE0iX8
	X49ifYj7c9lqa/KpLnZEdwZaupnt1xc9YRHPmGn6HuAfHhaXGMSGJXYoabpdgdyo6BAei3Nieff
	DXj5L1WAwTElGuWylSBNxIjXHu4xISW9AAmKo+3ko6d4x79n2sibo/iKaQZV/rJ8KIhdX+Zkx7j
	/g9azy+lNFS5ugmZTY2m81noeQJWuKArfQJSLSOuJNV83h4Sl1/Fajm2ZLHarXHvwTZEk8Z5XfD
	oLuhAJ1Ir9mmxQpLvyJoJFUvPpAJDaEUDm246RljYMGZ06XwEf6aJRa6rIV6P
X-Received: by 2002:a17:903:1b2b:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d0caa9bb8bmr359062935ad.2.1786375509674; Mon, 10 Aug 2026
 08:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807151715.7247-1-chang.seok.bae@intel.com>
 <CANiq72=bEB5-GvvroXigiCVtHjGtkhs1ARkk+mDbvjNAR4XKVQ@mail.gmail.com> <b00de567-f828-4ad8-a6ab-6ab1c47de68e@intel.com>
In-Reply-To: <b00de567-f828-4ad8-a6ab-6ab1c47de68e@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 17:24:55 +0200
X-Gm-Features: AUfX_mzWnk5jh2TEzlCLZWc2-FcFxFmP0_qT12wwYg5gXrjgdQImcClko_cEbXA
Message-ID: <CANiq72kT7KozY5yXyCFpN7-7rc1Rbw1cLPs-c5AFuKYVu2f4KA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/build/64: Prevent native builds from generating
 APX instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	rust-for-linux@vger.kernel.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, ojeda@kernel.org, 
	nathan@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, Omar Avelar <omar.avelar@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 5:21=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel.c=
om> wrote:
>
> Yes, I intended =E2=80=9Cthe commit=E2=80=9D to refer to the one in the F=
ixes: tag. To
> make it explicit, I can add the commit back here:

> I=E2=80=99ll add the link to reference the status of the Rust support. Th=
anks.

> Yes, I have included it.

Thanks! With those:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I guess this would go through the x86 tree? Otherwise, please let me know.

Cheers,
Miguel
