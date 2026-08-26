Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916AE44238E
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753403; cv=pass; b=bsjv48EBf05x49tIaLR+h1emXOm1qVpfsKD2DWKEJi+cJwoecBOZ0kBb1xm6yL3NY0WZS+tfX2hzCRgXYf+yCcaG+4v0sbEwIKo1ZXSZJDHcmhc+iEpaaWVk8ruGM7l1kb0MWGhIfL0SuYbjmDOpPgLgmm0sRR+0nBbK0iA5OI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753403; c=relaxed/simple;
	bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8Hu2kMwyC3gSS/p6IJz7D7x7+s2z6OPUu44mbmogomlJdt2qVH7THNVT9jHPWlpeUlAR2RUmKlem1a400HeHDLOw1Cz+mfIPW8PQ8zGqmam5Ny4ivl9ChSW63IxB9k05RRAqLzzUg4TAxdshH/LPYe6bMl+cOMLDFOacuzVsdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asZZWodO; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asZZWodO"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9ef0c26ddso80884a34.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 07:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787753397; cv=none;
        d=google.com; s=arc-20260327;
        b=I6CAqo/kiKsQ4psLAhSkhcuRlAb4MndeQJsJfYFT3ku2zVHoUoR+pj1vUqAcYNdhT7
         Bz5hKJYqUijWRNtj8RxSYXs4jW+3WQ92VmVtQvg8ly+r78fMvbvYcU17HYsCI9MjuRlG
         e7hz6cfHrc1sI5wK8ecoUSE3LI9H+hfXhmdn4JbZe71D3IRlOhgbXTd4NRnxRqTKXKZ9
         Kv47985X38Qc2VsPLE0PfVUIVAHCAM7+HWWSDP+VjLxkU+ArMQu585vYwsemhD9L6oMi
         QI8B4ClnxgZQ5vNLZl2l/kuE2DfMSfXqeuc0laLgITfzfUv1Hc1hcNv5uJYZPskt/jiK
         dfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
        fh=ob9CayEUZL7Sb12goYUV96NSnEYTyw1+Z9P3p55rUug=;
        b=grHHUlrIbdnOPsXwfy9RSwIAgxrrC0DHm06LJAWwSmlEFZyJMsy27FinMB0B28KtTO
         QRCMXx8RY9Vb/VenFfmN0Fe2kSdgNwYyCu5QER9TuvsLSZ0ak1Z15Wg1bStVbl8Dixqb
         R12Sfuv+5EwyBnWNJ3Ds36CwMkQ2KeZ1ztAGUP9D/Ap8S5HD+N4oMgK+18vQPg8/rv4m
         WNVZspscgleeUXapNFfPrOVBG6nPLHaMsSRnxWBSwyUup+76tuduwfsQerqBVn9UYOKa
         LCnAJJ+KvKW+NR5CcJgB83fDHuNcVdWdpHQ9GeCJ+/AW1wcnuCTfaDNghh/dogd/1VLY
         z+UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787753397; x=1788358197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
        b=asZZWodOE5fYVzvlMZNhtDMVa3aCEXFQuoEWxejOeoU8A3TN/pIWBeMW7afixWwHPx
         FBIRtVg2knR3Hbvu5rZ8xIo0+4xX8BmIJMgVsnTqSTqexxWw026r2QcBWJM2npXyi8LS
         TWQDji6dAAWjxBjc6YGhGfVdHQpmMir8D6h4FibmKPuJUodjstRAvcriVym71NbCYFrR
         hQ2XiVH/Mh0LkVMVTiXkk2+9Gcki91gMEdAwfW2ScMUsx7pMqMDjdPga0Z7QJxLWrj8Q
         TikfsQ99sg86424aZ+8u46dm0S+ugzkO/Z7JK953VGsP8xARA9ruLUCgMh+2HqFWwjbq
         iW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753397; x=1788358197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
        b=kJdSsStD48SxSdNCEHUGprBbm2+L3yvnm4iCPTEh8ZQDO2XpXpLaTqY/LwKGFPnG+R
         2T/q+udcg6H+z8+tiprUaW8XE0l9oedLnxYNKIG998lcc+k27hj/2QPgoI/++5NpH5gP
         OFACzM/7RT3GYk0VbWM8YFlv6U46//zSK2X8qc8sxAVZEqRAEwrecjGDCQBzmbsD/Nld
         zY8iu0zGlpL3oW3RwwKOcbGrBZ5/jgqBdMsfRJ4T6qQ6s4Vu+csqeSwwmHzi+JtzmaFK
         N+/I/gtXF7V2toNjco57Jb/Jj7/wlJwjVstaPF/M31rTP9DeB2ZxHjR0iocNAJyg1gyd
         vvaw==
X-Forwarded-Encrypted: i=1; AHgh+RoVDDcbq6Q6K5I9qrC8AWspDKJmpbBjU8+2IBEXiSWWHu6lvA52LH52HzQvu/i0f9itBaCOU04F1ktMlADDtA==@vger.kernel.org
X-Gm-Message-State: AFuF++nWxq4IoxoyUsPMgIjUPo7FbW/hxNRJRBWyBlUkupJTnocDGP9H
	hRid5sFZeb70mYi0Kl2/rt5i2F1YIfDcXotlY+ComjALH9tpTY+E+azD6FvVE7+AD6TKqLYwhW8
	qvva/KiT5bLd+ErDECDiEx14s1+a9KRQ=
X-Gm-Gg: AR+sD10J3JlLWTCbAPSmz93B57dULoOmQvdTlhQlHIU92LFQW14hHE1YQPPiUg8Rjdr
	L/gXeWKlI42LVjpY9so4vxQMcWMAMClXDh2BY9VRlUdPepIBGD1xqnJC/Cz01w5FqrznVbB9Sxz
	Wfjgbl8/zvnYiHU45LvmYtwt3ENSF77oIxgxuFpm5MlmbZg2Y6X6rBop4D6pa5Fl7wafLM8+tIo
	6UeymYANVajseW3M4ODIKIboVmCJrwIw1ww+3ZSmOAg82Fx2/3KDfy/8qNk/kAsDCFWvnU5xPuU
	4VQXeawji957oDFQx0QbotyNelzW6SqVTpa4w9NY7H1xk7LTlhN7tMEKbTRm8IGoLgVAp/vrL9N
	CyHVDo0X47w/J3sz2M0FZT1EWkW7+hrQFmU7CA/rpV98TYWn06faIjeCIMMPI
X-Received: by 2002:a05:6820:4206:b0:6b1:95fb:7d3 with SMTP id
 006d021491bc7-6b1a01f7ff9mr2702848eaf.0.1787753396788; Wed, 26 Aug 2026
 07:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818084633.1673214-1-zhiw@nvidia.com> <20260818084633.1673214-2-zhiw@nvidia.com>
 <DKYU6ELNN060.154BHE2QG442C@nvidia.com> <DKYUBX3TU66J.1P5UZ908CCKBX@kernel.org>
 <CANiq72m3pGr+sywbZ=woVnpbHW616VN2sG+RKYZWbWHAehRvvA@mail.gmail.com> <DKYWYZPPYZNU.32R4UV9WLNZ60@kernel.org>
In-Reply-To: <DKYWYZPPYZNU.32R4UV9WLNZ60@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 16:09:41 +0200
X-Gm-Features: AcwNN1UJDnIsDK3s-Xz74AoPxa-_z4dXNrN8ZtRzT0xk3LN05nkWqoC5E2b1vr8
Message-ID: <CANiq72k+-fNWZCwGuQ=FTchxgm-X-f6WR=tG=Ercn19ic1edQg@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] rust: pci: add extended capability and SR-IOV support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, cjia@nvidia.com, smitra@nvidia.com, 
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
	targupta@nvidia.com, kjaju@nvidia.com, alkumar@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Sure, that works as well. But in that case I think I'd rather have the re=
gular
> as-cast intermediately (unless your idea is to go for the full three cycl=
e dance
> of "introduce new API, convert users, remove old API").

I meant adding the new interface now instead of replacing; and then
later migrating. 2 cycles should be enough, since we don't really have
users.

Cheers,
Miguel
