Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C518B0A
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311743; cv=pass; b=pBfTTI8O/qBui/VXyISBLLtO4k9jYpJhk/3PtgiwkKteXSpogZgFPzFumrvByaqVU3viZJkAwwVHVvPMHx/0hNxbNylL4fBbZkzxFf0DQZ6pFjIuABgcnUNnC0KhpTJl3q+KvY1sQxWuB3J9EA4BGWQQ0o0OHLZPoNnb/JzIYFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311743; c=relaxed/simple;
	bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5tFig0CZ8fmeTX/DjKA5+PBPdfpQr0QZomlt0MHdBBVEkuXaCiPB3umtqkN7a/hP0tL9kIjOjp/anX3kVGmk7pxtL290DrWw6ed/I7+Y1x/1V7cDxTxn9eVbObLq69CWGYdigaTLb70I+fIbyPIPs8HsDUBAeSccKL7/wHiSkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ju4fkBF6; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ju4fkBF6"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-11f42e9724bso558174c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 05:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768311742; cv=none;
        d=google.com; s=arc-20240605;
        b=J/LsMEdylrgwO0lmq1jlqxsDPalt5qDPOYqNFypSDaYLah9P2YbmcHaozOIwzD8SrT
         g3tvtFWuAWiJ3Zkil9keANL+p8fGz+oilHS152YJj275NdrF710maFrOpVn2Rna3+BkK
         cCZQXNpE9kMrOgIKagqJr7m8IsUQ6FcYORwTVQCrrtmI3gjL2iglrTFS9p5Qgo+hiyYc
         bjt6dQMsnMIPggDLKHdWCJU+TDrKDYNkmvdyoSgEwr3S9CnDVL1748R4FgjdRY/SLOJN
         jqCltTxtlKqfnoOdrv4WAOpgVF5rvtKYhHaogJA4fC4curH1MZeNaweBOjF4oczs+tIU
         UOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
        fh=akGEjWgGhWr3RnD5UZ+VCFzpCu9ZNl+X87wDuYMUINE=;
        b=HMXsqECE+Dr1ITu+fBR/7O6AFyUg/bF/KA0vp1QvwiGS/Ou4cWbhV2sAtrkZj7hNqx
         CqaF4yYAzHyYpKfN4rK+2L1aXIauCQXosLqu8izrCmdxEiQ7U8vOTU/geb8d7mEKvhDP
         LnVJovfBC+WwXaHlcJ+TwJdpp9u7JVKAY6U3OG+HSzHtPtJI5maLVpXU5a9vGbqTdy2t
         4QgPwhXNPMxanZOm2PUzYZowNQEnUXh/Q8Ans9wqLdKvszudQoAtqfRyQHorsk8FqAx3
         z9UtMUWHOBL9iQvaDySN16EnyuatD0G2XJysFephuu6/ZIAMZn/cTwh+76BCRZcGO1hz
         x78A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768311742; x=1768916542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
        b=ju4fkBF6Z86+eRUjn9fpBiUxSyhw4pU/6SGFfLyVPx3FAv3lA6WdXmE1CkmzlHSsl0
         2zrQSiyi1kETOb94fx1dV2/TGOM7Er2CfhvCMiGRJiKPsQEvoSTPKN8Ht18pWpl5eYYF
         5tQnvwd5W3cU3d4zPCa5iL8SN6nj9zNu5xt6Ir0xmRs09uPrV2pUTs2suJj075uXZFqG
         rp1twqB3sA8/UQ8J/sGDEWxU9P6B/Rs4gnl/XsxncSNAOTxJ2SW1C8ofPaTI17RT2HYU
         PwNo5Q/e5uKFA9gOE+ucD2qUNyNvbQFb9SCg4Wv29iw7bCchUAnFVTb9/G27hg7aXJC5
         nEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768311742; x=1768916542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
        b=oXDMYyz0j6QPAz32qCAdY3SohPbCJqFunYIuPqqzCQ3eQhlsTtp2qEIdDaF6k+PoC7
         zpgtxF1maynGudvBeNSYCjA4SfEwsKR7QogWIKWW5d0o/PR5PVI/QZdmtpJbrwPjXFqO
         CjcCsYuOKaSPPrK2FncsNh2O5D83bhhUucGf/017TJFu9XJwqy2178szEsH3UwzdDlXL
         WkXhroGoWmmjmztFlq1aOy9yQ6Q9xRlWNVv0s+QyvuRErIZOTO6msChGKu03bbYuxHEb
         uaIk+X/KS96I/DIJU/jklPgKvlLX3LXPVBq8hi94jjDsjr0KUrCuyLr+EM6Q9HGiWhMs
         BS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKlSZDb2OtgFjB3+WiYrB/In5xVFsP3mmVg/c9mwiBDB+meqr0m2kHuSDT4KznkXtbzdQ9c5JKnZVnxV+VPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZZO78b0j3B1/aQBwBCf/njgnknrV7NsXypqxOFB/g2j8Oaea
	yD/SRDAYDoga6CbFMzDstN4CPWB4Pm9BXV2VLcn8Z08ZF4XeccAESJlslsb6xXsGVOVCIymPTE5
	ivCGpTmnX5HUws139lqppF41eakQRXBY=
X-Gm-Gg: AY/fxX66TE4ZfcDe4LJBfPXyh6cpWWCzKysceoxf3RY8Od9RT2gOHk8Xog3zN/3RrK8
	QgEI/2dlB7SNOne/mu2kamqO/s+HcETO3998n0TKsdtELUDBjV/SYolotZt18uccs3P7XJ3biyU
	qTumEocrdyt6byfl8AmxPBpd1ESi2QDOaMM/fdiDtbAgkbA7qhrEVvBrEED8R9X4KnS4M1dSI9x
	V+M7pBCaUwEUKsR2QXl9QoidDhfg2kyMUt3f+F/xJ+HBjPwqK/XyVV82lIfhDdsrv2QTf5snePr
	7LDmPB7cnKUc9HD9s+gwPGPnvgd8Q4Sb+Rf3F8tAcCebOuIHgMWFll9nGfGHFRjqIrmGHOMJTmC
	KL/3QHYKJN6fj
X-Google-Smtp-Source: AGHT+IEajQnCdX5ZisGRdExe0O1ic9/ebxlyg84D2VDprur2Zw4fiWmbUwhJr67eqmLmFEEJ70U1FbHIhLJwseAJBuc=
X-Received: by 2002:a05:7301:2990:b0:2ae:5abf:ecff with SMTP id
 5a478bee46e88-2b17d31bf67mr8215846eec.7.1768311741413; Tue, 13 Jan 2026
 05:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com> <20251203055923.1247681-2-jhubbard@nvidia.com>
 <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
In-Reply-To: <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jan 2026 14:42:08 +0100
X-Gm-Features: AZwV_QjSJgThpHi1P_7JHl1wPop2X8OFeuu5lrHMB3m7CgKzXv3yTd1NXMxwV_g
Message-ID: <CANiq72njAx78DMdfB-hai73YW6_DTgayyR024rUpPfbDbTbqhA@mail.gmail.com>
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
To: Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 2:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> How useful do you think this is in general? Would it make sense to have a
> dedicated PhysAddrRange type in kernel crate that provides this feature?

Related / to shine some light into this patch:
https://lore.kernel.org/rust-for-linux/20251122055256.264180-1-binakugent@g=
mail.com/
and https://github.com/Rust-for-Linux/linux/issues/1204

> I would either just use IEC prefix "MiB"

It doesn't seem very common yet in the kernel sources, but personally
I would like that.

Cheers,
Miguel
