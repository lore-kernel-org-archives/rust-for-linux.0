Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B709330B16
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762436080; cv=none; b=Mh9/xcb6NPldGt34Llgb3ag+dG0SwK7aRM0VQS7ajD1ixuKoLdrfrs0H7qleAzwHfE1/ytokc0mVne9pZQtj3iYxlBXbG+QVoVI1pN0RbBV9D2sb0e9VjfjyZ0CHrT9HAef2/Tn7HVzEirSjKrsqnmMX7QFWIpUEQ8FmoGzTaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762436080; c=relaxed/simple;
	bh=j9SuhjIVPNBBqJfnVLYcJU6kiIExeCsnHgyWendxW+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdTAXa3ICDUTXc58atUvjMyZEVHy1joqMM2PBCNWoTZOA/bhxYbTfTuZN2vo4sKmHqSfHrGXu/v7O7a1jmj3xhlPDUOWwo8bzXi4+9Xeez1eb3/9AZGD5976Gk9whIRCV/nk7XXZnfG+mVr5fcd4P/vlzctWjo/hFWrEnuWR3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RejsDbjP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RejsDbjP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-28d18e933a9so1191535ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762436079; x=1763040879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAPFc6E2cuOBznS+PFsa8uaGEFuFxns4wE3SuTksKDk=;
        b=RejsDbjP2jbgpCpqsdNG6OMV13aH6dy2qkkZoZiMhJdYvPthSskFOjy1WXWxigrFfT
         x0zrGjVhvmGenH8bAspZjjV6n30oMIHvkpUflefZtXs50vZ6TmG6tE5EpfV83MSevzRu
         /MRSVUH8RVDdhxZF6tkVgGOHj8dKEG+xvhgcu3sgjaCs7FxGjqXu3rW65Fc3DV/8qiLN
         ksxt7atx1AX3oZTtyoEI2WsTP86YA4G1TjOGtdUPw2vAsopxkkDdqpkHD2CKB3vWn/0t
         1eZrI8a/qn9JldEtgP0NGSzIU6nKrrST3EzNlwA4bJ4TIDNqMd5A8JUXHCVa1xGffE/A
         M41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762436079; x=1763040879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAPFc6E2cuOBznS+PFsa8uaGEFuFxns4wE3SuTksKDk=;
        b=LrhUZFbrpB37G9V8wDbu4gWV1ZMQQBtNlxLZqXLkiDYCERr7qpEWwvtUwTE5KhzuaU
         LVMbzaiSK9MYIBGolfl1iGF3iYT74u3N/H9RPAQySWZ/fXhhgRROh3+ir6eNLO3ZatQK
         FbW2KCpecPZ0mAXGeiwlA7PwJc8Icq4F+Cico7hQAJHI433/T57zfvts9XEYu7Lr45uN
         vq8lsE0nyit3t/Eo1SY5q+w4yAg1k7+fYFg3qWIHvdHQE1TMcNx/TWskGr4/gcH4gVHN
         VBlDbYFNvMHoav7qSaf22jIEA0U4EFoF/qgn+60pud6EBTG5M+nHelDwjvQ1EBgNgpDX
         hcRw==
X-Gm-Message-State: AOJu0YxKPoPmLca/LqGfITlJJNXRIFYMHiI4hZsC3X9cKHjs3v2BlZMz
	jmVAwIQSF66Y4nkcWlU2Pavzila2AZB18MlDo+HgOlBdJu0H36GavZVsVv6Pi17D7ZbbncSEuNV
	/RkQyxBU92PGJq1rY93h38WvXO1hNrgg=
X-Gm-Gg: ASbGncvrKviiZMAf+l+MBP8bbWxKryx51r2BK9/tdoYL32PDFkgCQXZAiZ+oi0UP9We
	lBzz1+lkk5EIIEOp8fyLWZjsVeaOA7AjtTm6fzQaCQl6aZnz/M5SRGL/S2hmbN8lutRdCKTzjJb
	MQ4tGjhyH/jw4oNprp34K4i+HhK7Uzqr3FbmU0vfzqSfFZX2h+H1gIV7Nuq7WnRh4uyzEIQefMX
	N1dLQWFrlGi+0Vx50O5ugsdyB5jkTCEXAsqBOfdeUwEnwWXJX4WQ9XY0E9vDD/UA/xQVtauTp69
	vjlNS6x1oqo74ScUcW58FxvSPMIUafAtl4HgUFaXALFzOVRuNOTEgOC7Nh0PHzfm0Q7Wb/rIA6z
	vrcA=
X-Google-Smtp-Source: AGHT+IFgsu64H5AxVDYQ4VC1AtIntPLrClhNs2DhzecuOxKsWfCafPqovP7OzWqL14ZLgcHX93hNFscreoxfb/7qqJM=
X-Received: by 2002:a17:902:d2c5:b0:290:ad79:c617 with SMTP id
 d9443c01a7336-2962adb0131mr50508655ad.1.1762436078666; Thu, 06 Nov 2025
 05:34:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106102753.2976-1-zhiw@nvidia.com> <20251106102753.2976-3-zhiw@nvidia.com>
In-Reply-To: <20251106102753.2976-3-zhiw@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Nov 2025 14:34:25 +0100
X-Gm-Features: AWmQ_bkZlBPvsV_cw8dYZQNsheLfRuBL-Y7e_Ty1STSrCFE-bOnmtmTHqEfXIAE
Message-ID: <CANiq72kE9QFdAP2cTjBaxwsQ_H=BmMyabY9vSWUdfj0Ai0QZCA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] rust: devres: style for imports
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dakr@kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org, 
	cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 11:28=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> +///     device::{Bound, Device},

Is this one converted?

> +    /// # use kernel::{
> +    ///     device::Core,

This hides only the first line, which will look quite confusing when
rendered -- please double-check with the `rustdoc` target.

Thanks!

Cheers,
Miguel
