Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821A1BC9E2
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799941; cv=none; b=E/xlSGMvn0V6hBIwlC+WMy5QRwt5pm7iWRNzpTjMQD+yDJCDC7SQQCptuYWfo48Xl8MGC9SJqDuqyQUol81jcPkJEg4fnTMj3kEt7RTEjuCYBIM6dPHhUXAGZTqy1f9MQQoqlLIlbEii8+vLzCq+I1huPq8ioMuVCzo3OMIvSwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799941; c=relaxed/simple;
	bh=/IeBj9l1DuZvddK9K3ZPSaNn7OyXHfUK2ZfsFM9/Ug4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JkDwjnxVsgAWv9KV2P7Q5EgfItCcIXF0tAtnK7KJTvC0vdzS292hMiLmK81B1EYrQS3ySQYFelj+acHeL64eKpWIU2Xhc37Wnz5VgoTbQGoiX0R/yXN3EgqIyskajqe2ZrRTqVOKKuRM+nV2x6SDD5t210v4mGnK/gspfD9O068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wy3gXymZ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wy3gXymZ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39ee3ef4f0eso381109f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744799938; x=1745404738; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzdgsiFLrWJM9v+aW/iqIUvY9sIWu9H1VS9MicD3j+w=;
        b=Wy3gXymZ9d0o2NqIMK3M+B6r6eeGjQNKvRoQagUg4DRDuC+ipfA9R1GlnW0Q81EniJ
         VXXMzmMS/pGsB6niUlZ5LBF/PgJWE6dljhrCsCG4gE2FwTU9aLtE1KXdFOGEoB1cwR7l
         ILewoQ9ITbxFDZ6g8DEG8CXnKfM3SHB0hWZEUWVk/R2mZzLB6FCFjEFpR0yoKXJ14msS
         avii9qpmSLp3O81Mg0SQAptG7eLLy6tyPsaqwqIpDPC5UcKP1LYizS0ZLVTBcx0V7s8L
         omNc9ktQ7L4YpsjNfRua0ELneRKh3NG5GfO7jJU3/juQyYpVy++ZtQNZVxp25GMreUtb
         D7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744799938; x=1745404738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzdgsiFLrWJM9v+aW/iqIUvY9sIWu9H1VS9MicD3j+w=;
        b=bFXkBkpHT8Gwb5tALcILDX1KwUZlFYBE/0YJlQeuxAFWa6OWrKu4V0eTnmjXIht4ky
         KDgtTRZG2fyJ8DXRQ3GEBcL6UddTyWgz8YrgsMFjxmHS/75AVyxEW/FHYy6JJX4KJdaG
         zq/QDbYs/8/wViXa4AOW3GyITHf5RTPUxOyW77kYMKCZ/oxD5vOLOOKH6gUIcm+X1mW1
         1hkgarJchajPqWq047cFrzwrEz7gtyfKzG/puotNRSxNbv26S4pG9qp0TcUuBGOtJ3lE
         kSeUg9NtZKVK86HHZEMw2mO9njVaGG0G5I885tAqRrRGSwNy8Rks9Nqy+vDzuMjxG0XA
         mvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYe/L1W3ApkilDARpoK4lfcdwifyAryB2aqUtYiaHnzr4wJT+X8Kdfl6U6hOrWEl06DTiXpAmbOihaQZo7NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi4ZK5ppdgg308Y0etiMrPvSMzT8Uznt7FJBiEyr/qqSfl3T/d
	HKqOOV+aabDWWg6gy3cY+l63HaghMRVqIXWx7s87vYNjzonTSnFeJ+V/Qks3MhVjclZ32XiAFYX
	7pIA3sd4shFLqyg==
X-Google-Smtp-Source: AGHT+IH+MEg796oClEqkHXdBLlFKTQFf4k2OPeeqW54iAz/lXVcUBF8U++to388rj0q379XLpqbkQM648datN08=
X-Received: from wmgg9.prod.google.com ([2002:a05:600d:9:b0:43d:5264:3cf8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1846:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39ee5b8930dmr1273487f8f.43.1744799938290;
 Wed, 16 Apr 2025 03:38:58 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:38:56 +0000
In-Reply-To: <Z_5V-uznqkAvrf9p@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414131934.28418-1-dakr@kernel.org> <20250414131934.28418-5-dakr@kernel.org>
 <Z_5M5Auqj2KK-rPz@google.com> <Z_5V-uznqkAvrf9p@cassiopeiae>
Message-ID: <Z_-IwF4hrPUqVqwN@google.com>
Subject: Re: [PATCH v4 4/5] rust: auxiliary: add auxiliary registration
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 15, 2025 at 02:50:02PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 15, 2025 at 12:11:16PM +0000, Alice Ryhl wrote:
> > On Mon, Apr 14, 2025 at 03:18:07PM +0200, Danilo Krummrich wrote:
> > > +impl Registration {
> > > +    /// Create and register a new auxiliary device.
> > > +    pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Result<Self> {
> > > +        let boxed = KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)?;
> > > +        let adev = boxed.get();
> > > +
> > > +        // SAFETY: It's safe to set the fields of `struct auxiliary_device` on initialization.
> > > +        unsafe {
> > > +            (*adev).dev.parent = parent.as_raw();
> > > +            (*adev).dev.release = Some(Device::release);
> > > +            (*adev).name = name.as_char_ptr();
> > > +            (*adev).id = id;
> > > +        }
> > > +
> > > +        // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> > > +        // which has not been initialized yet.
> > > +        unsafe { bindings::auxiliary_device_init(adev) };
> > > +
> > > +        // Now that `adev` is initialized, leak the `Box`; the corresponding memory will be freed
> > > +        // by `Device::release` when the last reference to the `struct auxiliary_device` is dropped.
> > > +        let _ = KBox::into_raw(boxed);
> > > +
> > > +        // SAFETY:
> > > +        // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
> > > +        //   been initialialized,
> > > +        // - `modname.as_char_ptr()` is a NULL terminated string.
> > > +        let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
> > > +        if ret != 0 {
> > > +            // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> > > +            // which has been initialialized.
> > > +            unsafe { bindings::auxiliary_device_uninit(adev) };
> > 
> > Does this error-path actually free the box?
> 
> Yes, auxiliary_device_uninit() calls put_device() on the underlying struct
> device, hence the release() callback is called at this point, which frees the
> Box.

In that case:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
