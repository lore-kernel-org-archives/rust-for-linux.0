Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B23587D7
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000101; cv=pass; b=k/hkh3xPpqTzHdBYsqjkBWqZkb3w+im6O+MQB3c3oxK+LhXKt1OgNRoZTw9hBIWR5fFLVDOCPXxJC7MQnupuVX2oWRbwakEdA5veHIvBaK4YR+qOR2sDaZrqy3ODFnagTQB1XTrmLPnFr9b52lQBqunnZ+gaODu24z5wbbJkIbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000101; c=relaxed/simple;
	bh=52iDN4uZb4nDMKQM+8E0N47rb6UqfNGBSJw+2+6z/1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIkhfGVHOKinJacVNnMpGSfmwM7aE7qg/BqInNP77X5k7G/mP7Q61xC6yErDOZU5x70g4fBHzIe474UT2BNHjcmLH0jj5pNodixzyer6B3M6lRH8HtzB7g3lEp4tUeiGDB4oTJ6rFO7LyOL95oMFGWrB0FSpbIFH6R93PxaA6rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uBnDzMwF; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uBnDzMwF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so1363981f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 02:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774000098; cv=none;
        d=google.com; s=arc-20240605;
        b=euRljWznqcNt/tqtmiR7FnVixDU4/n5X6oGv5JkUG1WHKL5IzX5Nz98/CBcA8VOBk5
         8xE3Fy9bS/6yrHTLd/SIeftjHD8fwczqNaXbyfpL9qGeID69fEUdGbrmcKd7QkAronrL
         cTJsCid+ZSFNEl7Cvb++OqKZSMbtbW3skWrdBEm38v0qAF0fdmXQsGE63qot0nMW53OG
         ioDBTRzzgzKM5ISlKuFi/2kpZtxoGIs13EJevWs+wo6yuipkSSUmq0+4+qiwmcbir/Ux
         Oguuu/d2eZiLDW7ffppaQDS3g2sj/+eEmzWnfVJkHSVCMZWbxYfRUgeoaGxHEzN1vRjl
         Bj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52iDN4uZb4nDMKQM+8E0N47rb6UqfNGBSJw+2+6z/1U=;
        fh=XrWwqa41/2x/ek89Zapyp9TAszjxmtEgyVk8R3cthxw=;
        b=eO381YaIW+OgakxDeJ+VEewkYYdGbp9Z2PRVeDjd82mMBc8WjTxINEmDoD/bfJ2Erl
         Bu37CGUNE9zoUKZincAJFWh73jWjexxOn/yzT17KZ94bN1gAZQxqmgw4cfC+EqUXpRei
         /45iSzqUiQgkrVdTapibfqoMdn8Cr7bnDkxTtEe1BKK+Qz3IGSbB5aU2W7zozfijmocq
         qNnExqBh1VCrzia0ur74jEI4tPvTyomlcwQHFbcFAVmSsCwwJiEeGOn5uDrxLMlONZDO
         Qa3jTbqO9A2hKIlWFbmVWtgoxl42B5AgY0Hr6Gvl0UPSkdmbVTZdDHUouK2lA3iatrvX
         XRPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774000098; x=1774604898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52iDN4uZb4nDMKQM+8E0N47rb6UqfNGBSJw+2+6z/1U=;
        b=uBnDzMwF2emblX82h5Y1XX/SzIr+aliQ9epo2vY/dZMj0znMOnoG3R2mvoa4MU4Yy5
         nkrcATD71iU9rKAXANjn2bLpFXcFL9z8BSEAU7BHM3QUiGENpZqAPhxswgRJ0y0fObuJ
         mPdL3t6yhVE4HQSbr+tfcVWqg38vlpH1wELE7PF4OIhTRPs4Stev5lKszScx0+kHaqyE
         0w9ODXHYl/nK7MkVBkryjtuxfq8OMTunxk5eJrzxLf9UJRZwm5hJMHqghaAv3NIZ7Fcl
         XW/mur489TCsf9pIV8Y8dT79bg8XH96YZyZlAdUL2R3+JWRxyo4bL3lmnmFBvQgsO/PI
         k+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000098; x=1774604898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=52iDN4uZb4nDMKQM+8E0N47rb6UqfNGBSJw+2+6z/1U=;
        b=g7FwFb0YJsCxgb2D3XbYPfvXQJ86mt9zVxApALdAfeKMlYJkQNag+ptjTmQd91ORuC
         FM5wJZ+BnHiEvFH+2tDo/eOKpuCg5K2jmeLNQfdXmPc98F0GiYJBSP+9ZkkoR/IECt4I
         +ZZ6QGSRSaPjbpdC2cAbOMEuG1zPfYCoTBr7VD+l04JBOT8O4cJwTOFb5UhDdiRIF5GI
         VL42KMFaO0goyah+hlKQyYbdXhSBFynd2cq/Rr/LxqIK0Il+9e4HwPAuvJkesZAC141m
         ldlgQmra6BwpWKlddlZHh6BtBN5ch4Kjik+89s72N6Usg6NjdhBA4kOPYnY3YShu670R
         9Dyg==
X-Forwarded-Encrypted: i=1; AJvYcCUnY1TaTQwvCAf7xWfJLyhk3ZWlFvQ35trpT259SWpSiBBe5m3rD/b7JSEni7Tu4/BuPm3vBmTX5I+YgEl7Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdAgchlO4WgkvIFPFogu+k2wxkwa5D9vCkleneSr7nVZYwI8w
	3mk5tM10Diwj5YSRN4F6V6aUATp6nrCGBX5B4KBJo8GEQGkFoyknsiHofg6W6SBsDkpe0akGEv6
	sENWVsgvg/9RyxUSoj8fgXyM+WqcCd99RjpjcDBxQ
X-Gm-Gg: ATEYQzzopHI7rgfhS2uAjWXscwOF2i1k11AzzCZ7A0DcfaRzkQmQ1gjiAUHAcFpPyNz
	Fxva7ynyi4lYU8j333Nk+8+hjzfmrS3jxAT5NRgbdi1CN11kFV94D3LcbsFjLOSbGAACi49wQ7n
	cqQKoYKCBCC81tt6TKYzu23q937cwflgW/feKhD66ASClhDTssFKeL/jl47z180hHSFS+hZP6YQ
	FzaBkc5xbb67JhN4zXpWvTs0mfgbZJbqV/hkhtSlZSmXD015iOpv4UtzFI2HqlAGxCiWvwGAU8H
	taDCV0yOlOgg6U+ja10HP2+c0MQEhRMO++NyEucaJVr96isvwDKvzNFxRJOYOXmjj4aWgJVdJo7
	X22Ir
X-Received: by 2002:a05:6000:608:b0:439:fdd5:10b5 with SMTP id
 ffacd0b85a97d-43b6426d710mr4310584f8f.39.1774000097784; Fri, 20 Mar 2026
 02:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-17-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Mar 2026 10:48:05 +0100
X-Gm-Features: AaiRm50HadVDs4pqO9dj3wahdEzbs8lG0kVQbJ2LPNPCxgwkInPqByiFH9AmBdc
Message-ID: <CAH5fLgjbZZaxRaAvodUM4xkKY4YOz=n-hcWG-JraLi_Acu7u8g@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:54=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

I think it would be nice to implement the trait versions of this in
terms of this method, so we only have one implementation.

Alice
