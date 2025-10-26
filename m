Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2465C96
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761489387; cv=none; b=vD5jIz+9m/KuCscg6RdDBaC2eWWCXrC/tziWz5X6izbjoWBjKK8cNwovoAHBoXsK2GwU1yV+eaw3dWxOYFk2AMTOZBu1AKGM9QOovE129J9W1Ycsni7aVrU4bG8dTxg2cdH45aOszkI2wQn00dSk/NKja4OUajl0CmAXzNOtZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761489387; c=relaxed/simple;
	bh=bfoyaV7fTySChzd8P59MrJSB//MaEELP8QuOboq49AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUnJdiXpGpV2RUWYBcdFGhN8NdzI7xvBPsqiOF/N1lo4lQGjeN/Q0r6O6nfwhz9kApZbF0l09clzjsDoTv20kmXDMGQTqVYbIbgXRxGScKZ86pcseMZwxQpIE+TdjuyveM9sHTeITIgL9qGY9X2CEvTJtkULk6QyZQetgkTKJvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQAeo93U; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQAeo93U"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33fc9550f68so643418a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 07:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761489385; x=1762094185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfoyaV7fTySChzd8P59MrJSB//MaEELP8QuOboq49AI=;
        b=ZQAeo93Us11vtF87iN9bk9lQ/T9k15adBvNdbj3aB01YqVX/2pxeYugHa96FA/kpfn
         tODejB5gL5uirMo4uKRcgX+WyLB9d1F9Sc3cUXgJLxSMpEQ8yjYuGE5pcg9RGaFn26Qt
         xnQflWASDS/O56IKTpWX+NKg1AwBzyVIeJVbzvI+qnMXRSPW2vxrB9/+XwF4vWTatdP0
         icc3nSERjsjJ42X4omY557GpMb3y00r3o/gKujtKA+JlB8cVVu7PLSD6LeGZRCIS7/WH
         pnJ12X0p6k9aYhwHVL2DT2WH2iur3+b4YBsqgKrzvO3/KtPsRsPypkcDL7AN15/k554n
         wxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761489385; x=1762094185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfoyaV7fTySChzd8P59MrJSB//MaEELP8QuOboq49AI=;
        b=EV2j4hwvP+VsRCOVErniF1ldVq9K3F9leJCZR7oqRswwYMOsnKbKOQ+Bx6Q3dteDHB
         ryix435YthwTaDV1Q3ZGpSlAij1xBb941qnjxW2DkgH1tX+k/o+JI6pxr6DjEPQfQBSU
         og3pQUYDbq1EOy9drYDxh6Z4vzwIORS9pNhHz1c2TonrCK5ilaJwwJnQ3hUHBfWr2eWV
         bzs1Ty4AwWjpaiT5S2KopVxA38byDdcJLRk34po8fo2k3LPXp5QYnySiPnSXhORqTx1J
         gSox3iqkcMfvtBeiaPzISyS9BuPZjSvUhLmkuyj2JtmVOfJtRG3g6JMrTXsNjJQ1Az8V
         bHBw==
X-Gm-Message-State: AOJu0Yzt3C87GThutEhQnmVeSxiYi11RvR2RpuT8DSug6Op+fR3EeGRY
	xTYnf/xLvVabCJaIuiXE5eWlxhw5Wr27zCDXJpLLiICvf7uETJnhycOChTUQvMJiNPYAZTQjQUQ
	0MSOW/mm3FULM5KyJarsFBw82JgQOXgM=
X-Gm-Gg: ASbGncsz9GfNz11ke0romOkOUJuKzuW/a2mEKoColzsza41Qk6K6avd0m6aQBWOSyEv
	g8AWaKwuHu5PHDpbnOZWbBlFwK4eguaOe/EMKm+RCsad8voXazC5i1C4bQPranEO6uckPZhz2ox
	JX4Hxzgk4v2y1yfdp1XjbWrkBCy4nBlIGFXfC4cMII7tlwjWqac9qB4BcqVrVzD/AVGOCNiAX5v
	51Ezg76VVMWqS8HTvGiQfnjMXpv/E1i2w96lHKwZbnpOc+NlfOwAkrGwSXQt+i0E8bD23Aefn2e
	g1Nbixtn8PIZsjFc0h9wEjtESlWKo5UBurckvgrcgN/MYCfxxEETBWRk+0hbEVX4dXc/NSPJsfE
	seKh8O/qJPRBq1w==
X-Google-Smtp-Source: AGHT+IFVxex/Hvf1Hd/vAwZCict2EGUF2vy+UiYI/sA1gePu0MO4UxHEviapG32w53ALhrtBy1cpvP25qhGoJgOjZGs=
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id
 d9443c01a7336-292d3fd9a38mr154422155ad.10.1761489384860; Sun, 26 Oct 2025
 07:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFRnB2U1uvg1vyZe1kDi7L3P4kTFowfOo6Hfo9WJED4qve4ZZw@mail.gmail.com>
In-Reply-To: <CAFRnB2U1uvg1vyZe1kDi7L3P4kTFowfOo6Hfo9WJED4qve4ZZw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 15:36:12 +0100
X-Gm-Features: AWmQ_bnxMU6b-D2cZjIfU_QUJYdxOKaC3c8ozScS8fUS1p7ym5Bwb9UakSfUcCA
Message-ID: <CANiq72=t=oLcpR6ML63Nofs-f5NFn9b38SDgKoKDwkGS-USK0w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Alex Gaynor as Rust maintainer
To: Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 3:30=E2=80=AFPM Alex Gaynor <alex.gaynor@gmail.com>=
 wrote:
>
> I've long since stopped having the time to contribute code or reviews, th=
is
> acknowledges that.
>
> Geoffrey Thomas and I created the "linux-kernel-module-rust" project at P=
yCon
> in 2018, as an experiment to see if we could make it possible to write ke=
rnel
> modules in Rust. The Rust for Linux effort has far exceeded anything we c=
ould
> have expected at the time.
>
> I want to thank all the Rust for Linux contributors, past and present, wh=
o have
> helped make this a reality -- and in particularly Miguel, who really
> transformed this project from an interesting demo to something that could
> really land in mainline.
>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Thanks Alex for the kind words, it has been a pleasure!

Cheers,
Miguel
