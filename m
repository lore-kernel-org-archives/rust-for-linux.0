Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8471993AF
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729595085; cv=none; b=hMCCqClLfkGONA7XmXD57LShuD0OMqaCjIA93lr7oeGp6GPyRAnhQ2EEUKpKafhWJ12RDsrebhOfk6Q76II/CYZ/kghrq3ubFg/vdlHBaQ2Um+58sHveaZc8VjUa53ox0Ps3gIhLmhQ1+OISVuujjVbnUHjPHKJPzb5u1S1S7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729595085; c=relaxed/simple;
	bh=iVg2FAzFEvAFxXnNkdf9ZCF59BnILSc/6WBCXGP6J6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7tMNI25/JviiiVvKCINi1yZgoLsNA7mb2kSOF62A034dptlUIPYe3bsHleOvFRVs2x23g38MBJHlb3B2LJ+l1/8DxuHBXSWBk+x1w4m/GYW85PttPo0nrntL742Uqe9Xq5kb40KgjFGMFj22/1TBfQTTKje2M4flKSB3wUuu4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZTwpzdb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZTwpzdb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so3970718f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729595082; x=1730199882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYqphra7ioMyXLLZNQGAcA6KShSPo68yjMcIhmyT58o=;
        b=LZTwpzdb+LuFLyN1yeYZYzjyvQI/9yRxKETnfD1sSA8J03+6Iechj4G3uarvWIeJtk
         gKg9nd4qJY+bcB6V5dvYsy3eozBZSFDydW3b1P2ZhLhvFGExlZDsPfGxNvOXOnQrkb0X
         uaMhhRCNUJ/OiuAzXOO/bQOR4D7TXbdrh5BM7oE9GTMYLa2fAWWG/pGTebthQp0MI1cV
         l3Pi9NbIrbDhXY3QaVRQr0IxonqdwYE8zc3czfQEzRoMUDs0436/vl+lKmJnkKfQpS+q
         SWG46yZitprT5Tu0hAtE8K8JDB7CxSe/2s8cJMSZjJqXuvWJgcB8/c5iPpjfXw9RFKRL
         tvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729595082; x=1730199882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYqphra7ioMyXLLZNQGAcA6KShSPo68yjMcIhmyT58o=;
        b=dx5Bk+BQHQTP3P5H+J3MtZ9YbgoS8LgcZz6olk6DDNWLrGJb/VSLsTwXzNlGP+Q1Cj
         HI70D89KaXrVOu3EvTQfCdi8K9DqyvJbjnlOBsSiLrVM3JcwSjddXJRpGoCTfDKs1pMH
         BwFbynLuBUkHOki4FGc9hHLFGycMBZMf2/TKMUONuhobtmZoZE0Ec0cWbDIPsOIEwLJX
         qrShTys02wqlnURCKnsuoGZjGcSvekAAdsIm3yCxYi0g3dE+8mStw19ZXOv0iN9oMaTe
         G6HY/pUxA+JMTrEwh9200reMOERPfZAR34WrCYACVl30DIjQHw8TKAdKh+R+eXXzNRFx
         RplA==
X-Forwarded-Encrypted: i=1; AJvYcCWGz2DJH1MlFaSsk5HK6TjTCfKLDKR2Uls1gYY4JUibgXnyuixUKDsxaleWTLnIAuKzAlO6KoepeiLtJrASrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhoBOdsP7Efuct2AfXfg+H5WrUWhcltRTb728r7/ziOa0ktJlk
	FAvIIoC2+LqzMbhLfasTyEPT0gc/7hvG2HroLN12ioRkO1kebF+Z0WDzP6HMyYPClRL31zDnLuR
	SqITbdzpG56MK3pV1WV3cbDVLRg8v32HbDXp5
X-Google-Smtp-Source: AGHT+IHu1TNYDncA5Nl/blFWdyNhhH3fwJ/uZG7OcrIUntvcftPXLjUPBpi3MwZRKTeUeq7lNS9mEDPXMqTC8YgDiU4=
X-Received: by 2002:adf:ec0d:0:b0:37d:377d:c7b0 with SMTP id
 ffacd0b85a97d-37ef0b7cf52mr1871673f8f.18.1729595081737; Tue, 22 Oct 2024
 04:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-static-mutex-v5-1-8d118a6a99b7@google.com>
In-Reply-To: <20241021-static-mutex-v5-1-8d118a6a99b7@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Oct 2024 13:04:29 +0200
Message-ID: <CAH5fLgjpYPBwoE10eschOVnepbYmcEKtaZkWyPT8ZXG2wGrruQ@mail.gmail.com>
Subject: Re: [PATCH v5] rust: add global lock support
To: Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 3:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> +                    /// Lock this global lock.
> +                    pub fn lock(&'static self) -> GuardTyp {
> +                        $crate::global_lock_inner!(new_guard $($guard)? =
{
> +                            self.inner.lock()
> +                        })
> +                    }
> +
> +                    /// Lock this global lock.
> +                    #[allow(clippy::needless_question_mark)]
> +                    pub fn try_lock(&'static self) -> Option<GuardTyp> {
> +                        Some($crate::global_lock_inner!(new_guard $($gua=
rd)? {
> +                            self.inner.try_lock()?
> +                        }))
> +                    }

It came up during the meeting that these should just be pub, but now I
remember why I didn't do that. Making them pub means that you now get
"private type `MyCustomstruct` in public interface" errors on
whichever custom struct you're using as the item type of the lock.

And this error isn't a lint you can silence!

Alice
