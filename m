Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCFC21FF5A
	for <rust-for-linux@vger.kernel.org>; Wed,  7 May 2025 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605058; cv=none; b=ElNgZG71chbuJHRugCPgb4TyiyyypaAzdoKV1tKlb/XlE4j9gUaN8OoDB3U0Qf4i344jN2ZtJz66Uu1yW8+8kzeQxlz9L1wtkvQWbaCgpirN1MbGpxOLzIrCl/1IZW/wuv2cROS2VKTCXUFxuDat3eQ+0F0W/OOR2CMJEAPmnMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605058; c=relaxed/simple;
	bh=KaqL+wXiWuFD5PVgN//2x9Uy1IykRrC4KAlo3OQSS/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B/eitsLwJny80M7FWh/KKZYJGureMN4y3ovPOi+gEbSVRIJRiImka+6B9o4qN59GtkeWD03PMR1fWUT4hiL3ohsIYJ8EOh2LTWytLY2ww3rIzYO0LESBwogT6fdo2djMPf09f+aUry2xWoc6enosS/Y5jf2NXwNN6Ql74yWrbLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TimkSsfb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TimkSsfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746605053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1L9rKyoo5gafZgxfVF9TUdVkYjAT0uCnIxL4ynrWXso=;
	b=TimkSsfbxHMq+DaK6atPGWLJl/jjqNQIlORIrd7YidjpWkCSCgaWMDtGIOJpT108UM4P64
	BB0Aa4Ni26q0SPBgercaX5qPdbLQdbkLjvbsOTp2OcEYNz5YTUkqvKoJoDry/zGc8wxHPm
	YJJLFgjzNJZYciB7MlCeOAiiqQuI8Zg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-1KsxrilINg2hyR1qzBgu1A-1; Wed, 07 May 2025 04:04:10 -0400
X-MC-Unique: 1KsxrilINg2hyR1qzBgu1A-1
X-Mimecast-MFC-AGG-ID: 1KsxrilINg2hyR1qzBgu1A_1746605045
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso46397245e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 May 2025 01:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605045; x=1747209845;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1L9rKyoo5gafZgxfVF9TUdVkYjAT0uCnIxL4ynrWXso=;
        b=XRlyBSTZ9o26OIJFefIcsenM2IotELpoNBqjVLGOqG7s3VRtsHpWLMRltq6Ic66vvy
         UDf8S1eoNLwFqHhMB/g6PupmLFYpgzB8U94xL5Np3GcsIw9w9hnALdQtdEILj7VGCUWH
         OzHUVWIL62XqjLB4//IZj6IosTqVgk3hX0CbhssoDhMHs6GUdIHjN/DtUuWLNOR2zNRz
         e2NejNalWoSYufH3/dTHunZqVeIl4Wpz9c/C9nktk6o2mSxKRTKLJX+G2KYVdz3K7S78
         a/Tj0uYyqZcK0UseEYL5gmjM413+J0WhphqVzr1xngGlMHMjaOgqUwlywXhrUoJwgMW4
         RqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjagUy/YB3c4IWCOuK8ufa0PckiL/Y2EVSPhHc3OgxiYkHUnF/TgfjJLYdhfXJl6re8DoITsN7uTV/+BaXrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCQCgMPhfPsQXIPyr0EE6xEt/RErRcmB1iqwYXFqG3nxomqXV
	Ll9NZY3jKBeIzkb2IJY/CZ5sa/u6ZRXPKEJnLf99u6E/Xx3VKvz0zekBjcRgxGGiXY3SnY0Ktg4
	ozdxrj77Unm73kH0qBVQYbBSe2dvbQxs+q3xIuhiz8Tp7LOCq+aN1roJiaDgOSmOR
X-Gm-Gg: ASbGncvgC36vqXDbW/NXc1jlwFVljIvU8yQgvT+T5nzkBdgVQSMY1eqcLtVCdBUe2xK
	ac+3/U65wAsTS+EmmBY+SBCuc7ntbxltqBexWL33N7UxGSmXWadcg3jj80iom/tOnZCF+24HgVs
	39NeBy+DxvwEde7rfhrQnZMHX0z4uLFxzL/Dz1d9rKPl95+r92haUHO7PMC7JWzguprAzgxUB8R
	vxSot5nJyKh82zWtYMOZ2I3leai+/KyUPhvjFG0K9dee4yk8fRZIsQYbLuoTwq4lZdjLxQuXfxh
	EsMiR5BDe1DpqcAYXohkXNt2br1SgZPdlfakD1kSPczC24Ajrm2bVfuTm7r6T/d7FjJUgA==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441d44b5e6emr16208275e9.8.1746605045112;
        Wed, 07 May 2025 01:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4wUqpShq9lUTv4LL8emvVajX8S6/zH0VVVy1lkz3Elvmc01LNJD4SZDrIMl3WfO7xuH02lQ==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441d44b5e6emr16208005e9.8.1746605044738;
        Wed, 07 May 2025 01:04:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43d07fbsm21881185e9.10.2025.05.07.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:04:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add entries for drm_panic,
 drm_panic_qr_code and drm_log
In-Reply-To: <20250507075529.263355-1-jfalempe@redhat.com>
References: <20250507075529.263355-1-jfalempe@redhat.com>
Date: Wed, 07 May 2025 10:04:02 +0200
Message-ID: <877c2s26fh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0FZGGyh31GY3YpEW6MXqWIuUxV4vROZtrAYBTAhoA4U_1746605045
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
> and drm_log.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

