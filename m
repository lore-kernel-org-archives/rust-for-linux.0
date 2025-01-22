Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3591BD014
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540953; cv=none; b=Dwx1c1ZK+Vy1sFeGr7lqRf8V4lJR40OXHWjLfljPbwQQcKtkStEIQz8Rv5cXRgKzloKlOepN9hY0NXCwF6hsMLWA+6ptZAhA2kaRyJr3tnfH6dDR7mnEABz8J5yEvKigpul0IXs6zOvs9xePBLV1HWGvJANTOEgNecKZfVZf/5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540953; c=relaxed/simple;
	bh=UBlzD8MynP4wtJMH3FouuoxGPAoh+UjXszE4ZLZb9PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ix5860vB7ZcC3t1W8RfQKYJMX8il0bvQc+bgbe/DyBBQFZ7zRMrgLUswbPjz+8sfnHdiUK9JHVUMVubVn2MaX1l8tJTTSCSRlXbrkcp2mLbJnGE2KWFDqZccL3Is7XKYW08j0SRqzTKo5ZrIdpECrE2Tr5gsg/Sf1j4LfvMma7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrevQxiF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrevQxiF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df53e559so5070750f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737540950; x=1738145750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We/e78Nv3R6LaJg7Byr6yv9XSyWPTTNeoplZz3yEeWg=;
        b=nrevQxiFuVse/3tS/Zc0RWSXPV9aiGniUECTdBhRnY20ZNqjoa+jPC6NQPMWC01k8b
         QvZDFvIuvhwH4viwyA+ttiUE0YBAKltrV8ZqNSDzmgQUzw2fcUhd0mwEz3Ci1U38ogQk
         VWVpTmOtdt9N21H4tC3iuYFI0/FOpm/SjOD5nfiT+6qtvOxzXtmZ7JT5FSfr7JvHDSZL
         t7bgYy4Lv2DVtI3gjhIhjA/+SHcg1b9U1CSDtfPPNaXob8RlVymy7MaTb4eqLuuajmYt
         3TV12lVS0XLCXDW1NNMBtpz2Wdos1oozKp9x/98WcUNGNysvGasOFdNO1D4PVLsloE0k
         01AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540950; x=1738145750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We/e78Nv3R6LaJg7Byr6yv9XSyWPTTNeoplZz3yEeWg=;
        b=EKlavl8DxZ8HVCpNnhIHZpu/qqF9UaM+Cvd0r3oXBe0TBuqq20gLX7hobEUlybo6dp
         hpjcKUDvMR4cAh8CYYKULwR2KKxqUiyUH1MqP+j8GdVGhTF2usoexBVzhk3l3uIC8v0h
         ggzXj9TKvnOQC2k9puyVt7/o6lQg+dYJ7O8ABUiyriIpUeg/UKmGpuH65bMLSD93eunD
         joAi0pqsJUCd3lPOARS0NFLsMW/O+B1tmjFgG6KrMQgnKCVNbKzuAw5ckTgfOA4+P5V+
         3Fl8CYgM6uuoHyokUpxO8hT0AdmxZtjGXqW79vn6dF1xNf/u/m0i4Q6FUvlb8BBB0ohr
         Uzfw==
X-Gm-Message-State: AOJu0YxbgFl/39utD2hFUKIqawEOugOVMG3/QB1iGOwRzed65T3JmzHB
	gcXE3vu/qzJM9dBquS9yuN4jV7bNRzoJW6s/oMgUx5upnDyhtKUd23k+og1veALfNBuTOR3NOwW
	kR3y4DB7KLjUXuSuKiKA6VJzA4WqYIsRVVx7X
X-Gm-Gg: ASbGnctJCVLx4fOoZjID9RSySMNajK6cWU8gm3MsZ60Ic2oUh1dqePUtJ8u7IuMSxsU
	7x3fjB5tMO+EkAnKgPlAlC1O+r/6OImYIdd/GD7NgWTFLwx7/aMwGK2D2Vd8agrBh/w02wa2lqK
	q0MY+I
X-Google-Smtp-Source: AGHT+IHFzm4euUAacp6gvYxVizLBMwIg5oDbxoAH60HayNsSmT+3Q7l6UofaUmQpPsbKH7EPaW0Rk6q0dXkawUrfJmw=
X-Received: by 2002:a5d:6d83:0:b0:385:efc7:932d with SMTP id
 ffacd0b85a97d-38bf57d2a39mr18199014f8f.46.1737540949669; Wed, 22 Jan 2025
 02:15:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
 <20250121191432.1178734-3-abdiel.janulgue@gmail.com> <CAH5fLgjVjAVwR+osD4ajKfyewdWPpkSyV+oy=ppaCULUdPqB7w@mail.gmail.com>
 <fb2216a4-306b-4635-bc13-10647e7cdb93@gmail.com>
In-Reply-To: <fb2216a4-306b-4635-bc13-10647e7cdb93@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 11:15:37 +0100
X-Gm-Features: AbW1kvYHOBRoQQbvT-ruGTUBikUWtGUaNvOBrtbEBcj6jH7COvdJOr5ZaYwH_yE
Message-ID: <CAH5fLghO3eh4VWjSiwX4bqORBMC8JF6RyDQM2eCPg6On5Ti9WQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	dakr@kernel.org, robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 11:14=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
> >> +    /// Returns the device, base address, dma handle, attributes and =
the size of the
> >> +    /// allocated region.
> >> +    ///
> >> +    /// The caller takes ownership of the returned resources, i.e., w=
ill have the responsibility
> >> +    /// in calling `bindings::dma_free_attrs`. The allocated region i=
s valid as long as
> >> +    /// the returned device exists.
> >> +    pub fn into_parts(
> >> +        self,
> >> +    ) -> (
> >> +        ARef<Device>,
> >> +        *mut T,
> >> +        bindings::dma_addr_t,
> >> +        crate::ffi::c_ulong,
> >> +        usize,
> >> +    ) {
> >> +        let size =3D self.count * core::mem::size_of::<T>();
> >> +        let ret =3D (
> >> +            self.dev.clone(),
> >
> > Calling clone here increments the refcount, but you don't want to do
> > that since it leaks a count.
> >
>
> You mean return the raw *mut bindings::device instead of ARef<Device>.
> Otherwise the compiler complains not being able to move out ARef<Device>
> because it doesn't implement Copy.

What I mean is that you should return an ARef<Device> without
incrementing the refcount. I acknowledge that this requires unsafe,
but it's the correct semantics and the unsafe is a consequence of
using mem::forget.

You can write `core::ptr::read(&self.dev)`.

Alice
