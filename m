Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBC616F910
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503255; cv=none; b=eKTDx9akuU7kBbUPGriMab5xrtC0DyDYZFzLpur3NQnfzdzda8hGne/GER8SZFK5UgmuvqXZMOf7S46+qSOVIZmX7djQEdTFNURYzofA5bHCU60nvLJzXJ/UMIo/D7swiWDYxqEe5XkP+1uPYbJeV6apcTc+j4UUQLIcbN7G42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503255; c=relaxed/simple;
	bh=PbzCpt9LVzUIp3dPDBp7/+rl+oeX8NSlECmbYAM+Qhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMPmVG3cRRYVtr96iaDa3kp2AMLLe4Izt9xAVVQN2/RYUf5EomeMA7+nlDmryPzHOlWABMIR3R5UOsy0sc8sJ9AvjYQD0X9X5FawY0vvO93N59O8OhlmdiaXUjKNM0Y7K48+cTkW3g8VPqGFgIqIKVHmM5PXodJZibTQqUVtl8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWBefl6u; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWBefl6u"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-367963ea053so4258420f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722503252; x=1723108052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cITLfcdMgmNjjc18PVtnS6F53c3+dbjdEEoiQ1eEiJg=;
        b=JWBefl6uBqLwUyJBQGidImSUgSEOhZyVyT49iU+kMF9lvBcVoaZhbWf1KGpzkr7Rhe
         JvSu8dd7u7k4o2Oqtj8wd9X8iUgBvDuhoPTCxHsYBIowceEFWSNaYqYshNs/AppB67JE
         3WRtOzFRU8tri3IaFSoFlT5YtCVOVtWUmuO/LrWPRgJ0u9M0S2GHVgeQDbDq9Lg1E+X1
         dX+S6ld3Of0YtWVTeORJ+hacBB10+16ZQOZ8Fkx5FQCWej6RiQ48ejrtcQHoyn3hCfMj
         MtxrY/fbWCYncFvnotFfjr7co+bJMdkyDIHB9GYL1LFZY9bZ8A2TzvWFzt+jVWhRQwFa
         cHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503252; x=1723108052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cITLfcdMgmNjjc18PVtnS6F53c3+dbjdEEoiQ1eEiJg=;
        b=Xsk5C4KH1YJ1t7UbM8MAFtBZ0LSisi7CO1yNrqoPiFL5q9gbrPL4atwJGDTSIYcCTE
         +tlGpWjZv92GkY0d6X6qeGAAPM43wzHZNfyFJ5YJ5qCIUlfRqWYI3CkANPFG3fR9tRfn
         XbRGt36Hzk+nNNQCiYdDkrKccp2Mxm7AlVsaJg2hHSPr7HinuASLhhtkP318UnfyqH32
         QEUSyCr/ER7JIpvKBQFrxDyZo9p4H3wrIk9eF67qUYa/godbdkE3pTjLpJoeYaUyEj4V
         B4uTBx3dqud7VdDbbDB3UsL8ICj8QPe1brs+iXqlPVXfMG2CxoyEA4v2g5QnkEjO2cIg
         J6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUYhc4MKXx2gfCnn3gIKpUtXhs5+/0IPi7aQyyvKj/mQKzotDZIfJyZOZUxMgjK6E656648qGssK7nGL8ioimuo+1+oSpJJBVB6CadJ7io=
X-Gm-Message-State: AOJu0Yzqc0TCAGIpsr1cO/a7t1B6U5YIm1mb9wheTzwvphKc1oiGUXit
	wWQG5OR5bmTm849xp6KM+mhwuDd/NXXOvb9cVRPJUqPYDW8P2GzzoKdk05mG/+I8H3A9ixpHUh4
	dlFuDm/HdE7J/W5YPtn6xsOg5VnoJWIfHbKHy
X-Google-Smtp-Source: AGHT+IFg0425wG8tg10zQOge2v6HXsK5b2h/IkKi5JoSLLLUh0Z+xRclV2mJj2hnWLYleP7WVQpzPa0zG2iQlcNPif8=
X-Received: by 2002:adf:eb10:0:b0:362:4f55:6c43 with SMTP id
 ffacd0b85a97d-36baa9f713bmr1730350f8f.0.1722503251987; Thu, 01 Aug 2024
 02:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731042136.201327-3-fujita.tomonori@gmail.com>
 <5525a61c-01b7-4032-97ee-4997b19979ad@lunn.ch> <CAH5fLggyhvEhQL_VWdd38QyFuegPY5mXY_J-jZrh9w8=WPb2Vg@mail.gmail.com>
 <20240801.091708.676650759968461334.fujita.tomonori@gmail.com>
In-Reply-To: <20240801.091708.676650759968461334.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:07:18 +0200
Message-ID: <CAH5fLgj05_rZ=MnRhqUMnthLKioiXJ9xvMAtHyc3-MzNcfbkBg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/6] rust: net::phy support probe callback
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:17=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Thanks for the review!
>
> On Wed, 31 Jul 2024 14:32:18 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >> > +    /// # Safety
> >> > +    ///
> >> > +    /// `phydev` must be passed by the corresponding callback in `p=
hy_driver`.
> >> > +    unsafe extern "C" fn probe_callback(phydev: *mut bindings::phy_=
device) -> core::ffi::c_int {
> >> > +        from_result(|| {
> >> > +            // SAFETY: This callback is called only in contexts
> >> > +            // where we can exclusively access to `phy_device`, so =
the accessors on
> >> > +            // `Device` are okay to call.
> >>
> >> This one is slightly different to other callbacks. probe is called
> >> without the mutex. Instead, probe is called before the device is
> >> published. So the comment is correct, but given how important Rust
> >> people take these SAFETY comments, maybe it should indicate it is
> >> different to others?
> >
> > Interesting. Given that we don't hold the mutex, does that mean that
> > some of the methods on Device are not safe to call in this context? Or
> > is there something else that makes it okay to call them despite not
> > holding the mutex?
>
> Before the callback, the device object was initialized properly by
> PHYLIB and no concurrent access so all the methods can be called
> safely (no kernel panic), I think.
>
> If the safety comment needs to updated, how about the following?
>
> SAFETY: This callback is called only in contexts where we can
> exclusively access to `phy_device` because it's not published yet, so
> the accessors on `Device` are okay to call.

Yes, that sounds good to me. With the updated safety comment, feel
free to include my Reviewed-by in your next version.

Alice
