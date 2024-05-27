Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBEC15FCE9
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716837776; cv=none; b=VnxBh7H315jEPssaqBQIF2Wl+CvRQbWtTjTbcRNIm6x/Jlz6VkCl4B1RPMjcg5DJUAVhYi1L4lJvq4Y5xxGUWSsNddaBVWwdooCTibWXf0VtPLMbeBi6oXLAtDNafrdqaQia6um4KC8CfQd95o8Swu2CWOTw6f+oZrDiv1tYvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716837776; c=relaxed/simple;
	bh=2vt8QwlweD5ua3tE4v7ksaaIllQ416hZ+VgZPSA34iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qrSaFJsjh5yKfBKqf5A/zg+ZRGUgj3mF5ll1U5X8xFakhat6saYHPVVTHWsceLmDybDCT1h0w8VVu/8r8mKrjwhf/MofjxPdZensWNWQm1nq+mKCAAvUwzrbgux18yjUzIrVpQmp1qUDEYgjBudbf5S8S9r+APRWQaBZtYJrYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fMX2s1Ju; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fMX2s1Ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716837773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+bh6eeKyL8dV8w1mLvCxudFIQs1HlIb6gTyNzpVbwLw=;
	b=fMX2s1JuTvBWw/ZAdDl7eR7Hw8TE8GVjoBCEQcfTdCcWZShOBo5ANhXJOIdudKBwPWICSR
	V/zmHVMd8KYtAQsgVGAuIhxabT09GqMUNyvFMjjnwzgYnnClyThn60ZE9u9KpKxv+EaUUM
	M6ONfnrrTQCZ+Ag1R4pBux9qEJkawMY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-xTAuwm57PcunKjPkpIYsVg-1; Mon, 27 May 2024 15:22:52 -0400
X-MC-Unique: xTAuwm57PcunKjPkpIYsVg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5785f7b847cso73478a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 12:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716837771; x=1717442571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bh6eeKyL8dV8w1mLvCxudFIQs1HlIb6gTyNzpVbwLw=;
        b=NyNOkARPj+pJxW3J/8t2FA1VpwdDrxMFyQM5hDvgvX4QO5ZwE7Jz1BZleknLsoR+Rr
         Rj/4ux8zDFfvvck1xlAfYvxfKT1kJaGCgMUhaht051OFeE/VYnzJAy0aLMEKnwOuvl5V
         EDUtO1961jmUuGLRegyp1K6KCbs12pw7o4crrEMatBZmLli6OAXXTWgbSKjqHw9LjcT0
         wWFwIPTCfh7IaxZN5GHq+d4LfXFTJEOeACnt0ysi9ewpLQQdTcRmYXVt76jykLXZg7VQ
         Z44mdMUmxalamUSNaKR/lxDmhqbi7FFxsXRGx3epXcRixtwg8LbkfKytEzhKJzu1W4fj
         2W7w==
X-Forwarded-Encrypted: i=1; AJvYcCX29P+gkGFsofnWIfbMD3LDZbh7KtYm5EWSS3YCw+FddGaa+sIfn5i+6Rg4n4rLLtmZyYnfPlh5JcYXoT+thx9moJYlLLRNd52q9Js4zgo=
X-Gm-Message-State: AOJu0YxkymL5uzeTRI7EFrrACj59DtFuh8Gi6HEgN2dUlM7Ou4QzTE2G
	7yagb3P2XlN/kHJmQ58CKeML7eMTV7rZOaUeK/izHOzA6RjJ25nhqbvIm94Qg6WUs0XjdYquE/5
	8QqIvc2zjMD4aOCD67uYpA29Q9x87yZG7uCE7t2SrrBQcdqnN7Z36sjxVRqwTBQLM
X-Received: by 2002:a50:9354:0:b0:579:c4e8:42bf with SMTP id 4fb4d7f45d1cf-579c4e84380mr4666431a12.12.1716837770900;
        Mon, 27 May 2024 12:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAcWifdc1cmj4PyyLda94dlOEBvjOTiDHYgpo+M4fPeLYt+JqhR5bWaQW9VkpsHWQ9CeNbw==
X-Received: by 2002:a50:9354:0:b0:579:c4e8:42bf with SMTP id 4fb4d7f45d1cf-579c4e84380mr4666397a12.12.1716837770413;
        Mon, 27 May 2024 12:22:50 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579cec28c0dsm2325554a12.66.2024.05.27.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 12:22:50 -0700 (PDT)
Date: Mon, 27 May 2024 21:22:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2024 at 08:53:34AM +0900, FUJITA Tomonori wrote:
> Hi,
> Thanks for working on the firmware API!
> 
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given allocator
> > backend.
> > 
> > The firmware is released once the abstraction is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |  1 +
> >  3 files changed, 76 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index b245db8d5a87..e4ffc47da5ec 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -14,6 +14,7 @@
> >  #include <kunit/test.h>
> >  #include <linux/errname.h>
> >  #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/mdio.h>
> >  #include <linux/pci.h>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > new file mode 100644
> > index 000000000000..700504fb3c9c
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,74 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Firmware abstraction
> > +//!
> > +//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> > +
> > +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
> > +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> > +/// firmware is released once [`Firmware`] is dropped.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> > +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> 
> Wrapping a raw pointer is not the intended use of Qpaque type?
> 

Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
the boilerplate in the 'request' functions to some common 'request_internal' one.

