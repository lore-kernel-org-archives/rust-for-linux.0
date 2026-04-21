Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633433DD526
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801960; cv=none; b=pb507fBNn5FYIo5+URcDdh4drw+pMQL8JAo0mEN3L5Id8JZbYbe19k+8rS8OE2jLS6hQMugHT1wt+R8nWa5jJe2O4htuz3Hs3q0KkZPLfQtLbutukITPmt4SWZYWdy4+N0g/4qMSgq2RHy/yXG+0S+VYrqnGQ+XhcNSUQk7i2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801960; c=relaxed/simple;
	bh=Y1PLoj4e8iOjKgpTO1Z2p5qecvDaS7epvI5R7dinmlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3O7GMGqD5JtmlkwB7O7LymG1ioE0aDe1xKluywvnAX1N4C7KvyLNj8kysDMm1Roc+BIu7A/EafEm7gpA1t2aUrWZb9tU/6zU0sASXyBQZR2y5wJLpOP8QKHTZcvT8Kurl+hfOIojHL4O6Va8ptJpRMzrUZL9MHgDmryl9XjD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoV7lu20; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoV7lu20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776801958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
	b=EoV7lu20ntBKLDClQdpt2peq2sIZRyEOKzWNkVjJpneX3pGw6QAzPSehGaus/yOSg6AEVu
	D/tEGMzlhIrCQvxMW5cORvUxkp7hRlir3NUkfZ37hMfpPqB68KIIckOCzpDzigdkhsrWWO
	cRhOnCD6zp1OBHBI54qIExVsmBUbPXY=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-15g3sy4VNcmWHTnza3A2CA-1; Tue, 21 Apr 2026 16:05:54 -0400
X-MC-Unique: 15g3sy4VNcmWHTnza3A2CA-1
X-Mimecast-MFC-AGG-ID: 15g3sy4VNcmWHTnza3A2CA_1776801953
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d8c521be48so3737842eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 13:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801953; x=1777406753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
        b=RFHrQIfGCRBkpJ42Ru6iDhUKOO7dXjuZw6Oi/FpyAw6IQqaPGcOKAxmiJAPI0SEQyO
         fwni7gSpPaTKGMiFRTozAZ0S5q5R7QRGtW8IoX5O3qRMiPoeOdkLVdooqJqfnMoILnmz
         0rHJs0mN5+CImQvE/CiNXpNkT0hSVQsWLNoQD5t38T31D4YRTbtPIR8vldxcJOY6n2Gq
         TotafHX4OMk0gxpq4Elf/8wUTKXLPI3lB5Htx/PFjkRc/gHpfoQ37C1kINQ1Cz11/Rit
         2PaQb8ZpgHdxwEeuFZf5hXO4dPcdJ4iuH5AEJZi+4A2gmt7KAGHqy9hTWBccjWNCSlzX
         9Xww==
X-Forwarded-Encrypted: i=1; AFNElJ/e4uL0Re0gjS+CcuA3SeXbB1HzkoR5+yvfBxOOwU/TXROYbSz1+T+vLS+oBlUnFLOLE/1XydNgx9064xFMYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylZcM8FyYCVDzW6n3be+jsxgAeJLJ1zXcXClkXxwVhb8zHFJOL
	7jY3tTg8clPb9lObzlpS+L2Vdij+onAf+tc3uGoNa5+2yCYdSDbUIxDtAiyFS8VOzSlGEu/2fIx
	pPCcs9Ywg0NKHuCdgE0msbinhx39rZnnFdNjaGZCho+wEqN4heWtTPZN/oV054WOznvbT6ZRYAU
	VTgiwroDbR4Yz92caB0pP30y5/KqeR+lUBhfw57o0HaFU=
X-Gm-Gg: AeBDieuYlfL2/90y91wF+EdJz6GzvLKERBUvR/k/Am6P412e8LKrT9EMBFFAsEAyhg7
	AEpZbKyhVMmwTudP3TSZly6WNDd1PJEfyqavpIstzkThsLkNBvInPavVEnJDErgVdj1zG9QTgjs
	5IHY9pucGRU6fCO2jKs770uAsaJ62QYkvvgCVI+7xIe8xbAR+2zcOgPNt+K2kP2rGiRX3KD2N1V
	VjifmMPWBJElTQjyvsZt5GmasUD1t1kcNzllt0Qxr7Uqrc=
X-Received: by 2002:a05:7022:e985:b0:12d:b2ca:a9e9 with SMTP id a92af1059eb24-12db2caab80mr2009978c88.8.1776801952719;
        Tue, 21 Apr 2026 13:05:52 -0700 (PDT)
X-Received: by 2002:a05:7022:e985:b0:12d:b2ca:a9e9 with SMTP id
 a92af1059eb24-12db2caab80mr2009922c88.8.1776801952185; Tue, 21 Apr 2026
 13:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
 <20260415210548.3776595-2-joelagnelf@nvidia.com> <b0c5267d-ea77-41c5-94d4-39c651761b3c@nvidia.com>
 <20260421145521.GA51176@joelbox2>
In-Reply-To: <20260421145521.GA51176@joelbox2>
From: David Airlie <airlied@redhat.com>
Date: Wed, 22 Apr 2026 06:05:41 +1000
X-Gm-Features: AQROBzAsZiSzIuFbaTfYEhScUqQNnqcYEoqTT_Ur4O9PkcMB0Af7pJH5n1PBSF4
Message-ID: <CAMwc25o2qmaYnfsh-cW4M4PEbmpYb_1x4qg1_2155P0orzCnOQ@mail.gmail.com>
Subject: Re: [PATCH v11 02/20] gpu: nova-core: gsp: Extract usable FB region
 from GSP
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Nikola Djukic <ndjukic@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fuHm4O4QRT2ymJSFjz_3Pew-kpEimKOrJA5RRitTGzY_1776801953
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:55=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>
> On Thu, Apr 16, 2026 at 04:26:48PM -0700, John Hubbard wrote:
> > On 4/15/26 2:05 PM, Joel Fernandes wrote:
> > ...
> >
> > Apologies, I found one more minor thing, while looking at a
> > subsequent patch in this series:
> >
> > >  impl MessageFromGsp for GetGspStaticInfoReply {
> > >      const FUNCTION: MsgFunction =3D MsgFunction::GetGspStaticInfo;
> > >      type Message =3D GspStaticConfigInfo;
> > > -    type InitError =3D Infallible;
> > > +    type InitError =3D Error;
> > >
> > >      fn read(
> > >          msg: &Self::Message,
> > > @@ -205,6 +209,7 @@ fn read(
> > >      ) -> Result<Self, Self::InitError> {
> > >          Ok(GetGspStaticInfoReply {
> > >              gpu_name: msg.gpu_name_str(),
> > > +            usable_fb_region: msg.first_usable_fb_region().ok_or(ENO=
DEV)?,
> >
> > OK, failing out is correct here. But in addition, we should also
> > log this at dev_err!() level. This is rare, surprising, and actionable,
> > so perfect for that level of logging.
>
> Sure, that works for me. Will add it in for v12.

Just fyi when we get to spark later this will not matter, we will have
no usable_fb_region, though maybe it could just return 0s in that
case.

Dave.

