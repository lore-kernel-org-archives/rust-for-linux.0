Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343442;
	b=QawYyf+Uv7eHVpq+fYvEo6d+DSDV5D8E/kWJLkKr6m1EJDEaleRyZ1/zU88vtjpnc8Je
	 x5iIi4oHk6rPkq+bPjt3QH7bNjWO2+Huzg1FZZO1G2g6wtmCAUqNu5r1PNaQOBCDw4GPN
	 HIzGI9RJURXbVTJC9M7U8Ekj7L1tkwh082rIEnyUu6nagiNl8HKkCL8iZszYj1ti/LTKT
	 V48JO8x/qEBQf9dkDrePVrdqy10qrK8UI6m0kGGVsXX2oYoBKcD1d6HhrctzrtTG+JqmZ
	 mD7aT6QkgTCda1MB1MoVQbGb/y219yVqL8oN3s4eNGULsO1IdnVc+cG7pSGgKbeaT+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
	b=RfIT8O6LQAL+O0TCKS9G0bAvCeG08nZNStBAfiDtClV1qt3D71ZTFaZrxkUGAcdSjlne
	 ju2ZkC6zFog6YLVSseRJVYKl+ygj/NftFPHWhuj/ZJTjevefmTdzz8Nn95uTj7gdUVLrd
	 58G8zP3vq4AImV8cd/ahBib6kR7KPoIl3AQ8Ei1yAOligYQnuXvhZSSfRNSv0hs5Rscz+
	 VbUVQAYDPsHxy3XRvrfs6+YpwlzAxRZLf8s/qeFOfVd4hf5h/wGY/iTFgTxxpPxV8abTK
	 eA2C1wWXrvjIqnKfE/IxnLg41qiKpCrGl1Cl9VTKQu5k67KzaeLXm+24HF3jM3l/ONQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ef6hQC/u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDCD606A326
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 20:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDCD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ef6hQC/u
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso26233785e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 12:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343440; cv=none;
        d=google.com; s=arc-20260327;
        b=US0ukPiNOLnfcmtVUL3VPsKxAhfPSnVhcsms7Wb35+joUg6xGhvTuUcNb6q2iVihvC
         laYor6Jc+du2aIUDKEHY0Am/9tHgmyQbHUxGT9kvisAc04kOOjae6OG1TcWuNup0xdFM
         OEHGEFBeS++h/lYZqkN9JFbl7gZHTd4QZmlZGmGLRuPT2lXMzWTtU9YFPWd6UaVvKwhx
         qvU/2JZ3jaztEovAefdAuu1Ne/gRLe3Ukf75XYgmS1MaSCnXu4oQ+ucbQwhhNUp5h3NN
         6ynD1uLMPiyigJFSjf7MJ8+N6MJ0ivsFcIHD1jeI0DtGPeCTYfkJBTTi1XA/cnB4/3TU
         n18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        fh=wEM1SAm97UDsFFAZS+3VXXZKAcryl4nOfC3++LPpun8=;
        b=TqcR5NqOsm4Kyy60XiVgHfr2Vb3Ihej+R7oeUUy65dd3J4J697SJMPaWOEWkWA+CJb
         d0z8QwltyAh9cKFgxBdEJWzR4dP35Kv9C+TtLxBQdQaEb00MDwGa9opA9djG0B2WsCR6
         E+KXYhLcJ84tPBpze7J8Ss6XjyiNPo5K4UJ9Y0mKtQWCFQjnNzVFC8Mw8jA24OSagXtm
         uHoB6JaejDYarMIBZHzNvYCkJ0wNluSdQr3QqMJ0u2VvhL8lBwzeEgzctIDM8y/OtOQl
         fOKJpsVwNW+qczWGvSclJA7eGz7xcyGzEBTZRwVNSoWdUm2h18Dv6AHd2Pwj9UyWirQw
         8Jpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794343440; x=1794948240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        b=ef6hQC/uSVy9ydem1JLqPW7Vd3y0dUQg/gsHXvcfGN4D8Y3eL1yncC0OmJSA/nfdKu
         FUtmqhY9UtVIq+ypvvHig7m0gg76e3P1c/CX3LREmGszKXLR+9QXsHiQ+dZ11CmSzNzS
         GmJU45hQltt5B81++O8M/FJB4IPRcnyTP9SuDS4PYNgOK90SJ/KMrjoRGWiQCkv7V7MI
         dt28GR52dia5nENFtuxs4vI90/aO6kDeGQoTGy6Kmb8qYBel5UteHEZexa/qWKY40huR
         OfZmOhZ6mmg8K3LKPcUZut5Ipc39QHcskeP//JuyaQzP/aAYKbjemoh2fa5d4C2r7gtn
         qgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343440; x=1794948240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        b=BUc7AAvCm8x6CPpuon+z7JZSAVgXY53jW2OYa12F0AqghCtADLOBp3hivlUivblG66
         mElUt45QYFPxJS3GcyLgoDTuOqFMLzhdBlTGi1UVAlZOQiqnvXJVLNa89DA17xIyhty9
         AD9DvZz0AcbHti3mfByR5R8kxgb4AVrkj8cc9mCi7RI5TOPXi1Ohn5zlrJXxDxnB6xOc
         UP5ebZavMNkz4lg/jNFI560OEWH3d2yxTCSX14GHyJWKjNdiJrQFWdQku+z1zfGi8HHC
         4CcOn2fLASfO1DQLPg4xJh3oJAQjrgJPX/s9gjX4VG2gGfDcrRuNis9YcQfiimBz1HNo
         b9QQ==
X-Forwarded-Encrypted: i=1; AL+hErGdVdx2XKHae9H+I/KB9jZb19JG+2wjA1Yx9xO9jxrOjzmowoVG/pb0G+gHSOPlFGKkHiI3kojZUuTcmK2Gew==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bs4oT44DEeTzPrUfqUWA1HN5sd+remdUDB3rMUMUqq1wmj/yd
	vW1wd2BYWKzP/4Ghmnvx14qSrOa4ddqzK8sJ+FLXogBg3ITM1klfQNTHZ0OuU1zIB33ANjJJBvg
	Qt4wR8rQavUChkZScpg2nbiMcNAtB9084itBqqP4T
X-Gm-Gg: AYBFou0olKdW4kP4ecyJ7n2PAEOzfgV51s++j2CVw/B0Vv/V108vNgRfaOrRAim6AMO
	d/YgYwnKxyrtuVBFMHrHPy0QLClUVyB7kcj4ee3+HKzRHHJULN9X08qTn8w32z8Fq3tZx4TtAw5
	jQ7KjfCLeuK92pxEBhY2Ic2gidfhdHWF2TeOXc6tpQZ9IYb93eDPth55lndBhxzl9fQbSUwoVMY
	nUAYE7ywjO+tBykQ41m9Vy4c9lZ8W3UAeuzXpKvo3T+Oa79JqPp8MXLD9ejnk7KH8GXP0TUU51z
	4HDw3v/6TIMeul7Szts/mHKMv6YCwa6bxqEFTMpNtjk4bX24H22fnNIWHV7BrmXxSwr3uecbeAf
	KT87y/lEYK6ctMsMR4j8n3SRLDPaE/qSdK9URTZH7PMRAwzSxqst2MGDASBqFTUjnciyPoSx3K7
	W3ru7ZXVji9wMU70c=
X-Received: by 2002:a05:600c:354a:b0:4a1:7e77:c382 with SMTP id
 5b1f17b1804b1-4ba0935dbe6mr4583165e9.5.1794343439620; Tue, 10 Nov 2026
 12:43:59 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
 <au7eV0D_44ipe3mw@google.com> <DMP0HGBVA3Q9.T8UP93DA34UK@kernel.org>
In-Reply-To: <DMP0HGBVA3Q9.T8UP93DA34UK@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Nov 2026 21:43:47 +0100
X-Gm-Features: AclHuK_M_RBnCdkeBBogWw-mSzZ7FX9o88E5X3OuiqD9l_BOcZbdHx_bNnfG79w
Message-ID: <CAH5fLggzEvheweiHte5KTaQi4G_5GtV02krR0OpXB+buDUORBg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File lifetime-parameterized
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, 
	alvin.sun@linux.dev, deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat Nov 7, 2026 at 9:16 AM CET, Alice Ryhl wrote:
> > On Sat, Nov 07, 2026 at 03:03:25AM +0100, Danilo Krummrich wrote:
> >> +        // Run driver destructors without `filelist_mutex`. Take each=
 link before dropping its
> >> +        // allocation to avoid recursively dropping the entire chain.
> >> +        while let Some(mut data) =3D files {
> >> +            files =3D data.as_mut().project().next.take();
> >> +            drop(data);
> >> +            drm.open_count.fetch_sub(1, Release);
> >> +        }
> >
> > Instead of transferring all the files to another linked list, how about
> > taking them off the file list one-by-one? If you release the mutex in
> > between dropping each file, then we still avoid deadlocks if the file
> > private data destructor takes the lock.
>
> I did consider this, and technically it would (currently) work with
> list_del_init(), but I did not like it because it would be a very subtle =
change
> in semantics from the perspective of the C code. (I.e. for C drivers the =
list
> entry would remain intact after this callback, whereas for Rust drivers i=
t would
> be removed.)
>
> Actually, I did hesitate to move drop() out of the filelist_mutex protect=
ed path
> at all because I don't think there's a way this could actually ever produ=
ce a
> lock inversion, but the "move to a separate list" approach was pretty sim=
ple and
> very few code so I thought it's worth ruling it out anyway.
>
> (In any case, I'll soon start working on the C code to implement a common
> lifecycle scheme.  Once we have that, the Rust code becomes even more str=
aight
> foward.)

As per discussion on chat, my suggestion doesn't quite work. The point
of moving to a separate list is that we don't want to modify the
existing file list.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
