Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D214A4EC
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301296; cv=none; b=dIuPHslzwgGfAHkTv5Fn7P8fJEMPTYiITXZVdlT8iCy1vPACjB/322p8mfgP9WG+wXNdoWflaQ9V2Yi9i+PDzacp9V9RfZpqYJfPMiq1iueUEaOCMbxsJg7biEQ2rmUVaILdsjMI8PvWeP7SjOkgoneQXPLZeU+xX1dGaD6rXAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301296; c=relaxed/simple;
	bh=vhq2bcn6tB2taXgSamYwPuh8jEpEiizgkvg/OOV1I0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhYYjNCDYGLfuKToGgjZdb1eCjJ1KU+h67s3rPO3EOFfvqqiAsoYlXNffKo5A66r8QRkEI8r8q4D69cdpP6KscFWoBGDi/vZBxcwllbTPnScL7+ssWLqKvbC2QCfG3LqHNDJBaQ3ZX34ouTgio5PE30ECrkHGL43Oj6BN+0qNIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=GrsQ2+Dy; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="GrsQ2+Dy"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-63127fc434aso9696257b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1718301293; x=1718906093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6mt3EJVIuLRActdP09PfdwEa3eqcbPd0P35VWXraU8=;
        b=GrsQ2+DyB+tEct7IjpG2Pl8uH75NQ9mseOIDAcWroiKGKr7/Ly8e1HXD1gC5k1sn7j
         AfAlm9b3XEeJYprTyuQRC/nZcflRthYippC/9bFHCle4GgyO4AqcKSzjtaJNIZXWbG5o
         tDck7d4/bH2Mxrm5nncZf5zeFxfbr0IcOLDNUJG/jkklwkhmDrYxg3Qb+xiKO1A7kfP2
         uz3nFZkK/rD1nVzdO7FLbRkDwwgTyAGB4SR8OjzOpyn9vWCgQBqYM2CwTR0ovFsg8BAX
         Y//2chnoZ0gamHC526vjobPt5yueIHC5g0FCp+HMKgG0tuHHEDbiVsUwJIGnTfqIuIGz
         Ciuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301293; x=1718906093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6mt3EJVIuLRActdP09PfdwEa3eqcbPd0P35VWXraU8=;
        b=dmvzFgKlTrauBH0qGWsievUvsATnAaGDoP7nTV4ra2CBJyLc+5patjUflPQIzJ2D6B
         p5vtxaMlaTJ86V5hhLR/bVCcx8NHYQ8Zv//kE9oZ3PEY14Dq44MsmhTRgfOPrSoBK1lp
         FBjr0TzSThnnZr8CcxnykYkSCXENX6jDAgpWO20r5i2QkTWrvovBG7QzuvEol+dodStx
         fQ5Qlc0O7Sgrt7Vjb66w6HAPcCk8UiH9WkBRZiTtLBKlvv1O6aMgIWQdCRRu54zjAOAQ
         MlSQF4GaXDTwizUtzj8MRYC8reJo3Q5W6juF3XNQbGRBkEYzyG966UuPCtC0WsOpqswH
         /qsw==
X-Gm-Message-State: AOJu0YyxzGKpopMdQ0oRVI/jvlt+39y7kidHSldLBWdLmMbz7qCAoAlG
	X6eViPtt0FXddr7SnRlFSTGxd46lwGom0x2LrMRLx+0Iimqu3+nFizYBiRQGdu8YkKvxsoR8r/x
	pzKOETTxNNLfpv7nnsotpjMFWmsyl8DIpk7tSdVrE2rHsOfhJ
X-Google-Smtp-Source: AGHT+IEJ5/EFik2jQU0jQrstc3C5le426SSwPm6K4F1K//a2l1G8D9E5rGGL0YNNAzC/EDhU414pmM8i3AAb4j8dH8E=
X-Received: by 2002:a81:6f8b:0:b0:62f:635b:284e with SMTP id
 00721157ae682-6321f586de2mr2446077b3.0.1718301291842; Thu, 13 Jun 2024
 10:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610122332.3858571-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240610122332.3858571-1-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 13 Jun 2024 12:54:40 -0500
Message-ID: <CALNs47uDQK2_7d4PakbTn9f1snBZ7exJKz1cr4m_dezUM3ooFQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: no_std is used
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 7:24=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Using the #![no_std] attribute in the Rust kernel support is different
> to the default Rust usage. Mention this in the Documentation.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> Changes in v2: Incoroprate Trevor's comments.
>
>  Documentation/rust/general-information.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 4bb6ac12d482c..8f78d87670aa2 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -7,6 +7,15 @@ This document contains useful information to know when w=
orking with
>  the Rust support in the kernel.
>
>
> +``no_std``
> +----------
> +
> +The Rust support in the kernel can link only `core <https://doc.rust-
> +lang.org/core/>`_, not `std <https://doc.rust-lang.org/std/>`_. Crates f=
or
> +use in the kernel must opt into this behavior using the ``#![no_std]``
> +attribute.
> +
> +
>  Code documentation
>  ------------------
>
> --
> 2.28.0
>

Thanks!

Reviewed-by: Trevor Gross <tmgross@umich.edu>
