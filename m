Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C98F5A0E0
	for <rust-for-linux@vger.kernel.org>; Wed, 15 May 2024 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715766435; cv=none; b=BgrqHsYm2stmc0iJFUxfLNzd3asiD/YRGPolp7gm/OHxqyn7KqaP7gpd/5KSuqkiQeODB1qYOEacwgnGR5/G72IoMOG2GbOMDGGrGtviFwGM+FLiXtYLZiVd2ppbe0o8rclCD4m2PeILw7EjZ52DzAuKvXSCFzfd/AEBPhFcfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715766435; c=relaxed/simple;
	bh=3/tM/ZF6be42GO69o3PShY/4v9/iUGx+l+jSEb5jbSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aft6z94B8nXqO/KzVBex2KzMoAZ/j8sz0+UCD5AXQVZyaUAdFBa0SO+Iy3MUZAOIa57r+G6KiL2WF0KzZWL9NWOXDoFzCbg1YDiFM7whwdawoSWnYpkMeFqmkz9Zlvgd/xVMeQvFWt2DjbF6MJ2FmCt1dvMs0ApSrP1Q/pP125c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TL0N8/NN; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TL0N8/NN"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-47eff9b3c23so2118818137.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 May 2024 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715766433; x=1716371233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/tM/ZF6be42GO69o3PShY/4v9/iUGx+l+jSEb5jbSo=;
        b=TL0N8/NNqPfnb15ADeGRfQNDPz0y4AMq5Lunjv2fVniS0Jj/VZvfSDIa9zdqTaRa8B
         if8GmgTl6+qrC9MlYX0BpAgbsC5m1IL6+xduxYsUkvbcyHV8QTeetC2Kls6BNntXdeog
         zyQCRi0qss9xGMVn0jPdC0UAi6+ohTk4idE/a6KRghCKWCdhknvhCZP4vqTT9iVN/Ogd
         CKmJ4njM23rXfPp0VFDh8v1rAo/73uCPCuWqVTNdJn4mc5DVeyqXLsFrsoCPhul9nzbC
         yr1u38uvdarB496LsxERuLJx0mSTLULAfRD19tGvdl6+Vt2JYRcAPxk8bVDhooPx3kpa
         yUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766433; x=1716371233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/tM/ZF6be42GO69o3PShY/4v9/iUGx+l+jSEb5jbSo=;
        b=BP7IQera50uA79yqL/npZTn99be/LsoABMpy3tixCPYQlUpzg+82bgi/SdW0wyV7Px
         U//sYvuAz1pi7iyEyBxKhak4AVY+iK1st+48QS8oUcttAgRg39QZ8uOX0uwkaO8su8u6
         0K+gGoImTEjGxHERAd2tit/Oce1ZxadXtfejIurJaLhhwqH1P8gVRjFeUgrrjGUhhKX6
         j0hvFBlWyq3wf5yr4PgPJO9FLZkSL8OUAskcRAWh5pAIMrN0jNZqNpANEbPc3+fNxDgi
         F85gc8drfAvkTWdISj6y2m2k7kEF90wy1QLkavX+lPx6HeTivCb4rSoFhT2aNodToqcp
         5Jrw==
X-Forwarded-Encrypted: i=1; AJvYcCX+b/UUtW66wm/arv87N0BxQBWDgNQYhAX58QaaEtNiDqAWE49BIHk3cUcYI2FRkj35S5Ysba9qMlY2xQWfOyccYBjNpv7y3rWMmiqGxLc=
X-Gm-Message-State: AOJu0YzmoWTQTb/f2dmpBqdMZaKm2Kqu+XFBBfNJ541d9cxsZKBpJHuo
	1+fJuQpXxnKMq/ql4asGEF5yWov8SBOCcvXxR76JjqkZ7nYquZBxHPgLZnSHhJMMZTcKG84Pxx8
	sy3ArcY0VpKbAR0p1jnaZjZLHfkCkRK6MXO5p12k29Ng1vJDdsA==
X-Google-Smtp-Source: AGHT+IE2Fab+kONhounuKNSFJaecaR5izar5a60/lJv1XkiipyShJzYgwdCrIBvqcX5cYD8l2jRN2y0zFCpOg4cphYs=
X-Received: by 2002:a05:6102:3051:b0:47e:fe45:eb32 with SMTP id
 ada2fe7eead31-48077e79174mr14390185137.25.1715766432963; Wed, 15 May 2024
 02:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425213419.3904105-1-benno.lossin@proton.me>
 <20240425213419.3904105-2-benno.lossin@proton.me> <CAH5fLggj_MT=njdieD9BX_gV+4A02m0+zMyzPTJ9DR6hSkQhEg@mail.gmail.com>
 <1fa87967-079f-4ff8-9946-81a571eb09bf@proton.me>
In-Reply-To: <1fa87967-079f-4ff8-9946-81a571eb09bf@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 May 2024 11:47:02 +0200
Message-ID: <CAH5fLgjXmc_+1Zx_VyMMStTFixPnGJcJkKheOunZ-1ScHYBUiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: init: add re-initialization functions
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 5:45=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 03.05.24 13:34, Alice Ryhl wrote:
> > On Thu, Apr 25, 2024 at 11:34=E2=80=AFPM Benno Lossin <benno.lossin@pro=
ton.me> wrote:
> >>
> >> Sometimes it is necessary to split allocation and initialization into
> >> two steps. One such situation is when reusing existing allocations
> >> obtained via `Box::drop_contents`. See [1] for an example.
> >> In order to support this use case add `re_[pin_]init` functions to the
> >> pin-init API. These functions operate on already allocated smart
> >> pointers that contain `MaybeUninit<T>`.
> >>
> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> >> Link: https://lore.kernel.org/rust-for-linux/f026532f-8594-4f18-9aa5-5=
7ad3f5bc592@proton.me/ [1]
> >
> > I'm not a big fan of the name. Perhaps we can use a name similar to
> > `Box::write`?
>
> Sure, what would be your suggestion? I can only think of `write_pinned`,
> but no idea what to do for `impl Init<T>`...

write_init and write_pin_init?
