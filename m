Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08A339396
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037651; cv=none; b=bJugp8/isD9vF9tYD5xkM7nDHy38AvzyJ7hXAWm4u7DfQfLW8LyHpXqyOvvEWY65n2bye+OwXjpg4VMSEkcBBw/JEmYYuVKczG63I0A40hMQoFQj6Gv6lv7N9+xi3aG8CXTH5kY1NgSV6H/R8LdofB8r1bfEhqJ+i67GCfBbZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037651; c=relaxed/simple;
	bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlAkRahqRkSnUQqDU6d8QXxKhLKmWsXGE7me22xmO5M8nXga6lghRuITPAHZBGKzK/qSIyX0eyWoWph4UqAQrA3DwX8tME5y1BxGrjUE1H7ZrqzcWdFPD/kv20zPpDtagnGDvXvV56FNAT8Nc7ovhuUN4+FQvdutOzcwTPOAB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNZ20DWu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNZ20DWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787037649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
	b=UNZ20DWuiEwFN+15v4ASYhRe6pRY6hr94OrkE7B6Agw/auVJJYuFASB96BjWJkcRTtWua1
	moSVtZM+WBqeuV70kT5KiK7UAk1RETa+MjV6cy45f8jcr3OA+BE7ynPof0LNO3d3QwKLAj
	YuH3qAr0LwfoFKHAzmEkSXFPICDJjZ4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-dFdIJegkMtmc3NNoxPH1Pg-1; Tue, 18 Aug 2026 03:20:47 -0400
X-MC-Unique: dFdIJegkMtmc3NNoxPH1Pg-1
X-Mimecast-MFC-AGG-ID: dFdIJegkMtmc3NNoxPH1Pg_1787037647
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c9f68dcbso60703147b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 00:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037647; x=1787642447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
        b=kecUnZbXkC91JAihmRa0KZyW0MdPPUNioMOuPZmKznYUvZ+BUVtrHhAAjwS2k4SMs0
         YVVngg89xgTC/Dn6Ws9XKGRa2QzHE9tLs8jH5Sp2Fy56E8ekD6s91ExcvzlJiOs2KJry
         aSHGexBke6nLTIpYkzCJFjkl2JLwC7UjJEgbW8kmT46N3ywlYIcHFjAktzOpPf0en5m6
         pVoVhYHkY8OwYOdHsTMeBDERUZgrjXdDUksigXsR4yWLbq0xHAU+BJFhU36h1BkmoALG
         pmjSlpbaphstjV1/ocgJBVqHyjtxvEsTQj+W/UXKxA/nTaa6v1o3qpyoCIVdQG5vxfB3
         Dm9w==
X-Forwarded-Encrypted: i=1; AHgh+RrpHslx0m6Ve79geEA/U3/gVFd53Cw9aMBHeA/2JhBwUWbE3o/4X6uWFPYKA0oG3oPotGQqkV9wEnDZUXjy6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwczcFdy7Pp8CSBy+Re3MNZ5Ix4yu6mwb+xw90p3hrL6f3JfHLp
	bSgcdPdU0Wwi64ce7EQQpalwQylRPQRHUshhxKo7mybYx4p+uyO8GNViRY/sy1EfKx/l6fBbapV
	03At2FK4P0pY0k81/EM+RA8e8asS9g0l2WNvNEBI3yVQnBSfqDIDAB1qlzxEZbS+q3qdd0hj4Q6
	bz+rRB4lrN+zFiO/zXhYAYcL0e533S8fjE3++EZfNiv9I=
X-Gm-Gg: AR+sD10a4YJtYkPZWhaVoHo69I60lvY9enlu7YeI/3QekoSyponTW6oBfHCar+gq3KF
	MrwEjmlsN0vFvHzwlbH2ervYEYMkkCN2cBL6Oa3xSbiBr4sDkcoSv7IYvd7ILxyEtS4SlbBRi5O
	MqplPwfpmmGx0fUje95YqTVsk8ZvJv1+OFa5ixCy/AzxDsFd2gNII5bbM=
X-Received: by 2002:a05:690c:e1d5:10b0:81e:6a10:f90f with SMTP id 00721157ae682-8371125d508mr80483427b3.17.1787037647089;
        Tue, 18 Aug 2026 00:20:47 -0700 (PDT)
X-Received: by 2002:a05:690c:e1d5:10b0:81e:6a10:f90f with SMTP id
 00721157ae682-8371125d508mr80483207b3.17.1787037646635; Tue, 18 Aug 2026
 00:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-1-1f974508a31c@redhat.com> <20260817151815.GA757484-robh@kernel.org>
In-Reply-To: <20260817151815.GA757484-robh@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 18 Aug 2026 09:20:35 +0200
X-Gm-Features: AcwNN1XPNBWCoPE2Nkai9E-mE_8PW-Et12-aqT9wAxfp7sMMAA08KesO-xwraw8
Message-ID: <CADSE00Lfh=8CSsadEoiEAd3Ld_0=nphkYGnxNH1v1woNPbF_bw@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: of: add Node type
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mripard@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DHB1c2kHF_Vmnx2VrdkKhLwC2Dyx8dkVUcJj7Zhg73c_1787037647
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 5:18=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Aug 17, 2026 at 01:40:46PM +0200, Albert Esteve wrote:
> > Add a Rust abstraction for `struct device_node`, the device
> > tree node type.
> >
> > `Node` wraps `device_node` type pointer and implements
> > `AlwaysRefCounted`, allowing owned references to device
> > tree nodes to be held. To do so, add C helpers to make
> > them always accesible from Rust bindings, independently
> > from the configuration.
>
> struct device_node being refcounted is a kconfig option
> (CONFIG_OF_DYNAMIC). What happens when that is disabled?

With CONFIG_OF_DYNAMIC=3Dn, both refcount methods (inc_ref and dec_ref)
become no-ops. Same as with C code.

Since Bindgen does not generate bindings to inline functions, the
helper functions ensure that bindings::of_node_get/put are generated.
Otherwise it would fail to compile when CONFIG_OF_DYNAMIC is disabled.

>
> > This abstraction is needed for subsequent patches, in particular
> > for creating drm_panel instances from a `const struct device_node`
> > pointer argument.
>
> My intent is to make struct device_node opaque. We may never get there
> with C code, but please make sure Rust is that way from the start.

Got it. I will reduce the visibility of the raw pointer accessors by
making them pub(crate) for the next version. These are the only
accessors added in this series. Future methods accessing struct fields
for 'Node' will have to rely on C accessor functions.

BR,
Albert.

>
> Rob
>

