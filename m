Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D658ADD
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606580; cv=none; b=a6+9aLqjz7gzh/PJsUF4+2upw6Y6DkpqVYY89E2k3fQebXUmI3MssWJ3TlGgGvBC7M6V3kypoljNGnSUnvroGBX2fUpwpsXwcgArcSYjMKStOFPkfwzI6/QkFXTuWMDRLl1P9nZN+Ftwqw91NMsfFW/96PpPUuwze3GLEDxE9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606580; c=relaxed/simple;
	bh=u8E/DAzdM4BDv+M4rE/6UY3tXIFTWYYORwwsXK8NW1Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ii0S0uu0A6VF3b/9+tn+/YFDwDxAF8WH2qPYV9OeL6//8KJdNsLdwl+0wL6vFKPWASVEr7qzYf5wwSeh2/xduDcdazgKN/OSRUPAgIut9LVWgrlUokZ9UCt86Iqs7H427cZ4xEbrhsMZ3oMVit9T9gCOuwX6QvZHVlGO7uqIofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiSz3zCO; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiSz3zCO"
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-2d0419288d2so19910621fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706606576; x=1707211376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqLMO+WcsA+qHzDqK7CtF5QEfkhWOqOfu9v7+ZVhskE=;
        b=XiSz3zCOefqwkTmBq9+h/pKYiuDQ0oDreYkg4yBCyqFFPH75qp8Rj1i17gpjnW33uD
         9Y9G6Mn+ClJsYXQMWxVlGhjjoarsQgiTKM+7O6uOBPTKXQ7i/Hh8ejd0h257J/THo0aE
         nfhVRUHy+5Zyzhuu19vH+27txyM6fLmjqktikAYqiD3bHuVy+ZKUaMBkCbop34FeA8P3
         HJFfeE28XAK0BUWXR+VUajgSwYogu2eANY3O7OM5QvDw9cO8JN3nnrkOd45k8ZpWN7dA
         3TQlgsxUfShCe4ruqS/8KujqPmNkwqJIW/TbcdHW6rWwu2Tm9dZq1Qk8abMf8ay09UNk
         lOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606576; x=1707211376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqLMO+WcsA+qHzDqK7CtF5QEfkhWOqOfu9v7+ZVhskE=;
        b=jWt87yKuxYqK6sv5jbdv5c6fiydQIAxpF1L9bLBLcZqa4aLP43j7ykZKYA8CuOi7iC
         359pA/3TJ6TqgOtNyJ0aGxDygQ8xjynMfGiFlD4mmgk1sQWdV1htI3+OZrokqFFQAqu8
         TvnAdIGjSV3isE09YcTgJjXIB5sGmke9BIvce4N1u/tQDrh4GzYfnFLKw6mSalqIdKLz
         rNjst//sW9TxNRyStIS8ZwwU2E5zJoS3gM2YZNI3s7ncfN0hhicrSxYdz/ZJ2zrJu/aL
         S+nwR+6RJWsn9cZRcFa6U3bCu2tCVMNPHJqKGFD1WXqBXKsZUFiSlPxLETJoEZ0cpOOj
         mkAQ==
X-Gm-Message-State: AOJu0YzXnCG5BMzTrTgmJxTIRB+GYT+syTgth/t2zwfc55KVhoUxzgr0
	ODboPmaB9qZzZqy4+4Urogdb13TgskDRpeDhoXVRTdmphxZoWj8m1Lec9lnxJ3iql0jIIBGJyWs
	88VQTGvtvOMY7tQ==
X-Google-Smtp-Source: AGHT+IF87NQ812vMFotO2i42XCkp9U2cUqOajgaKofrGlkuAmbQh0g7jvgwQO8Z70Yi76a7LPw7Yradv/DUgloU=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:a370:0:b0:2cf:3298:3ddc with SMTP id
 i16-20020a2ea370000000b002cf32983ddcmr10644ljn.7.1706606576260; Tue, 30 Jan
 2024 01:22:56 -0800 (PST)
Date: Tue, 30 Jan 2024 09:22:52 +0000
In-Reply-To: <20240123150112.124084-1-kernel@valentinobst.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240123150112.124084-1-kernel@valentinobst.de>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240130092252.1610582-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 00/12] rust: kernel: documentation improvements
From: Alice Ryhl <aliceryhl@google.com>
To: kernel@valentinobst.de
Cc: alex.gaynor@gmail.com, fraunhofer@valentinobst.de, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Valentin Obst <kernel@valentinobst.de> writes:
> This patch set aims to make small improvements to the documentation of
> the kernel crate. It engages in a few different activities:
> - fixing trivial typos (commit #1),
> - updating code examples to better reflect an idiomatic coding style
>   (commits #2,6),
> - increasing the consistency within the crate's documentation as a whole
>   (commits #3,5,7,8,9,11,12),
> - adding more intra-doc links as well as srctree-relative links to C
>   header files (commits #4,10).

I left one comment [1] on the last patch. With that fixed, you may add:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

to all of the patches.

(I responded on v1 by accident, but it was v2 that I have reviewed.)

[1]: https://lore.kernel.org/rust-for-linux/CAH5fLghSaorRgDDuqNCN-BhQ86ysX96b=nKM_cZAN0_E6Ai04A@mail.gmail.com/
