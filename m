Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9191547CC
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722858427; cv=none; b=t9JqpBwvcesHK+b3zt6OeTgYYI6rEzX90DBA3/dJ4a7JbIncFR95AW22/kfdEwF/l+8JenlD8CSrPOyT8oe2i1/PTCc5j+p8Cz8ATwtT75u/hlgU/KgO7hlefDCJLwjJN5wxxpDKKN04DOBhY6NFwyNwhCpAIgLTf+lHir/2f0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722858427; c=relaxed/simple;
	bh=SYr3nGv+tCIM1QI3bK7q+uw9suu9eo2gRjoHtV8Re7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2TK1RuwGZGX9Xh1ejudDglohyIO02BFhge9Ps5Er+tnjktwCQO0ihA9olNbIcJ/mROIf42Sl9HWYyrAkcTBdKONOCnXUMjvxGo66pnk0fhQ9OfkCC6OJpYMD/ML79alQN+GkzkYEHLDFXBhvPiaGLciX+nyEqLfYCvWpxBeFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVeoFRAc; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVeoFRAc"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2cf98ba0559so5582621a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Aug 2024 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722858425; x=1723463225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYr3nGv+tCIM1QI3bK7q+uw9suu9eo2gRjoHtV8Re7s=;
        b=iVeoFRAcG4D2eYP2U45lRTKl/Zrt31nRARweH+z/L6vDhO7MSQ9vu2odMC1jJgVZgm
         baYDaqNdm5+vbxQXU60VVwNgCFEW6eyrMxVxV3ffKnH/fPvtkrLPU2S+kbFUhV3ozNds
         Gh43ONRgq2PMelkIZNOuOesDWDmcwb5/76C+hTCeQprcHWGvUB1br7ZqiUKoIhaEZp0H
         Zrk1wNW4om3gDfW4xnGA85bsVEEtaxYfSSe2r16hpWdcy2p0ph9f5QyGWklcmSbeTIIT
         zrInk4KrlULj2NwCt46mvzxb0dOn19rsCKUerKyar5uztUVFrfDHjxsFFjN46Zob6g9V
         Wgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722858425; x=1723463225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYr3nGv+tCIM1QI3bK7q+uw9suu9eo2gRjoHtV8Re7s=;
        b=UlHayKCwOrLdvcxF3dWZGqdWP/8ZvSmBdGaE6iw3vtSh36s2+7MDasBWd0EhjMi0zG
         xU0UVdQh6rLF4w3puZCqOLtRHWL2oRWjkpNMj+Hwg/pXWmgTT1V+eMVZHlX27Apw9iFb
         RYDGws+/db4TB2SOH6GTO46rQIxXHP81FMS4yhRI3TcyxA5FrMnZykOOswCFiIZ+4fAJ
         y6j3ru3b14bM/5WbwhA4dy/+RkAnta8VXRsQ6EIu3cl5oyhVVGObk/YStirDa98aPBDf
         jVbC5gkj7Pgs9ni+eXN+oOjlPo1/UXAAMw042AjjhyBv4vZWsZCexDWDSijR+1ecIeaW
         2ecQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCeb4UOKBBksSpT8m7PxO2CWChCSk/rZJgvXHEEMuOYIZLoJvTIgXCZJ4ygoFZUpfFjZ5BuRh2seh59YBneIPHii5G3GlTkoWFpmccAv0=
X-Gm-Message-State: AOJu0YxjMvvqFxLRhHEY4Rpnx6NmVBm3HWkDKQVbyixI/35nhNG8x6/v
	+nDu0pLSQQ0+3nq2D9dkJiIICYmLVtVEuAEI7Es7wSzMMvsiyOUAV4ZZo4c6/pfktZ4TPiFP+7Q
	25KTe/Zt22Z/S9u3dECmHZETTWNI=
X-Google-Smtp-Source: AGHT+IGEhxBpFtpAVRlV+09gkfUetsBFun+xFd41cInq0/grs2YheaRJ24FX/Sm/Z70T8WB9pux/kqovxXyF/PL+GA4=
X-Received: by 2002:a17:90b:184f:b0:2c9:a220:bab1 with SMTP id
 98e67ed59e1d1-2cff945818fmr10006830a91.20.1722858424983; Mon, 05 Aug 2024
 04:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
 <CAH_eo809VXLGVf2vs9gVGr9r_9y0pP+4ku=zoZv05U_ZWbnaHA@mail.gmail.com>
 <CANiq72nHyuQ9+59qDQw9PbRf-Tm299JNrP_WjsDBrahM3g-HiA@mail.gmail.com> <CAJDY-vRjxd1yM4nL_Z3_S_CojqUNVb3V0VBjceV0V5NiB_A45A@mail.gmail.com>
In-Reply-To: <CAJDY-vRjxd1yM4nL_Z3_S_CojqUNVb3V0VBjceV0V5NiB_A45A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Aug 2024 13:46:53 +0200
Message-ID: <CANiq72mNUu9iQb8YZzo9D+ZtE7BaZMoM7hPk-Akr_CkmTO9-Xg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Lukas Wirth <lukastw97@gmail.com>
Cc: Sarthak Singh <sarthak.singh99@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>, Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 1:43=E2=80=AFPM Lukas Wirth <lukastw97@gmail.com> wr=
ote:
>
> `sysroot_src` is required now if you want to have the sysroot source libr=
aries be loaded. I think we used to infer it as `{sysroot}/lib/rustlib/src/=
rust/library` before when only the `sysroot` field was given but that was s=
ince changed to make it possible in having a sysroot without the standard l=
ibrary sources (that is only have the binaries available). So if you want t=
he library sources to be loaded by rust-analyzer you will have to set that =
field as well now.

Thanks a lot Lukas for confirming that.

Cheers,
Miguel
