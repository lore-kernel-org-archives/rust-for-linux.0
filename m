Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68F330B3B
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776455160; cv=none; b=q3Ccj5mf9hr5Z4OIZyB2OrqG+T0TfzouV66wZ3UXdIgDJPEbhnRarKr6CuNWCxOZrRdWyxhELiZPTQZj8uGmMZBHb4EpRj7zhOsMN7E5Do2lgIsacI74M9ql2EfI1KB0HJoICJzLFLk++Vpw/F4QdNcQDSL4mrkLSQ3nC5EkqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776455160; c=relaxed/simple;
	bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUH9STrLk1JxAo3YlkcHn+0AreY2nI3iX4HcxBvA12lXtdcfF9CD5dWHD+GnC4cCXUzL+BeVWK8dq26pJF/BAIX2qZh5UD/hN7UoHYCGHD7u5XY+coE+4ADjhSbmzTOOQ7VQC3b/FJMINkhsmtawaRDTOr6yCTNdYCUIbRHS7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jx4ahSJ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jx4ahSJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776455156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
	b=Jx4ahSJ7BogJhhKDxUjAmYdeRiJe5ufGIP4fT8PnYUG3fM98EYtof1mHDEg0fjP/K+kpVC
	QGZrR07kF6u9T/2YSTjYaua6Ngaad9D2aaVyFiZrubPuRwNRtpoN0kVs/lCgAY2w9IkcgG
	0Qy0OJR7fvreYy5QCvo5MeaxfSgZAg8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358--HkbqXTSOZq1DZZ6U8yOrA-1; Fri, 17 Apr 2026 15:45:55 -0400
X-MC-Unique: -HkbqXTSOZq1DZZ6U8yOrA-1
X-Mimecast-MFC-AGG-ID: -HkbqXTSOZq1DZZ6U8yOrA_1776455155
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d63962d83so25372721cf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 12:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455155; x=1777059955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
        b=ATer+r976nC6Bhkkt7XigVSSk76cjBtyAhXAFZjklRkzGLxR0XJXWpamcXajfppbeQ
         V2H1LtqExi2BhOdnoNywBhY9OG/j7RPfR+uEORC86wViDJZxsro0io+PcRs8081Z/9EU
         ZZXZdE9m/xd2KWXhMAUcSD0pAP1hY/YWLwdy7u8MMzzGP+2++4nEbidYur98/JdLdW8/
         65sEAF2d30G345XvH/mVevZbi5MkR8w92OMWduH4PkvSfqSWznzlrWAMwzbKqo9nWyrO
         DydCxAcy6Uc19uapMP6xdxseafKDgw4pOLMkYeYK+zXW+TufEFlGkNHQYzoRUpBOa3BB
         Zxcw==
X-Forwarded-Encrypted: i=1; AFNElJ+pp8li0Z2go6w8MdoYzWdktGNPq+BCXykX2EZa4LDl9AJE61WN/ARXC6e48/4nSrMermWoFMDXcixuk0mRgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJodTfdupmlosJF8W7e4y8f5NOdekzXcRigpR4Z75iTkzrlKv
	GcuHUbG0FT6O38kJxBiTz9sS3YMk4q1lWQf0RY4S4gbxi6GXcoTeNlaftUKTkpXO7HZSJ3aEmy4
	PLpuR0qmdCloZUC59zdkv3ooVxh6TZTGKqI/EANfHuucO2AywZK83+FE/XZVOaaz7FW3w
X-Gm-Gg: AeBDiesTenx6UQCMnalfkwjqCLsAWckWfJbrJw9FQ7TAF6vN0nunGWLvhprkukcQSPO
	3hnnocwnxGJh4oqi2QJt4EJvC7uQt9Du2FcW7i8czlj62fKNdqpP5UT7D7IoGoVDymlDbmIMCou
	zdWprUVZV1ZjkoxGEmhwjaJXHBXGypNmbEpjNcadrOein949tGut1ffPFpqVHOAvMt3Bd3Z6eNB
	+riVy6f94mdGud+vU2KGCn9Ea/Lrz4zU0V1e7VF1NUVVDGpP7AdGaDte8XoAHTfaaNXrQuTQIb5
	8+ogFQ15TdYj9LhSX4FHtxOlIORa/Dbc7zMzVG/mtvG0EC9xDYEShwmfymQad/KEoA9+2EhMyG6
	KZigtx3oflNr/a5JsOeijfhAvHaq1
X-Received: by 2002:a05:622a:1189:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-50e36e9c0c7mr60319511cf.36.1776455155146;
        Fri, 17 Apr 2026 12:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-50e36e9c0c7mr60319041cf.36.1776455154662;
        Fri, 17 Apr 2026 12:45:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae97347sm18023616d6.41.2026.04.17.12.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:45:54 -0700 (PDT)
Message-ID: <34695156e1db9195eee105bcfd89b554b6ad32cd.camel@redhat.com>
Subject: Re: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 Matthew Maurer <mmaurer@google.com>,  FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, Miguel Ojeda	
 <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter
	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Boqun Feng	
 <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan
 Rai	 <prafulrai522@gmail.com>, linux-media@vger.kernel.org, Shankari Anand	
 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno Lossin
	 <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Date: Fri, 17 Apr 2026 15:45:52 -0400
In-Reply-To: <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
References: <20260409001559.622026-1-lyude@redhat.com>
		 <20260409001559.622026-5-lyude@redhat.com>
		 <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
	 <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BtQz598mgzx-zOcivCgDPom_QajLqAfPZsy17X7OWL0_1776455155
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

...realized the moment I sent this I meant to say labeled block
expressions, but also I realized I won't need those either anyhow :).

On Fri, 2026-04-17 at 15:44 -0400, lyude@redhat.com wrote:
> Just so it doesn't come as a surprise in the next respin - I don't
> really see a reasonable way of using get_or_insert_with() here
> (though
> I had no idea this was a thing!). However - I can get rid of all of
> the
> ret =3D statements and also clean up the indenting a little bit with
> block expressions as I forgot those exist.
>=20
> On Fri, 2026-04-10 at 16:55 +0900, Alexandre Courbot wrote:
> >=20
> > nit: let's use `let ret =3D if let Some(sgt_res) ...` to avoid the
> > multiple `ret =3D `statements?
> >=20
> > Or maybe even better, you might be able to use
> > `Option::get_or_insert_with`.

