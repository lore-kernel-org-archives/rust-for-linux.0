Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6446D547
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057021; cv=none; b=dKZqx6BJj5VIlPyj/hEcDjnfjaJruo2QWezFSnixK8tMFobGUBzwYAlsuvpbIyBmdHxoiqN8ipKgj0FnJCrbl+vs5SMAMwCRRSqLWbCUBo93T7JkbhRnoqWTP32BFF6nqN9zVlkXBh5tkhePk+Mqd9CZej8xovuiGnH4m4NtsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057021; c=relaxed/simple;
	bh=KvVSYGZR4H/ph+5AJPdcVXh8oAtFOdEboWyWMQxt8io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gynpFUWKLG4MNvDtvvMwawwwUnBcFQbDsRiaL53FX0+u+bhULip1LV2lm9n3ZxgxE4M+fgUKJjAZj0s/4PMV2I5SMvHLT2DMgPiRo7CBhjVaY0YfwmpumhlUpYLkjElTjqOJOjxp92J4N4mOwNBVxdl/Em1kVbGx3n63gh548Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2RqQeKv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2RqQeKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787057018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9G3iSxs63cmwbUmYiEX69zc+tabrPwShtlbbS8QAMw=;
	b=M2RqQeKvA6wPOmv6JTiZRZpVpuHMfdnBskO2iqrlGVvHmy9xjOEWGZn7c2kX6BzEDL7CDs
	U7TgNUTg5qC+pWDXE+Achb/YYWVClXoN7Dum5VM7bcxfSN79h3RHuTs4T7Wj3Lv+qXbjTH
	Nb1QJE2vB1hmPqD0yBmSDuW+9leMXB4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-5PSoSMYOPTSdOBX-JRd_Eg-1; Tue, 18 Aug 2026 08:43:36 -0400
X-MC-Unique: 5PSoSMYOPTSdOBX-JRd_Eg-1
X-Mimecast-MFC-AGG-ID: 5PSoSMYOPTSdOBX-JRd_Eg_1787057016
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836d23866bcso68944657b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 05:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057016; x=1787661816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9G3iSxs63cmwbUmYiEX69zc+tabrPwShtlbbS8QAMw=;
        b=V5ssDBoHM6mWKBLSP/wfZ7UeWtpuYE1LCubdzmhbNw+rUhhLEF9EOe7ck1EL+Cixl2
         DpHvs4Up4PTsVbc60pkjLu2fIT2k6S8UDhve62sViQHMijvIJwW2R63Ji0EC+38NqSNu
         fPlcf8vYnglS1xgCFuY9VmnLv7t0wZ1XckO/5FBaQ1BlUU0b37qLAVTmJ9pO6/tytHxG
         mLcLya95Z8kp1b5TShKyP9IREP5uEt+dAHQBIJ0C3c+QzFlXRk81IRwJ2O/XlhQ03uWT
         QyPWllqhvPj/Yc0Ln0Wu8DSfgAH0+SECZnCG8fibfYDmzK68qH9ZIoyoQJY7I4+T7zUw
         Hq3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6o4AtCRUDTBaq1l9q7hejWORMguSZiKQpGH9b9BTqwS01n9QqKHyq1IxMRSZKhrFNuTgQyJaN42qdyw3wlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzebrx1dfyuqtxjNc7u9kJFOloqf5uQn5IeGJJcFU47+U68wrKf
	36oh2BBtHr7wcWGv1EAgkn5uGVGtCnsmSPuLj+xXzujh2Ynvn3IUKBCQ+qjIV9/h6i5u1ZHNfnf
	I0PJwaLNqRzSzxFaa91+EMwDk0ucwf/D3W1RPJcOjXu7zEWKCdp4eUL8svwc9tvY6xA2ni85MTB
	HlDlB9UmgdelfuUD9dhyzMvV9KOGGlbthuzHOmyH8vgX8=
X-Gm-Gg: AR+sD12kgUr/OtAFneAOwrmpT7SHA0ZWh89fpR8MKLd7iclF5dii6eWvquXny7hbOuV
	XeEhRP0gj65E+JHIARWQ+IzaFrzeH57kuji+UJybC4B0cs4BgbVG0KN2fGqDEeTtLa5Rv1rkZro
	otheKescRlue6Y/2OYNznqHxxGLtPi5CF92AmRSBJEqjeJhIBKYx9P9uc=
X-Received: by 2002:a05:690c:6807:b0:81e:45a6:bd5a with SMTP id 00721157ae682-83707af976cmr125335187b3.0.1787057016175;
        Tue, 18 Aug 2026 05:43:36 -0700 (PDT)
X-Received: by 2002:a05:690c:6807:b0:81e:45a6:bd5a with SMTP id
 00721157ae682-83707af976cmr125334917b3.0.1787057015697; Tue, 18 Aug 2026
 05:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com> <20260818-encouraging-lime-kestrel-d0d819@houat>
In-Reply-To: <20260818-encouraging-lime-kestrel-d0d819@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 18 Aug 2026 14:43:24 +0200
X-Gm-Features: AcwNN1Xf5TcQWb8-1dGKED6s68kinvfHK33o_OU_E9S6-z4zydpISHNRJ6-TMKU
Message-ID: <CADSE00JgK-CYnBiCA8aB2tGXG2CqC-zB_Tvz3eU=2ap00th3bw@mail.gmail.com>
Subject: Re: [PATCH 0/5] rust: drm: add panel bindings
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: th6mUeh5EqCEehm3zcTZOOwC_TOxpmoLt8UitO0a7Dc_1787057016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 1:45=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Mon, Aug 17, 2026 at 01:40:45PM +0200, Albert Esteve wrote:
> > This series adds Rust abstractions for the DRM panel subsystem,
> > covering both the consumer and producer sides of the API.
> > This helps closing the gap so that future panel drivers
> > can be written directly in Rust.
> >
> > Background
> > ----------
> > The DRM panel C API has been progressively hardened over the past
> > year (see [1], [2], and [3]). All panel drivers were fully migrated
> > to kref-based allocation via devm_drm_panel_alloc(). Panel lookup
> > functions (i.e., of_drm_find_panel() and find_panel_by_fwnode())
> > were also updated to acquire a reference before returning.
> >
> > Note this series depends on [3] being merged in the base
> > tree. Currently it has been only applied to drm-misc-next.
> > The other series mentioned above are already part of the
> > base for the current version of this series.
> >
> > As a personal note, part of my motivation for creating this series
> > was learning more about Rust in the kernel. I would appreciate
> > feedback on Rust-specific idioms or kernel conventions used here
> > that I may have missed.
> >
> > What this series does
> > ---------------------
> > Patch 1 adds of::Node, a Rust wrapper for struct device_node
> > implementing AlwaysRefCounted. C helpers are added so that of_node_get(=
)
> > and of_node_put() are reachable from Rust independently of CONFIG_OF_DY=
NAMIC.
> >
> > Patch 2 adds drm::Connector, a minimal Rust wrapper for
> > struct drm_connector. Its sole purpose is to provide a typed reference
> > for the get_modes() callback argument; no ownership or refcounting is
> > exposed at this stage.
> >
> > Patch 3 adds the consumer side of the panel abstraction:
> > - Panel wraps struct drm_panel and implements AlwaysRefCounted via
> >   drm_panel_get/put. Consumer lifecycle methods are exposed as safe wra=
ppers.
> > - PanelOrientation wraps enum drm_panel_orientation and provides
> >   from_of_node() to read the "rotation" device tree property.
> > - Registration manages the panel's presence in the global registry
> >   via drm_panel_add/remove, decoupling registry lifetime from
> >   reference count lifetime.
> >
> > Patch 4 adds the producer side:
> > - PanelFuncs is a #[vtable] trait that panel drivers implement to
> >   provide their callbacks. All but get_modes are optional.
> > - Panel::new wraps __devm_drm_panel_alloc, returning an ARef<Panel>.
> >   Registration with the global registry is kept separate via
> >   Registration::register, following the pattern of drm::Device::new.
> > - ConnectorType mirrors the DRM_MODE_CONNECTOR_* defines from
> >   include/uapi/drm/drm_mode.h, required by Panel::new to specify the
> >   panel's connector type.
> >
> > Patch 5 adds gated tests, covering data type conversions and layout
> > invariants.
>
> So while it's definitely welcome on principle, I wonder if panels would
> be a place to invest in at the moment
>
> The series
> https://lore.kernel.org/dri-devel/20260814-drm-bridge-every-panel-v1-0-19=
cd5277cc8d@bootlin.com/
> is likely to move every consumer to use bridges exclusively.
>
> https://lore.kernel.org/ksummit/0fa2fb42-0714-49f7-ba43-22928e1dd488@lina=
ro.org/
> raised a discussion that the panel API is very limited at the moment
> (while the bridge API isn't, or could be much more easily extended).

Thanks for sharing all the information and links!

>
> This is supposed to be discussed at plumbers, but I seriously think the
> outcome of that discussion would be to just deprecate panels.
>
> Bridges would be a much more long-term-proof investment.

I picked panels because I had recently worked on their refcounting
improvement efforts. And even though I saw some comments in reviews
hinting at what you pointed out above, I did not connect the dots.

I will certainly pay attention to the discussion at plumbers. But for
this series, I'd be happy to drop the panel bindings and switch to
bridges for the next version.

BR,
Albert

>
> Maxime

