Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903B327797
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463360; cv=pass; b=VtQdq6Oh+eClrOmA9hfe3MvmmFDAgOxJbFwyhImdA4dvSYVKUrstTYqT8k8jYPLkraIeHSOh6dVnu/xz3wSFxTYOxlgHFvR8K7tXMaAtSsEq/Wdkb01r3DVluHpPHDocVG6aYbPqcZcEBUHDB+9CtLAv/5fRX6dEww8S4UTlfeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463360; c=relaxed/simple;
	bh=nOQz0muhgLoELpd5FN9SYvUUu2wnEMl9sQ0vYgazaxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQY+NJpHVmb0c6YyEBBMTTlXQeREhedyg99eckyyb8Z8eS2h+PZ+UA3GCKgd8YDaYBG7AKL0/JAiHPbS5at8qO1rQnqxpnqmQwPAagVPxQg1T1kGxQ+sVKpPbo1rvG0nPSByayovAfUhOCrqgZguTnvYFW2hnjapz1C+0Poeiy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKW+Q6pD; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKW+Q6pD"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b1769fda0eso78189eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 23:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768463358; cv=none;
        d=google.com; s=arc-20240605;
        b=Ogh8HvteKnbofz1cQHkrMqHWUAlCDSrjZW2psq1WytqSfCZTMzJMDjkRxqfjAi5qF6
         60l+iDcrtiZoAPkJb/0whrgFkOWJ2i5xzTPkk13IS8TKEF5Wp6sGYpZenbMPNsK0C0iD
         g0gCTzRazcwsvFUFjUrizF53nc+AVtik7E50BS3gAweaC7PSksz6bLBFnH/sYRg3lVDV
         lrtu09fF1Mbj07i0Np6k4WU+fWu/03N/UKBLmTFG4n6FPI8DefzujRHkp6RQoiox1mNJ
         nTXUf7KuurxVHix7sOf6lkpk4mG3y5YInmRRutOk2FKnZdHO32/K6GISFvKaH7RDuR2H
         5xAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOQz0muhgLoELpd5FN9SYvUUu2wnEMl9sQ0vYgazaxk=;
        fh=2pPQhFAHTe5MIEzgSOUkQflXc4mcQ9hVav7P7rmJ3UU=;
        b=OOSTozOmYkQ4cwJwpOycdpWmPPq6CVMmnRe3g8Lov24cZEIQVjmKujiGDcdDpfigr6
         sNIUlLqKIjTf1KPly0vE2LvDLRkBCpLbPH/r8crcuNGpjzx7jLwlyxd3TawjOfnQfFr/
         UnANyfz/o7WZtL6Yaa7i8AIGmsEIE4vHPTMHsaoQmy/lJd06n5wCyqxp6DLF4nJEBxdA
         Da9IIZlEDgnupBjK+In+rKw+HIWT1R9dv2VT3otWRkVFWdlfvOVq/+sx37lK/WxMQpf7
         TbJFDMPs5+6b0ztPdfBa2wuv/Hqs7lcXm74zQzz62CqVLqmWhidg7uklpiTpIBG1TYRG
         7nzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768463358; x=1769068158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOQz0muhgLoELpd5FN9SYvUUu2wnEMl9sQ0vYgazaxk=;
        b=NKW+Q6pDTwy+lHxrW9/jbrOIO2fXs60xw4O5+ZA6cc1ofr7oQC0w2PymPmrXox+n2A
         mOOETmZ2Gy4by/WtC8f4JQvihVyboi3HVD10A4iwW0jZ1p83k1jbFzYl4BpFOjcZ+cIf
         11XP0Opfoax+3yI3nqfvI28QTT5bXbUC+PM4lkmTc2aBuMmYClYmlj4pVlJuoQ2qlPIB
         NBW7slOfbR7kgeDErZ8DM+usaM1ZgU2YGqvbDn6wtoj/JfEAxvNSyidZ4TkkqqqW86Sl
         nF2T2/EF+UD9zQZ7lhMgDse7xQ/fPe8YmtL59cANi2eNhzDyuzwv0irID7dzWJ88+D81
         83JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768463358; x=1769068158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOQz0muhgLoELpd5FN9SYvUUu2wnEMl9sQ0vYgazaxk=;
        b=RulyiStIaTnlK1zeZ6tEBbvqZufUuSO5owIf7ZzK/ETgTOA4t6Ymrfqu9FYFN7KyY9
         rUyo4wQ4gZ3ycsk8ejoS3Vxhyr+DTPcp+4OkYD99nwwL4w74QNAZ52Py1Fo4x77G4gFO
         tK6pSOx329T08OK7APqWgmhCztdklQa7jqCBncaLCx5XAkqGLOW+j40D7BEbA6nhRj2A
         Vdrv8za+VAMCVrD+eiPx/M3fw/TDzx60laTAFBN3IQLHh+i72ecjykW5XzIRF6iEabo8
         Qi0iSakldeONo+7itiZZEm1euFR5DRYTWHIdoj8HYITZc2kW2z04tDhmz6LAIYsz8YJ5
         7ieg==
X-Forwarded-Encrypted: i=1; AJvYcCUa4+UO5URsqyoko9wvw8ctuUBB1E282fHULmCtqbOD1xyvmKTeK6spU7VymZk4hU8zJtFQos2yTWmODoNGjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTYS4t2+lRGORLHFTrEg+JQBOEO9m9bcJ1noivXi6n94sXOGH
	3EmYfH5XCfS51+alFrW4wIzzL7pdHX3N4cPlO+qDCkLpaI3xksWjrWD7Pu+KDqMgtvooJMQ1snm
	HtP0j1gYwQqkSpHqmL2d0cVCGBRnj1F4=
X-Gm-Gg: AY/fxX69PGjaddavx9k+350B27yM9NZMmNCYCVl7KVlWbtJ4lGQAPgxCpEeeSVjGYNy
	G8zKCuojLc+9NHUEqoNEhOkkYnDf5awxpQU8jrN7BF+8V8vN8B9mEVTcxiT89LeGE/SsKFL+X9M
	dzVqkZRLPXU+rXpnxM0IA5z0cbqa5FYHkYoNjLOxFVfwLXuaRSEtQcIdPeoYeJO3hw+qS60U48i
	BDXNKIN8H6RKU2ixhnP1IL4S2Jbx4VwWry7o8PkOK3ns1tgXO/uuRLrEt5HgXd+EXU5DGMVKLbs
	oCjkyKdMbvS/bpODBe8QGoan7/IgpRQLHEXYkYLhmxTKLRYpIbpVqYm+kVM7qKNHuVgbjMpibny
	+MMxcP7etZpW1
X-Received: by 2002:a05:7300:3b1a:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b4871e9771mr3815587eec.6.1768463357956; Wed, 14 Jan 2026
 23:49:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com> <20251208-io-build-assert-v3-5-98aded02c1ea@nvidia.com>
In-Reply-To: <20251208-io-build-assert-v3-5-98aded02c1ea@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 08:49:05 +0100
X-Gm-Features: AZwV_Qh28YVcYO6VVyfidVd7hc-EBw_qgwEmENRAhtkTb9yLXtecSM5NN0ft-tA
Message-ID: <CANiq72=U93ceCxLH_HYesCvCywpCsou98kM2Z53x=cx=iVXm0Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] rust: sync: refcount: always inline functions
 using build_assert with arguments
To: Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 3:47=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> `build_assert` relies on the compiler to optimize out its error path.
> Functions using it with its arguments must thus always be inlined,
> otherwise the error path of `build_assert` might not be optimized out,
> triggering a build error.
>
> Cc: stable@vger.kernel.org
> Fixes: bb38f35b35f9 ("rust: implement `kernel::sync::Refcount`")
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Boqun et al.: do you want to pick this one or should I take it with
your Acked-by?

Thanks!

Cheers,
Miguel
