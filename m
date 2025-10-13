Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937A27A477
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760380163; cv=none; b=Mfyx5aXdQ3S1F2nApD3K6z7dR+EAzKGZb/vlQ9QgT3cd3EszWnWBH5bIOuriGssnN7ofGqtFTFLzBbAFPd/4mZXXeK62PQmYgRw5vbFbe6xjCVnuDSv/HJ4mG5xkTlWB9MkpbojsUND2NN2lk7nCyIXl39a1hIuXxyFy7YeTImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760380163; c=relaxed/simple;
	bh=zYL+0K31QKoc5g18VBqsETSHnU+/6xRE94vFn5O+hv8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nbpsCiLAhJSvk8+OUt9lhrzRT/UKzu60pNlZWo62rFBpJnPh8LoIQU//AJNoDyYtsNoNGCT7EACsNkoKHDl4KYYDy/mSPUraZ86JfchaA4p9Uoq3uBvhwzZTCC2OVIShXAoChE5Pfz2NAFt1okn+bUE/gZsDr3GHUn3DFwW2Qvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekv/tpIC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekv/tpIC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e407c600eso32739205e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760380160; x=1760984960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bD6YmmdQTenqw0okYBiQ7W3RmItenU8G7xdrmKJ69M=;
        b=ekv/tpICQkn+DcpI2KvSP+/Y9hwJ+NGYYxo+ATN3t9vheSfquJX/thXOjtY7QSjVGA
         KMxwLH0wAq4ZCNIcqdWPe0l0jVeTRNEyndPvtBag4mip8KUrUJrqy9LpzC+xh/58gXEM
         MiFN2p4eG55/oBXxS/letJg8b6e/heVI+THRFZCFZtDHieAKzgaEKq/eJJfRWu2IKhAR
         7E67MtFsR/yT5RdzJDJKXJ/hJF/tkUvyOEPVHU7hxIxd1YY82JEtgpXYKrM3/MrHouwv
         yWHIeDaBJsY5tC06VafA8/Vdy4+EDG3QP5/VxgChpZVrnQcIExwJUgIso0Cl85FtyYa4
         LR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760380160; x=1760984960;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bD6YmmdQTenqw0okYBiQ7W3RmItenU8G7xdrmKJ69M=;
        b=SNnMEevUhecRKY4QN2NdxLETZ9atMx35GBj/8qGqv37x7UYsK8EMXdPtJmQBVuuPBx
         vWWfT5nPDgQ3J4F08bUHVYf8taCGqx7M0c+DM9YqeW5wMVZIqECTYwHi11aCJcc5nTYU
         QaT00f88gcpGfGfhtUO2OR2qn7iEteZZRJiJWH2bGDSWMyfk+L1Bvs2YqYk8HWxJHLPK
         VqRxL0HLRgqS0OphD3yfRbKDeg+tUPMKgGb5Kb8ShRfGZcXk7QoZw6f2QQk6Tg4hb5i4
         slWB7nnDlknFZTRziIDLZ3TpL/4pGO1ZTUWvM3BYuQiM4I3KJPZ1+2XzEWhkr/5sR+24
         cimg==
X-Gm-Message-State: AOJu0Yy6MLnXButeJAwTIFxP0Woxi/4Rbne9Ep5P0dk1nXKAu0uhtZeX
	7Do54JnmXv5NbKcwoXUv3x3UxrICFxNQJvpWSB/YzVkpOW1U1CfTdKwwxjOa1iVlPDrtVYiUnh8
	PGbFb9kW8otSLSi0cHQ==
X-Google-Smtp-Source: AGHT+IFNKtLrbphIS4PoyrnDJH9HejlloM+is74jPThCg9CXwvLc2SaQaccD/56Q5dEx1PAKJ/kbu5gPzH8MdFw=
X-Received: from wrrm18.prod.google.com ([2002:adf:fa12:0:b0:425:f04a:4d8b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c4:0:b0:425:75ce:9f5f with SMTP id ffacd0b85a97d-4266e8de573mr12388546f8f.48.1760380160506;
 Mon, 13 Oct 2025 11:29:20 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:29:19 +0000
In-Reply-To: <20251013124139.18809-3-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013124139.18809-1-work@onurozkan.dev> <20251013124139.18809-3-work@onurozkan.dev>
Message-ID: <aO1E_-KdnvpG5vXl@google.com>
Subject: Re: [PATCH v3 2/2] rust: drop `error::to_result` and utilize `ToResult`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	tamird@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 03:41:39PM +0300, Onur =C3=96zkan wrote:
> Current `to_result` helper takes a `c_int` and returns `Ok(())` on
> success and this has some issues like:
>=20
>     - Callers lose the original return value and often have to store
> 	it in a temporary variable before calling `to_result`.
>=20
>     - It only supports `c_int`, which makes callers to unnecessarily
> 	cast when working with other types (e.g. `u16` in phy
> 	abstractions). We even have some places that ignore to use
> 	`to_result` helper because the input doesn't fit in `c_int`
> 	(see [1]).
>=20
> [1]: https://lore.kernel.org/all/20250822080252.773d6f54@nimda.home/
>=20
> This patch removes the `error::to_result` function and replaces it
> with a more advanced helper, `ToResult` trait. This change brings
> three main benefits:
>=20
>     - A better calling convention. Instead of wrapping function calls
> 	with `to_result`, we can now call `.to_result()` directly as an
> 	extension function.
>=20
>     - The returned value is preserved as an unsigned integer on success
> 	which was previously discarded by error::to_result.
>=20
>     - It's no longer limited with a single input type. E.g., right now we
> 	can call to_result on isize without manually casting them into i32.
>=20
> So that the code that previously looked like:
>=20
>     let ret =3D unsafe { bindings::some_ffi_call() };
>     to_result(ret).map(|()| SomeType::new(ret))
>=20
> can now be written more directly as:
>=20
>     unsafe { bindings::some_ffi_call() }.to_result()
> 	.map(SomeType::new)
>=20
> Similarly, code such as:
>=20
>     let res: isize =3D unsafe { bindings::some_ffi_call() };
>     if res < 0 {
> 	    return Err(Error::from_errno(res as i32));
>     }
>=20
> can be done without manually casting into i32:
>=20
>     unsafe { bindings::some_ffi_call() }.to_result()?;
>=20
> This patch only fixes the callers that broke after changes on `to_result`=
.
> I haven't included all the improvements made possible by the new design
> since that could conflict with other ongoing patches [2]. Once this patch
> is approved and applied, I am planning to follow up with creating a
> "good first issue" on [3] for those additional changes.
>=20
> [2]: https://lore.kernel.org/rust-for-linux/?q=3Dto_result
> [3]: https://github.com/Rust-for-Linux/linux
>=20
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x=
/near/536374456
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

I think we should keep the function call syntax and just change its
return type based on the new trait.

Or maybe even introduce a new method to keep the existing method that
returns Result<()>. Many functions only return 0 or an error, and I
don't want to map from int to () either.

Alice
