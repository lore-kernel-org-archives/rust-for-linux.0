Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9259E2D8DBB
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583005; cv=pass; b=dyduvWqyN+lLTzIAKc/QwFtuZAuyGBMfw0ykyAdmcpPrfv/z9l3a3bijoTVihEBh27GEFjX8IDShAvqx0+oME0Q8h3K0LyjJv84BlrNxhu7JT+LeQekOg+a61f/m9wZviQmd3JOVrHYQ9DDzi5cypLbCC7C/H8TNqf9LCGwVmu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583005; c=relaxed/simple;
	bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ug/iKLtG+1Z1YWUG87CD8BfcOeMm7+q8ES4RgulU/ka5CzMjiCrBAqyebmhkjem8yVF6aF60JwFC4ehKiJxjZHbZRNx2pzfO3SRO58pOlxZ/FKjQLnTFNsYHp6PmJQPlk2kdua/y44VGlG4/SqYBnocuMIgRQrXrh7p0Fi7dPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=fdcqRxt3; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="fdcqRxt3"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so3082409e0c.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 07:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787583002; cv=none;
        d=google.com; s=arc-20260327;
        b=GhfHgBt1RF9PqB2U916eh1kgHZus7YrPR1+Ttseo0PyDvAqkFwSMLfXFZPSMnHEGOs
         uJk3wGKKY5QKYAKZ07YwKLIDF2SH0zSO5hNQff/M02lK1stKuBQHlHDrdmMNVPjOUqVi
         s7c+r33yPRLM0bL2SNHrjaNlZxYy66igp+uY1VuFz8dxkjdlgvc8TS/DyyeseaqfBM5h
         Igcup2aA8Bv00S2SdRsyVBWX2kM33vuFRZZQQVx04KUu/8fWfghWuVOTcPGtWpvucXDD
         CmibU4TPcKFBIMTYn+84oHJur5hhcnw7rKBFH9mglFdiH4S7814FCNIWmYI/gyYQj9iB
         rhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
        fh=5ouz8/YisR8PhDQWqIcVj9JqDNKl1DYScYDVl3iNeag=;
        b=ncvM7Hl7XUFMCIl3YfKfIiRAg0HiA73QZW2Xd6B93PLcAV2ZqEaFuI85bdSaClaING
         KnI/izaoZGWbsL8ukKCrw+xT66rFABKXDkINArxPG3h+M6d6xxM1t286r7b4ZuwSJ4iE
         JJUbUnb9wKKHKYy+VyEaYypmbxOme3pQdQ7UHsK/68ikPibQvyGFsc+1djFvdK6n4DB2
         oIFjYdxHKWxjzjzE1e5YQvdPK7BvaxAUhhSSsHCjGjXX03lF9UUfFSnxM3mcpR1ZCeD7
         wVIifjyvXlkiJzTMwc9dVch5YH/eDnIi5gLA5DgtBHpXmSJmSr5qfvR5zUTT7eZchgyk
         PW2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1787583002; x=1788187802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
        b=fdcqRxt3dEHk5Cf+uZSleLQsEpDarKCBNALTBtVJy+Z+32etCF8WpC3kOcdRgL2/W2
         MbUfvODFF2OGOZWyNF+w/+0i5wKFR1p65k+Ymq7IrSSzqF29Tf9PIfvwrU1OWWEjbgg3
         FgnrGY01G1ZRHcDG0gt+p5seSEnR9KRY42c0S4WaPrApRkfAIX3sB3ljerdb1tqMsbqH
         14pQR9tbKSCzx2ifa3PKQjLrlAv71UxSk5A7El7FIiigvkXLcGosUy/rZf3sWmj9tMKq
         XCwkEmFVj2yesFSBE8qdQpYIMg82ZkOHoT2AQF3tgqx0puNVDfl4Ast42f95uyqgth/R
         vn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583002; x=1788187802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
        b=qoAP6PJiA1CV/aEQkWzFXWSghQab6NMnm1ykm9PXL3iUavoo+37zXAnhx60QP+F7rm
         mej7o5IPPmKKzu35v+FOausrBZoL8+7p9WrndqoOA5VtEnA5iwhvRwIM15ntZiw9RPZi
         bn0nLDasMlvQ5Enp3arcAPFmfHVFoRD6Oa4d9JeeYwnsRz1PTpwyenBJg6/JUnUQlAt7
         2raj5fs4mH1kYrSWlVrfzCvw7ZR7L3olwcNYUFGWW4w5oLy0yWhWTgV/nxSmnS5ff9hU
         wmSP2hnFUVKVxLHCZzRoja/7L6Bl8w5SRau1m8k/fqgCX+MaHACBEciVCZvr6NQv2vhp
         bUkA==
X-Forwarded-Encrypted: i=1; AHgh+RryHG9c86x4/uH3lKW3dTqSzs7+nvNyG7YZDRsZxPwU9oEecbx/thzfxZAWVcumM/k9Y1zDmQ1Cv4ze3zTx9A==@vger.kernel.org
X-Gm-Message-State: AFuF++lrl161/jKfuvO2ycjVbW4iXXGgf4fyCMYtbIjpQbjPXQPNMfL6
	AKHTa5drsrAj+WbvNMmcmX+QnMy/abSJqv+Q6wEpmVh2+3fQXGJ1VJ5/joldeqCL0TQ1WfkWtEF
	VfxdEUv7XAW9ra2y3LKaoY2DK6E3vZkKH+4TYCFfyqw==
X-Gm-Gg: AR+sD10+yDgx3LP2XNLTP0m84aRXkEziQIp1XyLTmCK94MJxv+P4CAOJh/fXMiJcqUL
	hMcNWv1BUlR/wVLVjg4gEXmmk6E54qySSnwP4QFar0iHFkHr93X11MLLlPVankAS43KEUma/pbq
	8TuWX+4DZH0W2KII86eGP8g0RYOOtrr0cpUJOe3TwUAs1mjKwUNAzft2EX/E/HBqYHsVqzkoLZN
	+FCmMoP5aKjH2V5Z6GWot8bMm3OwGBaXktR4QBIKp0U5wxmXiIBzELoF4uT+yfAZr/LPole5q6w
	zILn/xA1tENs9XoYeGrjCAlcZX/9NTd7oij2zF4xbMvAJg==
X-Received: by 2002:a05:6122:62e8:b0:5c5:a34e:46ec with SMTP id
 71dfb90a1353d-5c60de7fa8dmr8437650e0c.6.1787583002393; Mon, 24 Aug 2026
 07:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811050657.646799-1-apopple@nvidia.com> <20260811050657.646799-4-apopple@nvidia.com>
In-Reply-To: <20260811050657.646799-4-apopple@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 24 Aug 2026 10:49:36 -0400
X-Gm-Features: AcwNN1VXMSHFTOJVp4EEFY1y9qIYBk2kbt8_wfsDcMgOmSc3agHjk6H3Vsvh59c
Message-ID: <CAAgWFh0VvY4D=-Se+bVO1YonRNFEa28nc7+ZbxEbv6en7oPaDw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm: nova: Add chipid enum to nova-drm UAPI
To: Alistair Popple <apopple@nvidia.com>
Cc: nova-gpu <nova-gpu@lists.linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:12=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
> +/*
> + * Opaque chipids. These may be used to determine what chip a particular=
 GPU is
> + * based on the identifier but the values themselves should not be assum=
ed to
> + * carry any particular meaning.
> + */

You say this is opaque, but the userspace MR you posted already treats
the values as non-opaque in eg. sm_for_chipset.
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43352/diffs?commi=
t_id=3D945a8e7c51939577526974b342c8dc6bafc3372f
So, I guess my question is, is is opaque or not?

I don't see much of a reason to make it opaque since the chipset has
had the same structure on the hardware level for 30 years, so I don't
expect it to change too often. Truly treating this as opaque would
likely require a small refactor on the userspace side without much
value. (I realize this has already been discussed a bit on the
previous version.)
