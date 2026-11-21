Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795278518;
	b=Ogxkku1arcftEt18ySvQ82HOyIOSpaPj3t/hvPG3Hk0yJXsmnXzUha09lyNPegLndqpr
	 40OV6EKLH3wQwEXZ/uDj/fk5+x1m9EymTnmcZcbVwYksc9JUK2EhWv6lATas01wVP7MOb
	 pRMCnZtk/kikfb62VsAGZqI9/j5CzF68l8NqHrHkHI6BtPg3veKZXFIXlNPWFkWozaAaF
	 3OEB3lC0mEocxdhv/a1rS8Yac2/+LeQqeJ/zam8ymR9SkkC7C04lL8fHILwfNeXtytRsZ
	 g/ePld5k1uQGvCfc9RmOQdcKJztlqRAGexmE5eyppY7UTCuUtiB05PqW56MH+X6BTJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+LGVfan7wS4hE7ubgJBRuwS2i7S/HbZrHu5p96veSQw=;
	b=lUUFws0aTKzjJzQ9ZMfcFwDJ/CRU7vQXaubXnqlGBY2cebSJpF90IZ1kB3ccb8s4Xj8Z
	 F6iIm4CFyx1xCQwnNH7ETRlEvJTQH0NNdRXBfnhJ1OMW3EAI+7cksiySX4Wmc56n3Dqig
	 gXqrvCc0Dn94PZ0kruRjhMIFTUVxKRsuRWEFn7q4sj+oBlIRdu8vayTiys4HrfOpU57Gz
	 uQqnDSqelWycg2dzvb2Cnc4FXnrz99CFp8tUp4ePtNoJA7B2fLXITOE4/keZz6EWHBVce
	 tn78yuIoiUaTUuHhPitsdVRrg5RbhhqrRTHhdBrT2OADkNaG061T+yW2vmkto/O7h5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmjWomno;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7F606A320
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 16:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F7F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmjWomno
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9495d543b91so117153285a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 08:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795278517; cv=none;
        d=google.com; s=arc-20260327;
        b=mv81IZGXfbYQ27x/USXKBcduBPwlsALWgT7D4rPq/Dh3h4M6rVmxlkGWOEOZMDpzEk
         xNbSGIF55g2Q2e9aukB7608lxcnj4KPM1IHmxMTxPAXOrcolYP6CB2iBUQX2gUi6QyJV
         4kZJ5E2EKrEgpyvpyJC++ITyOsd+NySSEB8rRVkO1TLQuuURIA1MjB6waXWQNptm2lIg
         cnURHDCzyEJSI6zQhD2bKXBI6kgMdZYDOOoMblOfmQtrtdk5cRGUuYaWPX+vxLV6nUol
         cowlIPI6gJdbDLcFOE/WeUm6J2s0KPx0/Yh3Z5Rt2ZurwiHy8coqkWcFb6L3MrTYKKUc
         WFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+LGVfan7wS4hE7ubgJBRuwS2i7S/HbZrHu5p96veSQw=;
        fh=/G4Lre10QE/MJlIaAkpWbYyaLWiifGDmIYHazhwDM8s=;
        b=GS1VPzXlT3ZgXIDMn+fy3rLWMiAAUMCAqVuosmoAgKc7SMj+Mbm45G3q2ErJ0aIK0a
         unplRLcSYRut2bF4iDh1aUYIUuTFpf2jNhsjxnN3B0dGJ86YmN2h80FBxf2NQ6i9YRai
         h/PyW1DgtWnqjnyZiW4gmvzTxY31czisp32a9BKtWLWrN5WBNsiaUC3Ero7TNXhxfUrO
         x0e8frgfKdHnRkrc082X/IaJJQsVSY87h3UQ2aPSeYyZp+6JmoiXGF+QLKj+Z8kuXJeo
         2hsecfadEaxc0lX9NoYAOavtdylfSG/AK3LZEI6t+pRC2NQlZmu2eQo1cv29l5+S6BHB
         sDiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278517; x=1795883317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+LGVfan7wS4hE7ubgJBRuwS2i7S/HbZrHu5p96veSQw=;
        b=nmjWomnopJQvXpEBaI36mu/uSMfIH74jX2ehkzYzHYIfd+NM3Ct6fYxnwLAL5ZUmQo
         SnFb1KfF9UJ/UVC0gdTFrEVXk+qosN21aPa4k2splECskky8rZaIlNUVIMHhJ/b02STD
         JFz/Q63uI3FV1l2kJntrB1LTr7ult8ZTnJ2HeYDYwU9LjjMxsGxgT4Cj5KPCvJjIynzx
         PNmlBcufl6VYtOGTnvWKbn/IN3lEK52Q16wo3L/x45EvyXWlNs2tkrNWJ8a0Ap1pmsP2
         S79WITJmNmVuqV5YAtfzuP7+zeWgEkfO2ww2GUv5B8yWOYbKA6VqCMW7EvrKFHDV7vSP
         hMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278517; x=1795883317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LGVfan7wS4hE7ubgJBRuwS2i7S/HbZrHu5p96veSQw=;
        b=s0au2ALl9fQBwSQAa05p0S8GMEjdJshl8b6HudeGihPQNoRoATHHu5WpWLR1xDT43U
         uWOs7RdGg2QVdiu07BM+uqFPWqDEznJRS79ajvHmNCMlASZ2ADP2pPSs4NLcwugFLZi7
         DF9eQHJ1HAIC4VcUt4EmkAGmcZ/x0XiC7aHgkFJiEaK7//vV3zQBepQ97AaQKbJhphfs
         0ZGu3PBJpehLHMC9UYlo4d2YFOX38nLm4Jo4UNJ+giES/FO+BwRLhs28mDZYMVKs7BZN
         3+vAowI7TaYvjuYav9e+VAocbWIvlrrKNerxHCnijQBWvQ+1X9kO16exIBrjN/Jb4NFH
         7MZA==
X-Gm-Message-State: APuU4Z8UscuMVqj5rJW45MSnVcUshgsDTtGLz4sn1DGFoM2Vhag49LOZ
	aWCtsfhwyzAIbkJgUVx37+pPg+pm0iCl32O5STGdYN4KJY5G60i1Xb+FGyb5eUhXGeUZc9KMejt
	EgG3cwqFYm7JI3BCpWDc0VZgclUs/Eq0=
X-Gm-Gg: AZFdTZed03qms2QQREF1iQWozNuHKT8PPdZFCvjJTMr5Uu64CrJQiFtfrfjOSuZoJzS
	VY9b2K6VnDpVyJvWrpJKPZ2Iip6McHy3B9DpIQiDRGin/iKcBT3wIg5NHbPlW8IYbgW0woR1ZXx
	iMbw6cJdulVMYqzdWVuibezxyyT4K2rgyqm3CvaHJhcwzkNL/KCrVtfT1rrAngVafz5e4dGyGQg
	xGislLN/u2jusrZY4jGg+n/++lYCUIkAunGyXV83YlO3a4dSJJ2RykV5NB3k1vhUM+W3rXanos2
	WNSDW/SEVVjhFJBgOqh5MIpOD1Dg+2iWn4kJdCQCkMS62miCtezecxbrP1asR1cJNJA6gqGXFqo
	ILpzRMyVWFJBLMca2fLY2ZTVi+Uf8yEDpxICA
X-Received: by 2002:a05:620a:17aa:b0:949:68b4:6dfd with SMTP id
 af79cd13be357-949bab68a6bmr982581485a.70.1795278516567; Sat, 21 Nov 2026
 08:28:36 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119111850.33270-1-mbkchelofficialdev@gmail.com> <DN0ZUECUCER4.QK2US2HOR3I4@kernel.org>
In-Reply-To: <DN0ZUECUCER4.QK2US2HOR3I4@kernel.org>
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Date: Sat, 21 Nov 2026 18:28:25 +0200
X-Gm-Features: Aa3M54qxaLLJMpAz3ziEfzSAwX7WvkoUi-S7MpjoDWzxyu7IuqrwsQMeFE1oYHc
Message-ID: <CA+YDrKAxh8cQPb0=jBEmZbUYfBMu6E=dh+PHLYz+LyMsKXtDSg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: gpu: buddy: store the allocator inside the Mutex
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Auld <matthew.auld@intel.com>, Arun Pravin <arunpravin.paneerselvam@amd.com>, 
	Joel Fernandes <jfern@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

Sure, I'll rename the `lock` field back to `inner` in v3.

Joel, thanks for the review!

Best,
Ivan

=D1=81=D0=B1, 21 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 17:2=
8, Danilo Krummrich <dakr@kernel.org>:
>
> On Thu Nov 19, 2026 at 12:18 PM CET, Ivan Tverdokhleb wrote:
> > @@ -313,16 +313,11 @@ pub struct GpuBuddyParams {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The inner [`Opaque`] contains an initialized buddy allocator.
> > +/// The `lock` field contains an initialized buddy allocator wrapped i=
n `Opaque`.
> >  #[pin_data(PinnedDrop)]
> >  struct GpuBuddyInner {
> >      #[pin]
> > -    inner: Opaque<bindings::gpu_buddy>,
> > -
> > -    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex:=
:new()`
> > -    // accepts `impl PinInit<T>`.
> > -    #[pin]
> > -    lock: Mutex<()>,
> > +    lock: Mutex<Opaque<bindings::gpu_buddy>>,
>
> I think we should keep the name inner.
