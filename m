Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763A1F26FE
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096367; cv=none; b=Zhjz+DFAudNbKitMGec8ZmUlpIqL5JE10xnH7hh+J1LkJ6bgY54qnTUu9gLBz1CgEgYNrp8hgUTmGzXWhm4OokUnruriZk3d95ohQnhqt5zXGcB/NCxnL/YYF24fvQn4Zzt+7d3osVl1+V5DFQ/hk1j6QSRw/7N7B7uXwdqwlpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096367; c=relaxed/simple;
	bh=ywmyj2+mwTU628wLUF2xRspDilFf9o3W6NRYN3/t0Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjjvfLvbgjwi5t7k5SNjRuujbrKK5RJrDIyk0HX1mjSyqPd0YgmE8tVVW6foD9CzyBxnaWjNGds3vPjY/O8YDpCoFqsWFnx0RzHuAR6wNlLDBOsqaOSm6y1rbzqCIODQ5sIu1eNPIclKV/Wrt2xAeyAS9ju4yL5MHwgu/ssOAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fwfAZUQz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fwfAZUQz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e66ba398so2636e87.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731096364; x=1731701164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywmyj2+mwTU628wLUF2xRspDilFf9o3W6NRYN3/t0Co=;
        b=fwfAZUQz0fvk7PCOIOzGg42vgzPQxYhmbEbHSgcYCt4yAsP7Liq9z9TgppYCuhi80o
         eUS29yeWjWecnlzjrR9v6i2RDNKDta2OoiGxiipKAuWxz0gHPdwLNH0Ji69+OuVUBQ3b
         FM5ecf0NI0qm5f61YifSTS5yLwgaSj6wzZ4v9c6RLpq5+qVvFlh6/AV3gcOjkCm2H2QT
         mzvJ7SIpIpYnzo5Qdy04stul9qNhAlKstdLrvNAE1n3uVO8XbL4atUrJ19rbU6epU3Y+
         K93IEIc4jKloVbhg8GAo/56gFs1/713Ky0hjUNt+Ia1uiEESFqFl+15PJUAo9ycwipCb
         ZRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096364; x=1731701164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywmyj2+mwTU628wLUF2xRspDilFf9o3W6NRYN3/t0Co=;
        b=IvXsI7pPYg9GBHKJaaGSsf9xXGJwynUfTLK23zFqNT7OGHDdDT/V/bxOMRlr3qM0/G
         VKyZNhlF/oodZ9ziVM5go4jFO4qL25Ioie140mBy6QGFXmZZyG57f2KupYW2LMYYSUnD
         6XMQow2vrrQsrY3BdYcUGTK0EZN/uavnvGqyugq9X41YslgDPwbmd2lQYfEba70KnXWv
         XmgMlzegBdG8RJeg8eHfR+xoPMtCvXLg22ZIqgId0Mt8Ixa5d4qp9Wyb2a96Jh78BVsT
         a1Gi6ezR+KkrVevCww6Qkn0BLUj0EskJuu7GIxmwc3iS0MKCXsj/lLzhrzbpvvHXeanC
         cK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmyQfY1wqp+ok+7i5yl9gYsp607abnzdUQP54EKC9yHpp6wgVPOS5KMTyUMOZZl7QY1mSHd9x53qyFIIO+lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0X/tOkZ04awljNKM80wi1PmdrQ5rVHKPwVIV5Saidx1iq5ufD
	Kv4sxW/eY1+nSKRUl9X0H/cNXFRfHL/pvbVrli3dkhqtE6xHNpp5GqJFVlNmVDbj53hEQXTuZm+
	HjrXNYLq+JVJoGoYDNSVBnYfeIT8qwE2jPpry
X-Gm-Gg: ASbGnctc+H3HYh0bDZ9m6ggnb+XS5g1lmz1wxaOnaznUBXbRWTmVDVrk0ti9CzvB17F
	gNxFdWJmoIplW3ZgMEp8rGMCbN0spmeXiFmGksR3OhuZLSyWKbMaBFIBsrls=
X-Google-Smtp-Source: AGHT+IH3kL4lLs0Uipupi9GWt32/5/tNTyCIa5bVmyx6fwQw8gtGwZzBdd1MsiyDybp0ou2acgQ0QsuHTDGC9DKGes0=
X-Received: by 2002:ac2:44cf:0:b0:533:49ab:780e with SMTP id
 2adb3069b0e04-53d8bd9a3e5mr66025e87.2.1731096363220; Fri, 08 Nov 2024
 12:06:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-vma-v6-0-d89039b6f573@google.com> <20241010-vma-v6-1-d89039b6f573@google.com>
 <CAG48ez3gXicVYXiPsQDmYuPSsKMbES2KRQDk+0ANWSS0zDkqSw@mail.gmail.com>
In-Reply-To: <CAG48ez3gXicVYXiPsQDmYuPSsKMbES2KRQDk+0ANWSS0zDkqSw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 8 Nov 2024 21:05:27 +0100
Message-ID: <CAG48ez20pcWiHXCKWv74cw-CDjeMrO+kcbZtmsgRo=7+Yxzspg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 8:01=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Thu, Oct 10, 2024 at 2:56=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > These abstractions allow you to manipulate vmas. Rust Binder will uses
> > these in a few different ways.
> >
> > In the mmap implementation, a VmAreaNew will be provided to the mmap
> > call which allows it to modify the vma in ways that are only okay durin=
g
> > initial setup. This is the case where the most methods are available.
> >
> > However, Rust Binder needs to insert and remove pages from the vma as
> > time passes. When incoming messages arrive, pages may need to be
> > inserted if space is missing, and in this case that is done by using a
> > stashed ARef<Mm> and calling mmget_not_zero followed by mmap_write_lock
> > followed by vma_lookup followed by vm_insert_page. In this case, since
> > mmap_write_lock is used, the VmAreaMut type will be in use.
>
> FYI, the way the C binder implementation uses vma_lookup() and
> vm_insert_page() is not very idiomatic. The standard way of
> implementing binder_alloc_free_page() would be to use something like
> unmap_mapping_range() instead of using
> vma_lookup()+zap_page_range_single(); though to set that up, you'd
> have to create one inode per binder file, maybe with something like
> the DRM subsystem's drm_fs_inode_new(). And instead of having
> binder_install_single_page(), the standard way would be to let
> binder_vm_fault() install PTEs lazily on fault. That way you'd never
> have to take mmap locks or grab MM references yourself.

Let me know if you think it would be helpful to see a prototype of
that in C - I think I can cobble that together, but doing it nicely
will require some work to convert at least some of the binder_alloc
locking to mutexes, and some more work to switch the ->f_mapping of
the binder file or something like that. (I guess modeling that in Rust
might be a bit of a pain though...)
