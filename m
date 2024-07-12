Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC6174EC6
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jul 2024 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798368; cv=none; b=FsgbW5M9GMUvqtBEaBcLJickZbBQ64MKF3OLxoJHueBVVXm+xlHPZwPKtEqEX8Xqx/lPmrxLxomNVa7sfJlexyFdpJawxrwynwtFKvUPBQwi5dDHMUglyu5G0ticqiaiGavkn3WSIumN2iA2mWxWa4av7J1tpFmye0f+acwbMis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798368; c=relaxed/simple;
	bh=ykurxgkKshUAh4zNAKMa/tJIoSjpi6lHqJ00J6sTWAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TjDY4nPj9pTjtZOGKjrh01ay2tAkOFhUMIV5GyuwDAx7Hxo1OQ+hVZgw9TKD2Nf0PVi/3SjZ88xeSMKyUUDn7Awn5CO5U0Umrr87qmtzDWkE90+aBIrTIXAw5bcLNBhValuJZ36+WqUfj8MqkINDNs4+g/flQ74kGnKPzk+vqx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VokgYpON; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VokgYpON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720798365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEz8WMihH5dvgSwOSmQJ46Poh9tPzMYsjL7lTQ558D8=;
	b=VokgYpON2MWkgxPjtoNmxiwufy8DNYXM+mU0bYZ4idf59QNKL8r8RK841NyNygplmC53Hk
	4Z5uDZsopJVM3o40o+gUoM39ZBXi4/v9s4I+y2d9OSQgkQISki4j9HFT9EWT1Og+Inyhav
	oJ3VT0qHVgGyuyOgB5/tzb4t0TJMFZY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-PVyPfmYdMOqbHRR6IgVNVA-1; Fri, 12 Jul 2024 11:32:44 -0400
X-MC-Unique: PVyPfmYdMOqbHRR6IgVNVA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42725ec6d8dso19740795e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jul 2024 08:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720798363; x=1721403163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEz8WMihH5dvgSwOSmQJ46Poh9tPzMYsjL7lTQ558D8=;
        b=VosEd36RDCvq/zxzO11ZZ+Vb55PsczC2q4ELt6AaetSf5H0r7xVShb8jbPdENywn2M
         fNPLrVaa3QH74RsSSGxLY2FlMfAQ+i8cSTaemBfydqlLBuNQBCQA8Iz+GhReHyQ2oJR/
         fiRsLxuusaPkYs/aIt86LPVxfzRaiVS9eGC0JRh9pGE/ZTm6HtkWGDmNiXsDQbOwhIxc
         DAuud3eSSY6UNpCTYKYsI/u/WCE0UhFUXReGm7w+GqFkIOUADY6e4MyDsftD9YLJ1V+j
         pWIZmSN3fiYWnRz0C6lBG03CJSnCFiBvbOI90oH+zcDPnqDSpajtK+HtTbq2/vWy5Wiq
         PxmA==
X-Forwarded-Encrypted: i=1; AJvYcCWsdtNxugMyJsMJmpIEhugOCCys1t7MCSGh62a39q/OMUCsaSB8HkpwGYb9X9JaFUsc9girHRRRpEF/MwSkXljowVfM19Cng+a5EdhxqRE=
X-Gm-Message-State: AOJu0YzXIRurQD8nosV6A73ySuS7wKQclQR6ZceOvnLNTJrIHzix3LEf
	XrxmwBMXGzGmcYyuAr35iqQ39HTwA5n70A9KfysrUao86kThE1OKEOKdj/uhKnRMeyJLXcgLTnt
	yUAd+wUgFItsoQ7BVTgrNDz4/ve1kCfW9RuaWc5PfDy7jqIDM+aQ9Vac8gb1FgMWt
X-Received: by 2002:a05:600c:2d84:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-426707db6d5mr103615735e9.22.1720798363158;
        Fri, 12 Jul 2024 08:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBacZIavOtT2JsUQI/j71t/YaxvZW9vrhlVVDFlkJPuemKNmocYH6M4zKWmAbtWgl9yPmxGg==
X-Received: by 2002:a05:600c:2d84:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-426707db6d5mr103615495e9.22.1720798362825;
        Fri, 12 Jul 2024 08:32:42 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:a4d3:4896:56d4:f050])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab161sm10420558f8f.91.2024.07.12.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 08:32:42 -0700 (PDT)
Date: Fri, 12 Jul 2024 17:32:40 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
	lyude@redhat.com, robh@kernel.org, lina@asahilina.net,
	mcanal@igalia.com, airlied@gmail.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
Message-ID: <ZpFMmAEdqo1dhj0s@cassiopeiae>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <ZpFDeajsuVONbSYJ@cassiopeiae>
 <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jul 12, 2024 at 12:13:15PM -0300, Daniel Almeida wrote:
> 
> 
> > On 12 Jul 2024, at 11:53, Danilo Krummrich <dakr@redhat.com> wrote:
> > 
> > You could also just define those structures in a C header directly and use it
> > from Rust, can't you?
> > 
> 
> 
> Sure, I am open to any approach here. Although this looks a bit reversed to me.
> 
> i.e.: why should I declare these structs in a separate language and file, and then use them in Rust through bindgen? Sounds clunky.

The kernel exposes the uAPI as C header files. You just choose to do the
implementation in the kernel in Rust.

Hence, I'd argue that the uAPI header is the actual source. So, we should
generate stuff from those headers and not the other way around I think.

> 
> Right now, they are declared right next to where they are used in the code, i.e.: in the same Rust file. And so long as they’re #[repr(C)] we know that an equivalent C version can generated by cbindgen.
> 

I'm not sure whether it's a good idea to generate uAPI header files in general.

How do we ensure that the generated header file are useful for userspace in
terms of readability and documentation?

How do we (easily) verify that changes in the Rust code don't break the uAPI by
due to leading to changes in the generated header files?

Do we have guarantees that future releases of cbindgen can't break anything?

