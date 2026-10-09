Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB35E376BF7
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791580782; cv=pass; b=rx85TT22vI2kZCmobhaQfNTvKmQitlEcRHpwL8cLkBxjGzCvViDniYg8SrJt42lFH/Llgc7ebleuOkAo8/y7nzFKYDAop05NRXfirhbtwfp1A1VSq/yDRtiI9bNAfWf3e17eR0uSiIDV7dyQ7kLTEsuPZvx9HsVMDbxbDL0VpGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791580782; c=relaxed/simple;
	bh=beyydiA9V88XWm0xVuVrpZQGXJ4d8ezyZQ/QUxMU7N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lbPPPtHYpmOFJw1CmeqizMaAkspNIk7IKaPiA1tsvvNny9lNDke+ZpHk5H2FyWDfODP/Kj9S0A0zyHslmCyS/vluXRm8P/NPNA39rmOW30JfKDzZ394D4UMXUpvi489ftmr/l9GCsBDlOjap7fN+bbgvJgR++9y6D2fbPX6/Zb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=fT4kd2+j; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="fT4kd2+j"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9178aabd30dso2717776d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Oct 2026 14:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791580780; cv=none;
        d=google.com; s=arc-20260327;
        b=nrLB+gpttytVe9FG/JRi506/uQtbwLm7Ao+u71l7sZRunDTiN6IzXcfDnhCDENtq4K
         U+DMOObAV0IEzBkqtMorH2+bV9zgDOnrslqdcqBELBkUDDVxNSItX+zVxFklqHwcr+ez
         E36KXzTW9bzWrc3SPwMSVYpYfisri5EnodUbXEBhoALGNFUhfT8oij64YxJCQT9zV7K/
         FUOCSIuDjVddInbF/0V9E53ccVDEe5wTC40ZsHc5APZZsDIG9n5kxpeaGjNklCz0XtYi
         87LaCEab2X/ekwo+wB7W2IjE4m6clXtVIX3vWUXQni1YZ4NVVQrJ1kmWelK7I39v5sGs
         oJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4CfjP2uOPQ7qfH2mC8CU7K2xv1mAcCpyBfjSDs8T7g=;
        fh=ORMnvbT8+1yxRkRoC+Tkhd9x/aaVx8NxBidEAMW1FAc=;
        b=Nfy3qlvmq5QxPAR4Luv3qy7aJhGR+I09GKiiT1vZ5nip4gxF0CNlXGoutwo54DDCXy
         sJTxaJQnPT4NdgsoZ6pJH5gWPry18Kri51ciLdLkv3WG1sC19F1/QTU7qY+fNy70EAY3
         yxKYC6qtxaLjtDpnJrtpTAVLfcmIZ3Q2m7iZzvvLJ5AvUpZePb7eDnbq6r3CNeLBIow5
         xiodC6Me//aVD6yTxfbfgGHAoLj0UyewBCBz2N2HRx/Q+VHx91GzO33sK3gHIO2teY/M
         uKLOSfVOssQb8Dg7mF7gSE+xLIeYcvWjQRd4824uE9kQXqygdDP/YfrW1WjIMsr1aN6t
         pUbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1791580780; x=1792185580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4CfjP2uOPQ7qfH2mC8CU7K2xv1mAcCpyBfjSDs8T7g=;
        b=fT4kd2+jTl1fbKPhcccPREnoWVOewqMjYAM/Wj/qzTfHHOtrFw/dVC/gwV3GzcY0q5
         fYKUbaC55AB9ZK5qHr4/e1ZUMiFPRRnrFe4EghfC5iBzj58zp+RflNmZuQ1meOTu8icQ
         F4JceaQ7B/61eFTrvIJha/G/Nn0Lxlq6PZyIv6QuS8e7Dy52dW14xE1VF3ejY7nHLy0W
         r48ppOpeReNbBghqvsAASCQrq73s7lKoEIslomOwJ/aMVRjMmwZXbHvso8dkdGZxx6hh
         +jRVntpGkScRMuTfB0yh20ugWYKIaE4XhB4Hrsxx8w2Y32BG3WJbtsp/PGLjKI/hDKi2
         3UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791580780; x=1792185580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4CfjP2uOPQ7qfH2mC8CU7K2xv1mAcCpyBfjSDs8T7g=;
        b=Dk7WalrIw54g/CMjAsyF5RGsr9c2SlJs5BsQQcdfJndNRKR8cmW3WeEMQ/mES4tSGi
         twiwXU4kcws2ZJjctqtIVBo3yqz5ulWNtQ82/hS+Xw2gfwIbVxjW8NcRvy3G/ijSZvzp
         iU2wLu4ahswx5vu3JnXFBw9KoDVbfbQCnXKzCzxx07X/R+mBbQByUeD2eCuyB3ts2hon
         mm1un76077chjF0/hnsXmd/E++6mKZf6e3z08NhTx3xlAvteGpJQq+H83PXplPfV9r5I
         3FFvwDXIhNjVAzVlft7t30tpesTRom3PwpMagNOusck7yCLp+gKmYuz1pQagOmQH6Oyi
         ydvg==
X-Gm-Message-State: AFq9FYJ/tvDF8IaeEe5SOvxoFat3JKi0P0XeFZS3tDcfH6FyTajXl5oG
	3HJWTBmqtFQ4GFX9ZcaChZiXP+ooPsIOMHw2lBtRrzMa/GTHBj/dIFDE9JQYN4vHIkSVJL1utzp
	pKRAt+0LqQ8eB7PArM8uNFqCW2CR5V/KCtxNyt3s5hzcdsnSmkPtayPDHcMJ1
X-Gm-Gg: AYBFou26dSz+qRJpv3vQQJ/8Q1QxHdeJR43442l3xGjaWOQEhO0/1uwOgcb2lEt8MOQ
	FoNrlD3KeFV4L6VCJ1VpmuAecta6yFfWmPQIVoCbZksW99GJ31jVhhbP0dIgUGTX/le7bKy3wKu
	p43P8O+t9vXxzCAE6L3I39ucXSzRXt66ePwImUsep1XHn0KExhiOHSrMeZ1ijb8L8ly5iiiEJfr
	B9HASgBfYy2RN2YU8Cis2vhkYx7meRSHazvvK/WB6Hc8c7cgw8eCheFnlWajcY8OtLTjcvkArU1
	hu3nWeTxpHL7WGTPT8x6Cd7F3SU8zqs6caKmxuMXGcwnBTTpmrIbLMhR5Id3OyoEeNh3yJv/Jxz
	x9F7wZgtRY0PW
X-Received: by 2002:ad4:5c69:0:b0:917:9905:cd03 with SMTP id
 6a1803df08f44-91b554f036fmr55805806d6.20.1791580778769; Fri, 09 Oct 2026
 14:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cUqSvTsTaMYu_TRrAABCYTNz0HZf5JeFdIq_Vv4e_-GFMgI5NwVfZJDcy8CTgc4fH_1OoiiMg2I2LIzQX1y3Rg==@protonmail.internalid>
 <cover.1790981219.git.pgovind2@uci.edu> <87v77bcg0m.fsf@kernel.org>
 <87se2fca48.fsf@kernel.org> <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net>
In-Reply-To: <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Fri, 9 Oct 2026 14:19:28 -0700
X-Gm-Features: AclHuK_BIAhpNhpN4CGjFxJnYlKgYUD32BpsrZ7GY-qW6Wu2aue8RC2-4TqWD3I
Message-ID: <CAPPBnEbmZUnKq8iPjTXzREiVv-kVy0qq1L+114npAyh9Dnw+Pg@mail.gmail.com>
Subject: Re: [PATCH 0/1] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending in plain text. Sorry for the duplicate.

Hi Gary,

`Attribute::show` creates an `&mut [u8; PAGE_SIZE]` over a page that
may be only partially initialized. Rust's array documentation requires
all elements of an array to be initialized [1]. So this doesn't meet
the documented requirements. Moreover, `AttributeOperations::show` is
a safe trait method and could be implemented to read any bytes from
that array without using `unsafe`. Reading an uninitialized byte would
be undefined behavior.

[1] https://doc.rust-lang.org/reference/types/array.html


On Fri, Oct 9, 2026 at 5:54=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri Oct 9, 2026 at 1:49 PM BST, Andreas Hindborg wrote:
> > Andreas Hindborg <a.hindborg@kernel.org> writes:
> >
> > Actually there may be a problem, but I think it may be in C configfs. I=
f
> > you take a look at the function that reads data from the iov_iter:
> >
> >   static int fill_write_buffer(struct configfs_buffer *buffer,
> >             struct iov_iter *from)
> >   {
> >     int copied;
> >
> >     if (!buffer->page)
> >       buffer->page =3D kmalloc(PAGE_SIZE, GFP_KERNEL); // <- HERE
> >     if (!buffer->page)
> >       return -ENOMEM;
> >
> >     copied =3D copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from)=
;
> >     buffer->needs_read_fill =3D 1;
> >     /* if buf is assumed to contain a string, terminate it by \0,
> >     * so e.g. sscanf() can scan the string easily */
> >     buffer->page[copied] =3D 0;
> >     return copied ? : -EFAULT;
> >   }
> >
> > This function does not zero the page that is written into. This,
> > combined with the buffer being per file handle means that you can read
> > the original data in the page. The `kmalloc` should be probably be
> > replaced with a `kzalloc`. This should be a problem for C modules as
> > well.
>
> Why is this an issue? The extra uninitialized bytes should not be used.
>
> Best,
> Gary
>
> >
> > Cc: Breno Leitao <leitao@debian.org>
> >
> > Looks like I only replied Priya when replying, so I'm adding back
> > everyone from the original email.
> >
> > Best regards,
> > Andreas Hindborg
>
>
