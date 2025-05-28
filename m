Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78E628C2C9
	for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448510; cv=none; b=gHQhx8L6tQzA7VMlsFhzKwbInVGJoPE+dqxUZ24Jl1RFOUwRihmT5kyE3Fi93wuL0tkFJ7pGJFwtx+3GSZXVd15kYPkZe8asyP3gAJtR5zETaqbLdjRxImv5uYRGmxldvoOgPyt9cFxYlNyEUTk/x3GmVZu8VPAlriwU7hJeo/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448510; c=relaxed/simple;
	bh=1C0pwXwiCeAL4hDTqN6K14FY7vnZe969R0K0i+ED6F4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1v5vghFtrn/jPGtMJckrbGXeUonpCPSrGzj9nK0dRMTyTphZNnZN0AopbAM2kKNGIzlpDPC3F5rLd7/Wy0CCeL5sjYIYHrmC+KQsKeFu+c7aep6BJqwuziGEwwyCzr/YtTDuJPU11Tkc91rdDizXcULQsafFIhld5gN1gfIeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WOu+s12i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WOu+s12i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748448507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1C0pwXwiCeAL4hDTqN6K14FY7vnZe969R0K0i+ED6F4=;
	b=WOu+s12iKW6H5tYBUkkNzQft3bFhWbIiElxHDMEww7WZn3b40n1ODUQm6U04KLRCrmA+sT
	lfveD+pgJPU+CJZDl+4ByD+5Mwvbw7sgRhUolrVleVaXj8JSQLX3/+VgnWKGhFYtfi+k4w
	qnf2e79/qHdrpFX9rmGZyE7FG8Q/PO4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-1WgSwgotP4ayzDLt5PCAjA-1; Wed, 28 May 2025 12:08:26 -0400
X-MC-Unique: 1WgSwgotP4ayzDLt5PCAjA-1
X-Mimecast-MFC-AGG-ID: 1WgSwgotP4ayzDLt5PCAjA_1748448505
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso747045885a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 09:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448505; x=1749053305;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ELCjKD+gxUuR3aRJg9A9JbOeDRYY9q3dgElqJB30ab4=;
        b=R2E3l8N386LJjYDXH/zaFBlnlKQcTuxTxF9gE7IZ59V8qBgPFbAfCASCyA8IAXx+ak
         y8h01Lx0g1XWJ4ZaXc2u3a+iKV53wI6mXDzxMDDKIYonHbxNom8AuM5JYkN55QKcHOBo
         B3KDaYumQfcLPesG6L1PTltSoxpXKKfzT/ewa1pndZ3HvFz3kTROhqMqhxdWuOxwpkn5
         ojdPFy5oxzaPKl+xD+fNSZfXDYa8t7cyO3LIStL7wLSZuA3QAgTQ9UY1H7cdHYsf6UKh
         DqFwpZ8SAlKwCJigrBqNHphvPPAcSBiWcGqD9aUj4DMf1efIP1R20xV+2xix6vv2mTK9
         2yEA==
X-Gm-Message-State: AOJu0Yzhcoi+ysLNJc14FR4Ez87SE6gJ3f7vPTrlfwag7R5PElO+KFZn
	6zsgHzf/BIYvFURgQLe9lxhoaNSMS0vHL8OYPsuIjwn1G0iPFLXIIOueOy1A2fDDprS7VWLgfwA
	WTRWosKybjNtnQuL4lJPCw3vFNB4cRqKlpmiUjoosb8L/V2l6/xY2t48SQPGFKxgH0QQuEFh7Td
	m6
X-Gm-Gg: ASbGncvd4IolR71j7bDjUnKo9UJUxlsVhnUH9GrqznNIXr98jOuMevdF0mlHogW3z7B
	MqUtlBG361Hi2bogP876JBsl2f2oYSqEoP986T6PZ31wTFex2cg+2WUiQ+P383zwkB3t05KsENI
	nI7CJMplb6oRVJiNADsB9SiddB5VKk1sI395Xu81LCToHVP8lhipxHzC0duVr78BpHH/j5wN0ii
	4dTsAT7vz1S76F/dIgps2oG99RM3d3QICtc9UQb4U/9ejL1Ut6VeJZQeX0VIqKo2ficmPC0L9MJ
	mgQ+ITcV5TncG7RwBrTt18WAHIqTqTzla8HcDrIN4MXtMVOxxgWU/yPgxRI=
X-Received: by 2002:a05:620a:424d:b0:7c5:962b:e87c with SMTP id af79cd13be357-7ceecc296f9mr2823528885a.44.1748448505352;
        Wed, 28 May 2025 09:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwBg64uo0z4Bgibxmg+9R08YonGSy0ylNwRuFxVQIAkQT9OnjwXxcnU1GDcfo/I0jNy+NrwQ==
X-Received: by 2002:a05:620a:424d:b0:7c5:962b:e87c with SMTP id af79cd13be357-7ceecc296f9mr2823520385a.44.1748448504590;
        Wed, 28 May 2025 09:08:24 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb8210270sm87017585a.31.2025.05.28.09.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:08:24 -0700 (PDT)
Message-ID: <fadc8e044c3b18984b0ca4a88ef214feb779034d.camel@redhat.com>
Subject: Re: [PATCH] rust: add helper for mutex_trylock
From: mlevitsk@redhat.com
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, Stephen Rothwell
	 <sfr@canb.auug.org.au>
Date: Wed, 28 May 2025 12:08:23 -0400
In-Reply-To: <20250528083431.1875345-1-pbonzini@redhat.com>
References: <20250528083431.1875345-1-pbonzini@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4O-6JRAsyUQNt6ns-dIet_9LIdvwmhkvHYcdAcxh2HQ_1748448505
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-05-28 at 10:34 +0200, Paolo Bonzini wrote:
> After commit c5b6ababd21a ("locking/mutex: implement mutex_trylock_nested=
",
> currently in the KVM tree) mutex_trylock() will be a macro when lockdep i=
s
> enabled.=C2=A0 Rust therefore needs the corresponding helper.=C2=A0 Just =
add it and
> the rust/bindings/bindings_helpers_generated.rs Makefile rules will do
> their thing.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Hi,
Sorry for that.=C2=A0

Next time I'll check rust bindings as well, I never had to deal with them b=
efore.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
=09Maxim Levitsky


> ---
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok to apply to the KVM tree?
>=20
> =C2=A0rust/helpers/mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
5 +++++
> =C2=A01 files changed, 5 insertions(+)
>=20
> diff a/rust/helpers/mutex.c b/rust/helpers/mutex.c
> index 06575553eda5,06575553eda5..9ab29104bee1
> --- a/rust/helpers/mutex.c
> +++ b/rust/helpers/mutex.c
> @@ -7,6 +7,11 @@ void rust_helper_mutex_lock(struct mute
> =C2=A0=09mutex_lock(lock);
> =C2=A0}
> =C2=A0
> +int rust_helper_mutex_trylock(struct mutex *lock)
> +{
> +=09return mutex_trylock(lock);
> +}
> +
> =C2=A0void rust_helper___mutex_init(struct mutex *mutex, const char *name=
,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct lock_class_key *key)
> =C2=A0{
>=20
>=20

