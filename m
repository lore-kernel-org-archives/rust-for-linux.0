Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF426A8A3
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905934; cv=none; b=M/Kj07v/hiJGn9PHP18RVWqFcr/OGd07jNhWiMhI2I+JOk9AmaDloPd0jtY8x1VtY3fRTnXredkgX6fa+JvyNWasKyN9m7/7dz0mtLjqLMldq8z/wI7lZ1XFRN/TPRXwclKCdENlZNCuJQWA7a5sVRL5fniWzPvF6uTbmskt/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905934; c=relaxed/simple;
	bh=bYzk1OnIzBTdgH/qhRITEf2NZ+0V+6FIJbO2yy3Z8Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D4/0DWoPaYCeNt8ZByFfgC9dPv4teFcv4OWGCfYRxEiHhPx5MiqRJkLA0r4B0cUtY4Fat/JZbt/Gejpi/ssoa0MHSxUzKsXNMf6SMs9W7Konl8UXQPzw8acDPTOUhygK+AGzGYRJn2Wk+B8cliIpuxkrVg3QP5cvGxf7EUzA4iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JJmm1wog; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JJmm1wog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716905932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z/BZ1nt51YTWYadDCqba2r6Z+lAvTA6hSb41k488cU8=;
	b=JJmm1wog/Xi3hUw3G9uspZVX9UNt/A7bXSMY0c+hmjskjYopNokUaFBTe1qvXvWRT37nLo
	Hvi6mQ0X/PyHeDYeO0TlL9Xi7/uXNP30FigRqyabv3HIF5Sf2y05dtG8pve8+ucUDeHH2+
	gvpNNL28HFUSJ/DE15xZHRpaRkS7Ig8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-yR6wQXe3M1idTF25brWn1A-1; Tue, 28 May 2024 10:18:48 -0400
X-MC-Unique: yR6wQXe3M1idTF25brWn1A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-35847dc0690so477520f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 07:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716905927; x=1717510727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/BZ1nt51YTWYadDCqba2r6Z+lAvTA6hSb41k488cU8=;
        b=sEDa4koCj2plBQT5TryT0ClZPAd/p2/2B1W3cWlK18R26AuFS81CrEvkRUgx+cjmRb
         GhlpHx8kB/y4cySudFk7QZpUw9TtVAdlKWHH9/LKM1Gn1HmsMruzFyC33QmV7koodY77
         PRk9pPCNTWqgjctvkoxMrTtpQuI0APlcb1b3B9i7oZA4cJfGH+7E7g0c8lDiOcQTkYBp
         PWKrpLI9P5u0IJDASSCGrzZcffDL6KH6fGHLSfVnDOmqjdKJk+WTVs1WI/r0RVOUhnR9
         nFYYEpp4hZO81cZMmOsEDFXkRBorzRwlA2SY/nhn2DmrglWMTazYYhUqt4ZWaEEsfS/M
         r9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVtHjRP+l7i0N1db1SXlcYZAU/V20QeqUaYIm8tX9Cn4Jw6z1Pcu1jmKNY9y5EIN811bVqFQ9/Z4LyyVGPF7kKnaKvBo7rtnX/CGeh4zIs=
X-Gm-Message-State: AOJu0Yx7rw0mTjR4cE/Nm6RvBu4et2+nKJV+o9IuNIg2FOasdt+sgVx6
	HUy5OIhCZJ5vENTu0+I35WQ5WbjrQ8P5Hstm42Blb8oUqg4/wImn0VgW7L/VvVWmkjbl6E6wfh1
	/gSJPPMaEIpUD01gYYVXVwDYTKjRdiCjmO3O43LZVqjpOkf5QWtmKa78a4UOcKl+c
X-Received: by 2002:adf:f14a:0:b0:354:e22c:ea86 with SMTP id ffacd0b85a97d-35506d48b8cmr9521439f8f.9.1716905927695;
        Tue, 28 May 2024 07:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzv0UKkNsSlIQyIXiOI2f3K/kj+ZZJuaGQwe6Mug19LllcchtBIhDXNRyuC86tE0PcwWttfw==
X-Received: by 2002:adf:f14a:0:b0:354:e22c:ea86 with SMTP id ffacd0b85a97d-35506d48b8cmr9521398f8f.9.1716905927283;
        Tue, 28 May 2024 07:18:47 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35607bcdf26sm11788342f8f.99.2024.05.28.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 07:18:46 -0700 (PDT)
Date: Tue, 28 May 2024 16:18:44 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"benno.lossin@proton.me" <benno.lossin@proton.me>,
	"a.hindborg@samsung.com" <a.hindborg@samsung.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"fujita.tomonori@gmail.com" <fujita.tomonori@gmail.com>,
	"lina@asahilina.net" <lina@asahilina.net>,
	"pstanner@redhat.com" <pstanner@redhat.com>,
	"ajanulgu@redhat.com" <ajanulgu@redhat.com>,
	"lyude@redhat.com" <lyude@redhat.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXnxGK24QaYLDmM@pollux>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
 <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2024 at 08:40:20AM +0000, Zhi Wang wrote:
> On 27/05/2024 22.18, Danilo Krummrich wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
> >> On Mon, 20 May 2024 19:24:19 +0200
> >> Danilo Krummrich <dakr@redhat.com> wrote:
> >>
> >>> Add an abstraction around the kernels firmware API to request firmware
> >>> images. The abstraction provides functions to access the firmware
> >>> buffer and / or copy it to a new buffer allocated with a given
> >>> allocator backend.
> >>>
> >>
> >> Was playing with firmware extractions based on this patch.
> >> Unfortunately I ended up with a lot of pointer operations, unsafe
> >> statements.
> >>
> >> As we know many vendors have a C headers for the definitions of the
> >> firwmare content, the driver extract the data by applying a struct
> >> pointer on it.
> >>
> >> But in rust, I feel it would nice that we can also have a common
> >> firmware extractor for drivers, that can wrap the pointer operations,
> >> take a list of the firmware struct members that converted from C headers
> >> as the input, offer the driver some common ABI methods to query them.
> >> Maybe that would ease the pain a lot.
> > 
> > So, you mean some abstraction that takes a list of types, offsets in the
> > firmware and a reference to the firmware itself and provides references to the
> > corresponding objects?
> > 
> > I agree it might be helpful to have some common infrastructure for this, but the
> > operations on it would still be unsafe, since ultimately it involves
> > dereferencing pointers.
> > 
> 
> I think the goal is to 1) concentrate the "unsafe" operations in a 
> abstraction so the driver doesn't have to write explanation of unsafe 
> operations here and there, improve the readability of the driver that 
> interacts with vendor-firmware buffer. 2) ease the driver maintenance 
> burden.

With a generic abstraction, as in 1), at lest some of the abstraction's
functions would be unsafe themselves, since they have to rely on the layout
(or offset) passed by the driver being correct. What if I pass a wrong layout /
offset for a structure that contains a pointer? This might still result in an
invalid pointer dereference. Am I missing something?

> 
> Some solutions I saw in different projects written in rust for 
> de-referencing a per-defined struct:
> 
> 1) Take the vendor firmware buffer as a whole, invent methods like 
> read/write with offset for operating the buffer.
> 
> In this scheme, the driver is responsible for taking care of each data 
> member in a vendor firmware struct and also its valid offset. The 
> abstraction only covers the boundary of the whole firmware buffer.
> 
> The cons is the readability of the operation of the vendor firmware 
> buffer in the driver is not good comparing with C code.
> 
> Hate to think a lot of xxx = vendor_firmware_struct.read(offset); // 
> reading item A in the code.
> 
> 2) Define the firmware struct in rust (might need to find a better way 
> to handle "union" in the definition of the vendor firmware struct). Use 
> macros to generate methods of accessing each data member for the vendor 
> firmware struct.
> 
> Then the code in the driver will be like xxx = 
> vendor_firmware_struct.item_a(); in the driver.
> 
> In this scheme, the abstraction and the generated methods covers the 
> boundary check. The "unsafe" statement can stay in the generated 
> struct-access methods.
> 
> This might even be implemented as a more generic rust feature in the kernel.

This sounds more like a driver specific abstraction to me, which, as you write,
we can probably come up with some macros that help implementing it.

But again, what if the offsets are within the boundary, but still at a wrong
offset? What if the data obtained from a wrong offset leads to other safety
implications when further processing them? I think no generic abstraction can
ever cover the safety parts of this (entirely). I think there are always semanic
parts to this the driver has to cover.

Generally, I think we should aim for some generalization, but I think we should
not expect it to cover all the safety aspects.

> 
> The cons is still the driver might need to sync between the C-version 
> definition and rust-version definition.

What do you mean with the driver needs to sync between a C and a Rust version of
structure definitions?

> 
> 3) Also re-using C bindings generation in the kernel came to my mind 
> when thinking of this problem, since it allows the rust code to access 
> the C struct, but they don't have the boundary check. Still need another 
> layer/macros to wrap it.

I think we should have the structure definitions in Rust directly.

- Danilo

> 
> 
> >>
> >> Thanks,
> >> Zhi.
> >>

