Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7E31A06A
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018163; cv=none; b=YksH2URkKcqS+TUl6+BwLl7MgsW7ENA9io9VrOAh58L/KdrWPhzikMH1VLQVZaqaVQrS0dOjmmYR4IcescQ8OKSFTo25A3OvpZyYItQ987ovGbrTb0hgLQ5+hYSeNIgvXP0zCZ+i8RvGnzSHz+sgrJ9lwYpdR3LnHyH46NbJRmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018163; c=relaxed/simple;
	bh=PMZSQ6FgWk/xHL2HMDvGtuDCCLzJAhwM1O8qBXNBR5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYBznH07pZNtYF2l7PV/aX3lO8AWblPVC+ZnQGLGqgeYfG4UCWbUiWi4pof9n8Phmgz4WtJvo4cvxxXifMXVEGgQblmcirLF+89aQ+BjL1m81hpIu/Ee9ARvRCzY2qwDXkSd9Mcom+Jw+ZfqjF2M0Lmic1i7RSwTO34CzLAqtoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJqRIIpz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJqRIIpz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0abca9769so17799245ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 06:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767018162; x=1767622962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMZSQ6FgWk/xHL2HMDvGtuDCCLzJAhwM1O8qBXNBR5Y=;
        b=PJqRIIpz6ewAFQwitR9ebFOmxPhXj9CmXY69nbUr2eyaoezM3TVPkbVl9mBypaSPyC
         tW2bCJ9lZx6gMeWasvJAWOFemzwocLtzPjtPIQgmu3L9YPIihOYJ9xKFfJYkXGD9IEpy
         5cTalGDNODfro9rMDy81vhOOrd4lRR+yF0zvrE7Qdha/i+u8RdFjpKYSIhQN+0yWoR37
         CgQ1NQZioLnZZhUauiXZTV55Mics7/Ro//hrzg3MBAsnWem691ZgXTlNgl6MZ0nU0oCh
         zjedEBE3PeH8Mcs6FsNO71fhlmnJ9XE6cv/5PfXEO7BcY+wavz9MOtAW1tTaMgHLlHrP
         2f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767018162; x=1767622962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMZSQ6FgWk/xHL2HMDvGtuDCCLzJAhwM1O8qBXNBR5Y=;
        b=hoqr8z9ITo/kwPBEeLXMlk+7PizChOSes5zJcfwPLQQCUO0f99AR221V4jyYaiNZpJ
         p/Ra6Zp9JeO16IjdY6wztfgU5ERPnWmK0xTnEgvqZmt4+mknuquVnfPgsbzxaN8xTV25
         /A3edWZk5NCS6fvgyaEyn5D912JlLbhnoupZ97a/Fi+MyxgEp1AQSqCBCEh/l+oH9Ers
         oHG62QIgkPIK5t8KS2ygV2nWc4WB2dyhgX5HpnkYFZLBGNyNA15WWWVcbJmSct1PcAMb
         kCyneyhXWW65Ra5uWBCX56MWq8T/kBH0ka36oa7beGGXDLbhHX1R8quMzafMlSvF+rFI
         t3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXJpbTVn1zd4RyrH4y3oLvv7S/ZS2tC0Yh39GZYbkYjeby6HdviDztkW/EdKiCCLYh+tntRm9pITfitJs9OzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjrg8Gs+jUJsVOWtgK/9V6OCm30JKu7A1wpcf4kbj9QfPA8NNN
	PHxNKTR5kKr9iJFL9jXF7ZxLPjA9v82oa28vC5ZCIrJrRzKjouDlIcAKh/p+cQgcWoP9j8v8d79
	JAPsZxIWFgxFOKowSG72gPHB85q6dDso=
X-Gm-Gg: AY/fxX6hrFgXMpS9TIL3nFqZjDujPFeT3Fn30psH/HaX3j52jWg8iX589AAuqjtrxRe
	QopIgNFDZpLO4WaenQhgQhvSTnzXYPa5E1AG1zdPE/8kwQs4cMkY89APhri3Q5AEqpulPuI5ECR
	CuUYGAXILgudiToNVn1/5o7j2sCAEvFfxws/tsB7gLn5hamnQCsuTX0466Jcar284QGeIZDlVyz
	75TT+iW8SZNJS7zKeCAp8jdGVZEHg+9kRWPIKBCmWrP4NUZcbCNk2Of1WbVXQ8Xg8Gyd9+Mrllc
	7cwr/BgoK9dfbQ5N19028lJdg3d6Ms47cHnnH5ebNpdd4ElJmBItx96W8Eh8baf71nezThT1A8t
	/M83FP8re
X-Google-Smtp-Source: AGHT+IFK8zH/w8XFvU0RU+/rjxgtmpJuDPXC5Zr8Jkaeo6bZ5wAYzZa4POeXSaSV/goD0ESacEhwTBXM2bvwUWVhE98=
X-Received: by 2002:a05:7300:80cc:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b05eb787b8mr15950255eec.2.1767018161511; Mon, 29 Dec 2025
 06:22:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223055647.9761-1-bshephar@bne-home.net>
In-Reply-To: <20251223055647.9761-1-bshephar@bne-home.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Dec 2025 15:22:28 +0100
X-Gm-Features: AQt7F2rs2m9x_5n6XRqPQXgm3AMMLdZD4r3G5kWhjRxj9p3-vppLT5akVPpmhwE
Message-ID: <CANiq72kcMLXz=xyZeKC0=j_e0BzJEY3wGpBTTxfJsc6EZhCnXA@mail.gmail.com>
Subject: Re: [PATCH v8] rust: Return Option from page_align and ensure no
 usize overflow
To: Brendan Shephard <bshephar@bne-home.net>
Cc: acourbot@nvidia.com, aliceryhl@google.com, dakr@kernel.org, 
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 6:57=E2=80=AFAM Brendan Shephard <bshephar@bne-home=
.net> wrote:
>
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Looks good, thanks for having added the examples and going through all
the feedback -- welcome!

> +/// // Requested address causes overflow (returns None).

`None`

> +/// let overflow_addr =3D usize::MAX - (PAGE_SIZE / 2);
> +/// assert_eq!(page_align(overflow_addr), None);

I still think this could eventually just test the top address more
easily (and then the extra line we gain could be used to test a one
plus the previous page), but it is fine as it is, let's merge it as-is
:)

Thanks!

Cheers,
Miguel
