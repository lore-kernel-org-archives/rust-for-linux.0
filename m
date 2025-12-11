Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C052DE1F0
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490407; cv=none; b=ZFjNNW4JEDuxhWf5rXj2xrGTxFjlKzqFZV3naofkjvJR/n6L5yQMSpmSEQ/A/KnYXTelneceOZ6/uYMn0uRzuWU7xSenAw4+esp/RScs3Leuu0u8b6atWsDxhoYSTUGsilXSYErJJKjsDym63io0w5imvHj62VjcDCAIMHSI6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490407; c=relaxed/simple;
	bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZs86FlA6FKckcybh5eHPc2CSqTcmuLNMQhh35KChjOWFsJiiLu6/cdAoBVU0Lhsqp/Dp6atxa2AZ3GT4UR+tl3JZTHbm1qRSwCeTSlVMddAaCXnGLcsONmnNTxI3TDg5q7XEP5le+uyi/H16buFSCfR5MLfumgOSFdTz37ci0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOXn1Jz3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOXn1Jz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
	b=QOXn1Jz3bEB53QoY4ypfTpJvVXBoQ5bYFjurbRNxQTFhO4dMqqqSq5NzK5hPzKFEZ75F9x
	WemXi9b9U9k0fmmQaCI+1mwvQsr0Prfzbexe90k4YP86Ze5d9ChrYmbwY6UFHvL1ZKppgv
	W52z4v8uVIY8ZLRKPFLnGwB4J9XuAWY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-NO5XrIMkM1eRVCbCZJ-Erw-1; Thu, 11 Dec 2025 17:00:01 -0500
X-MC-Unique: NO5XrIMkM1eRVCbCZJ-Erw-1
X-Mimecast-MFC-AGG-ID: NO5XrIMkM1eRVCbCZJ-Erw_1765490401
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24a25cff5so142848185a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490401; x=1766095201;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
        b=fSGeGh5eIIdAPK9nOi379hhWC9yKaW1mznr5JRlydt4mGXVwX/ut8Xx7G6CMIx4Rb3
         Whjns9afYxtW6rIxvJIBFyEmbuIXXERXouikI8wtRJc2lI/iKQKyomrSmydp6OkzuS3D
         jBAJvK1RkDUYFjV/D8WzmiSE/woxBo1W6B4e7exZN9FkS1qyDvNNFGeFbCJG+utNzLNL
         otKFqixjd4M4FrKK2ZzqWnEuvCwYPnlZ7amsyqUCt3QYOc2k+wF8Y0T5AcMLkg7KOASS
         VxR1majjn3DhexbIzHab2NgITEADnCSkZa/WL8NpjK2XIz9DRjNGafDaNxQ+SyW4I99R
         HISA==
X-Forwarded-Encrypted: i=1; AJvYcCUX9BJC0VQ93xvjSfKVlmkFPnsjzSud/yrTIofueR6brJlslDWuDfrPzWet01HgY+L3iXTpKVGYbrV1BPxUnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPlC+d1uySIVfqyG0f/1BQ5Qrx+NmIwXcnCqsL+M9Zse+kB8z
	BWysy/wOoUiqlMWiX2HZ3USaUCU5yBArz7d3Diy8rAnbonTf1/JMs7jHETJP6ZG2CZlOynvpIv4
	UfxyCCQH/5oN9D3uqgebDqGIwbq0G33QSSOrqM+LJIYL2/gSaMBSc3RjqnXxlm66Zu47T
X-Gm-Gg: AY/fxX61RUDtBHPpXrZdbwg+lJf4F+3w+u0mqJL6JiLKU8lFFMgq+pz83Vd2XPLrWCG
	oeo4yyip5qAXcPfJ5vRnh2WXRFkao1M1qWQWeXYlQ38kut9a4rUvXKlrrRJKkjxKGg/jmoaWW+Q
	8yHrR00TkH93nz3eB2O6qugoeZYLHEdLpRArgBjxQxMW6zhfWHzj+zW8uPzpiJpMULQwJkr4GDW
	LMjkGY+pTLycuLVZNQoGgmG6fOegtmsK2ErqMfhr28GjrVt5DIVOYXK8zC0Chy/ThPsb9GGHgOo
	ZSaXQ2vQuymRJx7eo31e6JS2SGRuHQIjY2zNkVROjkUjzdWoVWPialqucWhr3nd8L7Q0bXA5QaX
	/JP5o4wjoCgVSV8wd5XkOWN034dLkBTdVhT5QREUD4bcf5gDuYgPl5LE=
X-Received: by 2002:a05:620a:1a86:b0:8b2:f82f:c630 with SMTP id af79cd13be357-8bb39eb98b0mr5406985a.31.1765490401352;
        Thu, 11 Dec 2025 14:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcD/u3yfUht3fNeXEQhIUzrD0ydpAz9Hqu2OLR8JqXNXRjerBGXVTk8n11MJKpUQer50n6Fw==
X-Received: by 2002:a05:620a:1a86:b0:8b2:f82f:c630 with SMTP id af79cd13be357-8bb39eb98b0mr5403685a.31.1765490400979;
        Thu, 11 Dec 2025 14:00:00 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab544b657sm312470285a.10.2025.12.11.13.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:00:00 -0800 (PST)
Message-ID: <d47f7ca5afe8b53f63d91743323d152fe063ba86.camel@redhat.com>
Subject: Re: [PATCH 1/9] gpu: nova-core: gsp: warn if data remains after
 processing a message
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 16:59:59 -0500
In-Reply-To: <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n6YodU6kBjhubVX0G8fBNmGyYXNrsGnu9zO_oF-mPck_1765490401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjUt
MTItMDggYXQgMTg6MjYgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IE5vdCBwcm9j
ZXNzaW5nIHRoZSB3aG9sZSBkYXRhIGZyb20gYSByZWNlaXZlZCBtZXNzYWdlIGlzIGEgc3Ryb25n
Cj4gaW5kaWNhdG9yIG9mIGEgYnVnIC0gZW1pdCBhIHdhcm5pbmcgd2hlbiBzdWNoIGNhc2VzIGFy
ZSBkZXRlY3RlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAbnZpZGlhLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5y
cyB8IDEyICsrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dz
cC9jbWRxLnJzIGIvZHJpdmVycy9ncHUvbm92YS0KPiBjb3JlL2dzcC9jbWRxLnJzCj4gaW5kZXgg
ZGFiNzMzNzdjNTI2Li41Y2U4NWVlMWZmY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvbm92
YS1jb3JlL2dzcC9jbWRxLnJzCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9jbWRx
LnJzCj4gQEAgLTY2Miw3ICs2NjIsMTcgQEAgcHViKGNyYXRlKSBmbiByZWNlaXZlX21zZzxNOgo+
IE1lc3NhZ2VGcm9tR3NwPigmbXV0IHNlbGYsIHRpbWVvdXQ6IERlbHRhKSAtPiBSZXN1bAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgKGNtZCwgY29udGVudHNfMSkgPQo+IE06Ok1lc3Nh
Z2U6OmZyb21fYnl0ZXNfcHJlZml4KG1lc3NhZ2UuY29udGVudHMuMCkub2tfb3IoRUlPKT87Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBtdXQgc2J1ZmZlciA9IFNCdWZmZXJJdGVyOjpu
ZXdfcmVhZGVyKFtjb250ZW50c18xLAo+IG1lc3NhZ2UuY29udGVudHMuMV0pOwo+IMKgCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTTo6cmVhZChjbWQsICZtdXQgc2J1ZmZlcikubWFwX2Vycih8
ZXwgZS5pbnRvKCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHJlcyA9IE06OnJlYWQo
Y21kLCAmbXV0IHNidWZmZXIpLm1hcF9lcnIofGV8Cj4gZS5pbnRvKCkpOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiByZXMuaXNfb2soKSAmJiAhc2J1ZmZlci5pc19lbXB0eSgpIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuISgKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnNlbGYuZGV2LAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiR1NQIG1lc3NhZ2Ugezo/fSBoYXMgdW5wcm9jZXNz
ZWQgZGF0YVxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVu
Y3Rpb24KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMKPiDCoMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVycihFUkFOR0Up
Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Owo=

