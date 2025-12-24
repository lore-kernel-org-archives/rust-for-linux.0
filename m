Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689230E822
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766610625; cv=none; b=Bto9jutYVmuETKSA6Q3UkAHl/h+KACNBQzicfDs2eQ29XEq9O/SE4a5Un2BCX/Fg6/cLLDY64a0j0z/bXghG60/NPU8S4lN1+oHWeN6oXL1cc0J/WK0m7z9wqL9E7GkT4qlVJaTfniwXeLj+qmpM8bglmPRZuQZPRm2OVNUINOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766610625; c=relaxed/simple;
	bh=O7eCH9tPEjjkiX50GxW0iQ29YK5JDvfbNAIYkyh5Icg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2CaGUtydf8zcIk7gky2r+P7Z9pLGQJD57E0gaklAjdRz7joqsqqRv7Xk+3p2cVtIGz2i8RxaOif/a+EV4aHDTECFgiZtCHoLQCPHbHO06JWSWI4i4pIDXs+V5yAu+DAcPCvmw7JEoMuaBAS/q96uWGsAoRmEDJJNDIrs91rzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ys6Hh0jA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ys6Hh0jA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA580C19422
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766610624;
	bh=O7eCH9tPEjjkiX50GxW0iQ29YK5JDvfbNAIYkyh5Icg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ys6Hh0jAXeb9hAYuqWdNKQqKYdFx9KgWW7CFH4hDOW7BHIcfcVfi1A/9H55mhl1jo
	 w2dlYkeovrV2x7rqdzH/Tkzmt2vMcdhdKZ92pCpVjBd8nHxLT0E3AVZbZejRtqvdPD
	 qrRlnestyqAB7fRqCko6ceIc60oNLtBwjPbaB0GptM/SjzG4ir3RtuoaiKmym9+MmE
	 1GuUA1K+eBP7Hkmg0o2WfmzdaBtXy59D/vplnHjBxhqnIpeKOeyy9V55mXKZbkUc/v
	 DK116TQwNUOl877xau0jPXcoXAxLGqUZ7ngLqeWN4Zcfb+Dxn1CaVbqajWZ1tGAFAJ
	 Bnm2AoOwYwRrA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b95f87d64so51185091fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 13:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYYtew+SeDb6D6VCGFrU3xnSVNJurJu+GK+WkOfE74ATUasISaDXDM2lxe96SPzPHsKO7/0AzRum+c+VpmTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWRQ2qeJaEPDsWydm9wIkt8WrZ4fDfw8MgZ2ZZuJKEIllGXFV
	IkHHHDNImU/pB0YPo4Ef6PbVbC3honEHPe3nGFCNfemJ9/qCJ7xmar5p8NsitgG1dCESjCOl0N7
	vR1NexZD5+tAA1C/il5ZlK+w5qNtRN1Y=
X-Google-Smtp-Source: AGHT+IFIxgk+Gyj5ygMCEwdfG0MjJMXY9lrj6c9bWQ4tQlhYFfdfk0UKHDUO5Ra/PXCP7MKHIi/yzB36tFRBgfF15n8=
X-Received: by 2002:a2e:be1b:0:b0:37a:2dfa:c76a with SMTP id
 38308e7fff4ca-38121619c8dmr60585201fa.28.1766610623618; Wed, 24 Dec 2025
 13:10:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223115949.32531-1-dakr@kernel.org>
In-Reply-To: <20251223115949.32531-1-dakr@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 24 Dec 2025 22:09:47 +0100
X-Gmail-Original-Message-ID: <CAJ-ks9nVz_YtkYQuNGy1CUC8M4JL=KC26TyYmU5bZ2U7vbeJ8g@mail.gmail.com>
X-Gm-Features: AQt7F2oqUMCJJ8rcyTDJex4flA3uriK0niIKrJxszkb1JddNDDnlGrrgdqjTcyY
Message-ID: <CAJ-ks9nVz_YtkYQuNGy1CUC8M4JL=KC26TyYmU5bZ2U7vbeJ8g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in TYR DRM driver entry
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, 
	boris.brezillon@collabora.com, carsten.haitzler@foss.arm.com, 
	beata.michalska@arm.com, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 1:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Fix a missing ':' in the ARM MALI TYR DRM DRIVER entry, which does
> prevent script/get_maintainer.pl to properly work and pick up the
> corresponding maintainers.
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")
> Reported-by: Tamir Duberstein <tamird@kernel.org>
> Closes: https://lore.kernel.org/lkml/CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_=
ramNY-oh-0X+ayA@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..fe1e8da6c2bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2158,7 +2158,7 @@ M:        Alice Ryhl <aliceryhl@google.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Supported
>  W:     https://rust-for-linux.com/tyr-gpu-driver
> -W      https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> +W:     https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
>  B:     https://gitlab.freedesktop.org/panfrost/linux/-/issues
>  T:     git https://gitlab.freedesktop.org/drm/rust/kernel.git
>  F:     Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> --
> 2.52.0

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
