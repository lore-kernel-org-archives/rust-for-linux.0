Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3BB1339B1
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359945; cv=pass; b=Uok7qNwZeuoMev6oPR27hEwqHCCWJgcidyIXnFNWzh/IpuuCVLQNEA+JfFQ/hhQTEfwLW6APvwB67WJTacCsPFGGD6kfWIcpL/MxNxijCxA3Wbw6SUqBHe4Nm2glH6Bw8Ux/shxujvkgqnyUeuDFerP1ST94GIznc03P1G41sBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359945; c=relaxed/simple;
	bh=GtDUesrtBPEYQJ391tb6gvhG3srtiHA9wFHnN9DgsNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YF8IGBgZ1GBDUbh8Ju4LetnUgQxJOQrRwOsa2ibFd6fOkBhMf8hbwO2IR1OFSGtdHA+/vBXQpvcFt27pulHw2ZZJDIS5h6kEaNvWKPWbivl4vUhwUF0vEr7DWKuAzAnaaDGSqCeQ03ix33CtvT/wq+ATAHUw0SnoosMFoaeGSg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BImMFGaY; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BImMFGaY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso402a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:25:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771359943; cv=none;
        d=google.com; s=arc-20240605;
        b=c1JdkrPk4sCuY2D+1IZ+v8GC8SxhbKs9AsvtdMXGKdx7inVzWdqn8sroaw0CyHPXar
         tMfKRSjMkbV8/4zbnNJjw6jY0uoYDtZ2W2zGSP2uT6c5fRkqaV1uQ8jtHUbX7ICcdxID
         e+HdliOVoil0/nmO0pV7b/FqKVFRmwDU+n9thy3SlmvGJFoe4P52pVf1G8Rxi7RUOwgp
         gJuqosmhcHoqWJKwu2mK2rOac4dbaU18m290Z/WzjSaljaa5M55LlJGc5+L9XQekJ88N
         50wUvDh8n5Ixgf+roYwLLrmipT0LjGCn1qB6vJxdF9vt0l/wku2iCCwPwM5gTdh4OL3z
         ErEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GtDUesrtBPEYQJ391tb6gvhG3srtiHA9wFHnN9DgsNU=;
        fh=jAXjT5533kNKezA2kgp+xcKrGETUzusOQLsTJQHQYh0=;
        b=kLhmMPNWJZmTa9qX7XzbJPrnd2Ivpu2+TlZ/o2Q7J7myEADnOmfeh6DRtEy59zb9GM
         fUT1Q3ouck81jhp7F8AFZIVKrqMlmZqyzfU9wSpDshw+8LCsikGsZ9ZwjZU8k6rpWF5J
         mLJ3TQD4uU4PlFfu2jw5LsR+jiymaj7I2Z/75quSnqr98AKD5uMUvEaqzB4NeSOmvird
         RMLsTnclqiTzbAtY5R/eXdQVmlvV5Othwn9tRT3wQ+/guZatT50eiKMi5zgMJDAG7ryP
         DEjHmlMB8+I7FmIheIYT0h7rfiots/Ti/L8bNJY/fHeNR6e+aItXL3UHvnwcQd61cN7P
         fOWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771359943; x=1771964743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtDUesrtBPEYQJ391tb6gvhG3srtiHA9wFHnN9DgsNU=;
        b=BImMFGaYiGJRcuZ5zAdTRf8+BWfImWjkt4SYBtaDG6afTTcJ8wQjOL5aZMLQ6PaJWP
         kWJO5Mn0VBRFAJLDcTu2z/JBbkCF3y+VcBinw0sJvh7nAlK2ngzOVS4oKn6aIdiyOkiA
         USXO9dg11R4VHwRDZzUHqGcBgb6smRJcufRhoZ1PMu+Q4Y0QhT53wB8hujnDZ8iLrm8Y
         D2iwHa5JpWsVWZqxt7QD5IPG0fJ/qzesj5U6wpjIaBwhyva5oXLPR40dXdGWiQJBxhQx
         NR9TQBvZjz/RSe6B1gxKc1wt8+CXidR5O6XuXNlR4sKjpHl83VjHtxUOr8dDQBrb8ZYS
         GVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359943; x=1771964743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtDUesrtBPEYQJ391tb6gvhG3srtiHA9wFHnN9DgsNU=;
        b=Jl2kOc4Q3PZQPpkIpsdeCLE82D5PEh/S0N7KUM7QoE4460NuAsMRq5wsWkCPEzqzma
         DvqGpOK69c3l6dDSvUaFHm/tNAha40blBOqzKhXOJgM0wKUKULsGb+yZ9k2E7pVS0G46
         y5EhxIdiwpHG4VsgjYKUGS5kISU0qRkBfKEyx85CjsGd6l6DRWQYLACiEPo5eGyRbhiK
         BtCqsUoZXTek/eyzeBl5gqe+6H9/j7s5uVtDTXJzoWXeysYss+CMBofiVyiFNIwD6nL4
         gUEDt9oP5IGZ5Txmsy2zmEwt9X8V4JHej1xNJBKamOM7Ugc5h15Ay+Ze7pmd2fGo9SlO
         FS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZWFyIfzjnB4Pkk8RAlNpJeVn/E6XgBmxb7Weh+OoIDVdv4kd/VoDSqIJaD7Yc+ZFGaH+nFw43KdEVqoXEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnT4UGS4yem1wRhdxv0Ceo9JQcrEK1W6a/5Gvh4+Q/qoCf8j73
	I0eW1mu08EsfMNtkKykbJtTwJt04CCRbaSoI4nbo4FrWwGOQ5dgAuOJ++li4Ca+9ITiBCUNFuWD
	Pyb/v2B6uxwNVJpETHNMk2naU8iRzAaeocTB757/I
X-Gm-Gg: AZuq6aJ7LFcIbujE4UNUwTjxwwfpc9YYC4CK6HR38XbnX++pGzvblNThZrapSFyihNt
	ijXOZXO8UfwhmbpUZnt+qfiNp6soAZu8EuCbNsag3JWfha7cS4bjnSfStogjQ197/362VIIrhuW
	eqGOVqmDYc0p2GGTETsHevp06v6796pdEUUJnQpDkvCTlpb6gnYw0XhN9Yu1N28d/3xkaDk5Vyw
	AZC+SrYVaUcZZJOhigmWBpD0RpROg4AO8gAe5ZK7qbQ73/P1+yk3vMUkZNsFqXvrA6mOSrg8dnJ
	Qh3W64wyxvzhvEYpNajybqYXJuX61g0NQq1j3Q==
X-Received: by 2002:aa7:d783:0:b0:649:8aa1:e524 with SMTP id
 4fb4d7f45d1cf-65c14a4eca3mr72486a12.11.1771359942517; Tue, 17 Feb 2026
 12:25:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
 <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com> <CAG48ez2mUQ-D3jpPbvdZzcOz16LMXRnzcudOZsfdoftBF5yvPA@mail.gmail.com>
 <CAH5fLghCCAvOi+xRtPnD4ToQmyignjkn-PJ6xG6Y1DAUHgBKVA@mail.gmail.com>
In-Reply-To: <CAH5fLghCCAvOi+xRtPnD4ToQmyignjkn-PJ6xG6Y1DAUHgBKVA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Feb 2026 21:25:05 +0100
X-Gm-Features: AaiRm51ZqfX4kH-xRbv10dGnYSdGZ5HZG-5FCY7NO40gcIrlsCslxHPpR6pvA5c
Message-ID: <CAG48ez1vuJMmVyFw9BLePaMskOJ0ig3LwZw5FL34RFAjqyOW5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust_binder: check ownership before using vma
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 9:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Tue, Feb 17, 2026 at 5:55=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Tue, Feb 17, 2026 at 3:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > > When installing missing pages (or zapping them), Rust Binder will loo=
k
> > > up the vma in the mm by address, and then call vm_insert_page (or
> > > zap_page_range_single). However, if the vma is closed and replaced wi=
th
> > > a different vma at the same address, this can lead to Rust Binder
> > > installing pages into the wrong vma.
> > >
> > > By installing the page into a writable vma, it becomes possible to wr=
ite
> > > to your own binder pages, which are normally read-only. Although you'=
re
> > > not supposed to be able to write to those pages, the intent behind th=
e
> > > design of Rust Binder is that even if you get that ability, it should=
 not
> > > lead to anything bad. Unfortunately, due to another bug, that is not =
the
> > > case.
> > >
> > > To fix this, I will store a pointer in vm_private_data and check that
> > > the vma returned by vma_lookup() has the right vm_ops and
> > > vm_private_data before trying to use the vma. This should ensure that
> > > Rust Binder will refuse to interact with any other VMA. I will follow=
 up
> > > this patch with more vma abstractions to avoid this unsafe access to
> > > vm_ops and vm_private_data, but for now I'd like to start with the
> > > simplest possible fix.
> >
> > This sounds good to me.
> > (Userspace could still trick Rust Binder into accessing the VMA at the
> > wrong offset, but nothing will go wrong in that case.)
>
> Vma is tricky stuff.

Well, they try to give userspace a lot of flexibility, and then things
like the rmap are supposed to abstract away this complexity so that
normal drivers don't have to deal with this complexity...

> I think if I add the vm_ops->close callback this one isn't possible anymo=
re?

Yeah. (Or you could explicitly check that vma_pgoff_offset(vma,
virtual_address) returns the expected index. But either way, from a
security perspective it shouldn't really matter.)
