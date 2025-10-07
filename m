Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53716189F5C
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759834924; cv=none; b=dQXICZfn5V38XCcN9nIUkViXgsZb/HSK/3WUYYNcJ4rN9kqiQlI5mSzXaJB6mQcsWB05p0MNji+tUmVz9lQehz33FYjQLCWGpvsU4Su/iOq48onOevE1RxPtbG9FnFB73I7UENXmUSUQarVLa+mz4UVWH+FJdEs33v/d8MijpcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759834924; c=relaxed/simple;
	bh=PGrje0/KPcBzP7FBajz2RGg43sKePjZezJXaVWwAgdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PWzSZtkAvSf9AVghlaRcXU0XinnaeE6nWTkQRoX+Rfsk2fbbWSQ24jtbSnO2zlJoxS42EoRfYZHGj2k+kDqPNrhEq4d+SMfsb71P4PRlPAJwzbKluvdmGw63nn92reI51WHSm20kCjP/AbappeCpghZGyiGi2hXhnwiTXt5ppyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qtdQFWnk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qtdQFWnk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e4fa584e7so24961545e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759834920; x=1760439720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9cBFNjFEfAJOD01Katg1TkGcbRmePh4iGouqwbxQ/M=;
        b=qtdQFWnkvjaCHxSjSFWwWdE+GrvK1DOda41bdgGQmQO7lTZDOeEMLlu2gSS7EbFAW7
         uSbTIgBTCdbFIGEkkGLlMoUxnRUBCk7nXOBgYJbv0Eu1GHvjf6r+XoA7Mv3hu+MLxfH4
         Y5cm4NgAtti4LKhzhStjXWjoXr4I3MMXromgcV9R1XkgV7eosmkaMVzoWkdM1f1tbT/i
         ZbMMMb1bnD+TdLRnnfxjXQOK7ssmwUvUk6ZithjSTZhpoaGWvNaRzWu/Vz4wRO2B7ARa
         5VcAa+xuxzup6zkudEdhOwzvnilz6k7TQS6Y9yGFZIlZbpickV0wf9QrsrX/orM5M7tH
         NZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834920; x=1760439720;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y9cBFNjFEfAJOD01Katg1TkGcbRmePh4iGouqwbxQ/M=;
        b=GxXYK/c1vG+tZmIXDTghyq20EMsu+vPcWaA2fCAfbshtO+ekRFn7W1x1QBDay/zgPU
         +5UWJwOSP8sQZ3oHHQXBJZI8KIRVF7f9ytb1KENIYjpyWEYaafwxSFmECKflEjdDfeo4
         a9hCozASvH4V5F8p7MJdQs5JnzHFyadeeu/75NZ+vh4i7SPHfamZnDv9IbqQPEDryOUD
         8+73Y+hVI7CDwuYnHSZifI4G5a9mD4edGFfSh4CWlAcCgEWwGkMTCM4XNVUrpvugjMJL
         UN3t3HJfPBZpwxPjIDEuceOBd3uAL85iiLwAbT1eEdVfRdydO2EyoZA4h5genVkJ2Hu/
         zOPg==
X-Gm-Message-State: AOJu0YzPzrn40zGIWXrjRBpfM8llf1sKU+kz2XFqRrf82WF5bd1XY/VF
	1BMjEObqZXdmpfnCKYFNA2Iq3fH0j4kVCXLZMbNzKSUw8OB6VvokpVwZulmnX7xnqs4mgNNNS6Q
	13hprEaAwg4Pk89J8CQ==
X-Google-Smtp-Source: AGHT+IGqz3ZqJgw9/rCFGmf6rNjZBgL7PkKdsRmGaumcB6YPyLXFLZRDLyxgYqnJue7uO1W7N4GVYLSQ3L7x1Ww=
X-Received: from wmna4.prod.google.com ([2002:a05:600c:684:b0:46d:6939:1b46])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c9:b0:46e:4341:7302 with SMTP id 5b1f17b1804b1-46e71155b8cmr95460085e9.34.1759834920610;
 Tue, 07 Oct 2025 04:02:00 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:01:59 +0000
In-Reply-To: <20251006163024.18473-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev>
Message-ID: <aOTzJyLA49xdckRr@google.com>
Subject: Re: [PATCH 0/3] rust: xarray: abstract `xa_alloc` and `xa_alloc_cyclic`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2025 at 07:30:21PM +0300, Onur =C3=96zkan wrote:
> Initial version of xa_alloc and xa_alloc_cyclic abstraction
> patch series.
>=20
> Onur =C3=96zkan (3):
>   rust: xarray: abstract `xa_alloc`
>   rust: xarray: abstract `xa_alloc_cyclic`
>   remove completed task from nova-core task list
>=20
>  Documentation/gpu/nova/core/todo.rst |  8 ---
>  rust/kernel/xarray.rs                | 82 ++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 8 deletions(-)

We should send xarray patches to the linux-mm@kvack.org too.

Alice
