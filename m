Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AB4718F6
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134213; cv=pass; b=SzqgGyr6y5HJ5qnfvv66sc9rggNyy8DwBXyurdWcYlAM9LtkyoTb0C2oHpnz1E+qJMx2YHcJxLviG9GWPriwl3CJC83PR1baQjTRZ4DjAcQ5JkNWjWViO8tm6PkV0aSJmkwPuvIO9z271Wn7zhyGQe2oOBL7ptOGuX5+pCvLlsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134213; c=relaxed/simple;
	bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTKzp99AJBvLVC5U3WuPWhm9K27gfT4+rwSM7lSrJdwc/11vToIc+44MfOfopEgmtHhYfoPQW9mR5r37rMze4P9u1tGe7a78QYe9Be0DaK2PD5guPgyMIcxj9EyzI1oZ3ayNJFIr6imgBhOSoNWhhkloz2p0DYj8uF45v1VxtK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ehf9dS9K; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ehf9dS9K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso11540445e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 06:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789134210; cv=none;
        d=google.com; s=arc-20260327;
        b=KyafwIlByRG9CzfTemrW1jzP5PMeJZjKkZK4vZuNAcWYzTIY8dMEVLrkxubYJXriYX
         61CxcuPl5Pls5x4FxfQsSe2dhfiEbnr6NPqZqgfUOgLHIbw/yw+TEL1qhcDfhYei1gt4
         emVqVkXFRIUwi4MxjdheGkfbpfMU1doCLzdyG/hoTMoIvjFJBhU3fgez+dDL4Zbanc6W
         H07NIN4vGAdvV+nraenLczQKum9tAsrD17mq09XfmwSPqhvs0wllfsPXRdvCg+rf7vlJ
         NPns0x5/y+Z+S3YfdI6whMMoFo9ietZeIgCSf1nJKmIvb80vYs/D9yDP4oIISthxnDhK
         xQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        fh=jzwF5UJnqdMkWIeRb1tZ8bYRyz1ze+yMkJshbR87DgA=;
        b=b/kOqj9onA8fr/T/j7UiOsjjJOEU259EYtVWjvyDH/00usiIOAFUAQaPWaGGtL8yph
         0WCDDBsAI1V+s4m0+nyY0cspBKuhCSYEM2rgTgZDUW3LIAy4FNgBpL92ZJj1NfF9Ipo5
         TEX4SjB/PBXq8ImR0EnQemGKa4/dsu4Oul2B43Jovr/aIwjWkvNMIZk/N/n4y+IzfvuV
         6d0zzgLwIPScMgGTioKXH/c5LB/Hr4OMNXiQoYLlxrr8c6h9wFrXKZOkRtId1G50KqZX
         HM5TOKDV4swlfVA+UP39zcRTLg0E2zofQspe4Z8ZivBJgZYi+hvu79b35B56kVepQMG5
         xdcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134210; x=1789739010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=ehf9dS9KBtz8dLPV1eOtxc8kmJv+fOyIVW2ZdO06596kBMMRx/tyUK2lDgVQgI5M/c
         SSpBMb7uUs4G1u34797nfCD7P+9zLvxXZxAHnuR56Buv7tbMHFhU+KXC31bwb8LxfuHW
         8rSFo0UCiOxET6/EGYFoQmdn13E7BSnpGDUmtBh5eTd4sQzXsa+4KMiX2L2pwFInQmBd
         XbtYZ8PflSCvO08pB5VAXZaYQ3wTj5HZ2Hp+yRGmtaYxRkpKM8QUHwvM09P+tJQDQK9v
         QG0xK00MrU/0875Gy+xMQiBhNe3qdsPJOLSKMbDDhT7ODGKOfLVFvcBzJ0WilrEwQq0E
         IdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134210; x=1789739010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=jranMLZQsRLlnzsHS6edapwqjkYxI5UVA1HVDXkGdAJSo0LXaVG4a//9W5WlyN0RRH
         Sye3Doq3vbaFaYKl+o+R46D4FQcXPbQ5O24l4WlujCLWpciEGtSRScY23Ist9e8bkjov
         KbK9sk6YC/nwKO2+VDmTRy0i1cgxqrF2NngMDpee6Z9sdwfLOQsdRtvHDTBYwngd/XMX
         iZeJ2VVrpqH3gAE4ygO0O9Wk4FtQHIWmJ++5mCLe2+UxqkilwnAVg0iku0fJZ4tVlWla
         gAtKNoIXAPLIFtSHrdHg11Ja9g8bQBvgMHqJ/gnXpmGyD2kYmpmCibX7gdE6YsRE1IyI
         1vNw==
X-Forwarded-Encrypted: i=1; AKwUvBypH2VMg/G3aVAm63rrurvKqD5NvKOY/C1beZ9WA+mFQUFBhEsznKIj3zpdTzQrvgXI8tJV1J8czzM4UN8+9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lX8uPO7KxAjxyx5uBBPSP7CQC3njQH+oQwvVd6SjBDPGgvLnYl
	gaij7mPeWdrrTaFvzyjBCu+rL7dfLO/s5i10FEGzClob1qEQJOmAWfk6xQ/Z80DgNmjQl3nsV/P
	HtJItWYP8pf7SeyDCGQH9fhQVRCKitW7pfsFf0+WV
X-Gm-Gg: AYBFou2EU0SczLcbdY6uvm5wIC+vQ/5ZblISv/0vBPWFMvNxT62L73114PtGdGFpRtd
	Di6ODppoloNyDv/+xCLc2897KNVZ2+rkFeyIfcKxQQyR8zLj/dU8y4jsPaK3C/b2eFZA/l+gsfz
	T0WPMqwd+MKcNgMC0SIts27AJRY7oGQ4Ebu9dRvtn3TGbEkV2FvKAx1NsLPOOv3d3jc6xvnOXde
	2CDYKWpGg02SPAr+XJTD/GGLEnfIdxnihyOIXlhFBu/qQIg6dPUi1xOPleSfuqNBVKm15332LNY
	xZQwoXwPakcKygmTQNbSWeeORInctS8nnFQ9I/JI7fs5T55637FkWFAV4gaVkPOQ3Ft0jlhSKUz
	NMSEm0J3B1j0bSla14C4hyQLtLXc1iS/9BH3O7s6cbi6TFfUWKhPp
X-Received: by 2002:a05:600d:8445:10b0:49c:cf18:494e with SMTP id
 5b1f17b1804b1-49e6198a3b2mr36939915e9.12.1789134209249; Fri, 11 Sep 2026
 06:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-7-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-7-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 15:43:16 +0200
X-Gm-Features: AcwNN1UlYe5vy_4Ph8n7W5xph6nzuuUOW4o-tvYKznIiNAx0UgbfO_rFNfVUhuY
Message-ID: <CAH5fLghC2qRh8qNmMHMWQXiWW9FAPdd-O4z-O-17FFDB3hy=+A@mail.gmail.com>
Subject: Re: [PATCH v21 7/9] rust: page: convert to `AlwaysRefCounted`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> `struct page` is managed by a native reference count, and kernel C
> code routinely takes its own references to pages, for example when a
> page is inserted into a VMA with `vm_insert_page()`.
>
> Thus, implement `RefCounted` for `Page`, backed by `get_page()` and
> `put_page()`, mark it `AlwaysRefCounted`, and return `ARef<Page>` from
> `Page::alloc_page()`. The page is freed when the last reference to it is
> dropped; for the order-0 pages allocated here, this is equivalent to
> `__free_pages()`.
>
> This also allows `Page` references to be returned as borrowed
> references without owning the `struct page`. Remove `BorrowedPage`
> and update users to use `&Page` and `ARef<Page>`.
>
> Assisted-by: LLM
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
