Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F1C32ED2A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 20:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757116; cv=pass; b=Pcb0WIQsyb8OHmvX05Fyf7BhoASKpOCFcQ2AUlZu1w9HgOwmALMq/GriK5Wq5kj78cDowQd4e/2bTk9SSXzyZeOIGwLzSykaWzFdCKumM373YsKujiagIAgMz00YKJdq3XUzhMNr1UeVMloK8v1Ke/+H2W0pwMHrewhsINKQAXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757116; c=relaxed/simple;
	bh=hov4NZSZDLaCtGgvzkNKTcQo2jxrMokSQzhZkZBNGLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPZYUnSog/KpQb8Boaer0ODZTUfz2GJ3sVVQQk13+Q1NDg9PmyR8XdqgZbLKCOHes6xEGMbiosqG9RZtahk8N1OTbJtYPzMv5bmPlX6Fqob1N+GR8LKMxZxi8OOrEMMDlaJC+OtbjitIfl50/3r3vz8qxr/Ad729Qv5Ych4qydk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEwArRtz; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEwArRtz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43284ed32a0so4159566f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 12:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770757113; cv=none;
        d=google.com; s=arc-20240605;
        b=a9J3awxdnxfptBgdARNMd1WufLp2dqTMQSqX7I51EAeluSCQLlRgUBwiT6eZ3UluGb
         zsiK++TnvO/lapFNezamQtnwmR2ibjdKQkUmCn01AGc52110yYFWJ5AFGwm0ylU15RK8
         vYEqg1hDFZIkPQ0Rezc6knNmN2++3vtZeLOL5iTybxHQxxRzDROceZwPJpHEISmbt1EA
         I9vcFE8AbiGK8KQMyXYAUDNKz02vgxgoDZwW4DVHCFl5t9LTunKkyeNBUXOc5YNERe99
         yWxD+eUTDpU4IHq4xwJ/C5wBPHS5W614NkqWnspNs/0oIoEuiDzcp1tFY90w7GIpKmWc
         xncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMiNo79hn8KA9oSJ9taji/ROfpEwl2Uqf0G9kw8wuXY=;
        fh=a0R0dmSHwMn+A1eurEG8uzJUJ2/go+d2wY0IQaPm/A4=;
        b=HiRUQ4EbACXjcH04G1PbsgpjKN/rNlZ0q78B9+7x/Ug3zxeXn4o6DbdTqvpNaVXQIC
         zQyMYfhxOajAaE8vvy2wPm1q7TpJ2ugm2voAB9b1DxVJ1s3IKC5h1vU5p1s6aYgZ1FuK
         LWy2w0R4ol41EbIGMy7+DB92XkGi/tgxhXME04rXvJ5ZLlUWqrgulJPc5sDFd81CFhge
         EgnRba8sSEKN0/KQOC+V2C8B/EaNAC5LgpsORPrDRNA5YeKTXLfWiYWkoKVANNjy4ySR
         2nMHOngNgKH3Ss7SXi1eAWbpOfxvf0DW5yFvKA7MVuRSd5v2uwYuWKZqV2kZea47L3z7
         j9WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770757113; x=1771361913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMiNo79hn8KA9oSJ9taji/ROfpEwl2Uqf0G9kw8wuXY=;
        b=oEwArRtzo7Ghbp4Cup4cSSmthf8FOQOUPfDZn1/RpRU5JhAlYNqFIyh+wZUtbGrkKT
         IGw7E5chpMPPDeWLOtqSoNwRSS0yadUYEwL6CnZe/229M16cxG48fJSGbfXKyiuXXqq+
         S2+4hMw/OHbUvbUXd13Qci+M0mYOFtzQ3mNap28JadEi71AhbQFX1slplwjg5tZifpqd
         j18PugcU8lDjNYyrQldhoegFeSs4U/zp3wmT0XqXl1UdHKhtihXSC9Xdko1l+0PKNb6/
         eH4X5goZQkNLKfDN8dKDkKvEXPvFR8FaFr3topFRt4abKjWRsK5FyKzNtH2uHmuHAFBi
         R63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770757113; x=1771361913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMiNo79hn8KA9oSJ9taji/ROfpEwl2Uqf0G9kw8wuXY=;
        b=WhUgskwtxLDENMhabCFzCS7OFfVjhZ5yXC9Y8DwgxdiZr8x/wa7yLRjP4CvbFCYJu5
         71WdloRNNVKv+/Ng/agBMMcLmtJbZEWBBQFLvSw1KKH5JzMlyM9v2E1SCe00tquq0DjM
         P7uXbgDexaXz2a6gWyqEH0xQvfJzmbZ4QMRJ0+f7NCf7q1GBVMtqvttoCUJG+ZrMgx0L
         MQsv4L18lILGfYTkj6LIUk5sELzTFfvs7XvF8PrDVbtwrxplADxfJPqS7cKlxlClCHSL
         bSyyUM6ZpNnsqAsoSmkKgj1kIvcdtO1zIC8PRrO7k6d0V5yucYcLhWasO3yTJ0NI41Xo
         CUdg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gPO3te9TZGewkg+KiI8rKbI4MpZM3FRac5OhghKZ7LUfuFL8MT2FtxehnDTDLPSotHa1qPpuPgt/PmGpcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD1ULPMs9RDEWEgxQ5ZPl2iCedO5Hnhfd5tKogojuv/QM6L3oS
	dAT7wBFTVge8+uTUf3Lh4MycCHYzR1UCFwQVqMmvSyKKd00FL/SeVdt5AfWZfddDJvQeFcJEUxF
	7IqZv3WhTnYKu7RZB9TLBAqb/wO2o9NdQE3hzS507
X-Gm-Gg: AZuq6aJwPghh7ECnL9iag7CVXA/6AEONd1mSY4UF5dsSaldhtzzD5pXQlQyeVbcA3k8
	bJN7e1reLxGmRaXvOIAGdQ+qxOPhHEz0D3ymuu/yUmGO/lOMkpBrcQEhSYejT94HWx7rHwG3zGP
	P5sQC4gNFo9s8pUJpDEDIHU9jN4rW2DRIz2yQ1XsRXislREihKUlUcnaEskQBxwHcrXogX/9ign
	kELDdIw6ovIxZLZZYPixjobJa6jCG9VhWNca/NflZm/g74xvyofB3lbKk920+gQFYVkyLi9Krpu
	TuLe3cxZFvyiNKGkQkoBccz9SJ2EHjr7R28nOw==
X-Received: by 2002:a05:6000:26c4:b0:437:7710:5204 with SMTP id
 ffacd0b85a97d-4377a5a8720mr6438678f8f.53.1770757112898; Tue, 10 Feb 2026
 12:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com> <aYs5L1aG5S34teKT@google.com>
 <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org> <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org> <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
In-Reply-To: <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Feb 2026 21:58:21 +0100
X-Gm-Features: AZwV_QgCtT25ZPmvpu8QIXFvYY4XMKLSSSdx_MYZHniTTHmgt-LKd22OLCir5xI
Message-ID: <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Danilo Krummrich <dakr@kernel.org>
Cc: Shivam Kalra <shivamkalra98@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 9:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Feb 10, 2026 at 9:43 PM CET, Danilo Krummrich wrote:
> > On Tue Feb 10, 2026 at 9:05 PM CET, Alice Ryhl wrote:
> >> On Tue, Feb 10, 2026 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >>>
> >>> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
> >>> > On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
> >>> >> This is a follow-up to my v3 series:
> >>> >> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-=
v3-v3-0-8ff388563427@cock.li/
> >>> >>
> >>> >> Hi all,
> >>> >>
> >>> >> Thanks for the feedback on v3. Before I respin, I want to confirm
> >>> >> the direction for v4 to avoid unnecessary iterations.
> >>> >>
> >>> >> Proposed changes for v4:
> >>> >>
> >>> >> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
> >>> >>    method on Vec<T, A> that calls A::realloc(). (Danilo)
> >>> >>
> >>> >> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaro=
und
> >>> >>    (page-boundary check + manual alloc+copy+free) until vrealloc
> >>> >>    gains in-place shrinking support. (Danilo)
> >>> >
> >>> > I don't think you want any new traits at all. What types would even
> >>> > implement the trait? The special code can go in the realloc() metho=
d of
> >>> > Vmalloc struct in rust/kernel/alloc/allocator.rs.
> >>>
> >>> I did not propose to move this into the realloc() functions of the co=
rresponding
> >>> allocators intentionally, as there is a difference between calling re=
alloc() and
> >>> shrink_to().
> >>>
> >>> I don't want that some user of e.g. Vmalloc::realloc() experiences pa=
ge wise
> >>> shrinking by copy. This is acceptable for Vec::shrink_to(), but not f=
or
> >>> realloc() in general.
> >>
> >> Ok. In that case we can add a method on KVVec directly for this
> >> purpose, but I still don't think we need a trait?
> >
> > KVVec::realloc() should not have this behavior either, we only want it =
for
>
> s/KVVec::realloc()/KVec::shrink_to()/
>
> > VVec::shrink_to() and KVVec::shrink_to(), so I think we need a temporar=
y quirk
> > trait.
>
> Unless you mean to implement shrink_to() for VVec and KVVec only, that wo=
uld be
> fine with me as well.

Yes that's what I meant. Only provide shrink_to() for those. After
all, if Kmalloc never actually shrinks when you call realloc, what's
the point of having KVec::shrink_to()?

Alice
