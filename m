Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675A2EBBB7
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775200; cv=pass; b=htI2+m7TYS6wYDsmmH9M/oT+T2p86ZxuIvnlzm9AULcL5FjUXZJIwMXeIqhmfWEhRS8vSE+tMJ8De8gk+bipCDOOGKBUtc2W3ccjHoSffne6Dd6JELpBIrYwt7NANSOStcZcO+HOS9uyuYh6uU4SoHWS9tje3ktZqNwa1uKZ9Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775200; c=relaxed/simple;
	bh=qCUNfST9Dad+2YGLA9lH4WWrKVDkFyhY7Q7mW1BjVBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHN4eS42i6CaWoFW3HSZaRFOCRgU2uqCndhGGt4OdA9QWOYfP4LIfVAIQAUIdC2VQAEzHn/v782Agtmva0wK8Q9z322Ma9Ii36Hm2Vud3MIbIx0dCXCWSIZBaNKKx045NCl09JyfKl1yh4lIfXEfPa/HnzVVL8x5vmlWx6nFwuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ef5aU1O5; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ef5aU1O5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so2464294a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 02:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774775198; cv=none;
        d=google.com; s=arc-20240605;
        b=jVtGiiLXo7d4p0i/b5JnVVAtvxw8ZLQZ5R77zMrC6Ppl2R9VrFEEIS6JYxoOf9BlRQ
         e2ZqvYwA2J5KIs6aX63i/2OjmSCVQIfP1SHaNeeSqOg+4+Z0+8sXhY4Si9J879qmcYb5
         tY8DaTRQFoltrFRlAZ1X0aOc05G1+NCVa6I/yNOP4f+BwAN4M9EJWhizvIzHI1J3Vlxo
         +o6zgarAplSTRhkRYnaGU0FF2CF1J4lFATyPVTLdbEoBCzTZUOPxvNEPhNvI7c2H+Ag5
         fxSXfVUhoewxbnfUZqvcngiXdLlhGJz1jM/V7t5a7SQNk70SoouHkFFpxO3nSolMga3I
         SVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJ2SarqavnaN7Yrd8WTWghsbWeVyfV34q+2YzkvL0lM=;
        fh=nh+fY6Z4xOKA6paudfv3MvuSB8LEev8u1i9g+c//lwI=;
        b=aevBUqnox5O0/SkgceH898vAWEiv5kKZk6VkeM14KerxnZbsVvlJlKwG7ar5O2kI/B
         EDfPBSPoK1+ECc1IBZrcP1JYee38OLgzXnU6BJDgaP3lD0tS3TZOLf4mBvjh8JAepGci
         0VjAc8CzQpdtRYyS5Gz1A0845E4FtEIjTCgcLqiBdpkZNYbu+EYcyynL7L3fflncOPD6
         TEL+UBANrtRXEB9XqRbO6f66zT7rmwjvnVnvefK4YMzSyvsQ5kP2pHtGOfMl0TwlbJkN
         rVupBafbCuUkTJZDrOuCBTGnCbzxoGOscLB7ZJrEzsT8zPV6uMX/I2xdPls4zIkSwf+A
         cz8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774775198; x=1775379998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ2SarqavnaN7Yrd8WTWghsbWeVyfV34q+2YzkvL0lM=;
        b=ef5aU1O5/yvWeHMkyu1X+H6u8jJgZIJqaIFPEQV3BhPVyUtD9DrifHMrQjhCLv2gk9
         rwtXQURhYy76AXNCCazjx4f1UwHaMMBFj2UKNwaX1kqfmZHqR7neyKq/x3GtKGbPm4MK
         ffnYmd5rw5gtDpGMvYauBXCOC3xiFWvWiQiLOXLfgKab2QmSD4KyVEqED+zuwSz3LtJs
         i7Dc5C7/gpKhUMe/Z/dL1wL2aVCUujEib0rffaKGL9TXSIaCAQGHf8eoXBXwLxZlAcM9
         8Iu8AveQOByjDDEAnKT1km3mUD4RKR1z9MTtbbbW+9mi3grnnW0OztlW0cUpZDd4nIcL
         a50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774775198; x=1775379998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJ2SarqavnaN7Yrd8WTWghsbWeVyfV34q+2YzkvL0lM=;
        b=m5Qu4rsCZgYh9uO6XWSYu/0+0wRrzhBcU12iiBuAQrQ5oF54ib8CfbswZ9a5rRcaiS
         kLlTVBsSzAbIebI/nWZEApGTeUB0EEGmnEwf9dpxK+oSwFmtkz87wj9TDho7xGkhf8nF
         NoeTy1+bNjcSip/87qhpFr3Q68Rd1/BVf73z9MH/+lCjVc2Qa+cCd5c+FBHc+pPwdGU5
         /qlrrrD0BmAVYeVLo3BJJEIAH3olfh3cjtVj+EQlY0nKTuZHc0LSP0zhQg/olZ4MGp4H
         TjOdGoUEvDIn1RHZquft7MqzcIxqlbigAYSGHNuGEI4fOeuF3wxGSTKXU3uMzjq1HsNT
         5peg==
X-Forwarded-Encrypted: i=1; AJvYcCUeXfX95q8XUTV7blQOmSrzKbAxpuAaXPrm+MUgn9ETkIk61CknqZ+nqjxV0951OiAMeCMlP65w46PnzraWfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJ+QX5Q9k5Gs5nhhvTIq5s9KAxT21cUsALRHFjDLRvicibril
	vo3E/Eq3AkjLHORtopa5EKi81/A9GzxgP6tTp12KWS6763Wo+ve4IbbnEk45Y1y6DVhD660IBcl
	Iv7SdiMKGTkJXcl/Xv9rJ7xZh/NyHwNoNd4M=
X-Gm-Gg: ATEYQzwxz4u2A72FHQevOx0onN7NvYRY5mpE7ONgBZEPiL1uNMkgYr+CsbYQ6NMuksB
	uuxT0UUbZyhgtaGxooOk9p9tCbLzJLjO+32giwK1pQ3fbAA5IL40xJpVAEAO9k/908N1jPoMmGH
	wBvwz9tftXTSHvpy7Zcep15mwnSlS90rPQ46TfpxyxdTAGOVCs3jF964Tyyb1Pg29ZNAKY8y5Gf
	iIdp2PxWWpVSJ20H+gd0veuQTbXbnRL7AkREyrObUpnWqWWMEdbhCxzQ541BTAVDTLnPBGKb/Mi
	ObWjL2ecB+62uY4L2g==
X-Received: by 2002:a05:6402:a0cb:b0:66a:819b:e8dc with SMTP id
 4fb4d7f45d1cf-66b28465b36mr3853180a12.3.1774775197683; Sun, 29 Mar 2026
 02:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328114005.125617-1-adzicmirko97@gmail.com> <CANiq72maj2TqANaAxr_k_TuSFWdGSbZkyQzT_u=TjGEkKncmKQ@mail.gmail.com>
In-Reply-To: <CANiq72maj2TqANaAxr_k_TuSFWdGSbZkyQzT_u=TjGEkKncmKQ@mail.gmail.com>
From: =?UTF-8?B?TWlya28gQWTFvmnEhw==?= <adzicmirko97@gmail.com>
Date: Sun, 29 Mar 2026 11:06:26 +0200
X-Gm-Features: AQROBzBG7SK221iqDjMaajD59b4at63MOQY0m1y8dPRIj1FC4YKQzUUWgcOscU4
Message-ID: <CAGP17W888CLYwQYStjyyt5utON53d-fcoRfFb80FA+duL_Lr=g@mail.gmail.com>
Subject: Re: [PATCH] rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	daniel.almeida@collabora.com, khali@linux-fr.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, tamird@kernel.org, alistair.francis@wdc.com, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thank you for the review.

On Sat, Mar 28, 2026 at 7:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> > +/// fn einval_err_ptr() {
> > +///     // SAFETY: ...
> > +///     let result =3D from_err_ptr(unsafe { bindings::einval_err_ptr(=
) });
> > +///     assert_eq!(result, Err(EINVAL));
> > +/// }
>
> Like you yourself mentioned in the GitHub issue, code inside functions
> is not called, so please move it out -- you can keep the "blocks"
> separated with a newline so that it is easier to see the different
> cases.

Will do, thanks.

> > +///     assert_eq!(result, Ok(0x1234 as *mut kernel::ffi::c_void));
>
> Since you are asserting the value, but the bindings are hidden, it may
> be best to just assert it is not null.

Makes total sense, will be addressed in v2.

Best,
Mirko
