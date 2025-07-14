Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34E25E471
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752512050; cv=none; b=PLuDhYdLTIPVMMF9LEVasVfmGxRnjYIuZGR1uicPCJp7JVEQNdbNtMT6jR4XA3hDW6VZ660lzosW7AOnCPFQ7MenTt1blHY+eTgWDFAHi0fU8f61bKdF/8WaN2eEJETZkEAlcyYwGlPAlckIcOudjDKLRpyuLThKEfrA8BjBq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752512050; c=relaxed/simple;
	bh=NKE+o/JDa+ee+ZtcoTr5eoXt66DWRlZm3k1FjB+KJxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHSNGup+A+KrposB0AAGWuKorQK73VAU1SZIvlE8C9AzsQhSD4M/Qt8ebIhkkw5SPuEO0pzlNpodfOze9Y2SSLFyeuZBTyN5o9ZJyVdr16fEcmOv3h0DsIwHv+9Vq7oLb+GqgUVouJtiMsq36CwdNd9mfkjfxMIvZqOH2mVg66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdZmhzpX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdZmhzpX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2369dd5839dso7231725ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752512048; x=1753116848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKE+o/JDa+ee+ZtcoTr5eoXt66DWRlZm3k1FjB+KJxE=;
        b=kdZmhzpXW04Qqgk/yjkzz/x74Gw4o1b9UlzEyQxkOB6FRUUIp/2fjto3oovgkQns35
         Ngz/ZJeWlDYvft0ivTGEASFjPHbQOf7+v+jusjRgK/Z0DMLY3NsZ9Xt/s7IAJn7/9iJG
         BGFrojJM2DRzI9eA7KhI7xyqh8e6INKp27GdXP/70IVBDBlVOGOcTKSpJmGdfJThjArb
         WmJTTXIHDp4yBoLLgVyhAPLMPNXsrXFjxUCmhqwHuw5it4yXJHImWe2YDuIDtS420Eex
         Jyr5nz5rbRRSKonpsMRrGfe641MiwsOssuz7y8Va2c6HYdvhbmaxoUPphKcsr+YGCl05
         4jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752512048; x=1753116848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKE+o/JDa+ee+ZtcoTr5eoXt66DWRlZm3k1FjB+KJxE=;
        b=WozlDvU2mmKryC/afu7JBZkhmIlw71gYVRtfvyqYudv6tPp6Tb8kHmoCrHzcGmmQV3
         7ElzrY9CMIr7gqaharx4ZuxGeulWNb4SacVBv094MOhAj5HzjomIVnOrWftdkevX7oFc
         AhzswcaOF0BsBAXOT+XDxCRsgnkvfYode7gd63y+s6VR68AXEKXZSLJrL3Hv1AT0wLU2
         5yJc54Mkd+RgBgtNvRW4VNj9sM/Zhw6rbF3G3LDknyjGuiyTJS+YU1NVSX01a4Rbyk+i
         Rv4pdugQcHNfBWSnvaFpBG7XkptbZTYZV3iqmgfKczqVti8zZLrp5zmGCdDhKmYRLkG6
         j0MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWokPyT7zDTv91dMdRM4GrfpItNF4upXoFcHNBzJuqZW5HkZAwrjMzfJDt8UAc0O7iLssWuwyPFDvSmz94kJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfwELuCZOXGajBS0RhsWmemre7yQLxzeCp0LJHsHAKjnDWd9o
	hXTsbBadUAOgCKV8TA2uh5p4xmFb6nbKKMuPvk5dc16BpdIatFAcGzqGE5u94t/vdXhLbNAMUGl
	yu9UGOUWKFh03hAq3A81uDUqNZOxYNJHCGjgQuN8=
X-Gm-Gg: ASbGncsaXhXQOmJY7Wj0lVD/E+DvBu8O7m7Zv3/GqX7qyWUV5ZeQhtH6hWAN+33Lx2G
	AWFOneZgl6SXPZRjAnXnM9eP2Z3J/VAWW9uxYI/EdPzOmLGjFYJ5hyjV7OUhz7otLdjUcIy+NiP
	3kG6SRyzKFC9Mk4LNDCpcB7qymBXAf2i5n/LxSW4Ms2eLLyXvbCFxp4nV5K52Rvlg1M054iPu5U
	KkgflSe
X-Google-Smtp-Source: AGHT+IHWfr/3+o27WNttfY4rJ05lWE4VnVGrYl08TiGlXqY9I9xfRtYK8bSv9kCg2Jssg0ASuAHWrB8EQjhPp3JGOpY=
X-Received: by 2002:a17:903:41c4:b0:235:f1e4:3381 with SMTP id
 d9443c01a7336-23dede4e7b5mr72406965ad.8.1752512047808; Mon, 14 Jul 2025
 09:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713190244.143286-1-ritvikfoss@gmail.com> <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
In-Reply-To: <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Jul 2025 18:53:54 +0200
X-Gm-Features: Ac12FXwhOUVq1Ds-v5zcrfAbI6iXUqsmfLu3T8SCqpMWUvW9ixyXKzl23jWzahs
Message-ID: <CANiq72nYqOGx7FEfMyp_8VnpZargzZ0uannbO9VMCk=kiEbd=g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and `mem::zeroed`
 with `Opaque` APIs
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Ritvik Gupta <ritvikfoss@gmail.com>, yury.norov@gmail.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 6:54=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Wouldn't this go via your `pm` tree to Rafael? Or am I confused?

Thanks!

Cheers,
Miguel
