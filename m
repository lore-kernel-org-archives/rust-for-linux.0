Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC73C1978
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869362; cv=none; b=ZmPI2Tav/66KpA93hZX/Z0upcnLbNpNDLvWap0H02K8ZlbTgDkzg6jqrde7s7MIOnKV48H2KqHR60qRM8ViAksQUsgnp16OU7kzWF83VkJFWXcCi1OtKv+DHjXExkBauqz8ELZNF4Rp5iMBjXjINzeyC9HmqqmSsFDXdpAKQBJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869362; c=relaxed/simple;
	bh=QZdCBbLrSupxH3yQW3rELbqJcCJ9U5qbiSbJhPIBhC4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HgENu9Qs5x0LpGJwiiaPZrbxYVpXv853PohCqs3VAzceaEd1MISk69yRLP+qoBs0ijO2pHQAFn/uU3MAnLkT8G4t4m5NWoXQs5eJIcxpd/pVTunemqMPny2T0/IMjpmX2YKGlgxsXnQhrruREc7kMDbicRFfHajpE4n4boPv+W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYPmcOid; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYPmcOid"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b04e6a989eso26407975ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774869358; x=1775474158; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwbMmOxnhNPJFKX0tFv66f1BEnM4IowI567cylvFxpY=;
        b=GYPmcOidt/bRuKyr2JsVxUf9fw/YCBfook/8mbDzZsWxsGHAIKrqxehzXETMtWE4c0
         AiBj/wkPXHB/uYnyMsDx891fux1c9r6KDa1l43jrz2QZ5BQSjkBx18CSND2bTDcF7X6J
         xaZO/HYLHEWjGAmXNHLKHGKRZGO3sLJoLegbPPTrF4iQXkZLrlmRyIlVixWGijvqoAoe
         ts0NI9mfxAmG98EeFwtW0E1JGYFTpM419w79qZhggsTv4GYRaaKWYovlRGpEwBmPPQdN
         HwAaVC+l5UAKrlwHWODnr/dYSveWeiW+oPYUzBTAerX2txs+ne8LanJEdDetcS+sJIw4
         pVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869358; x=1775474158;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwbMmOxnhNPJFKX0tFv66f1BEnM4IowI567cylvFxpY=;
        b=G1rJ+Zm8wSBzlWPkdP4l8cr8pNxJQ3TS5pi0UQgwRtiYOFMPms4b/1EQwXrnu8lYEn
         zLweNLgMkECsPJrOS8BDpSUOL7qvK5GARsdSlmmL0baysO0HvPuW1EnBhjLebiCcxUgw
         Sy8zBt40WXJIhlhcANwAwY+OJTB9cdN7gD6eAqY6aRfa/5bKysTYtZl1zC4WKmcBA0S7
         1MYkYihSW6i1dWEWlIYJ2qpv/Acq5GTQ19ROps81uRFlthz30rIvXiYaMZGzAic/SrJi
         jKa3yZoWwsneKCOA0S++Fc2BP8CfoXLLxfE/b192bfF6BL7LdNxkBUATjjXJC6CcGS1H
         21CA==
X-Forwarded-Encrypted: i=1; AJvYcCXp1TzHsUw/+sfKzCc5Wv7oYhg0WEoxPmQEzYP2zb/WS1uF9zDA2dPB5tgn6pipaFP8p22Xdzu2hJbcyv4qxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0Sw9IYppXFxEipeKmWQlfXvwLP+Gt01VqsqiNohgZ7icuOb0
	+RlfKKj6oCJFI02Y22Uj3kB8Pul/jZUMIHitSsWr43WZWt2HHCS6VcSZ
X-Gm-Gg: ATEYQzyuEI5TBuBrWwklvXzRtBUTc0Y4/XLKVOp1PDdDObH0S5MY1wXFi2SNSqgZ4VY
	0w95s5EeJ6iqUa7/3rm4gvbL9FVEta26fMNy/SBbtIg68qP9wQ40fUHf+Xg7UY9gNxSIHinkO0y
	sMekGP0FRicMa7BNLLHUJXV7/+mEK1Zzh6S7EaJSIa8e5iH41bDGpBmMXILDg2/tVHPMYZQwLEe
	zcGGvtWueLh+B8fNKb//Exh/HJ3nAlstCDzMpmXo7feqKvFGzFjEoO+HNxv242vBS2PPEMAUN0Q
	PBZAY9QgK98OxhQ2eVmY01uC8Wyr6wErG/JxjjRk4OCcRF7wtwCI8P/BIyf+stW31q95DgqLbf2
	fj9/CZYUlXs6GyNaz05gxTudI47kcndEaexnAyiOOfjborvy8EqTljN20nV736iJtzjpjKVoG8n
	OeotI02DJUbWm85pA=
X-Received: by 2002:a17:903:1392:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b0cdcdc34emr86397435ad.29.1774869358504;
        Mon, 30 Mar 2026 04:15:58 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642b59sm78870575ad.16.2026.03.30.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 20:15:55 +0900
Message-Id: <DHG2ODK6STM0.25M7U46EBUSZB@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <oe-kbuild-all@lists.linux.dev>, "John Hubbard" <jhubbard@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "kernel test robot" <lkp@intel.com>, "Gary Guo" <gary@garyguo.net>
References: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>
 <202603281331.1ESuqgfz-lkp@intel.com>
In-Reply-To: <202603281331.1ESuqgfz-lkp@intel.com>

On Sat Mar 28, 2026 at 2:53 PM JST, kernel test robot wrote:
> Hi Alexandre,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on dff8302ca1d0e773c90dbeeb05e759f995c95482]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/=
gpu-nova-core-gsp-fix-undefined-behavior-in-command-queue-code/20260327-003=
216
> base:   dff8302ca1d0e773c90dbeeb05e759f995c95482
> patch link:    https://lore.kernel.org/r/20260326-cmdq-ub-fix-v3-1-96af21=
48ca5c%40nvidia.com
> patch subject: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in =
command queue code
> config: x86_64-randconfig-102-20260327 (https://download.01.org/0day-ci/a=
rchive/20260328/202603281331.1ESuqgfz-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260328/202603281331.1ESuqgfz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603281331.1ESuqgfz-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: rust_build_error
>    >>> referenced by build_assert.rs:28 (rust/kernel/build_assert.rs:28)
>    >>>               vmlinux.o:(<nova_core::gsp::cmdq::DmaGspMem>::alloca=
te_command)

Been able to reproduce this, but only if I use the 0day compiler (i.e.
just taking the `.config` is not enough).

Bisected all the pointer projections, and the one that triggers this
failure is this line of `driver_write_area`:

    ptr::project!(mut data, [tx..rx - 1]),

... more precisely, the `rx - 1` bit (no problem if I just use `rx`).

This really shouldn't happen because the conditional block we are in has
already determined that `rx !=3D 0 ` and `tx > rx`, so the expression
should be perfectly safe.

I'll keep turning the knobs until I find something that works.
