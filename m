Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063623DE43B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180359; cv=pass; b=h+HvXr12wBZh+0rHbTPRk0VDUer95Rv6DUAlda3Mxgvl0JQobmp48PDM/91N+E3QyZUrZqWnnrlS3z4n8dqXTE5HAADAzku7soL/veI6LZWDAoqQbzoYPUYr9KPg9R59g1FbF2oUFJwsA7+waXJkOLq9S7cC1QAafZ6y7pA23A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180359; c=relaxed/simple;
	bh=D4vxySje2jcLDUWWdsj+8rItrXiAllGaKDdCs5nMmGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBlfEAjCMrA0KkGih+vNVxGwA222JdjbIA/q1990MozWdUQkpz98kF+bUeoB89FRmZs9n0H0X+R5uZawwX/Z8S7F+FGXqvxVoHqIRXa5/DZrElYad7e3H5hOScW/WaRnvjM+fbzUtfRIZAVPmWf+I+zI1lnQikzw8ZpB0c5okgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYT5cyQX; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYT5cyQX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b78b638eso10700947f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 15:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773180353; cv=none;
        d=google.com; s=arc-20240605;
        b=O9+mn+7j8sc6cifgVDF+YhHRTRafWfHOEVRftib4LkX3jQI4P5uzvXEg499GwB2LGY
         DaXq+1iZ+rQ44t/lqI0Vm0iC9GwvaqnZRIs4ehiZt8N821MquTI8FNb5x0gH54qKCCK0
         xKCjGn6ZtaBdd3FxoyOhAwivWt2/IqV+sMxQIiPLpw4/qcLbLWIzU+ZfaYU3/+Yzw2mD
         2Ye6kYsO8QFQI3UynLBDBUD0ynI+F+n1Wiiph/YyB3KBP1maWdzQAb0ipiTME949GuRo
         Xsyhen3tO3+zWUSL+zi3/lXwkfcTbV5yzRZV7CTQRtqPYJoW73pXC4DhTvqvdSOyqFBR
         3ZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
        fh=DBFeJpDDOqYW40agksrRJReOF7o09JJ1Tc/2beJXsDM=;
        b=jhJ+oeRO3wjojcZw6GtEtNhiCqnyIH96qcyKdkS5PMwOJZJw3hElcJWmT6nhpz6SSK
         y8kUl13He85UgGjm8kh7FxrMzVAV0d8pLScIC37j1ZGpmm0pUYgmtMtabhaxkY5ZM7WU
         ZUwOeunXNxPforSGdxJ4B+9Oudd9L4Bmk+rS4mRplRjXVWFxGMc/IqxCosWlPDHWDPX2
         rMoiU73dXs0bThRElm/nvLmKvkt1IoRGubmPFupNkrR01+BPprcVuwAx920Hl9eUEOi7
         zYOZ+rYRSqoSgcQt/+iNTANYDoOOJzQAU8UJTNpTGAB7fHEcsqO/dRa9L0buzIdR2ARo
         TxGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773180353; x=1773785153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
        b=GYT5cyQXMF/RaWpLhEOfwAKVSb+RRKY9SLzby7SBcplFpyxIeIQuxf8Cudx0ke8GD0
         uG+ZEcv+TtV8XCdndCol6w9K5tJHKLkV/kSLsSbkz/8isTn+roQQK13pjG/lP4FOMvJA
         ia+hq8NP/GmwAvFNMlYscVOYziRANYPyqFdQUgCtYZWoqSHfP7wNrY6bBV1AlVfoUHIa
         vjQ/mccq44SQIgutb+0fGfDl5Pzd861UnWe3vzdM1HLSwvAt7TrVZnwSDB8Ss2uY9z1v
         XCBbsz60gaPlqEfn7cdOlGcpi97wF7BJ9bAHqPIAop9O/tYuFNn3bfgEHeIH3HAQbOdu
         nDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773180353; x=1773785153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
        b=vhyTWmPMmK0S0Qhf/w5UuzTW2MBcTquJEvTcQiFTTMfmgqTarsTMYMMBYBZMF6PN9j
         UsKdSooUpT9MY+keT65S0J67tW97180OEev9ArazNitHlH0KXyXKic+ct+UWp3tTdMyI
         tA9AYERMH4uXniMeUEBcQjHlOF3OqEdE4MaMkj7QTkZ/KvetDfZCHGYR/6p2y+xUrQVr
         hyPSJBaKFKIJl6t2ls+lfPsoJwwGumXF5G4yNvF3AVX1SPtHbv1hyYTQpUyJmvamZkjJ
         hAtnFC8xsq/fl3YZHLwRTHzUkoB6TiU5C+wVFkzZKBA9/5b275fsm7/N2RX9RF8dy/ss
         fx5g==
X-Forwarded-Encrypted: i=1; AJvYcCWDq/+2Kj/aUEZtL4eWfiOTuA1TgFsmpfnJpyzYIah6IJpt01EHdVcdkhWheBXMoGQxLn5ISgDH4c76XkHNHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjD7zkE+sOppli8pODAmPIJ7p0H4IeVglqZ8g8PV6ItoAs0iv
	XexnoOgkkIQbXV0ZvZPCQrecGZ7vXoyGS1gM2AV89RP5ZaDM4JP4KtoZVsic5BccixaZkOraLio
	qIwEb2aqa/o2oruR0F4hqVLYeflW6OwGcYMyuyxsNiYAG7rxmKpf+D2vd
X-Gm-Gg: ATEYQzwtpKUerivKtupaKenz0+yafHQSaSc77KdxNdLmf3JvxsMzgm8Ii5x69Bfka/3
	yno7un4uX5p+AX0ileME5p46PAbdzDyKTPGYsnvAcxayBAsf8MkhfW2LKWs2t1bseKSxu4MyfcC
	AEueuSbkCX1Jy567fBv1Krq4mwr7GLGrlUBdqlvqXZl1dd1MSYVD2P/+b8Bg8+2SnQHqQClaxrM
	z49+IYO/kf9e62e+n1V1OokwhFd2FegEU7cN17leWLW3p9EQ3KysuqfaRhVpamxekimAcUme+eR
	dPMeLxcIuJBNwR0SfE9bF1VQPxSUytAVei83Ug==
X-Received: by 2002:a05:600c:3114:b0:485:4526:ee06 with SMTP id
 5b1f17b1804b1-4854b0bb7dbmr6727395e9.11.1773180352890; Tue, 10 Mar 2026
 15:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310220000.1897166-1-ttabi@nvidia.com> <20260310220000.1897166-2-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-2-ttabi@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Mar 2026 23:05:40 +0100
X-Gm-Features: AaiRm52vMWD1hUQdoTLBXH731zprYyazaHr2Z67UGYmg14XKa-DqpFKMibMQL2o
Message-ID: <CAH5fLghramRQukqaMyMu_YOnmkDfy1xEOVBwwpEFDxawm5akhQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] rust: device: add device name method
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, mmaurer@google.com, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 11:00=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>
> Add a name() method to the `Device` type, which returns a CStr that
> contains the device name.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

with below nits fixed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
>  rust/helpers/device.c |  5 +++++
>  rust/kernel/device.rs | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
> index a8ab931a9bd1..3be4ee590784 100644
> --- a/rust/helpers/device.c
> +++ b/rust/helpers/device.c
> @@ -25,3 +25,8 @@ __rust_helper void rust_helper_dev_set_drvdata(struct d=
evice *dev, void *data)
>  {
>         dev_set_drvdata(dev, data);
>  }
> +
> +__rust_helper const char *rust_helper_dev_name(const struct device *dev)
> +{
> +       return dev_name(dev);
> +}
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 94e0548e7687..6be93425fa0b 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -489,6 +489,16 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
>          // defined as a `#[repr(transparent)]` wrapper around `fwnode_ha=
ndle`.
>          Some(unsafe { &*fwnode_handle.cast() })
>      }
> +
> +    /// Returns the name of the device.
> +    ///
> +    /// This is the kobject name of the device, or its initial name if t=
he kobject is not yet
> +    /// available.
> +    pub fn name(&self) -> &CStr {

Missing #[inline]

We want 'strlen' to be inlined into the caller so that it can be optimized.

Alice
