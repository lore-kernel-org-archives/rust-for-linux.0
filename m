Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0258448D0E
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304042; cv=pass; b=i2KFHzYjAZo42m3mHNuFFOugasAg6YVGsKq3OQAa8rxfUxCA9veMuAZRsewDN91quZldG71kkNtifyrcg5G7u4ddB6qnlrHfra5D93zIvu8apSyzCn5qqglqd9jUaD7kUdN1V9B5CJ4p/VqalTbVZkEI3EE/BHCox/WbzQQvjbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304042; c=relaxed/simple;
	bh=E4zb8nb4cf/tpYQwGQJz33v+VSbtCZjWNTE/nT0ENKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm9oPdzWFbZvTYTuxAIoNfDz8dvtJjkX8fUhH3EVlXUhl1FIRyXcXiNjyncUibJGLUrMAmB/tNzy/J24rMOM4BpyTkh42KTCfciW1NmIS0koUzZQjCs13E+vnxgUn2o61rZyaRVfPVdO7kWn2He/jYeQ6OtKfnPDdDbWTOECmKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYc2t2+c; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYc2t2+c"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceeee8c46bso1418795ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 02:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787304031; cv=none;
        d=google.com; s=arc-20260327;
        b=Hj58qezeucof9DWgGr0oSNSZSvM5yl5m3tVDnDZqPki+rPKtnZ6lVP60BD0R1lbaAy
         09aUB9NSauH8cxr8BHkuTzg2I3R+QyDK2lM/f49+Aj8kXkPv/+aXmxKyzkj1itqkqCiQ
         Ru+ekJk+80PK/jmU/wRlHsjAI30QYLK3NWhUYKywJ8mLx7UbW7xWa8l13wQJQC6v/zT8
         YWmodgDl1LStqS7wX0u7zlVcKFlkfqYi4wBPJ3DTiwATYrccwaorH+957zMj5CKJAG6t
         Mi5yDw26qlNUpYNwqwm3qPTn+Nr8ERYYZesaUSj34sJ3yiGjvm2bKH1NBEf5l1HdTnsj
         vU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        fh=lM5/YTCuUDiSAAoRTRPslJ8aGEdiizQa+Tyj08YTQGg=;
        b=Q5bGGWJxsa5BD4bfrdM8g9rF2pEnYUrXGfkycvUceSrufI0V3Js0DeYTt+1NPS4HcE
         5ajKXMyrnQ6nc2r8e/8uaslnGSrrZ0rygtIJbuYg4LjrFy/oWnIExaoEZdO1hS9tPSl9
         dGxunXCCD04GaGRla5kMSCrBdUIXqzA9eafPTUKphwMVW4MkoBzU6KNcMoqZ10wQGaR7
         ciQ9vTm1Wnfg4u5yXWXCO/nVYQKFIGZoSRt/IK5eicLg+Duj2fN61S9t9zO9UtQGu2+L
         foBh43/6qp0YJ3kCYY1AoX9iwdpueusl9uPeBEUTVOLYO8WpGvTmQD/7TOSZCrySjDwd
         qEtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787304031; x=1787908831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        b=AYc2t2+cT9l/KBUzZxdX+dWrnDzavcTsk8wlbCBAgFBUbMo7gb3/2vNZmYGtnd/5X7
         g/FrBkVBJ7tYaFubvXFw8POAJUVC13gNgnA1WfH2AnlJbtEjJLps8OGlsUBeQ3e7Nv50
         XAM893yK919QwDEswwS9VCJH/jUpLDK/W2/FmNNX9RsUPD4MCV3Gqc0/FE8KdkKZ+1zJ
         hcJT9iLvGzrO4Chyav3M2a53HZjVCCtymtaVNF1YdjQy5JYJGvizPf3ezZvLLYfuP6d7
         YJWun2o6qBoGi02Hvwi3rzsnYHOg5Bbbq7UZUK1nufS9yI7cWrjSH8ZhqRRJAAFn+fly
         nLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304031; x=1787908831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        b=O8589ec3WZ+3DwCgf6P2WC46ex6bR2J+ekBmGWsYJktzJJKBoSx/c+wumGq+rjjhih
         Xc2KDrm23SFOqwcR0A396LC/2+toJRXYQS06WMVhHSHN75Hug8OBamDonnvk+Trv8R3v
         QyOrBK8CmeM+OTFaCV031C3T3RoT48NYHJjtLeMQjKkon289FIwLoVn2cHQRRRV24Ks2
         xZ4L4RWUi2/VLAtcFLfLZoWxITTFmbZauU4hrFDPJKahN4NGj0pDhfjcjsVh/CU9SFZC
         D++SB4rpjPv/vRCYtMPYqnupf4QbDLnsaeM0ffrJ3N2WRxEsqTCwuloz8MT4jseIvR/Z
         XnjA==
X-Forwarded-Encrypted: i=1; AHgh+RpHpfDWUBTOeiQquIinfQBtIICh8BUYi1pimAgCCEY6bWVvi9mnpH+sUsvanS8OEHOaUoaAs4cJF8q4U7YSbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mFIqSZkGqUYJrBbf9o3Aobt6JDXhDAUqQV/FEC9zYF0Ct8Jm+Q
	oURC3/Xo0sLg/jfcXCO5vDz7lcQle4izYFb/E4vuMiunOC0SFlmX7SNKmKWcih5lvehgNM9L8F0
	e3Ald57WkU/9adSbC2Od47Dn+EZEHfz0=
X-Gm-Gg: AR+sD11QV3X6na1RivFgFay7EVn7yOSsYLelmJHlODzbT+SrnrnqKIvlLvW5ctlWnzB
	OTeFEBvvqji4pTVMGI+fGaJO1SeWQOladxCiDbzKONDCamW4FW3j3Elaj2HGz8h10gRXwx4aj2y
	Xy5lyLr/2Rl918h4WEPVHXPzB/AtsM4XXNObQkNCXiY+6tyBwd9x5qXRnElu9OG/iNSKaF3WRsE
	6F/b0aLeSYfoZotkv9eWDq6Zb5uDyoZXtLSRJlGKM+oA8i1VqZ1nN36UBGxRB1VVHdNmBVvu+Ng
	Uz8MFNTHouFpR1AHhucxcZIvKfeWiScxKhWYcnzY7QyG8Kve8ywaFirPmmDZzd98w4oU07qM7x+
	nLfkSR4WUcJ8fS7rFG6k6xD+m9QgKqxfBz6RqOhJeHSXuNXtt7agcXrwafApZnvdiYaSMCzY=
X-Received: by 2002:a17:903:1847:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d64adc9846mr49568215ad.1.1787304031240; Fri, 21 Aug 2026
 02:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
In-Reply-To: <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 11:20:18 +0200
X-Gm-Features: AcwNN1WvsADV8MMuI-iTtWhTbjyEYDjf-9ZfUuCq94WpdMme_2NkgLvAR0YHzPs
Message-ID: <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The LLVM fix itself is trivial, and it looks like a pull request for
> it already exists. I assume we'll want to drop this flag for fixed
> LLVM versions when they're available.

I will link it in the commit message when I pick it up soon -- already
did in https://github.com/Rust-for-Linux/linux/issues/1132.

I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/issue=
s/2.

The `-Zmerge-functions` flag is internal but has been there since Rust
1.34.0 in upstream commit:

  b91d211b4030 ("Add a target option "merge-functions" taking values
in ("disabled", "trampolines", or "aliases (the default)) to allow
targets to opt out of the MergeFunctions LLVM pass. Also add a
corresponding -Z option with the same name and values.")

so that should be fine, but I will ping upstream Rust so that they are
aware we are using it.

And, yeah, agreed, we probably should remove the flag conditionally
later on, to confirm the bug is gone etc.

Cheers,
Miguel
