Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B246D23AB8D
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640306; cv=none; b=lfNRUpcjTRbnwioZIgl+VJ/5/h4lo6sMOp7Jy5s3Mfsl6e8s5MEuGoWF0U8cFj58JyeNrYejBJINsNNjx64zNA3gGHYuQRfkAGFs2CQS+/vEOJblfS0UcpAP2S1foxE43H/9344WQ1GWx7zczNRqITJExjAX7oLBgXBefhj83Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640306; c=relaxed/simple;
	bh=MVvmC7MY2M1TL7VrB7aCmsPWhi1lCkdO2TRKjAq+FoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDz4m1h8ughhgR3K+jkmTIv/PSxcTXBw3wOhvNuWagsYs8PbC55df6LSv0Qx31FZwdoOKxSKtfRRVrGSb2Nxk7dmnm9R9T0Ld2054xfa1N9A4FIKoIFLdtwrdyTZXE5+JtUR/mIFJCesgSKjRJktE4wQXlXcuav9ABW/OcDwnN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtH9HYM5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtH9HYM5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290af0e154fso1360015ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760640304; x=1761245104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPl4GNeEvYNsD07xkIxR49GzR8yYXDLG1l9YclgP27g=;
        b=TtH9HYM5a4FUeYoXz+SZqe6MYw3kP3BExPqNjklDmC5IaRgZkKr3RXBb9m0tLrjdxe
         q3Lw9cEF2ZNlNJyi8MGtsfvkeg1dQTgunkaxgXnpLA72lFMrcx2du2N3rNQxFwl0T7i9
         Iylq8ZvQHDBO2BwA+rzs/COHIDMbwi40e0w54NDQrSMyPmeJsQTgVgj2XVagAlXdgnQ4
         4xWCLqxVoT9lJi38TMDHIzQ2MWo/udIMntFZM2/73asVgwGmvi1uuCgvGNF+jt0r6tFC
         WtvByxqZallAeHHGWLwiv7/vHLHMiUAhHiaphgcUKFVSI4HnGz2dshh+K9kKdaaXC5fN
         UQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760640304; x=1761245104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPl4GNeEvYNsD07xkIxR49GzR8yYXDLG1l9YclgP27g=;
        b=u7UAIyrq35NNq/6+EMkjIZ4fAy0imMsVs+SKdeXZWipiADHHN1Nfq8TUd5u15AniWv
         9d5MF9/exyvnyw5F+mgh6NnxzUpmv5ZLlchgp568A3MGk1mmO/rHHewlbVgf+UuATnBa
         SZnXn/uv9skLZdr5vZAQfEMYyKd7aRxMovCzeirtCgghmi0c2jO4XSBXFelwED6LWOcj
         A3pnSw1FG20pHrrsqdzELULjsag68LuFBXI8LN9nMq2y5qUnUMuc13BX6hWl3y3x7Hub
         v1SCYwHDd1D5oI6iHtdUlB8eRzbIV0kuYpbmnfnmRPHMQWvy8c+BvXD8+U03aDIlQUpL
         8+9Q==
X-Gm-Message-State: AOJu0YyqGCtGgj8i58XgBPrcfJAxP4wSQLXbbTjo5erY0LUWttrgAGio
	oOr8t9iSwe6WBWW83kjbEigFwLLh+HJHNdLF3QV/ZD2ZJWng9V4IRdU5Grs/cVlxmMKhG6IF5S8
	x2H1h8WkvYeV+ircRWCkFRNx4yVb6qFU=
X-Gm-Gg: ASbGncvP+M0Fhpp0T+dlqkGNT3l0rk9gPbMBEnGLpMGF3j7pRF7zPmrROEFfY77WlUD
	Nc5KHl5Ea7IzesfT7BFjmAaiNlTuv65sVksdQNBq7cJc9zjGzXfPugOHFTVanTBAdI0XzmWbdaf
	cAHeUpZPpAJCBQIRYeY2qhqeJ0LF99RvnkR0vn9PVVeH1+JjsGofuYN7njrNowTQt7KBgyAipzY
	tTFbP3vEB2yCsQJ6HU9goJYlM/bnr43xJcptYRlLDEhIrs/uEr2Iov9nlWNwHXQVxIPVHXdnOGV
	3F++eHFs53nSxjDNYcE7d5HVev8dkZzANWPurmbOXiHqXjXY1iAcAYhHT1uQ7q3EihNGsGpjn6l
	nL1E=
X-Google-Smtp-Source: AGHT+IF9I6SSPaZXt6fObKsCwr8z4pX/yL7H2Swh89Pd5qRMIU65WohMKqiraRMDzUotqhTJ9xFy0vEvU+nF48HX4/Y=
X-Received: by 2002:a17:903:2f87:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-290cba4effcmr5451435ad.7.1760640303984; Thu, 16 Oct 2025
 11:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com> <20251013062041.1639529-8-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-8-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 20:44:50 +0200
X-Gm-Features: AS18NWCjsMPV451tdiawVF8gJgOdhZslUWuxkRt4tznLBhQSO2tbezIdx1gta_0
Message-ID: <CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gpu: nova-core: gsp: Add GSP command queue handling
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 8:21=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg,slice_flatten

This is not sorted, and it is not mentioned in the comment right above
it -- in general, please try to clearly mention this sort of addition
in the commit message too.

As Alexandre mentions, it will not work to use it as-is. However, what
happened in 1.80 was just a rename, but the feature was available
since 1.67 as `flatten`.

If you want to still use it through an indirection or similar, then
please move it to a new commit that explains the addition of the
feature and the indirection to use it.

See e.g. the `file()` function I added in e.g. rust/macros/helpers.rs
in commit 36174d16f3ec ("rust: kunit: support KUnit-mapped `assert!`
macros in `#[test]`s") to see how to set it up.

Essentially it is:

    config RUSTC_HAS_SPAN_FILE
           def_bool RUSTC_VERSION >=3D 108800

And then:

    pub(crate) fn file() -> String {
        #[cfg(not(CONFIG_RUSTC_HAS_SPAN_FILE))]
        {
            ...
        }

        #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
        #[allow(clippy::incompatible_msrv)]
        {
            ...
        }
    }

I hope that helps.

Thanks!

Cheers,
Miguel
