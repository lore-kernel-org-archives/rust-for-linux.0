Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3855E57
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709020512; cv=none; b=ONGv4UA//u/pRTZI+BzcuAupJb0VS4JiGqURgtUlLpXvHFiNCEhGIOmNrms04+Khgo9TXXa+b1XxOVOkyWR4tiPyWd96O7l3QLdFjxLcb14B71BW9iduHxOBi/ZnGqMxC2GIG89kWPqcq/+Y9B/21z9vwZ16UW3+wfjwkjc6XsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709020512; c=relaxed/simple;
	bh=3YwsmNBwEGfFj80aTMlJdL8VkTAwnCvoWa6TqLDGUZo=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=Ca8EnbGGqYKtSFaR2qI/SE0CDYaAz+c/q3Yo59S3RnFGDOFBwgvGXQEO00/BJfVJx68gMK6vgBzYe0BH8Tr3GEjSk0Td/Wvftv8PbHhP3Gb846qeTS7G5yJpc0gt7jG2c4wSjsi8NscdDaOHN7Obd4vbv6Xblo4Hvzv266spjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=UgaYbcSP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="UgaYbcSP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56533e30887so4361221a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Feb 2024 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1709020509; x=1709625309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YwsmNBwEGfFj80aTMlJdL8VkTAwnCvoWa6TqLDGUZo=;
        b=UgaYbcSPPuR0qfAeY3WHmzTx4KWfdJontpBGC9yst8NpamoC5+7xSGoJrweepUm31J
         Zk0FXqIA+MILtoIdXwkqtC5ybZrV/hwIvCvmltVrpftLj0I8gOtgYwNWbrY2mwBBuS2f
         kxu2XObfEy3/UrZXQCyWh6F0LCqkup95vVHDzABu4cqFJGSqxOKj3QaPFms9OEo7rGQp
         whCVXEeK9F4VtMAcN6IWwdp3aVjQg4j+iJk3XTLI/BidVl3JelGWfxE7MIj2Hcz2vJHD
         grGRDLhXyvwkJZqRHvrjheZg1Wgq7dPtQREmT9uH0K3aQwYztT4VO3vbnNMkbEZpoXeN
         T+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709020509; x=1709625309;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YwsmNBwEGfFj80aTMlJdL8VkTAwnCvoWa6TqLDGUZo=;
        b=VRlVlZLGT3rwAeA/LCtFE5mAejKzpnj7b/6zqws9Q8tMfLXqoloqByG7Je6mPW2n6p
         DEpsi4FQPhMMIw6u3ecYOudmue3pJl3/t+ciQjxEq8HnC3Wc7DIRkgYSnoz8/wLST/I+
         hfyZeomKiY2mPa2kS2I0c7ViLF6ziDl10WrlXLhUelLvJLk5Bs2iMEdgDI/VCS3hRNus
         rKp2E0UFzAH6KXqvjXQArG0KzOEhyA4TTPRAXdrhM8GKPaWHfXIT7V5SkImEab0yuMPy
         sJVWzXCX633oCvd/3l1/ld1+PdMdl1o33tB5Ty6dsBLcrI/3QhD5ifyIAS2Avygo+a9N
         4NjA==
X-Forwarded-Encrypted: i=1; AJvYcCXKnIS7i837Kg+Hdwb+LyUwSlu9gvxsFPcZwV6D4LVnPKJvF5x6DPxpwvcEahRepKzhDKys6UrmyzoAsYhqRLMsbzXTOhCvGoRzb64n9C0=
X-Gm-Message-State: AOJu0YzbgZmQLTnUgJRb0Gy73UWN+GtbTKq8RIehSXXCmiZrCXTbpSKp
	DVIQWVr7IRbW4Uzqn8r2P67cMdOmwuBS4wpmURfnsEJ5b8ySmbhg6Fp8hgGt5ns=
X-Google-Smtp-Source: AGHT+IHZCKU4F4DqNwk9h+g7iJIh22fZJJ9J3NRhYCTuQGFEiinICXGF2Bdlgkihac4kau8kRK6vAQ==
X-Received: by 2002:aa7:d898:0:b0:566:44b4:ea58 with SMTP id u24-20020aa7d898000000b0056644b4ea58mr285530edq.38.1709020508661;
        Mon, 26 Feb 2024 23:55:08 -0800 (PST)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id j8-20020aa7c408000000b0056200715130sm502183edq.54.2024.02.26.23.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:55:08 -0800 (PST)
References: <20240209223201.2145570-2-mcanal@igalia.com>
 <20240209223201.2145570-4-mcanal@igalia.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Andreas Hindborg <nmi@metaspace.dk>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v7 2/2] rust: xarray: Add an abstraction for XArray
Date: Tue, 27 Feb 2024 08:54:25 +0100
In-reply-to: <20240209223201.2145570-4-mcanal@igalia.com>
Message-ID: <87plwi9waq.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Ma=C3=ADra Canal <mcanal@igalia.com> writes:

> From: Asahi Lina <lina@asahilina.net>
>
> The XArray is an abstract data type which behaves like a very large
> array of pointers. Add a Rust abstraction for this data type.
>
> The initial implementation uses explicit locking on get operations and
> returns a guard which blocks mutation, ensuring that the referenced
> object remains alive. To avoid excessive serialization, users are
> expected to use an inner type that can be efficiently cloned (such as
> Arc<T>), and eagerly clone and drop the guard to unblock other users
> after a lookup.
>
> Future variants may support using RCU instead to avoid mutex locking.
>
> This abstraction also introduces a reservation mechanism, which can be
> used by alloc-capable XArrays to reserve a free slot without immediately
> filling it, and then do so at a later time. If the reservation is
> dropped without being filled, the slot is freed again for other users,
> which eliminates the need for explicit cleanup code.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---


Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

