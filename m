Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E614D6F7
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Aug 2024 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478304; cv=none; b=JVv1Mbo6P/HO998q9pze9a3HvkUuwsICya9PtcH2H6HCQ8sQ5MQxLnoSRVdhJ/RSVzVGUBN05oRvricOmM/OBr2l2Bzjl+SEM/hRi5ZPrBkWrf23vyD7xHYCbR8dEt46a8K9yJbHa7MxfUgE1FDtOAdO9oL69rCvjvAXvnHtMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478304; c=relaxed/simple;
	bh=/qKLJ76IUNLPddIr8VugAy3y7N77IqZe6iOeGbTRu9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQOrTOAU44CA9ANO/Bjis8Q6tbxrm+Ub0UVIQ19S31AfwtYaVXRWNw5sznF/bzVcwASdHO0QLl1Butqk91Cdy30WEPBtX1jmlCiKgdapQSNO1UAkckTkBKhkvSlVqnmfFKybXZng7F1MBqA1FUx9oRmuqnJFFi9VPKA/LSHvRFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=SclNRj7v; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="SclNRj7v"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6c1ed19b25fso23008037b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724478301; x=1725083101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDfaHiUZUvqLbJKDCnwo4tv7jJFrBMb1nh7MzHWt+F0=;
        b=SclNRj7veocrWP9J+cwS0j8wsL1ioQrrtp1iJDmUmb+/TxsWLzOmrxIPIoQ84QRh9P
         I98sybB0Dk0fu2V/dMxkPMlScAT9eFXdtbV0lGoSZQutDyKsAXzLeGYovMI6GKp6bfQt
         Ifkj1Awmtg5ZFvz8NMgtds6xA11WKc4R6xFP9z9OdiRynudsaEU0apFkHie2W+zzpWW+
         /4+5Q+hQFyuJiebD4B3xZM0PIy3sQbvVnEcBCDxlnXfaRUiwSUV1Foz6M2ruiAtJpVjT
         7dwmzWhNcCwUiBKcjuiSoyjoWtAAv4aI8Vr4KWtGMfRXhn6DaDEy7IeN+l54M3BaI4nC
         UP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478301; x=1725083101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDfaHiUZUvqLbJKDCnwo4tv7jJFrBMb1nh7MzHWt+F0=;
        b=NJyiAlIeY6fDIdIQxfE8US1jd98wqrqu+DBJm62qq8jWkfa3l8alM6iO6otIk1JHAJ
         kHvMym/Z4nzBZdfRCZcgLIx5d+cSqsEIACLb7smpbmpcojVZZxDnef31j+azPI8Vvdi+
         ASvFnVDmLz+7eYEbpK1gkFa+NboDRNorqhf/cfbcCo6Hh43cIY+d0d+S8pbEDtXLJNp1
         gAU0ctCC2RJktNivP5ZrIPGghE6JA8RRjO5PU1KBiU2TEXjxp9weEntVkWhLzTjbwU5I
         UaUUv0x+mYmY/WIrp5VrTJ3tiU2uXnJbpNl+Wd6mkxy79/CrJq7mpiyCRLBe2L7j+ucC
         cuFA==
X-Forwarded-Encrypted: i=1; AJvYcCU6HYs6mRF8JJ0c5KN286470N5cq/8Y2FLhzgYs6GM6DpgzsWUwalYUg8Xz9RPOAphfFWefgxB8xqavLo4iEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZTUCIRgDAFThk5RXMKvPU5vUgkPKJXUoiMIdf6bQcSEV4sKSv
	GyGHKCHYBTS46OZxsekrAUTG2rgm4WR5t+l+1X/ZtDHCOHJ2BF/IlTgh0wa/y8LnAUOT12xNl2u
	JzP/F2i4gYa2LE9yzBxSdHJmxeINAmtSY5311aw==
X-Google-Smtp-Source: AGHT+IHUaLBDk3NILb2neGV/Pvcr7b8KOMb6mjvnbgHK6xZKxU2D5bgqzHhVQhCG/Pq5DLKXDEbOkqbJEVF1VD3yO2g=
X-Received: by 2002:a05:690c:3248:b0:62d:45:4098 with SMTP id
 00721157ae682-6c626109a39mr45246777b3.26.1724478301248; Fri, 23 Aug 2024
 22:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824020617.113828-1-fujita.tomonori@gmail.com> <20240824020617.113828-5-fujita.tomonori@gmail.com>
In-Reply-To: <20240824020617.113828-5-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 24 Aug 2024 00:44:50 -0500
Message-ID: <CALNs47uSeGR_Z_Bor4yKbd848XdohHMam47zwBct39nEmKFb7g@mail.gmail.com>
Subject: Re: [PATCH net-next v7 4/6] rust: net::phy unified read/write API for
 C22 and C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:08=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:

> +/// A single MDIO clause 22 register address (5 bits).
> +#[derive(Copy, Clone)]
> +pub struct C22(u8);
>
> [...]
> +/// A single MDIO clause 45 register device and address.
> +#[derive(Copy, Clone)]
> +pub struct Mmd(u8);
>
> [...]
> +pub struct C45 {
> +    devad: Mmd,
> +    regnum: u16,
> +}

Small suggestion: I think these could all be `#[derive(Clone, Copy,
Debug)]` so they are easy to `pr_info!(...)`. C45 doesn't have any
derives.

This could probably be done when it is picked up if there isn't another ver=
sion.

- Trevor
