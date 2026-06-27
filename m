Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2793ABD8F
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570124; cv=pass; b=ZzsnqfBI4NO681RdOQrj3rf8BG+apGOf82QnaTxV0f5pIvoDEM/1Fip54Al6E5rog+0Os7xfQT8TZWJjHvezifkMqJ9O3PZEITMo9swoDdLuGkA0ta6WoAAb71MZLgZzfeX1wTrHH5J3pjg/Un7zVmbsWY61xJTsnJRGVcGmwSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570124; c=relaxed/simple;
	bh=hgYR+me/WqBHOq1AxI3Al6Lomfd9P4rKWlIodfqB2Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT871sqiobmg2RnPu2OcZfAhSkgMBYHKXYqeMQnR/Gdf/e7fdoMnFri3JgXemg6/XbVW+JNOjNSy3YbVbKRa6Djlb3qYoR5GiUxRM4RUb7JzWyKdsueNHx0L33kK1EsfgOdXBane0WioiaSyJ7sAyzdhhEYzlL1g/I5z51v4gLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVEjWYzF; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVEjWYzF"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30caa24aeb4so118763eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 07:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782570123; cv=none;
        d=google.com; s=arc-20260327;
        b=GLO0mqkPfdZRVTQuETBnYa+27mNV1ACww6atEVqcNz3QqdhQ4wWRJAyug6Fj0mY8Az
         K8mxXaa4u6UQEOcc9wfCAOa7HXio/hbBlVXYNAaFHTu7OIbXkTYMfD45zD5iAQUMjeWk
         WDieTpgyhrRrQxSQ6neozLy+jGhv1fvqNve1+E+gvmRbIhs5flC3H1sKhQJcTqUdz+Vz
         lDjblGNV98Ss0LiSO7Qa1T6+HkEffB0kp/kY0zr1IOhwPF+O6CuBX9PdBqlgcAfOv7c2
         HcoSQ928EWF8AVL+MmfFKI8tWAAsFMN/YhUcHqsFnjCrQa8A+RJN76nogAXMQYIxnoKN
         ZI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        fh=as77jogaAXk8E2Is76kCobUunRRx1XCS1JyqpVfOwPc=;
        b=Uz+7g093KQVXuQfbgR1b5V2lyCRThYvXwfFjLjetUOC42+2iU4iwsnxo94gnlY2w68
         aQfbmXTngticKpkNV+roiZIQI10d2xmT/z9416Gx8fp5jmoDpERtWEMqFzE6ZXC0c7uL
         SOf7fp+aeVnK8tBlWQNGdJbznWhvXNUA84dx7AcA7Ka8Lk9LCz1vq/Kr9FsLSX1gvJkG
         rReHnlEmAH6IXFW7jjXTia+KM6Uxzv/nTb1UNUFbxh9PBoQKQC14nQwFxS5Oj1wNB6QK
         bRY6KfuQKqRvJb3WFQKrXEucSMqcliCtX1WkdsZWl2wJTx58beSXdkA3/ZbJwtBwo2Rq
         g77A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570123; x=1783174923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        b=NVEjWYzF05WyTbdn7SOYkAmR78SpwH7+R+TdGAuVjpEyg704FiMNqdShrbR1EZRnoZ
         NAPIrljL5qwLtZRgtclsQE8RKA3pwuBBKkcSorKUN+cJMhCYVT2dGcoJ1BRM4Sk83ImQ
         5ZyvSMhpI56MJUHLZKa6qmedVA8oDPSlEgG2oCwruw/d33jPz6SEeGBBXPhVRnv4+sKz
         urOfFX8gH5L65LeCPiyCQ/kq+i6rrbyhbsGhpQQyzUEUkEClxRwiy6XMe30c+TnnjZgo
         DF0aJYTrndnVQFA21B6bx3lcYtdZ58SVPQdXsSlW5s1Y9e4sNEbpHw64I41HTJRKMmZL
         Cwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570123; x=1783174923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        b=mgGQROl6quKAbjy6tu9ms6dkQPhnH9TwU4O81oD2QtwAeI6V2k0eq0I1+GNAU/CT+M
         UKUu5+pgffSLeyuDOh5YX4WQD41vGFTFlkjpDtKrBgz6/A8fVy64Qmcfat2ToDdb/Mv3
         obTqeSOc0t/NslxR+ghFNgGaO+uBEvZmsWFTo3go/mK08jsiTCYnUoeN+6J4mEBSFAp0
         VkbBoajsvn+D6oHoIe0Og/C15UzGRZxHsi7VFaOb2OKL6aIL7vzw9dRsIFRiNbyMlvdS
         pKKrpPiTs17M5Nvk2lCK5Ua++F42eWfodPXOkqgP/CvU/4UnydlFzo0qp+flsXlGMdMu
         33hQ==
X-Forwarded-Encrypted: i=1; AHgh+RobKlK2dP3irX/t0sBmFw/kfChiwcfFIUBFgCo7fHtphyH5aXkJ1IQYeaePQASIt+dremJk7/TLGfr1tf946Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi2BeerhrBZtXfKdKFIBCr51JyDEgrc4F5hQt1Ytu+U0pZoEqv
	hEdXftPGCM8BqnAumbJQk0OH6NlM6g4GEe5ekYuq/6IkbCMtaH8VFyPSafnHNV6JL+97MeS2YT+
	7xORS9Cvn94v9rU3ZJyHEOGZWyUmNSQA=
X-Gm-Gg: AfdE7cmnIZbe6SuVGr2e7ENRALcprApVqPh0OLUQNbCeQM1+ToteauUxCiFL2JwxOIe
	e/mCVScgv8PhnJXQTvrdXZseFRgh4N+lvxpjUiOvndqBn1r3NH8EbgHRkzdm8M8OP3qwBm71yIz
	QmKUyMR7MzJLz5Z/CluuJFDStWlhuyx4hH9hlMfvTDxgij3Wr/Ii5scALXoi17D7q2sFMIGMT/F
	2yeThAJKKP++KLHjm2YhV2ZjqOBEroJ/m8M9n1K8ylxLYeIGUwGTi82Qa/WD2witBDXPzgyAI0U
	vF5vXEkBzjzY0OU+qCHH4LtPP8TbQ/OmbBdw3IPmcAEWNqQ2V6VBkhJRn65y9X/4oUq/IYMJ3+T
	OdRSXOyOJ1vno
X-Received: by 2002:a05:7300:ec01:b0:30b:e157:2641 with SMTP id
 5a478bee46e88-30c84d6411amr4636635eec.6.1782570122681; Sat, 27 Jun 2026
 07:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-3-dakr@kernel.org>
 <CANiq72=0OOgc6NtbpF0Ysdk3ytRWCGGbWg00u0Le2AzQmKGKxg@mail.gmail.com> <DJJVPW8H183T.1927SIBS40Z40@kernel.org>
In-Reply-To: <DJJVPW8H183T.1927SIBS40Z40@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 16:21:50 +0200
X-Gm-Features: AVVi8CctSDh_S_EW23arFCE2Q437EiWrwvRaI2YwlTvVdF9BNVV6NJ35O27uGtM
Message-ID: <CANiq72nr6UD=W6oFsJQaGrSFCRqyWnY80=SyNR7u6=eVQ7ci=Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: types: introduce ForLt base trait for CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 3:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The only way this could silently break would be to use ForLt!(), but then=
 don't
> use the explicitly provided safe cast_ref() method, and instead open-code=
 it
> with an unsafe transmute() assuming covariance from ForLt!().

Yeah, that is the not-compile-error case I was considering.

i.e. I was trying to think if there could be an issue with the name
reuse, since it can always be a pitfall. For in-tree I agree it isn't
a problem. For out-of-tree users, given it is very new and it is
unlikely they had that case, I think it is also fine.

(But e.g. if it were something that had been there for a long time,
e.g. in an LTS already, then I would say it would have been better to
pick another name).

> I can add them on apply, or we leave them as good first issue, as you pre=
fer.

Up to you! I didn't want to add noise/nit work, but if it is fixed
already, then that is great.

[ I also saw some non-Markdown comments in the other commits, e.g.

    // Invariant ForLt types (e.g. containing a Mutex)

  in the sample. ]

Thanks!

Cheers,
Miguel
