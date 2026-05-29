Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E334DB6D
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 01:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016452; cv=none; b=rTglHCGaQ/7YFA0r8x1+RM++VqbH5ShGcZHG6kEcFSsbdm/1wlcwxwl2TSvK500yXk3iLIPd+nFw+YevrAohPmIbpErz55ESiTf6mV4YvLkkklZXmOWkGcq5yvx1CjHAZLwJy2HerMO6Gex8cvY5w+tyrej/Wue06BzVRRDGQDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016452; c=relaxed/simple;
	bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kEDj5Z5ucRlpWCknwGrKmy8GAL5DYz3aocu1kES5ZFKiILgU+IK658gui74/+kQFof8Izak0xjDM/ta2rbcNEQ0LmFemTWujqxUGqIdyrTc/H1W16k8KVXuX8xF4iaTJ2Glh+mLtCfNHxjuBhO7CmAINd1dyjeG0yUJ4O6lPZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/SWR753; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/SWR753"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780016450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
	b=P/SWR753vyNJQ6KMRgt/BkWurGoeEtvUt97RkjoYNX2W1GKBgUv/ncfDvGudt0Vurjs0uu
	rUjVGXL5DWapsyYH/nPRP5UqaTD5B3Aa3c96sjhlytQGTxkeo/tOrKcg0y2egJM4DECReR
	9le6iVXqGWayx7I5nDNulm6TGSJruS4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-l8PO8Ny5P-C3LRZ1bJAvlw-1; Thu, 28 May 2026 21:00:47 -0400
X-MC-Unique: l8PO8Ny5P-C3LRZ1bJAvlw-1
X-Mimecast-MFC-AGG-ID: l8PO8Ny5P-C3LRZ1bJAvlw_1780016447
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516eaf9fb76so108219891cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 18:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016446; x=1780621246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
        b=Q+rY0e7iBofqjGBn1sO4/Lw0u2iuMn6yTVRlfUWRCidpq3obEBZXoSPb4F+VXMlDP4
         Q4QvYUb9Ocsr+iu81OpLs8U4kUe2PqoKKGhZGHviOci8hRNI7p/3/GsV/HiRowvXxWCQ
         UtdSNZne9WOB54IsYKx7TcA1YJwhQXpeQbk4pp7IPDBhyhJTSCAvpE2e7avi8nW88W8o
         BnU9uHP4+GXnfowFm0+LmnmKsSvDIDvOVsn7jpEsfHHoeG7yJCQJkpzyPB+TKTkJ8fzd
         avQiSxAb0UZfMdd7BM1Kr08UVhjPQr/tkGK0fei6Y0HmQdGXMhy9XKvA+IqwVnkn0114
         vEDg==
X-Forwarded-Encrypted: i=1; AFNElJ/r+1iohBrE2HjKzqMPm9TPvin59Y4TuvVwuqwIOe6tlZXxvZKmMZgqOHpS2hskpk5k7NCOj07XQtfyWIkbkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGG+OSRdBBU1uidyEVuNNT2sdpXmhiqQABNRTAcss+ZAKNr8kP
	PJg2GDoJksNb9pZi5omQEO97uQ/Yj5VVYZj+6m8BXlrDDJ2R2GrjOGbIo54L7NtrYvw6DldiRAP
	5fiRi6p3mMZVefx1zZ8fHRVKhhv98lBo2k2qicstS11HEBaGDZrkLk8hXguZmQ9IYm+xRiyJWcT
	f+
X-Gm-Gg: Acq92OHRO60LhVhK4JQCWO8UqWigwFF1QURHfqsaLS5OumHqcziCn4C7V7Us8iD0Jc0
	aILILYVxJ4PAXdDhNN+K1mTzbR1XAUpWKB0jfxsyPU9250K/oipAtyuSGiJO5mwYBfhgG5TArMT
	uZTNEaQq6DEdKR7QBdMG1qRBF9RfnKfsu5iel6mgUr1pywTvRoUKBwbOU5rygpPpCjAezILrH45
	fbkd0ad8qsJ+TvqqgYThuNlTSZ1Ynt7K46Niz7ItExfnZIKIrLC4eYi9/EBpx9ppNJcLvVJJyeF
	iMY5ya5+HNg0H7JO6Ks6lkr6r349scYk+Cc5yK2ONd1MwQlLYG+xIQLUHn8Wiuctxn6uJBLlquj
	S0wO+3ivVFbOvKzSPOqTqyrjhUJtf
X-Received: by 2002:a05:622a:1b2a:b0:516:dc50:a01a with SMTP id d75a77b69052e-5172dc1e44dmr12443021cf.5.1780016446494;
        Thu, 28 May 2026 18:00:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b2a:b0:516:dc50:a01a with SMTP id d75a77b69052e-5172dc1e44dmr12441761cf.5.1780016445788;
        Thu, 28 May 2026 18:00:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5172e9a5034sm5068741cf.6.2026.05.28.18.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:00:45 -0700 (PDT)
Message-ID: <066ef2f147aa7b568d31983b8ba4427c3eeeaea4.camel@redhat.com>
Subject: Re: [PATCH 3/6] rust: drm: Add RegistrationData to drm::Driver
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 airlied@gmail.com, 	simona@ffwll.ch, daniel.almeida@collabora.com,
 acourbot@nvidia.com, 	apopple@nvidia.com, ecourtney@nvidia.com,
 deborah.brouwer@collabora.com, 	ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, 	lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu
Cc: driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Thu, 28 May 2026 21:00:44 -0400
In-Reply-To: <c393d06629007dc9fe76224d7b8a594b10c07edf.camel@redhat.com>
References: <20260506221027.858481-1-dakr@kernel.org>
			 <20260506221027.858481-4-dakr@kernel.org>
		 <b1865396f13f67b600f3548caa8ff907cfee9403.camel@redhat.com>
	 <c393d06629007dc9fe76224d7b8a594b10c07edf.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uvjNcQRgyVe8GGo9zYmMHHBzTptmo0xJ0u4CFxjGMT0_1780016447
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-28 at 20:15 -0400, lyude@redhat.com wrote:
> FWIW: now that I've noticed this, that might simplify things w/r/t
> what
> KMS needs here from DeviceContext and allow me to go from modeling
> DeviceContext around 3 stages (Uninit, Initialized, Registered), to
> just 2 stages (Initialized, Registered). The purpose of having a
> separate Uninit and Initialized had been to workaround not having
> access to `drm::Driver::Data` when a driver performs an atomic commit
> before userspace registration, which would be a big ergonomic issue
> for
> implementing a lot of atomic KMS callbacks.
>=20
> But if that's not an issue with this patch series, then it probably
> makes more sense for me to respin that DeviceContext patch series to
> reflect that since that simplifies things a lot for the KMS side. For
> your patch series, it just means you have to replace "Uninit" with
> "Initialized" in the next version.
>=20
> I will send out a respin with this tomorrow after working on
> respinning
> the gem shmem patch series, since that shouldn't take me very long at
> all.

Actually - after working on it a little bit more, I think having the 3
states (Uninit, Initialized, Registered) is still going to make sense
for KMS. So, I probably actually don't need to respin/change the
DeviceContext series from how it is right now after all! Sorry for the
noise :)

