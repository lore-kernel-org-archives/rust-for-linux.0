Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB5C18C31
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490646; cv=none; b=psqhlNJ7enFmvJsQ5apDFvGzQEOSYBE17/WWV95ZgwwDuQv5sY+md9XN9PeEugSMNap43wzVpJIn/E2joHVMgkQgHr7t4pfEgz+shC/51H0JGTpNnC/KsBrkCA+B+RNDS7cMtNammQeo6N+eB2NemI25JhKgiMzLSH9RharR5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490646; c=relaxed/simple;
	bh=ox0xCAebVCB95PbU+gdxMPdg3qP0JLOdxS4EeOBLbV8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r17RBI0WpGMW1X/kGCa7m6GGbmcqbulzk3U6lMb3CEjMD2SRWAhOMGetMsJfZjiuLf47xeRsyQOn6MrNVarZ+uyDCz5FsJPo/T6WnIAQ0xJSbv7m2uO9/J0PcO8ILIBrw1MvrMQO8xAbNtcElsh9BmBnOLesLs3M8NMa8lleelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dL1lSwFr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dL1lSwFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ox0xCAebVCB95PbU+gdxMPdg3qP0JLOdxS4EeOBLbV8=;
	b=dL1lSwFrOk06l+xHbNUMHVBO++TjcPobv7WPh7pt1D0MHC8qkYl0+rH1N7VfpDq4yvnHYe
	Asp/h/vN+t2rIzKtIPS12Wja1SidguhYD25o5YtLjLUd/S7ff835Q3Eo61hGeFAUshnRg5
	d7IydZuu7E3bxiGmIPkW8LlEk42hAzw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-xSDfROepMFesbMoCJT56nw-1; Thu, 11 Dec 2025 17:04:02 -0500
X-MC-Unique: xSDfROepMFesbMoCJT56nw-1
X-Mimecast-MFC-AGG-ID: xSDfROepMFesbMoCJT56nw_1765490642
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea3d12fcso131151885a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490642; x=1766095442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox0xCAebVCB95PbU+gdxMPdg3qP0JLOdxS4EeOBLbV8=;
        b=ZitdvOdwa8MtRy0hktUyHWdvWf+WcQ5UJKntCNxZUzs3Ia13NQkaLAvi5fmCRsBCDw
         MZKq8gUubaoB86w+9VunpoDMq8XzYLj52/EggmnIOgE6S0eM6BIsOTuY39Y354OKMKb5
         OOyYbe44JcN17sZkNS++CHt99oDd3fwLVW9nekW9Y4ix7iH1uECCntZpJXefT1rreiiO
         SKbgU7AahfbuJBimn/J19ssS4JExalGZWd6xAk1V6xjN2KwyM4YdUsogYJiWLz+hcM8e
         SKUGmYZqMEFPh//Nm7q7CM/VdWZ7EX7wbIGnaJdp0MxNF959JJL13aLK9/YW6EyjP4V/
         m3xA==
X-Forwarded-Encrypted: i=1; AJvYcCXhLZX9QcwRN4JbSSI3LJ3oLjYimD9+n5adEGBvJbZU4wFXuteU4zZND/E1eCxVOW29eYBaiYE2A1aVx+GRAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqPAgaY8WJU3S+wbfPzCdMOEOxkpLNq7AynrMGciJXuvosxGqU
	FZVRs3pPM3qHHWBelbhsVZfSb1SdWapy8fbYTg0DFbwOHBUPm0IHseD5wI/xBuLcq8aPt6Lc+si
	wR/Z6Sr+gfJfEYjP1zy+Fsho2BSm78gkp5Sh4zg0wH2a/H2BytDrRAhiNCZhXovcMKN1t
X-Gm-Gg: AY/fxX4U2qMG2JFIpDnbC9/548+ZBszQKfinOTp7b2VuKyJsXs+Enx0CfMpTU0R7roo
	dH6gqdBsCAhHuxdOOUvAgKwg0zojbc1oCOlhQgwyPjcfPMWBxcVJWqucrBP3cyuTO3dvt5Omy1a
	VZkEsO4usiVBVgwcJ31htFIBO4KBz9xlN0OkZv8XKgvu2CN8NLBI9xHDqQSD/gSkA/xM0Dg66gn
	aHo0t6cIjVuqLirdb/IpF/DsiNH9HQHTorWe0g1UCGu+kIWhzPm29dLestcWpvc6JaKnN/V6m7z
	ha8AJ7xH+GILNlY+B9Tk2r4fNJ51yBzrQGnxUGAewsJi357Rh+D0bRWaYpcQW/kIUcXJtc6wZpD
	kL36DtgYF0nItWmqeNbUX7nJQCpgosEjvEgcCTNi1yoUxfijNDnNjGQ4=
X-Received: by 2002:a05:620a:2912:b0:8b2:de6a:ca with SMTP id af79cd13be357-8bb3a253e10mr5297685a.52.1765490642199;
        Thu, 11 Dec 2025 14:04:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4dSZ+TQJmQSc9zvEmOhUZuUFMnzLXfJW8dtUKjPgR0V6/aFOu8dFcWoKAj/pYO/72lCdbGg==
X-Received: by 2002:a05:620a:2912:b0:8b2:de6a:ca with SMTP id af79cd13be357-8bb3a253e10mr5292785a.52.1765490641777;
        Thu, 11 Dec 2025 14:04:01 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab566608asm314452685a.21.2025.12.11.14.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:04:01 -0800 (PST)
Message-ID: <8482d73df0a6b3a5cbddf5381e9bb8b261190fae.camel@redhat.com>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: simplify sequencer opcode
 parsing
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:04:00 -0500
In-Reply-To: <20251208-nova-misc-v1-3-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-3-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nFCfg6tzitek6vnWzT5oWB4Ygg3NRrIAKt2XRn4VNl0_1765490642
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjUt
MTItMDggYXQgMTg6MjYgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IFRoZSBvcGNv
ZGVzIGFyZSBhbHJlYWR5IHRoZSByaWdodCB0eXBlIGluIHRoZSBDIHVuaW9uLCBzbyB3ZSBjYW4g
dXNlCj4gdGhlbSBkaXJlY3RseSBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgdGhlbSB0byBhIGJ5dGUg
c3RyZWFtIGFuZCBiYWNrCj4gYWdhaW4KPiB1c2luZyBgRnJvbUJ5dGVzYC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNvbT4KPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvZncucnMgfCA0MCArKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gLS0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAzNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1j
b3JlL2dzcC9mdy5ycyBiL2RyaXZlcnMvZ3B1L25vdmEtCj4gY29yZS9nc3AvZncucnMKPiBpbmRl
eCAyNGU0ZWFhZjEyNjUuLmQwNmMwZmRkNjE1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2Z3LnJzCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy5y
cwo+IEBAIC00NzIsMTMgKzQ3Miw3IEBAIHB1YihjcmF0ZSkgZm4gcmVnX3dyaXRlX3BheWxvYWQo
JnNlbGYpIC0+Cj4gUmVzdWx0PFJlZ1dyaXRlUGF5bG9hZD4gewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gRXJyKEVJTlZBTCk7Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKg
wqDCoMKgwqDCoCAvLyBTQUZFVFk6IE9wY29kZSBpcyB2ZXJpZmllZCB0byBiZSBgUmVnV3JpdGVg
LCBzbyB1bmlvbgo+IGNvbnRhaW5zIHZhbGlkIGBSZWdXcml0ZVBheWxvYWRgLgo+IC3CoMKgwqDC
oMKgwqDCoCBsZXQgcGF5bG9hZF9ieXRlcyA9IHVuc2FmZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29yZTo6c2xpY2U6OmZyb21fcmF3X3BhcnRzKAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiBjb3JlOjpwdHI6OmFkZHJfb2YhKHNlbGYuMC5wYXlsb2FkLnJlZ1dyaXRl
KS5jYXN0Ojo8dTg+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb3JlOjpt
ZW06OnNpemVfb2Y6OjxSZWdXcml0ZVBheWxvYWQ+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKQo+IC3CoMKgwqDCoMKgwqDCoCB9Owo+IC3CoMKgwqDCoMKgwqDCoAo+IE9rKCpSZWdXcml0
ZVBheWxvYWQ6OmZyb21fYnl0ZXMocGF5bG9hZF9ieXRlcykub2tfb3IoRUlOVkFMKT8pCj4gK8Kg
wqDCoMKgwqDCoMKgIE9rKFJlZ1dyaXRlUGF5bG9hZCh1bnNhZmUgeyBzZWxmLjAucGF5bG9hZC5y
ZWdXcml0ZSB9KSkKPiDCoMKgwqDCoCB9Cj4gwqAKPiDCoMKgwqDCoCAvLy8gUmV0dXJucyB0aGUg
cmVnaXN0ZXIgbW9kaWZ5IHBheWxvYWQgYnkgdmFsdWUuCj4gQEAgLTQ4OSwxMyArNDgzLDcgQEAg
cHViKGNyYXRlKSBmbiByZWdfbW9kaWZ5X3BheWxvYWQoJnNlbGYpIC0+Cj4gUmVzdWx0PFJlZ01v
ZGlmeVBheWxvYWQ+IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVycihFSU5W
QUwpOwo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBP
cGNvZGUgaXMgdmVyaWZpZWQgdG8gYmUgYFJlZ01vZGlmeWAsIHNvIHVuaW9uCj4gY29udGFpbnMg
dmFsaWQgYFJlZ01vZGlmeVBheWxvYWRgLgo+IC3CoMKgwqDCoMKgwqDCoCBsZXQgcGF5bG9hZF9i
eXRlcyA9IHVuc2FmZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6c2xpY2U6OmZy
b21fcmF3X3BhcnRzKAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBjb3JlOjpw
dHI6OmFkZHJfb2YhKHNlbGYuMC5wYXlsb2FkLnJlZ01vZGlmeSkuY2FzdDo6PHU4PigpLAo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6bWVtOjpzaXplX29mOjo8UmVnTW9k
aWZ5UGF5bG9hZD4oKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCApCj4gLcKgwqDCoMKgwqDC
oMKgIH07Cj4gLcKgwqDCoMKgwqDCoMKgCj4gT2soKlJlZ01vZGlmeVBheWxvYWQ6OmZyb21fYnl0
ZXMocGF5bG9hZF9ieXRlcykub2tfb3IoRUlOVkFMKT8pCj4gK8KgwqDCoMKgwqDCoMKgIE9rKFJl
Z01vZGlmeVBheWxvYWQodW5zYWZlIHsgc2VsZi4wLnBheWxvYWQucmVnTW9kaWZ5IH0pKQo+IMKg
wqDCoMKgIH0KPiDCoAo+IMKgwqDCoMKgIC8vLyBSZXR1cm5zIHRoZSByZWdpc3RlciBwb2xsIHBh
eWxvYWQgYnkgdmFsdWUuCj4gQEAgLTUwNiwxMyArNDk0LDcgQEAgcHViKGNyYXRlKSBmbiByZWdf
cG9sbF9wYXlsb2FkKCZzZWxmKSAtPgo+IFJlc3VsdDxSZWdQb2xsUGF5bG9hZD4gewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gRXJyKEVJTlZBTCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oCB9Cj4gwqDCoMKgwqDCoMKgwqDCoCAvLyBTQUZFVFk6IE9wY29kZSBpcyB2ZXJpZmllZCB0byBi
ZSBgUmVnUG9sbGAsIHNvIHVuaW9uCj4gY29udGFpbnMgdmFsaWQgYFJlZ1BvbGxQYXlsb2FkYC4K
PiAtwqDCoMKgwqDCoMKgwqAgbGV0IHBheWxvYWRfYnl0ZXMgPSB1bnNhZmUgewo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvcmU6OnNsaWNlOjpmcm9tX3Jhd19wYXJ0cygKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gY29yZTo6cHRyOjphZGRyX29mIShzZWxmLjAucGF5bG9h
ZC5yZWdQb2xsKS5jYXN0Ojo8dTg+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb3JlOjptZW06OnNpemVfb2Y6OjxSZWdQb2xsUGF5bG9hZD4oKSwKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCApCj4gLcKgwqDCoMKgwqDCoMKgIH07Cj4gLcKgwqDCoMKgwqDCoMKgCj4gT2so
KlJlZ1BvbGxQYXlsb2FkOjpmcm9tX2J5dGVzKHBheWxvYWRfYnl0ZXMpLm9rX29yKEVJTlZBTCk/
KQo+ICvCoMKgwqDCoMKgwqDCoCBPayhSZWdQb2xsUGF5bG9hZCh1bnNhZmUgeyBzZWxmLjAucGF5
bG9hZC5yZWdQb2xsIH0pKQo+IMKgwqDCoMKgIH0KPiDCoAo+IMKgwqDCoMKgIC8vLyBSZXR1cm5z
IHRoZSBkZWxheSBwYXlsb2FkIGJ5IHZhbHVlLgo+IEBAIC01MjMsMTMgKzUwNSw3IEBAIHB1Yihj
cmF0ZSkgZm4gZGVsYXlfdXNfcGF5bG9hZCgmc2VsZikgLT4KPiBSZXN1bHQ8RGVsYXlVc1BheWxv
YWQ+IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVycihFSU5WQUwpOwo+IMKg
wqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBPcGNvZGUgaXMg
dmVyaWZpZWQgdG8gYmUgYERlbGF5VXNgLCBzbyB1bmlvbgo+IGNvbnRhaW5zIHZhbGlkIGBEZWxh
eVVzUGF5bG9hZGAuCj4gLcKgwqDCoMKgwqDCoMKgIGxldCBwYXlsb2FkX2J5dGVzID0gdW5zYWZl
IHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb3JlOjpzbGljZTo6ZnJvbV9yYXdfcGFydHMo
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IGNvcmU6OnB0cjo6YWRkcl9vZiEo
c2VsZi4wLnBheWxvYWQuZGVsYXlVcykuY2FzdDo6PHU4PigpLAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29yZTo6bWVtOjpzaXplX29mOjo8RGVsYXlVc1BheWxvYWQ+KCksCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKQo+IC3CoMKgwqDCoMKgwqDCoCB9Owo+IC3CoMKgwqDC
oMKgwqDCoAo+IE9rKCpEZWxheVVzUGF5bG9hZDo6ZnJvbV9ieXRlcyhwYXlsb2FkX2J5dGVzKS5v
a19vcihFSU5WQUwpPykKPiArwqDCoMKgwqDCoMKgwqAgT2soRGVsYXlVc1BheWxvYWQodW5zYWZl
IHsgc2VsZi4wLnBheWxvYWQuZGVsYXlVcyB9KSkKPiDCoMKgwqDCoCB9Cj4gwqAKPiDCoMKgwqDC
oCAvLy8gUmV0dXJucyB0aGUgcmVnaXN0ZXIgc3RvcmUgcGF5bG9hZCBieSB2YWx1ZS4KPiBAQCAt
NTQwLDEzICs1MTYsNyBAQCBwdWIoY3JhdGUpIGZuIHJlZ19zdG9yZV9wYXlsb2FkKCZzZWxmKSAt
Pgo+IFJlc3VsdDxSZWdTdG9yZVBheWxvYWQ+IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIEVycihFSU5WQUwpOwo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKg
wqAgLy8gU0FGRVRZOiBPcGNvZGUgaXMgdmVyaWZpZWQgdG8gYmUgYFJlZ1N0b3JlYCwgc28gdW5p
b24KPiBjb250YWlucyB2YWxpZCBgUmVnU3RvcmVQYXlsb2FkYC4KPiAtwqDCoMKgwqDCoMKgwqAg
bGV0IHBheWxvYWRfYnl0ZXMgPSB1bnNhZmUgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
cmU6OnNsaWNlOjpmcm9tX3Jhd19wYXJ0cygKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCj4gY29yZTo6cHRyOjphZGRyX29mIShzZWxmLjAucGF5bG9hZC5yZWdTdG9yZSkuY2FzdDo6
PHU4PigpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6bWVtOjpzaXpl
X29mOjo8UmVnU3RvcmVQYXlsb2FkPigpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgICkKPiAt
wqDCoMKgwqDCoMKgwqAgfTsKPiAtwqDCoMKgwqDCoMKgwqAKPiBPaygqUmVnU3RvcmVQYXlsb2Fk
Ojpmcm9tX2J5dGVzKHBheWxvYWRfYnl0ZXMpLm9rX29yKEVJTlZBTCk/KQo+ICvCoMKgwqDCoMKg
wqDCoCBPayhSZWdTdG9yZVBheWxvYWQodW5zYWZlIHsgc2VsZi4wLnBheWxvYWQucmVnU3RvcmUg
fSkpCj4gwqDCoMKgwqAgfQo+IMKgfQo+IMKgCg==

