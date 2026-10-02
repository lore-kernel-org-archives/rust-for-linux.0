Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E842E40C
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925840; cv=pass; b=kzZMWXGMFlTu+3dyAjYPhVGxaJyM1g6uN4gYfBmXecfVFMxxZRgjaLKGBAHABtQT45eBWlBcECjCz81ycXDEdBNgNu/cOtxDWRThx7qhFXsiUYA//BavJ95Uh5zdGYBwx9xvLxGIUg2DN9y768Q5bS7cqW18yUUdH6mGl28G3lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925840; c=relaxed/simple;
	bh=gMHdH4oSim886Jg3aR+R9K9dB1KrAhno1lvgyTvcx4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMoYZeQm7OTZkZmu2m8Tu9O6u94/tiyUyKHa20y7s6AwYArJHcgdhuqvFtKtNHqJlan1VKuv2SxXvz82mTaWl/A0lZQSXQ4tLyg+J0LoCDC/FDB4wsjfZhDNLweJOUslGUyr4EjyD9gwbxPqUrcXbb73pMv5WOBfpLGyHRo/2m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjJ6CvZF; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjJ6CvZF"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so408650eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 00:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790925834; cv=none;
        d=google.com; s=arc-20260327;
        b=ls1ZWnpNymd8wmRMX7vuL2ECrmBPrQ4ruXqy3IsO5E//HyB4cpZwHgH7HaH7ec+1HK
         3i019y9rB2+h33qxibFPPoNj+q8GvLEM+7l3TnnLTKy+JrsyGeQI7/qFCTp74DMc129j
         Zx89KEIqwIIlDKtZKNUJUhWoxxvNlkb8qU2T1PfnT0LSSMW9/l9Gp3J4ruDXHcgf4xEq
         z3gKhFgfx0t4GTx+JACUq3IYSLJG0ZP4kta3UybXmS+64Omwc9j9Rqoqk3VXKKB/cZSs
         PqH0D61znPRvjZv5dmmvculz8zi+4jHcHAdm5TB/DEz7y5kc6qW3pNUucznvZGvyLmE+
         N3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9NxKNLanM+8Plqp7YrFfXpx/mVglpC1q1g8CPCCyRHM=;
        fh=x0Lxn/4jcxEEhlD8L0rb6XCQiBZQwCONBtjhvrYtfnw=;
        b=Uv1JAEjNo2IYR3xb0JN11xhBgH/lhgM/CdR/m65lUhyEypuX1BMDr73dlkmlA4n3ZG
         8SPV/YfkW/vHzrTe907yxuKjEWkPbcwnxYlieScp9wEiwt7nUeN7kOA65P9D1Bt5C2t+
         W58DCgzEuly/LXHGLNDdDUVYIFYmRufyyLJOkLuae4b94vrJkqp4SafHgY5Sfd6PzsOR
         ZkM4W5MF5NNltH54II1pT18aNwEkHXw3kVh59PNfuGNG4ZSidCZmD8Bx3ZnMvC/daX2C
         N3xQb8f0SJHowxYmkbD+ASoz9gTvxdpxnnlHK0sf2TaWRxlak11E9wFWNbl1Bq2I+guL
         OV4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925833; x=1791530633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NxKNLanM+8Plqp7YrFfXpx/mVglpC1q1g8CPCCyRHM=;
        b=hjJ6CvZFMLteYkenvz+VQWDCilRxX4dnHzf4YEOlVkZwynRWITlkulTelKwv6ig5bD
         Ds/bYPjOfo+4W/RJIwTu1FxcQL+Cw9TE9H56MNfYuo1QREYt9eXfWJebL5cUjdvGGfDQ
         vIeJ85DUNf/vCGnrZT+ook4QG9nNc2t24CDW9YvmCpeUnLmEF9xS+iocEAtPK9IF7oLM
         KXLPsIrzEqMCnOkbtLap2rFGGinToAYApouMPWtnglKC6z51Dkl+41WSeY7PANh87sZK
         wpJ1MIAlBFDc4fhHMUeJ7K7qkk1q7O5E5wxePagptfEv5Iv07QRp01h9TuPnLeQYQRU7
         vB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925833; x=1791530633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NxKNLanM+8Plqp7YrFfXpx/mVglpC1q1g8CPCCyRHM=;
        b=ibWlfCuytxJ+gEMsRXeE9W/kv8CQO3EvbOjs0Yxxt71KQmNEQmOF3W4jpfukOLLFyc
         5HQnkx0LIEATQokAtxL7jnawneT7pnI5EumW2upW+G26Z7m3eZQldbYvdLCSvYAim/1O
         69M8WUO/O/5HUriFwQxgQCufnt1SVlw39Sy880Fudu5Lh+qq+0kx0nbPN2+TV/xglXim
         JgFMr5EMuzN6+b4CJHc2+4sB3koHN+iPegqnQvxOvmG/1MSHwzAFpmRAGvs6aaoMegqF
         g4PVR9UGZBCu6SOhX1D5/XdrxK/+u06FewjizHHy2s0SxJYAzxT4a6EEpmvOQtBewlpE
         xrLw==
X-Forwarded-Encrypted: i=1; AKwUvBx4Vk09huPQGvv8lWO6h1xFn1SjNqoD6+eC+Jr9+ovhkNbUsHD9e7NaO3w7malR5uVWLmBZHx+0GA2SkH+HoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJiIb9WpQ05irgAHMLQ7YTiOJvwgEsGD3YQ8MR2rwZ+QDSXnJVz
	zQGV9aERy8OitOaIhQREpln+LCuYii3cGEO+RJYgfnAjMMMW5CMERwihHtIJCRheuTxVMTeh6bb
	fpkoe4H/wEbX96Pvjud0P2Z/N9yDJWp6XGnuPGsA=
X-Gm-Gg: AYBFou0+us88FLTRb3Tt7qs9h3/aDDhuaRUml0LRU2Hw0dIrPbFOvoTVQp/kVbN39wa
	LW48zp7UMUXiJFyhc7DG4SKx+HzMZ6hgAxNuswAhfg2Y3/bLiySNE2pqMdgPN7/c6ohm3P+hMoF
	7T7Ch1n2QF8pXGwy+UHIRkSWbMtC8D6Y+xFL3MFC/OvRMpc0uYQmoOxfka4UOMh0b1vfNIHYXwF
	LpJzQgGWRctpNHP36jYnhiL/nh7DPcJPqdbqX8nIYL2jnvNGSuGcxB0S6aHF4HLgcIjoTWk78vs
	j62IOc7vFtzq5K/5dZUAS7jKfpjdlU2SlB+WzcT3yOTrA9xAMvGsPHn8ALgVcCOAc+FsZ4rOrnb
	Dp3zNWmyqinrVypZlYYVHmACYXW1DzLCGlQOXHxgbWg91PDU0+Y4PyPnfz1Fk5NBEphU4SFc1qG
	/EitBqmtNpsxv0Mf/0Y85BtKjEmlNHswQJgz5BY/BA+e7f+4Hn6ps=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34f14ffa69cmr3405035eec.1.1790925833461; Fri, 02 Oct 2026
 00:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
In-Reply-To: <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:23:41 +0200
X-Gm-Features: AclHuK9UJjTIF00IX77HZfG0i2ZSfMN7JXWcd1eIDxRPA96mgfzo5pEnXFRoENU
Message-ID: <CANiq72kB9vFf6x6KD9SX_LJqq55hENN6wxD6Ef8irUq36+MvBQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: mem: add `Align` type
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 1:51=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Rust's `repr(align())` only works with integers. Add an `Align` type so i=
t
> can also be specified via const generics.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks!

    [ Adjusted the title of the new module to match the one used in patch
      "rust: mem: add `transmute` with deferred size check" (landing via
      driver-core), which is also closer to the upstream standard library
      title. - Miguel ]

Cheers,
Miguel
