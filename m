Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5316B3AC0C5
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782557985; cv=pass; b=aSXvRvNraKVFAO9n6dm0KDbcuUZcoSMC5qOwyrIWvCHoihUbFY1xLBww9biiyq0MigvPqioIJeAp3Ua0d9SLshQX1WJ0vOF0dX9HYNd7KFsZpXaAQLkupFD/Al7bl+nqPisvKqI1aaNCViELxWMmaxldfbrXx1WsDYSYkdlxW34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782557985; c=relaxed/simple;
	bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUAmr4T8TPfR6gUQM3/oBKwd3va9y/I5lv1MWyqJBObgSl8It138+s+Uj0Pj00dGLO3gEbMru49MG4cZ74TZBWdzgClEO1rhrehTOkweGcghdYY5Gml5/+BsxLNWsIfaQSNq4K9+TMys++A1eQnhY4hj4K7aLvZrSSlUkdPIMAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTCC5J/A; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTCC5J/A"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c91a3fdddso104277eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782557982; cv=none;
        d=google.com; s=arc-20260327;
        b=NxL2yFaozowxGrrdotMJswpXFFemAmEQ08bG3UaeykrYT/JcXrZQDmb+56eMgVvFL4
         1CTFP+p5nTYNpDYjxfpoOVjC19Ee0TEZlexAcMQEnUTt5JInrFkw85mdQaqyf/gbHnPC
         xD5x93kiU7vQuGanQAWk51x3lzTuXQELZ2KAoS+W3g1BKbYsZtyuDl1S1Ad961PTX4rf
         TfOHjc2G4x/i+G/1zrehYKvxGj5Xc0NDyXOvtbbP9nKn2u7w2njvIWxoH1860/Z0Srqs
         coRYzZpFgO8Kb1Be2K2RI/QczLIWIfl9GQQeH72HwLKSlv+z6UIK3vtPdyOZSeuWoRuN
         lN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        fh=MGwrwDe2KH0owG37XXKug/ULaD2dNfQlKk6kfglDTIU=;
        b=fxbchh0oe1RtA5WPCCfmM4/r0ZkJaAbQcwaHl/KPvMq2zx11JcN53bgLUC1tZ20OB2
         dj7QOXqxxQSxdf8oAWkhziKtLML9JnpBi+Ngr3IYeb7/E+g20OHdcTS7pFQjS8DFJe3f
         MZcmvaSy6QflY6EGk1+Q0GUBkkVYjY6UAtLPrXc+PpjZe6qEG+5H7Mh/kbKoBOhgm8mk
         T6m9Q8zFFYLa86PLtVFEr1vqdsQST3/Es1aSoYY0pVH9oEi+/bORwVO0xBTKSure1aWt
         0wOduWEyHEZqwGx0F7mlM71C2cwX1ckRQrqrOmAHMLhtAVnAgsjqrNgWZYqv2O1iqN1j
         B2ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782557982; x=1783162782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        b=LTCC5J/AlHwNTPg3a/mufaYZZQPgXwVTgs8fczt2lpRLNdTwoqGRwRbAMpfKUYBqRF
         tS+tNysbuvGGWZzcCg+xlQHqX6oxURMOkm0IBSolgrgzokVninhfx9uT68qbSBthVTUX
         b7FYU3JxaNZyP17nYb4cQCoOeiZempuB+c86YataOpL/Hv8EaNKn3WUyYRfSKzTRbrQF
         uGDgTU8R83YbRtGgCiqUNEdyUb6PJ55IWB1r5Nb2Tx08r8w78OF7EKKdmjW+YLvEPoLV
         fvW/aaULnlXJ4iZ8cIZoBbMK0rOoNWgQGCYROfV4m+nLdPEOclvLuVSGxmo9MxiX5+Dc
         P6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782557982; x=1783162782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        b=HpW4eCKN8W9yR5n5rOzqhgVnIPEIY/8Iwj+DOuwargeRUzu0husQFzYNMFC6rYEmmQ
         8ENCCxQEDDz1wSMG13VGA1Az+UzfylW/p1zOO112O47k8P4Vbtfx+mqW07FJbYVPg4Xf
         9eqHQORLfiJDVNxDokQbvttDKxY/otZDPkFdOKG3aBzsunA+k1E8y3eqgOw54GByOkLh
         p2YnTb9EPcFABa10L9fXRUFHwcOyAzMebNS8113g6cczWi88+yCL0fwxwGPPeQTnYnXu
         9cMjmXHxOvwD38YOUkMxEjgTCUx0i+gztU5JdGbF9AAbaRDZ38/WAPJrVLsP6gQonvYr
         QEDg==
X-Forwarded-Encrypted: i=1; AHgh+RqziHbyAFlaV3kuRDtiBXCM0DW39ihonuIc7PY+o6wFbEvdccvEfoBYV3nGAyZeWconE9cCXGAM6LssLrpOWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLDtr/X+puHSs5ambEIyHNciFMKhpqKDj/8+COPxlVFZM+cvF
	W1jPFsEa2Sf5561LsG7y3RMSD6JS2ldbtYjrN9kyWoKRFuWjQsH4rfeElvJBcxGQhUBACrqXSYW
	upQz47e84EnDKZAEw9XgW8VqdjgQT9Hk=
X-Gm-Gg: AfdE7cnSHFeIyb6m/PJeSljnJRgpfNtkxNTwrGArVZL8Xk9yQiu9//LDeIE+5D9TNNZ
	Nv1TgRGKMVli2mWGYELRycliWJszMyAEl78faqR1PMmCaZ5SdHIeM40hyiw0c9SLHM8R2auPl4u
	vOo44tgsRG/UTt4sUHvjnBIrtnB1kRISNauZJGiku1uMW4zHbiIrQYXQp6wYwcc+BYfNDyn6Ypu
	31E0BPEgD+HO1huvxsQVRvYf7dO9NJy7SBLikbCPp0O4/1e4xJ1+Xd5okB5czWYx26STebZO0pK
	7eWKzvRkTWSChWwP7BJh1XwPc/FbU4MroHug4bCPSqCG30mMiDcpl3umHFcoJc+DdBTWfS1QCWN
	VIXAKqZuBSbN0
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30c84ce60f7mr4014070eec.5.1782557982397; Sat, 27 Jun 2026
 03:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-2-dakr@kernel.org>
In-Reply-To: <20260626183630.2585057-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 12:59:30 +0200
X-Gm-Features: AVVi8Ce3MkIh0ONlyKuy1KTbQ-yG1BEWeg6mkrKBipEfxJFXZQzFaNA4SZvKL0c
Message-ID: <CANiq72mT0sAUX0Ob0RHzqS3QOzRxkc9=UoOuPTTyH=nAa8D40w@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] rust: types: rename ForLt to CovariantForLt
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

On Fri, Jun 26, 2026 at 8:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Rename ForLt to CovariantForLt to prepare for the introduction of a new
> ForLt base trait that does not require covariance.
>
> The existing ForLt trait requires covariance, which enables the safe
> cast_ref() method. This rename preserves the same semantics under a more
> precise name, making room for a weaker ForLt trait in a subsequent
> commit.
>
> No functional change.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I don't see anyone else in linux-next using it, so this is likely fine
-- if we expect others this cycle, they may need a merge.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
