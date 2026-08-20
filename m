Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531D3B42E7
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269407; cv=pass; b=D6z1FAG+pm8LGTDnKYIytG/oRSxgn6YPwtD59GW4cTUb1IdScIo7Ug8I0krVHxy0huV/EBlbL06Yi8Pak2a8PuWQextL+URoxaaPULZ3uWTudlbuG6FpiyC27qFee45R1HM+MW/9PvM4hSXzsHy7x4cZJA7MpPTR/ykfQz4/MN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269407; c=relaxed/simple;
	bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqaOUs9WXssWOy1uBQe7NV+gNjTNMofuFlEMIEqC2YhZCqVU761YxoH4EtKSgI23w49hX1vIBI66U9Doly3dwGrMPlPr9QySpR1o3asNCunToOWlAMRtBIdQqTi1zr+X44538ZQgogbOTY+kL5MJa+ffhZmlR2swwKEfP9QC2KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hcSzIvL8; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hcSzIvL8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498012a61f6so26775e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 16:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787269404; cv=none;
        d=google.com; s=arc-20260327;
        b=YTKaJFW8SUEfMtzT3jVkE+i48ws9uSxSNpEODwycGN6PE0ZVsPezk4Y5necBQ1t7vp
         cG4pXUDmSh7GKjBrxSSlBlcmmOgykL4TMNWsItvPobFb/hiDSx2erRILqZpwuNWKyEbN
         zTr0CeI/9Z0g5dLDKQNSM2oIZ6/ZaybhXh6QY/DtMbijkF8TjStOyq+ZxJi1PiQ5UZit
         6GbAExJfZ9g5epaJtYy+X/Zw8hq274wqFH7KMZG/Vx7aZXEsXYbvTV6EO0znKgs61A5p
         SwVkSLA7ywlUFcVfgMKcs6GMS3CnN8lrVB1clkZNwDaLm6hlzfIQx9cmDwJPcc17/D4q
         89PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        fh=X+6GRDW97kpWmbp88Sx/K6Uv72ldYfcgw6baXMpTpZg=;
        b=oPY8AoaC6Ha2TE79C5RUomWJSfJCfg9ZztR3xm8rZG0bVghrmRsvAB0J5SOgILM4dV
         /sBOSdu0NqJOW1quzRS2+1xjzyj4Zv0ZRwvrOLKTNlo3dEuA+CpWwPAR6RWPZyEOO179
         X4YfDIMwG1+Tze/Un9YvamFJL23yjsN5rYetak6zvxH+CeUt/PJfUIkAaEmetI8jhYeL
         ktyJAx6IfYkX7jvkTjzwEQIduplFM/TUT3zMR/caxiaEyYJZT9hvasUAifaasutu0QhC
         /ivo8s2P8rww7HCPUYLXCoCIJBZKPRK0fjgN2REV4fOPjH9rLo4sy66v2pwqAB/WBQuO
         JHxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787269404; x=1787874204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        b=hcSzIvL8HJOp5DFbBG0CGbsHTQtGs1e1c1P+B6MQ36RM3md2ZE9+Z1R42U5NLSCH6c
         XdGoaVofnef4u1QbXsJDOcO7rTqpwOlCHExztpxvV5TsmKsLMIp8r/IRNBqGBLYilr0n
         y2ijE8EKOB024mxc2RvtChy9Fuec51VdHWXTW+LfJH1JApeZy5OHe9z+vccj3ebBsGVP
         YWvGc7SvdQOpNRJCKXvuifG+MOuvfTfVNlsDob1F8iWUHAcsmWk0Z+xNN16Nl32lMbh6
         xug3LhH7jtalTneULFz6p8YYA9iJJfXcMYycPq2XJslBn357Tl8DQc+JBlMPwHPtb6YH
         0jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269404; x=1787874204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        b=QD4KZK5kBIXv637odZvhCkgXs504/IlfT1Bfna+ZHhkGQhkLhy7Zob6L2mVuXDIXy1
         AxlazR1HSzmIUJZ/WVkF1CY4leWYpMQcbKnqAwmstqNyr7On58AZt0LJV0grIjnVLkIV
         ODURVIDbbSUlUaKccmXRG6gjjLiZz9WD6u05x9zPK8axt29u0gPDmuJpPXDdBAHeN/Ek
         LBk1Ok3giDS9Pz+ciqiJ8ep2FiocFI4mNm9z0FtYpxmmBucSgWSoDl4NRe/2JjYaxGtg
         aTDfaV2cSro4OkNMEP5sxhkJGLELreMgt0L7EJnwbmbXTpuzvcksKmyoAM8kosdkPUTz
         pvPw==
X-Forwarded-Encrypted: i=1; AHgh+RoqITk0RmPG7qmlew0ugm51QEN2F+zWTFf52ArwUFBe6XtAPyRkp+EdlD1Qu6GlLRxzr/91yYsqGkFM28lYEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJiiL9LeZ1oOvdidomnCJqneuJnRm0BBo7mrHccyZm+Vtc8Tpt
	FshPLXHgDdjdH7sNFaKXF7qumrEOrYe2WWnat2VsSdn0l12sz9Lm4LlEb5HhbwKROKJivBCzto2
	eynKWeNK77jb6Yo1R3STe6ua+H7RAbvObKHKyLsdh
X-Gm-Gg: AR+sD12w0IgD0JOOF8np5ckuJv8cQjdmPUVwDpeNgZHZSvlB1o9SZbRTfaOGDnu0qbC
	V1fCFZlVoeFxRI/BPWynCK+mOzjuwHm1nnKm5VRIlYt38mgvZbeEPY4NSYhdk4xhWH8RFmImcSy
	AWWffYojEuITgSA/fbKUzRPxWscsZMl2lDhPgJrnj/OVhz4W5EyN4qCpa2rKhIhS4P+QICNTtDS
	zLOcxdjjOoKzPBA5imalDE9lCPw3k+OTjCR3z5bqWqzYZjRvTy/JrrIhDeBkBJKbNVTsi8imUk3
	jp/SzwFpWCmrCwGj83Lh7kjgkei4Lu2eW+P72DqQjIYx7aOoUTNJx1MMR9jT/xy0Mft7Z2Z7Dhn
	4enF4T4cr
X-Received: by 2002:a05:600d:8498:10b0:495:3ffd:5e39 with SMTP id
 5b1f17b1804b1-499b96bb829mr206755e9.3.1787269403807; Thu, 20 Aug 2026
 16:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
In-Reply-To: <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 20 Aug 2026 16:42:46 -0700
X-Gm-Features: AcwNN1Udef14G2LArp7Ykr4UYTpyjp3Xzj1gv8pPpjTIgCKojktSd_xlqRtrfuM
Message-ID: <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Aug 20, 2026 at 2:57 PM BST, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > In Rust doc tests, there is a dummy `__module_firmware_test_init` funct=
ion
> > generated by the example in `module_firmware!`'s documentation, which j=
ust
> > returns zero. Many other documentation generates function that produces
> > zero. LKP test robot reports a `Flags::zeroed` instance; my local
> > reproduction has a `Bounded::new::<0>`.
> >
> > LLVM's MergeFunctionsPass incorrectly merge functions with the same KCF=
I
>
> This should read "with different KCFI type" (obviously).

Also the comment in the Makefile. With both instances fixed:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

The LLVM fix itself is trivial, and it looks like a pull request for
it already exists. I assume we'll want to drop this flag for fixed
LLVM versions when they're available.

Sami
