Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30313CA49A
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769045; cv=none; b=kTNkdymq1qCAVh6DUsmrWbA1Rol3KjU1LIn/Pcr5sD2EHFOFOQg4bAREhfYrzj5OFZ4u2EtW2O/8dfx/CEiEqsMhK5gHJ2RGWpfnz3GwHp5W4lLc/9OEdUhd7n+Jj8FUTTgLjcoqPmf4qiA8RDAQdTvkQhc1KJqz9RfpQiqeTvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769045; c=relaxed/simple;
	bh=7uutpCNWAahXhInXrsjarJ8XhuURUcRvN4QenNk1700=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjlT4Qs2JFgOJK15O3hejsCZM/SsvDTe8RFN13xUbtlMfBLBokLKoWwskRONtmbnlwN03LpZXSa0MOKYD+cd5xDuA5l4GuFUgOyyBFTBEzbbORbbx/b2XdHK0Dp4dX5a87K75tYpSiJMSzCkC0/2Sl/zecXHlZk9xeQJib32sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7yvk7ML; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7yvk7ML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7uutpCNWAahXhInXrsjarJ8XhuURUcRvN4QenNk1700=;
	b=H7yvk7MLiuBwO6Eu9PSmxbcFc2q8nQxFJ72F6x326gBjlVfU82ayIL1Vk9K29afURwwXMV
	ww4spj8PC3suF2uthz/YscwOUteH/JA+ULa+KKDESWZ7EwDIDZexKw1EaEq+bwexJB1n3c
	CALZtKRZgbhKJV1ktHGzxD2IxX6Gdck=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-oRrSxFDRMRSH3hLsnQlyLg-1; Mon, 29 Jun 2026 17:37:19 -0400
X-MC-Unique: oRrSxFDRMRSH3hLsnQlyLg-1
X-Mimecast-MFC-AGG-ID: oRrSxFDRMRSH3hLsnQlyLg_1782769039
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso17772521cf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 14:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782769039; x=1783373839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4h5QDGQfeC12aIw9GPepcb1Zj6xE1bUvcgth2ziWe1A=;
        b=Q6FV+HCHSMj/BTm7Zt25EWmmFLp5Bqe832ZT4+C9NMboQkI1h/f+5bfLV+Hl/EdcVs
         ZrAmqu8EyLF013xXEhbA3+9bf622jQHfJYbv0J0s85G1PQaWdAkc8EhilvaHgklM+43P
         YwDQSShwzdzty6gntd0VFkTqCZuWZfENUQ8PcHH7f8ku/4UeLtsA+dXSR7N7m0Nl3L9o
         aO3m1q6GNvv+KnV8UmIWGzpcJ72qjwenflzy2lvv/QvrKkB8vN2ZjaTjpQ1SQ/EW0dHk
         14mE2rHSGMQnNf1lc5Qi/PdoO9LOylABlzXdDbX77fIs+IRusHMXqObZaZU2vZFgIso4
         8tBA==
X-Forwarded-Encrypted: i=1; AFNElJ/rCju4HQf0FQG4ZO1PySBaEyl4edOtNb2JPzTaZE0GebFZFJdQWK1KMwURItYjaa1+ScTjNT/9DgLHeLApyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0gCNM0EUAodr/vRV7mBL3QUoB7ucwJfL1vf5PHkeAxzNqF/2
	Rt0Jg35MJDSlvFMxmuuxfU/FxXbW8oEDonnXtLAu62Jo9OuFlWKbPB7Q4cuzG39QqWag6NI3sHW
	Oz99dJZARFsQnfT1hvzzjtIFugLsYTdi1NVbKiLh2uqEs1cb6jN7LTHbzKTQQ6K5D2bWrl174pD
	Z6
X-Gm-Gg: AfdE7ckYeTJjeOtSNLtAsA9ewQ4cCiSsA4zJRjRbkTg7/TZdT574LVV7kTMj0YkytwG
	Y6YQnveDCal/WVY3/JxymSI+fE3WB6N/8bbA9PNPeigB/exu2LX+Kn+PoR5cIlc5ehTYHE1sOVN
	50v7pbAXDWcwpWjodwbWSzG3klUqSp+RK8C29zSORd6IZ+xPo9TjEjHSqpUS+Gx3bYh1wzZiR50
	2gCcOf5Q3Xw1p6HoPMjg3C45ldbAuGl6W18TDvYYtffaJ2Sn+UgE8pBDTRK+Nphxn/vQH7b5lfx
	KFHyRAGNWCjHTUPMq9gk/K3sHtFMkQhP3IOOrQl44COCHvFG3Ybu4MsQkkdrd9HCbVsWyVE81K6
	mq3CQcXU=
X-Received: by 2002:ac8:5811:0:b0:51c:1d9:e95c with SMTP id d75a77b69052e-51c10716e14mr16825901cf.5.1782769038941;
        Mon, 29 Jun 2026 14:37:18 -0700 (PDT)
X-Received: by 2002:ac8:5811:0:b0:51c:1d9:e95c with SMTP id d75a77b69052e-51c10716e14mr16825551cf.5.1782769038320;
        Mon, 29 Jun 2026 14:37:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a69c25absm7952766d6.27.2026.06.29.14.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:37:17 -0700 (PDT)
Message-ID: <88003b81e8dc83f675ab94280409a1202a0c2959.camel@redhat.com>
Subject: Re: [PATCH v5 16/19] drm: fix race between partial
 drm_dev_register() failure and ioctl
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, ecourtney@nvidia.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, 	lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, 	deborah.brouwer@collabora.com,
 boris.brezillon@collabora.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org,
 sashiko-bot@kernel.org
Date: Mon, 29 Jun 2026 17:37:17 -0400
In-Reply-To: <20260628145406.2107056-17-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
	 <20260628145406.2107056-17-dakr@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IboTMB6lgPT8T1tS-Ve0NUzlmWnkc9CGb9YhX3LHJfs_1782769039
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-06-28 at 16:53 +0200, Danilo Krummrich wrote:
> If drm_dev_register() fails after registering a minor (e.g. render
> minor
> registered, primary minor fails), userspace could have opened the
> first
> minor and entered a drm_dev_enter() critical section. Since the
> unplugged flag was never set, the ioctl proceeds while the error path
> tears down device resources.
>=20
> Fix this by introducing drm_dev_synchronize_unplug(), which sets the
> unplugged flag and waits for the SRCU barrier, ensuring all in-flight
> drm_dev_enter() critical sections complete before cleanup proceeds;
> call
> it on the error path of drm_dev_register().
>=20
> Fixes: bee330f3d672 ("drm: Use srcu to protect drm_device.unplugged")
> Cc: stable@vger.kernel.org
> Reported-by: sashiko-bot@kernel.org
> Closes:
> https://lore.kernel.org/all/20260620190648.2E9F61F000E9@smtp.kernel.org/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/drm_drv.c | 34 +++++++++++++++++++++++++---------
> =C2=A01 file changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 675675480da4..e890052061f3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -473,6 +473,22 @@ void drm_dev_exit(int idx)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_dev_exit);
> =C2=A0
> +/*
> + * Mark the device as unplugged and wait for any in-flight
> drm_dev_enter()
> + * critical sections to complete.
> + */
> +static void drm_dev_synchronize_unplug(struct drm_device *dev)
> +{
> +=09/*
> +=09 * After synchronizing any critical read section is
> guaranteed to see
> +=09 * the new value of ->unplugged, and any critical section
> which might
> +=09 * still have seen the old value of ->unplugged is
> guaranteed to have
> +=09 * finished.
> +=09 */
> +=09dev->unplugged =3D true;
> +=09synchronize_srcu(&drm_unplug_srcu);
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_dev_unplug - unplug a DRM device
> =C2=A0 * @dev: DRM device
> @@ -485,15 +501,7 @@ EXPORT_SYMBOL(drm_dev_exit);
> =C2=A0 */
> =C2=A0void drm_dev_unplug(struct drm_device *dev)
> =C2=A0{
> -=09/*
> -=09 * After synchronizing any critical read section is
> guaranteed to see
> -=09 * the new value of ->unplugged, and any critical section
> which might
> -=09 * still have seen the old value of ->unplugged is
> guaranteed to have
> -=09 * finished.
> -=09 */
> -=09dev->unplugged =3D true;
> -=09synchronize_srcu(&drm_unplug_srcu);
> -
> +=09drm_dev_synchronize_unplug(dev);
> =C2=A0=09drm_dev_unregister(dev);
> =C2=A0
> =C2=A0=09/* Clear all CPU mappings pointing to this device */
> @@ -1091,6 +1099,7 @@ int drm_dev_register(struct drm_device *dev,
> unsigned long flags)
> =C2=A0=09=09goto err_minors;
> =C2=A0
> =C2=A0=09dev->registered =3D true;
> +=09dev->unplugged =3D false;
> =C2=A0
> =C2=A0=09if (driver->load) {
> =C2=A0=09=09ret =3D driver->load(dev, flags);
> @@ -1118,6 +1127,13 @@ int drm_dev_register(struct drm_device *dev,
> unsigned long flags)
> =C2=A0=09if (dev->driver->unload)
> =C2=A0=09=09dev->driver->unload(dev);
> =C2=A0err_minors:
> +=09/*
> +=09 * If a minor was registered before the failure, userspace
> could have
> +=09 * opened it and entered a drm_dev_enter() critical section.
> Ensure all
> +=09 * such sections complete before we clean up.
> +=09 */
> +=09drm_dev_synchronize_unplug(dev);
> +
> =C2=A0=09remove_compat_control_link(dev);
> =C2=A0=09drm_minor_unregister(dev, DRM_MINOR_ACCEL);
> =C2=A0=09drm_minor_unregister(dev, DRM_MINOR_PRIMARY);

