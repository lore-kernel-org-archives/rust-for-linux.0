Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8BD4A2E2A
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000808; cv=pass; b=jKqHYCT/uquOywru6EGN/MtlupaSOpyuM2aTZrq39LYh03q7WAKQnvoDT4wFhj1eADUTkx8p4MVoCeqTdL3A75lWV6qc0sVNH4B6Mb6vdPRUB/r2XrnfBTj1tGh9o5ZgC9oLe2iKzvQlygDUfhZLn5np+Q60HT5AE4O9jfgoFeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000808; c=relaxed/simple;
	bh=utoARpDnvA3c3vaCWBg5H9ujL8C1Fui0A2kGFCJI2Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMybHpnCwFuBx3IR1EkDr2OQQocvMOBZdlC2tkBw8wRcjhYHO9KbybDPcJoHkqa8NUeLDLCsothF2EXolcLaITg1A74Bh0nXDyhUdCavsRpS0i0WqGUaZswIOWSchFIwdqsZypGQMl+2bCvuimIxdUVIepqpl1pfgmUrDQpsD8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f/zslAEX; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f/zslAEX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso8287365e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 07:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783000805; cv=none;
        d=google.com; s=arc-20260327;
        b=L6hR5G5ML0rMte7vAbcVDpdJLEd99MDqwefa/B+IOTTnJNbR6Mo8yQ7DhwqcqXv322
         OeC3WZpNhaPtOQcL5GRJe6ei1he+pOmyNd6F56RG5TiwnTTuuaKvgPn5GwFehrTo1dau
         qseMZESdvvFn9jQHBWuBstZ9di8iQjAG8Fm/GXYEJoP9fjN4dgP4vTnyYQZqFdMOFvK5
         8/ddTrfgCMaCI4ZZFK/lveQ8WsD19/oFQfrDmgz3WURIwgWDlAkd0vGkUOodabV90EJE
         sK3TabPBEMacNNtaba6mnrxRY46NhSOG+jSCJLg8orX4KluwBkPYPTqaIWRNKHKDEh3h
         SyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        fh=IkJE4wlplvG0ScINp89Fj8bPa6m2ZWia57DdPMzDUjc=;
        b=UUkscBzoSQvOSDep7AL3Fq47nqP5iKhlRPhJPKoa+vOgnu84o7wvPqOP6kK47mi0aa
         yIdTd7EQh9dIWiK2//bmmG7+C751MpUzFKQAVSI1+OFI5JFXtQS6CzJozEDJ+vozUd5m
         9CcOtkueGEEHKosoCvn0YxFT9sus1W3+hblSjfNrRXrdesWsnJ6L343B06Kikr29M3NM
         51QywT/8Zy63iCoxoVMBMdgvRAKX7bj6+xuMLRkUbugaILF+nNYXM3lMflQiqPjVHgZk
         wB9TQF/VrjFJEAFfKmwxoNlPFUC5djMiF6IwF7dkidtVfRXMHKA89NfsWmz64z9RxYjv
         Ho0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783000805; x=1783605605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        b=f/zslAEXD61r9zZiS52Jiu3U4UMDUK2QUdPU3m3pjiFjQUm6iq14SZxwXzWEBDlzPy
         k7qJVXKZY4iyA9MzD4WfmX/au/Rb6rbm0YYM5sFpPGu46ZeMQG7zUt0z6wjypkJRnGzK
         Zx8BF4hOzrvd2kB0VRmN3WZQ+8ClQf3ImnEDwz4urhlZcfK0TM4Dp7bNjK329kPL1A1V
         Wwp2z+/+oel6WlZWx5Gh2nxQmf/Yq6ka2D1/3Cow25n3snN2+2fyub7nF6X4ZRNW1PWx
         4YBxG0dQJYU3ZTvWaX2cPMHgB67Ih9Pob6CWlheS9Pr7mslWCJr/p3aZMcwmTVSvHcHh
         ZZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000805; x=1783605605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        b=JIpS7wH0OIA+7XWx/89P0jkPwntO8WRxtMs8rGzMJTSYGTe5++PjMKcBTBefZkNCh/
         BprD20huvVQGsapgju7fmnYTsDxf6YykTBTaX8g548jQ1A0YaQ0lb6kKTXGmX50QyGRk
         ehf39KOKoNKiyHuyPBWJQzi09vuq9bYx0kF17ufkNLVGo0LBKFLwBTbuZ9Q/85zyvfFm
         jN4Jnf/NRCbnm+Hk5EzLPAx6t7qkxHmLEjntITs6CC+a7UVcZhcLmn4fD11ecPQk2UNb
         r28W/uHYbjtc31uksvT4u2MWomq1NgKRP3VErCU9yuJ/Nv6sreYd0mJ6JNujqern26PP
         q2lg==
X-Forwarded-Encrypted: i=1; AFNElJ8L1kviEgU4l1iyY3fxSJxRwTif+bAZjb/GQ88Ku1NSHXPihLVuim+f+6pehUltoZ3K/csHBalWksyb4DPDkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYo+4ZJXm//1SFdKP80X5SIVIXinwOZSo4tBHzXjXFQCc+cbEc
	wVZhAUv2bJDyhuhwkdRb9ZOZXxjjSi21OV+3pLfYH35VYvwZeQJF+q8JWALXV78qOjVgDRsJTvT
	Dp4ZoFrt9bUKm5UQPIylO4PxMSrr4yuLxIqMD252K
X-Gm-Gg: AfdE7cm4kUsH8MBPMtcuFq/OxIfvtS/y3tB8bJDa9hXkyhGG0m+Jtvm5uKHmHHU2UnE
	KB2GZDyNLmQzFd//Vuz8nyFEWKjNxhDHlcbSAQM5ejz/x8+U7YVujR2BakxaogCdiIgEQA2pD9Z
	Q49my1GrpwCsKujIdeCfB8pMkE7Hu5LYuinIACbF4SQNOtLGx4ebYsYOD1Wymf4Iw4lxzAAULu1
	DosJEM58R4uf0icgBJ0NKd6jEcwMszpauuhchJbDAgwHMjr65pjAbirGXZ/3labirxQUMu2jSx3
	SwISMdKqFYndy8DAz0hIpf54GVQ=
X-Received: by 2002:a05:600c:5296:b0:492:6efc:7c60 with SMTP id
 5b1f17b1804b1-493c2b99781mr85583495e9.28.1783000804786; Thu, 02 Jul 2026
 07:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-idtable-rename-asptr-v1-1-e0927273c71a@google.com> <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
In-Reply-To: <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 2 Jul 2026 15:59:50 +0200
X-Gm-Features: AVVi8CexQdyFEd0R-YBeb950WefW10NhAupPBjQ8CXL2XbC1XoogGwE5GSAY5zY
Message-ID: <CAH5fLgjz_FTzv7rFsxcvt2N-3ehPxa2kHJqUHKDBv56OZw5UVA@mail.gmail.com>
Subject: Re: [PATCH] rust: device_id: rename IdTable::as_ptr to as_raw_id_table()
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Igor Korotin <igor.korotin@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Jul 2, 2026 at 1:30 PM BST, Alice Ryhl wrote:
> > The current name of `as_ptr` is very generic, and if you attempt to
> > invoke `foo.as_ptr()` on a type for which this method is missing, then
> > an error along these lines will be printed:
> >
> >       error[E0599]: no method named `as_ptr` found for reference `&DmaB=
uf` in the current scope
> >          --> linux/rust/kernel/dma_buf/buf.rs:54:38
> >           |
> >        54 |         ptr::eq(self.as_ptr(), other.as_ptr())
> >           |                                      ^^^^^^ method not foun=
d in `&DmaBuf`
> >           |
> >           =3D help: items from traits can only be used if the trait is =
implemented and in scope
> >       note: `device_id::IdTable` defines an item `as_ptr`, perhaps you =
need to implement it
> >          --> linux/rust/kernel/device_id.rs:165:1
> >           |
> >       165 | pub trait IdTable<T: RawDeviceId, U> {
> >           | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Suggesting the IdTable trait when an as_ptr() method is missing is not
> > useful. Renaming it to `as_raw_id_table` makes the method name unique t=
o
> > this trait and avoids these bad suggestions.
>
> I think the name is fine. Functions of this sort is named `as_ptr()` and =
I don't
> see why it should differ just because it's on traits.
>
> I'd rather say this is a Rust deficiency. Perhaps there needs to be a
> improvement of `#[diagnostic::do_not_recommend]` so it can be sticked to =
methods
> or traits as well.

I had a similar thought:
https://internals.rust-lang.org/t/do-not-recommend-for-traits-themselves/24=
431

Alice
