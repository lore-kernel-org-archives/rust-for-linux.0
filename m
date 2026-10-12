Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45894497B8F
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818166; cv=pass; b=aigmiU0wN3i6e4iDsSruMwYDD2po2nehdXHAceD1Qd4ABZm+alJRVUCoHUsMv2uJUr9Bl5IXMnwsTZGzcl53GITZbVOLUC7Xjhgg1dmAi7PDRiAmOhsjq/Yy2txUVMDUUA1HIMbyLz/nyKGWauf/8UJ6LwI0EjHubh+wd8oHTVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818166; c=relaxed/simple;
	bh=Qh8/jPpdQb1uoYLtiV+P2F0fMSrInIfSg+J+6byfOcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtRrmp0eHWMlVavxrdDJQHo7LAulLLhXF8ioIc6dGaETyNllSzG9WLjJX2lMRI8Mt13FKvoXc+JQ4s0AFRKvDb6RbXEEPR9Dg0hzTXy6RDYXDjFI6t7eKMhPqpt751L1mdcUponVi+D2jxU/ITZPSdfmBJwK/lxcGkp3UV/90pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0BgTGEn; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0BgTGEn"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ad98c3fb15so13615817b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818164; cv=none;
        d=google.com; s=arc-20260327;
        b=EnNoDCkql+HpSgGSZ3ZJoFM1j6IggyDxY0sctzp25gtob9Z3KHfNH0SMdzQ3KHC7Zd
         NdCSASOIqsNe2kG4xPvY3F6VLOqyMDr876eK9evICUf6lmM9XR0mEp/6hbvFmaBDTRVi
         zPecKcuOVmKHZajn/SJFApuka0hbx3b6PyTYiEwwbEop/hcxx2gfUoCNUI/6jRvlZ+Ja
         GiT9MZBlCjmrcTow+491iFig3mi4XEwZvQttaoPrW0Yx3ZbM38BhI6XP7A7q6CwLYyl2
         c8oJUI2DgsVNSmii2MV03xe9NAZKJbONBrNPrszORY82QAhYHbZZAZVYE8H7xmkz6l5U
         Geug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        fh=ThQjajn1TauNmNKaIIZJcIO0Q04jbjMUiLPCrEfhOPM=;
        b=rWL/zOCgiHLDkIaGwFlBerSLTqQBQlmFCze8jt6bSG8POiFYHYBlqHQL4Keo0t3ttx
         NSk0MPx1Zy/EUAoi7UlYDh6jJEjlMJ79+U/5LXWEHxCsiFaoyyexPoo5pm12/Pdy+W6B
         fBxgEl/6xmZTnEV1CLHFFHIygoHsuiKhqc4gK4cB0HtZ06Foohgvr7O0+BJsensSP9FN
         kkaKIiwpEILNgH6F2VsLtw6/3n3kADam8qoN3hGT8nPyk/tlGcm+CZKbiev3LFfUdpUH
         DAmrxZnv1lXBQdeT4QaTsU4PiIxg5GjD5pDELcLGww8v4wpCnS3Jma22Mp7/UbOxhW47
         as6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818164; x=1792422964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=H0BgTGEnjHPsOpry8zM372M3cPbee1W5JIY+k1KGqv8WNzGyYlMWruUcNGXNpqKqHv
         qAht/Fg1XEZo8JjFRoEHFhUiRD8Q5cYqy8MKiZYc5LQtEbtjmhvyhG/D2J4elSaSnKUV
         ZM8MXqxhRXUvbFnlIr9rEEaR8zAMYY5wS09xL9mUt1dlIaceViENwfpBgQUtW3eVOGlU
         pDKwvkrYloE/6nhq3HRdIEjN85hfMhGmgpxKiemxr8Ipgmoo4uHaSrLyQls+oGGVrOtN
         wPBentZQM0axYBEPhSU6pemvJTTbrMwGD/WXXj/XHgW/LcIPOfUMxG79B8fdKd97k9XK
         U3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818164; x=1792422964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=AmcrMVBD5m+Mwu4S2+hUl0D1CmwxztHxuSYdFm+0q57MMid2WpuhnjynQS0j7zooDR
         pi+Rl3TWUZG+G9zjIRe346siyLKJsD7CA4Y5s/1mlOl6kHTtdEfW2sbC52IChW/Hw1gh
         F0DRmmfgI+NJcZjC26wwBfW16RwxnJ2YgT8WdXzfrhqL2rVD0gYWqVqJp0f5MniZ/+Ah
         NzBsybJ0wR3LQ8Cr1EvskQmo5S9jrJxixFwA8eUqZKgDEnNnol7vuSsnClrD0nMCbIVS
         fSZePBWTaMeB/DF6bql2Q+sSascvB6ncF+EHgpEiIU+JpxDlrM0LNJQioOz2tyNLR/+b
         gA7A==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2pybvDONMzCxrg3U7mdiqPL+EHW3l/74vHL6ixrUciW/xNtLJDNgtomOa24uI/7eMtSI/3rTZIU2lON7vw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBKmfmqPCpCZgZWCBaXjXgZHdI6rB+GBDL9sFdAVvymJt4e70/
	7b1AGgekE5PzRsV2rNTI2DKvyovfz2eKDqHowc+z69XitFnR6W+CcLz+9VezGc6u5pF5JIlD7P9
	Oyl1t2Nmd4//JXa3WXpffAry8JfySxD30aKHzTBlJ
X-Gm-Gg: AYBFou1YVeuvncaIQCjGZhAdV4gSRIsvXMAx1kfD/XzyZfltuuAK1clN6YJAlkXA7cF
	Wcz5kMb44bgMjYng3inoUgZCvArMIso+8Hd01VsR1kpMtv10bgMQ3t80GLR2ly1R3W2EI8m4YUY
	wC8aw2OUQWfwepzd0/FSt5m4whg8WJmov0NZWaLHzvxE/fDroXmkHZqr0Z3fiPy8ZdEMNXQD/eb
	u/E1HSM2qLFtTX9HX08ArmZrTylVayPBM+Spk1xEV0amrFj/L1oFzX+GOIWvSfmae3vogUOvNMB
	zqe5d6/iTLygsyal8AeA/YucZiAuDRZgwFuqRcT6XjShS0c+QQ6vdA+u553pM0UpEJU/Zf3Z7FU
	cx0PtarvvlgdMnkrdAWVl
X-Received: by 2002:a05:690c:f04:b0:8ae:b617:713d with SMTP id
 00721157ae682-8b07edfaf6amr35969547b3.19.1791818163556; Mon, 12 Oct 2026
 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 17:15:25 +0200
X-Gm-Features: AclHuK-ngdayfpaG9DdBIWGDrVoRKwhiuwWtMtaRRkzMdsYW60BnSKb-GUjELAE
Message-ID: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 17:04, Alexander Potapenko <glider@google.com> wrote:
>
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/Kconfig.test        |  11 +++
> >  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  5 files changed, 135 insertions(+)
> >  create mode 100644 rust/kernel/kcsan_test.rs
>
> FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

Oops. I guess we'll make a v2.
