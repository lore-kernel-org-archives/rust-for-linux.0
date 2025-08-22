Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE452E888B
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848691; cv=none; b=OrLvS0oP1GOrh5Y+R6VYUcVKZf0NUvDstJB9T4f2DdBKEYUk8vRy5c74Qa0/1ZfU6d3Q5q/0h3yRGKrIm2CpbTjqxW0lyCLOz6Pwou+xIpauMXDc9PDAMjxH4MThU9nAmKOsvtaCKynzv0w3QknQCYM/RBSsDhQpu80d1m6tDXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848691; c=relaxed/simple;
	bh=faSEfiTpREL/ys4OdLzvhf7bAeARCS9tt3rUMIAif24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3jUdHnEGkF/FlMLk2hkpAVZ7EPNROdsk/1R5XQwi77FrK5ohHWcTT0xypCBxlQO73eiwAFjTjt6oiwL5fKCx9fhiEkTqzuDFjWE/9UFxhLHmgyteW4EyOgPww4r1cH3//Zeji5sWtXqT06RFGINWoVIvl8oMfG9kbJ0wADiReo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gEAf/wWt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gEAf/wWt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so12437745e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755848688; x=1756453488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2G2vICsXO8f0ArDyQQPFAnFMYMmrHOiPk4MQY+POTA=;
        b=gEAf/wWta32pNHA4IE8oJ00dAqxUG/ZYX8oqYITQ/rJmDtVfB+/QzVWStHoch1KGLL
         c4MuTqszr8Zim4FHilnzmT/TpoclBVb9a+MJ1LHPhZ4fQ/ijNPo3DcnjBvK9SjKYQ4FF
         5UeTKO+Eae8qMyHnERnqlRxouJRYjPUt16z2TOWVWHFzTspCKGeeF86ZT9OW9MK9Pql1
         BcfwrdnwcEfX2xz0rQKvkt5OMQVW2pKfE0DcdCBnES+VVRUGO17SV8TDXL/aqdS7NXWD
         GUWjvLU8XNgSl42EL26SU4cNgwBv2aUk+sMh9CCePrTVaBcMIyk9LETgPVAf108Mr722
         9EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848688; x=1756453488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2G2vICsXO8f0ArDyQQPFAnFMYMmrHOiPk4MQY+POTA=;
        b=sxyTx6EVeM/M9dXG6fOcUCeM+I60gaRKKUztjaX0hLxYWLQ4J/kWGnS/6cucngongh
         I2CjDIkrd8BBlMljTnNo+ovErfC/BEC9lm2E9E7PlXDCxtrdvAABDeEaTauVEp14XJNF
         rsuynTSbCKa9vPbM7LACZi3c62Np10n4ZGvfzPyAZAYkALhhRF+FxJGB2bEZftZMFg74
         aaBvAQGQxJvcmU/VUuFwn3EuJGjbTtUFG2QOvV0m01KJrkZkzKWlFcN1RFxE9/uQolbk
         mcGbMnLv0nIPYb/IhXxCiMMAF2eVZAqZkapDbKb4CACJLejeNdaYoSriuz9G/AJQber/
         +Siw==
X-Gm-Message-State: AOJu0YyzLchhSqgEGUEqguGbHnEfDdO58Z9OrkDxB1bVveQSJwcXg+9h
	pjwQqMGtXMLFh4tcBhcTh47ILlwFpmAq6jV+4hBPWmLs0yohd9sil+w6uMdLHczBwoWQOM4hnLS
	n3bs0W5V++pkzoCaCUxuaq0yC/xw9u5f5uQ7aEFiJ
X-Gm-Gg: ASbGncuUYUjz9qyABl+aCWhyVeg6frRvMCdwuYSwPonLOGsq29XD/fyO4Ry4QFG5bKF
	vOdxtGhK0woSTaqQyv/hnEYZNjvb9KEtB+/3H1YuNTtVQxELDkDjcNl0d2J4h0qSm3KFRKv66Ha
	ino1+eJjFnLbam3HIT4G1/g2x+JXXxY+9fIJ+TEfcj98f9Cj3iJxTxrOj6APQ3zJNFjVuOFUkP9
	Y9dYT9yRIIM7jo1oW/AjbxPGGvD64qTPKR1P+HW2a3GKrPrET1HfTXodCW12OQUKkq+gfZR9VqE
X-Google-Smtp-Source: AGHT+IEoadB/lkuSJqNlo/SILQdpicC+7QYyIGD5rL1L8rNRHfY2sXck2SdaIgLT0kyeAavUOWBzZ7civMIWG5FymAw=
X-Received: by 2002:a05:6000:420f:b0:3b7:8c98:2f4c with SMTP id
 ffacd0b85a97d-3c5dcdfd718mr1520148f8f.33.1755848688089; Fri, 22 Aug 2025
 00:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822041313.1410510-1-apopple@nvidia.com>
In-Reply-To: <20250822041313.1410510-1-apopple@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Aug 2025 09:44:36 +0200
X-Gm-Features: Ac12FXz0SxebOQqcLm-97q0sd3X8rsVm5aDZCUPIyZPEj1aHLk_XWZ8qmb8qzgM
Message-ID: <CAH5fLgiYy-9DfjL+0NoYzwD=8tTSBrFMhJveZktRncJE9czkrA@mail.gmail.com>
Subject: Re: [PATCH] rust: Update PCI resource_start()/len() to return ResourceSize
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 6:13=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> It's nicer to return native Rust types rather than the FFI bindings to a
> type so update the PCI resource bindings to return ResourceSize.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/pci.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index cae4e274f7766..ef949ff10a10a 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -10,7 +10,7 @@
>      devres::Devres,
>      driver,
>      error::{from_result, to_result, Result},
> -    io::{Io, IoRaw},
> +    io::{resource::ResourceSize, Io, IoRaw},

Maybe we want ResourceSize re-exported from kernel::io to make this simpler=
?

Alice
