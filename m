Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B36237F8BD
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770238619; cv=none; b=sSD5GDafO54S5Av8YzCcL6q4JeCWIMbaz7kZImQmd+s0gxQh9vCSoNk7F0UJ/0Yyrn65kw7KMvnZ6jNd0ZPEG0GT6+WwRWvyzxG/KtulcQ4rd8+RfgwI8SZfkoKGXhEyjvh1dugJ20fh9ESovELsVEjPjN8OP8sTNh3cRTuvj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770238619; c=relaxed/simple;
	bh=HNUd9rPG1BceWdGBHYZ2EDlIZvEOeylw+slLK97uJB4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFC/sXb/Kau3Rn5KsjOhHJKMaRBAgIUNZtYElNN387h/1Hcs9WceUew65+Fib4GdTOofJfNAzxuzSZGrrRKm4lLxv2CBQzbn/Y1qo7y7XIEMhMD+U77fj4fadV1LTycVvmZwpJkRcSG9nNdxZyUXNqqjuy/97WmhZkTT3Gvl34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHqu4ou5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHqu4ou5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770238618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNUd9rPG1BceWdGBHYZ2EDlIZvEOeylw+slLK97uJB4=;
	b=JHqu4ou5MiXgEs0bPpXv9MIuCV3kUQOEidbmZtN1n/IQAW4LBudWM4Ym+lq0TWFh89EWF0
	Ihr6c9b4TbgOJ1hxTIS87IwWzUv7Kx5M8y5l0iRshj2uCw8L4FiAyfsC3gNvmZ5Wufo+9G
	b5EfcsMPAGNsd15ObBbCv3Chfmlt69g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-vT5dksCcPHuRci-paZ2UtA-1; Wed, 04 Feb 2026 15:56:56 -0500
X-MC-Unique: vT5dksCcPHuRci-paZ2UtA-1
X-Mimecast-MFC-AGG-ID: vT5dksCcPHuRci-paZ2UtA_1770238616
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946f51b8c8so10942886d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 12:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238616; x=1770843416;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxG8OYua1gClXTSBhwuZi6jzgFrYOt/LM5ChTM0bqUk=;
        b=fBEPbaxO+/9OpVGJrc71jkQEZM2e7Fttq2hHyRPAE0xitJrDtQqvD0CN8d9poK4Qwe
         FpdcL0+hmvmm1C+3rhc/EXDmVHJtvNfrgGKLgsmxjlkCDQ2yl0Z0x9Y4UnWmaXIHnZOO
         1wFv26Ohz7aI6Jce0APTVBx5PI6GYFooKkMv766Pg6TmSJUzRJwV5OgYdhyAWVTIHe5E
         Tx2kTiMzeJO4VfKhwIfFL4yUgtCmxsZjt23FJgcqmAdmCekoAuuWlR2Mh7VMZDU9+dvy
         b+XuA7dGQZcbf+UQQ2ZnxGBjZ/n5tRfTJsYXluG2bb0lV9/4O2xBXpw6v2nDDd+lwlnZ
         LYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7DZuZCmoQa7LacbdBgh34nJQHYIFO4pr9hmVfiYE31zwBnfBa/1gDpwDrJoscTCN6N0gRr4mRGlQDNyqYfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzchwt7ownQ5aeVLYcc13LcPEWtgxYtD1MCdpbvMkdwohzPbtwg
	YxzjjOQi+YcGVUqPrf39LgU1phf568D7Uju12sWh5OhgHFD8K8czkb37yq9Xup74smlkkozAAqU
	MP8UdX8ee8EKEKjWpYDCiPsVDF84xxwrc+S506ktZsakud17/NpMzKeIayoYH/nfr5LaF
X-Gm-Gg: AZuq6aLKDpW9obQ3EacfdSMAXhqpHlQOXYpL/yVQbyjFriIIByQ6Gav1kSprfTELk35
	mTHqmgUX0x+X2zThK31lk+ezHcLJb2dzI0A53ds/GLTffHWP+OEB+kt3eGLSGr7IUgp1JtJRxn6
	t8wzdNGUNXnsuvLCXJzlH2pjW8yOaTTWtrRmT4zisL4elbZ30t4KOZfJKLK8Kjg3mU68sH5V/8r
	7K/tqztGST+Mro+SPW2pPqVcv+gxYVd9RQMbe31Vv8/gAkVbJUW0cKSsWoxPAas/QQDQW5nfsUX
	mlvV4wk0GN2fcqNgYCehejBeEG5iTIvQ4WIJPQSrWJ1eZG3ciKJCwK7lHkPYk1FFfF9M7WA/yoE
	XYCvxQw==
X-Received: by 2002:a05:620a:4483:b0:8ca:1107:1215 with SMTP id af79cd13be357-8ca2f80c345mr484847885a.9.1770238616314;
        Wed, 04 Feb 2026 12:56:56 -0800 (PST)
X-Received: by 2002:a05:620a:4483:b0:8ca:1107:1215 with SMTP id af79cd13be357-8ca2f80c345mr484843885a.9.1770238615795;
        Wed, 04 Feb 2026 12:56:55 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521c00173sm27081576d6.12.2026.02.04.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:56:55 -0800 (PST)
Message-ID: <f4504b830225a8fdb7407572d92b65daf390ac8a.camel@redhat.com>
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno
 Lossin	 <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Date: Wed, 04 Feb 2026 15:56:54 -0500
In-Reply-To: <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
	 <20260131001602.2095470-3-lyude@redhat.com>
	 <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m9uU57ipgsMbWGglqtiqor3toW_GY0T7SiHL844W_b0_1770238616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-02-04 at 15:28 -0300, Daniel Almeida wrote:
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data_is_init: AtomicBool,
>=20
> What about this?
>=20
> =09/**
> =09 * @registered:
> =09 *
> =09 * Internally used by drm_dev_register() and
> drm_connector_register().
> =09 */
> =09bool registered;
>=20
> Can=E2=80=99t we use this in lieu of this flag you=E2=80=99ve added?

No we couldn't unfortunately. As I said before: a lot of KMS setup has
to happen prior to registration, and most of those callbacks
(atomic_check, atomic_commit, etc.) can both happen before registration
and after. And that's a lot more difficult to deal with if we don't
have access to the private driver data for any of those callbacks.

So - it really does truly need to be tracked separately.
>=20
> > +

