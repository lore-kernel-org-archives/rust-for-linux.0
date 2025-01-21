Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090D1DF75E
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453345; cv=none; b=fBGQnmoYuPa9qH/vyxCJ1b6M5yV3XDQeRH4dE4s9+JVUArhtlTNdXbNq0QHFzbXk2nOdS6katXcT62Q2p765KM7T+jkbVZe0WQbKxgZ97nBrZHOdk85104gDYcBHam5Yj63rJpPxZDIr8u/Aduh8i17uAS4fOHMWNVcnwVzj3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453345; c=relaxed/simple;
	bh=8PXPzOwbrsC9kILUva2YUAXRsm8M3PW5xczYUTLbG/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNCabDCgEMSPAn8jJYHi6mew7NhG5lSKwPZBfnuIJUgAjaXhP9+Ef+S0DZ4R1xklfB/080QJWIgzY+IOTEdH22rxWPU97N1mrjum0jjhPW/vJW8l0XnyJzrY4QXnqxFT8+5JDeyKGOZSSyBHzhSWXAxxBXSB3lCnvvrp/KbAvyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GZKh0GAI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GZKh0GAI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3057376f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 01:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737453341; x=1738058141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PXPzOwbrsC9kILUva2YUAXRsm8M3PW5xczYUTLbG/A=;
        b=GZKh0GAISTWV7XnXkJD85JgJAba0zpPVNwEAUWBpC5+SI3qD5wuGt3Wm1JzAg6Xgn0
         7jlgSqXqXazYrnpmPGJlSczIZwI9F9J0n457/S6WkVTFJs/Vh4TZ5gRNvbQxPjARZ+ga
         z0XWfDMmgT8CxXZwuecxcOoImpPryX/J6kGGdOQKyHBOBPcPB7KuxnOvnlfxffi9G9rX
         /vh/5dDkAueSKa2uI26ed5LBW8/5SGhjbXCScQhF/qH2KS9IYLsaBL0YiKG1ihAoky1M
         LTAYyJT+NHLtsb/BK66GIjwiqaTBm/rbcCOZqMtSNRm1s/cqWsWh1Y6L8UK8oPovI1wW
         PQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453341; x=1738058141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PXPzOwbrsC9kILUva2YUAXRsm8M3PW5xczYUTLbG/A=;
        b=JuicsrY3mK9ekx/BE7ka9l4Zd0227N6zQa5F8ypHIbRcpGhQfQ3WqJm/Pr7uR8DNeJ
         WOnf5ZNWgqQghmTXa6cQFDPt6f2FljNKfV8JytuHdmzOSd4PskW55wGEbIsQGD8lX165
         Ohy1oFm4wmLdjNIc9UZrbebgca6Jyt1i4o+Fx6L3UOtfMv30aJ8F39flgyQZDmry6Vny
         29DMfv23FYdtrFrxAn20GIap64dXSs7hjOceW8kpRKXU8O87DmmRsDV0TBKhaIlFn3Kv
         Wpx7YXzmhZnqKcFEBM18ql3bx1t5b6+264wu5B0jwpdzcRnkrQRMb/JGNox67fXRx5Oc
         PFTw==
X-Gm-Message-State: AOJu0Yz7Kgzo+jCB2KnM5MTWicE7Aze4InDzkJor2I7FJ6/Qkl5K5n9J
	uQ0bX7CJ5WThHSKClVoiGyfZ0RLyOCtsVnNa/QzU46f0KuLvdkMPEv+z4IGC/mtYYLaiXQ19AnD
	sJIe3GfuVFgdUOeBdBRk69immRQrA+IkUbrDp
X-Gm-Gg: ASbGncugWuE7/S8f7R9dUZJOZsOkCcSf2bN+R6SCiPzSLfcu1s6Ud5b6b1XLDZoN8gl
	4sK9FkJGLyvVqyL1fT7LDsq9Wn+w8u1kcfFS4uxA6yHNyFQogAm/EQcNcY4YPvWT+fCd0+hu4BL
	NQ9he/yA==
X-Google-Smtp-Source: AGHT+IE7KopMuvJB/37YGrU0+CEjSwlbu2NZ86YXc4fNcHk67SaKLR8AsHv99obklcQ0QFTCU4fwx+AhGp1sNJwYwbs=
X-Received: by 2002:a5d:584d:0:b0:385:f7a3:fed1 with SMTP id
 ffacd0b85a97d-38bf57b6717mr16579665f8f.44.1737453341430; Tue, 21 Jan 2025
 01:55:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121084756.1051758-1-abdiel.janulgue@gmail.com> <20250121084756.1051758-2-abdiel.janulgue@gmail.com>
In-Reply-To: <20250121084756.1051758-2-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jan 2025 10:55:29 +0100
X-Gm-Features: AbW1kvYQlWV5FFQMfdmH_H_nGi0poXEpd85_Sr1sW-ET_ThW1oF8DVJ5JvmSYzY
Message-ID: <CAH5fLgj6TAHhSQWJaK9pj1PAU7+dbJFHURd_qa8wgFE4syBxTg@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] rust: error: Add EOVERFLOW
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	dakr@kernel.org, robin.murphy@arm.com, daniel@sedlak.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 9:48=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Trivial addition for missing EOVERFLOW error. This is used by a
> subsequent patch that might require returning EOVERFLOW as a result
> of `checked_mul`.
>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
