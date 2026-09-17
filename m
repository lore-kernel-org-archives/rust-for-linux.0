Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08DD48AE24
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637587; cv=none; b=Evy0nS86T9It0toZeuneAP2FM2wD31tr1TkGf6TVBdLay/xqq4OFcQ9EHJMtC9hXqGUHBTSwWJYZWvwKsHyFxqF8zzjoTvWmlryRxyYzS4CmhnJq/cklsp+KeDaqw7mJRO+ZRG01xEEwB2X1x9WhySRKeADbz0BncnEkONc15yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637587; c=relaxed/simple;
	bh=3XVhvX9FaSzMPLV1sM5AoC9g2JGZvqkXTdE0PlcL4z4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fnd2mkJXFueLBZSgFerUwn+uJEm1O6Nw2Q/4Vj7JQDMUr2/XiimqSq1SZG/BlrGofxSXOGcOoL3bV9DX+Xvj5/io0li3Hw7SA7SOznGRyLoLV/EnN7ktB+OnPg1IUhITg8bkq5vAU2Ifyy0JWBfBgiqDP1Dj/3dOQ97g+agz5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGGXzoSX; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGGXzoSX"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6422198fso4138675e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789637579; x=1790242379; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLg+WWoCYgCGUuXdz7tNXtS+CEP4a258vdZIA6xLWNg=;
        b=lGGXzoSXKH956DfJfYojBwngDmyfsAWeIjw9eDgLPuna31En2aIho92UypPv7am1VR
         /USN+ShizLse5PNckQZFarPLialVznoEsDQrHu+2N1yHx3TLjCxb8Fvqsjvvh6NwRtAx
         COe6GXAR8xkxfaEV2dNnAEJ1cI1DsXhHdM45rkjrsogrGJHYrLTA7GbU7y8lBY/Zl2tn
         f1X8rkzedCG5cm2dsBwVlFFPRLQTt43tRTHsFiOKEnH/AuJHGlYFrSMkIn+5vqnCeGWC
         F6T8Ytk84w5vDdr69jvEhkhTFVaSEbUonbOWlkGXm2vRZFDwKU1VrtPtJLpPnLNMqmmF
         4dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637579; x=1790242379;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLg+WWoCYgCGUuXdz7tNXtS+CEP4a258vdZIA6xLWNg=;
        b=18uRc9vl1roY2XoGADF7YO/+xFDGA1XdgAGhzw4ruWfeEfoxhjsr5+ERNrrqu/2qZr
         93fYutOUzFftRTMBbDiHU30M2dQjvWm0tZNrSDcX2DirYMxx/Rafoy3QUBmBaDvSB/7Z
         5ZTIz/0HfjsubS6BLtEB1q20A+dsJcVRku6s13P0sJDRwRB10Wrr26vGkdmj2vyt9lOF
         jxUSBea5fU6iEmkIfpUABk2l2ZYlHnHw+Ec4hNTbcQkD9wHgPbKaWFwNLgxUDZuWbbbG
         LNdRNIYjs8qcd1oZa3boP6iASDgbOZ8Y/0/JUNAA+XPHGv4zBxCkbu9Q7Nej9dSZdxrV
         DeCg==
X-Forwarded-Encrypted: i=1; AKwUvBx+zb+a0doxpLZTBn+O7Ei+WvsVe7LndF4d9Oyb1bCap2uze4mpdgZj51hEySvGS4DwYLRLUdpvE+R6xeRHGw==@vger.kernel.org
X-Gm-Message-State: AFuF++lLlbeNq4NsVWrq9t6kKIjSuyY2ifR2XDk8papKymPb96tNKa3A
	z+qRrx6TEdSrfCDklm0UDDs+giKYeB5ewsPk7jadeTQCbmZJQ9Dw1u6odjBrirefag7jKnKPowe
	IStLorMYsxkbsYTFYVw==
X-Received: from wmwb12-n2.prod.google.com ([2002:a05:600d:444c:20b0:49e:eb51:f8fb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:1b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49f1d516a12mr138409325e9.8.1789637579365;
 Thu, 17 Sep 2026 02:32:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:32:58 +0000
In-Reply-To: <20260915144231.31932-1-sagartaunk@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260915144231.31932-1-sagartaunk@proton.me>
Message-ID: <aquzyg0T67vu43T3@google.com>
Subject: Re: [PATCH v3] rust: net: netlink: Migrate to zerocopy's IntoBytes
From: Alice Ryhl <aliceryhl@google.com>
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 15, 2026 at 02:42:44PM +0000, Sagar Taunk wrote:
> Replace the kernel's own `transmute::FromBytes` and `AsBytes` traits
> with their zerocopy equivalents. Specifically, this updates
> `GenlMsg::put` to rely on `IntoBytes` for converting attributes into
> byte slices.
> 
> Also, add `Immutable` trait bound on `GenlMsg::put` as zerocopy
> splits the `no interior mutability` guarantee that `AsBytes` bundled
> together.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1241
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks, this change is ok with me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Can you send this to the net folks? Please update your patch title to 
[PATCH net-next vX] according to the guidelines outlined in:

Documentation/process/maintainer-netdev.rst

Alice
