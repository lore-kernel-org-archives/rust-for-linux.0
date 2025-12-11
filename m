Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE891F541E
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490540; cv=none; b=JQW+NPcnkCzhs2EANg8jxYLYfA+cCHX9R2a0RUSRhqKqWB/6qUz7C/zXxgr6ESndErE8gza5mke0ZKnpAvm1i6t/wDFDNotUwm87vqcmn2BZSyksQYowyKEdXdWOM/CCBMJe9sjf62eQPrfYljRlGZ3BfjZWXAX9kodnSTIcfE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490540; c=relaxed/simple;
	bh=cs8OX3zrBUPudQgnuc6vS8MDDlR2+Y+x+5+NsCEXyaw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4Gp7hjX3RJ8atSFeR2p8/AgTXzOs3o4TvqalVHteg0ox0aQjp3CnAjAx1Qo7yBZNi8gNlkbtCevVDftckeSTBCaao8pXiwGm73RTGGqSDOkQCNgel1+9ozy7iMUh/wH2UCf26kEriW6oLyjFOFccyL5/C0G70GoqW2lF7lVylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2Fh0G73; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2Fh0G73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cs8OX3zrBUPudQgnuc6vS8MDDlR2+Y+x+5+NsCEXyaw=;
	b=K2Fh0G732QPg1ZS2zJUmfsui+dSNFLDTR3ctdzKjZPTrAaXe2Pjz+TPd+aNOTzDslMKBbt
	Mx76wkcmHB5GRu1GWepl1CUuiJH25kvYLWZLM0I005GutOiJs58wgTbfXijDPo8lE7Jlzr
	qpCCYgrCfxOfU3Vpu2Opk4DEkr8cH/E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-jxbUOixmPbC_mTxLLo7Uww-1; Thu, 11 Dec 2025 17:02:14 -0500
X-MC-Unique: jxbUOixmPbC_mTxLLo7Uww-1
X-Mimecast-MFC-AGG-ID: jxbUOixmPbC_mTxLLo7Uww_1765490534
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b259f0da04so125679185a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490534; x=1766095334;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cs8OX3zrBUPudQgnuc6vS8MDDlR2+Y+x+5+NsCEXyaw=;
        b=UIzoEFvvAeYpM/0bfjsdcVRUuUAKfej3bGh1qt8gOB4Ac0P+0Aw5D82C8y/Tr40mgo
         ANhQnCpXfj5DtCqqi2Bu/Q2mpcAVRTFXVJMVW6WgGKShi9cBZkPOR+uab2cry7hF5ENY
         wMyvrkI2IPgd1uR+FXg6439DMEwN53+pg6k9e+o2DjlH+y3wRrkhgDdnolX1Dqk6gzgY
         uGkIz4lNbfyGaOB0S+C6F5nKj3XeUFrafYxJ1Lg5U8GOzZ9jPh0hZafyCrii/7SgQVaE
         /g+AZh16O04Pyong713/XlcM4tbuZ5IQaghy0m4KXDANwwQXrd1In/iZepV2z8UtKneh
         Dlhg==
X-Forwarded-Encrypted: i=1; AJvYcCWhFktUPoWCIqe5ZU3uoVkVtPfIMRgkSjT7jdYHpp3Gi1oE5cNp9CJV00u3xPQGM7YHsQBmOC91H/p8sk9GFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2K2zW0VqrEJFe+iJKA93/ixKTVzWxJ7jPL1sP7RRCn8ADyJhF
	bDcyLDkjdcbGkdrs+uZrqiGEmzrTubFdaU13Ri/k2KwtrlLKj5UOE6r0gLFwTL5ZAj/XBKItvvY
	1pL7Nzz6/OrA/+HhI+i/EKtua+xLU2CKDS7768iNGaMB0jcXAhF5YRvlVyJjmvo9UQAKT
X-Gm-Gg: AY/fxX6uvorqx8aXDCVAKLKIHM7GSGUk2QOQWyYzLcVsf3ehhTYN+keF0VQcX2GHgdQ
	2cjjO88VXpARMySUb8ePQ0mw8O/n4Rt12i7Byj5xbqD9KQo+oQMkp40YgxkDOsbGS6mUcS5RXMK
	qAnYXbxqjxyE1CxbmmyyQfjpjm5iV3ty1H7CDZXhUyk+tdv3zczyFKDsrt1+DZcp3/+q4DT5jYR
	b10d19kohnUIXBrp24ybm8M5WxFF226A57y2jU8eAWqamysCQzl1x0E65eFxE56tRiTgUrS41A7
	BB2Kgr8FtN9LMmngi/WBKN20vso2nL8Z+UkEdLdFwcKLyDw6cPlBwBs/m9tOOLX60o1bleNl2Tq
	nAlox0ZdYcvOy3xPdBjSCM0i/tA/PLYZXtDFISZM/V9zWGNq7lG25BxQ=
X-Received: by 2002:a05:620a:7f5:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8bb3a24e3a7mr2627685a.44.1765490533577;
        Thu, 11 Dec 2025 14:02:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuHDnpAtkTZpTCwrU7byr7JTo15+BTsKDUwp0zFj5Lvszl2zFymLT1KNaf/l85d/9SnUFxzQ==
X-Received: by 2002:a05:620a:7f5:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8bb3a24e3a7mr2623185a.44.1765490533044;
        Thu, 11 Dec 2025 14:02:13 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d3e157sm319239885a.37.2025.12.11.14.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:02:12 -0800 (PST)
Message-ID: <1832243eec40476d1823ec9d2aa376dd584f4d57.camel@redhat.com>
Subject: Re: [PATCH 2/9] gpu: nova-core: gsp: remove unnecessary Display
 impls
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:02:11 -0500
In-Reply-To: <20251208-nova-misc-v1-2-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-2-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gr9g04XrTuSHz9vXu8Vd2rx331qe_dnq3WaY0GJa3r8_1765490534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjUt
MTItMDggYXQgMTg6MjYgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IFdlIG9ubHkg
ZXZlciBkaXNwbGF5IHRoZXNlIGluIGRlYnVnIGNvbnRleHQsIGZvciB3aGljaCB0aGUKPiBhdXRv
bWF0aWNhbGx5Cj4gZGVyaXZlZCBgRGVidWdgIGltcGxzIHdvcmsganVzdCBmaW5lIC0gc28gdXNl
IHRoZW0gYW5kIHJlbW92ZSB0aGVzZQo+IGJvaWxlcnBsYXRlLWxvb2tpbmcgaW1wbGVtZW50YXRp
b25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlk
aWEuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9jbWRxLnJzIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2Z3LnJzwqDCoCB8IDU0IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gLS0tLS0tLS0tLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L25vdmEtY29yZS9nc3AvY21kcS5ycyBiL2RyaXZlcnMvZ3B1L25vdmEtCj4gY29yZS9nc3Av
Y21kcS5ycwo+IGluZGV4IDVjZTg1ZWUxZmZjZS4uZmE5ODNhM2Y0ODBjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5ycwo+ICsrKyBiL2RyaXZlcnMvZ3B1L25v
dmEtY29yZS9nc3AvY21kcS5ycwo+IEBAIC01MzEsNyArNTMxLDcgQEAgcHViKGNyYXRlKSBmbiBz
ZW5kX2NvbW1hbmQ8TT4oJm11dCBzZWxmLCBiYXI6Cj4gJkJhcjAsIGNvbW1hbmQ6IE0pIC0+IFJl
c3VsdAo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnISgKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJnNlbGYuZGV2LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJHU1AgUlBDOiBz
ZW5kOiBzZXEjIHt9LCBmdW5jdGlvbj17fSwgbGVuZ3RoPTB4ezp4fVxuIiwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiR1NQIFJQQzogc2VuZDogc2VxIyB7fSwgZnVuY3Rpb249ezo/fSwKPiBs
ZW5ndGg9MHh7Onh9XG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnNlcSwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTTo6RlVOQ1RJT04sCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRzdC5oZWFkZXIubGVuZ3RoKCksCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L25v
dmEtY29yZS9nc3AvZncucnMgYi9kcml2ZXJzL2dwdS9ub3ZhLQo+IGNvcmUvZ3NwL2Z3LnJzCj4g
aW5kZXggM2JhYTU0NTVjYzMyLi4yNGU0ZWFhZjEyNjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvbm92YS1jb3JlL2dzcC9mdy5ycwo+ICsrKyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3Av
ZncucnMKPiBAQCAtMTAsNyArMTAsNiBAQAo+IMKgCj4gwqB1c2Uga2VybmVsOjp7Cj4gwqDCoMKg
wqAgZG1hOjpDb2hlcmVudEFsbG9jYXRpb24sCj4gLcKgwqDCoCBmbXQsCj4gwqDCoMKgwqAgcHJl
bHVkZTo6KiwKPiDCoMKgwqDCoCBwdHI6OnsKPiDCoMKgwqDCoMKgwqDCoMKgIEFsaWduYWJsZSwK
PiBAQCAtMjIzLDQzICsyMjIsNiBAQCBwdWIoY3JhdGUpIGVudW0gTXNnRnVuY3Rpb24gewo+IMKg
wqDCoMKgIFVjb2RlTGliT3NQcmludCA9IGJpbmRpbmdzOjpOVl9WR1BVX01TR19FVkVOVF9VQ09E
RV9MSUJPU19QUklOVCwKPiDCoH0KPiDCoAo+IC1pbXBsIGZtdDo6RGlzcGxheSBmb3IgTXNnRnVu
Y3Rpb24gewo+IC3CoMKgwqAgZm4gZm10KCZzZWxmLCBmOiAmbXV0IGZtdDo6Rm9ybWF0dGVyPCdf
PikgLT4gZm10OjpSZXN1bHQgewo+IC3CoMKgwqDCoMKgwqDCoCBtYXRjaCBzZWxmIHsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBDb21tb24gZnVuY3Rpb24gY29kZXMKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlvbjo6Tm9wID0+IHdyaXRlIShmLCAiTk9QIiksCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OlNldEd1ZXN0U3lzdGVtSW5mbyA9PiB3
cml0ZSEoZiwKPiAiU0VUX0dVRVNUX1NZU1RFTV9JTkZPIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTXNnRnVuY3Rpb246OkFsbG9jUm9vdCA9PiB3cml0ZSEoZiwgIkFMTE9DX1JPT1QiKSwK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlvbjo6QWxsb2NEZXZpY2UgPT4gd3Jp
dGUhKGYsICJBTExPQ19ERVZJQ0UiKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5j
dGlvbjo6QWxsb2NNZW1vcnkgPT4gd3JpdGUhKGYsICJBTExPQ19NRU1PUlkiKSwKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlvbjo6QWxsb2NDdHhEbWEgPT4gd3JpdGUhKGYsICJB
TExPQ19DVFhfRE1BIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OkFs
bG9jQ2hhbm5lbERtYSA9PiB3cml0ZSEoZiwKPiAiQUxMT0NfQ0hBTk5FTF9ETUEiKSwKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlvbjo6TWFwTWVtb3J5ID0+IHdyaXRlIShmLCAi
TUFQX01FTU9SWSIpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1zZ0Z1bmN0aW9uOjpCaW5k
Q3R4RG1hID0+IHdyaXRlIShmLCAiQklORF9DVFhfRE1BIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTXNnRnVuY3Rpb246OkFsbG9jT2JqZWN0ID0+IHdyaXRlIShmLCAiQUxMT0NfT0JKRUNU
IiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OkZyZWUgPT4gd3JpdGUh
KGYsICJGUkVFIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OkxvZyA9
PiB3cml0ZSEoZiwgIkxPRyIpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1zZ0Z1bmN0aW9u
OjpHZXRHc3BTdGF0aWNJbmZvID0+IHdyaXRlIShmLAo+ICJHRVRfR1NQX1NUQVRJQ19JTkZPIiks
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OlNldFJlZ2lzdHJ5ID0+IHdy
aXRlIShmLCAiU0VUX1JFR0lTVFJZIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVu
Y3Rpb246OkdzcFNldFN5c3RlbUluZm8gPT4gd3JpdGUhKGYsCj4gIkdTUF9TRVRfU1lTVEVNX0lO
Rk8iKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlvbjo6R3NwSW5pdFBvc3RP
YmpHcHUgPT4gd3JpdGUhKGYsCj4gIkdTUF9JTklUX1BPU1RfT0JKR1BVIiksCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OkdzcFJtQ29udHJvbCA9PiB3cml0ZSEoZiwKPiAi
R1NQX1JNX0NPTlRST0wiKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlvbjo6
R2V0U3RhdGljSW5mbyA9PiB3cml0ZSEoZiwKPiAiR0VUX1NUQVRJQ19JTkZPIiksCj4gLQo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEV2ZW50IGNvZGVzCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTXNnRnVuY3Rpb246OkdzcEluaXREb25lID0+IHdyaXRlIShmLCAiSU5JVF9ET05FIiks
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OkdzcFJ1bkNwdVNlcXVlbmNl
ciA9PiB3cml0ZSEoZiwKPiAiUlVOX0NQVV9TRVFVRU5DRVIiKSwKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBNc2dGdW5jdGlvbjo6UG9zdEV2ZW50ID0+IHdyaXRlIShmLCAiUE9TVF9FVkVOVCIp
LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1zZ0Z1bmN0aW9uOjpSY1RyaWdnZXJlZCA9PiB3
cml0ZSEoZiwgIlJDX1RSSUdHRVJFRCIpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1zZ0Z1
bmN0aW9uOjpNbXVGYXVsdFF1ZXVlZCA9PiB3cml0ZSEoZiwKPiAiTU1VX0ZBVUxUX1FVRVVFRCIp
LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1zZ0Z1bmN0aW9uOjpPc0Vycm9yTG9nID0+IHdy
aXRlIShmLCAiT1NfRVJST1JfTE9HIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTXNnRnVu
Y3Rpb246OkdzcFBvc3ROb0NhdCA9PiB3cml0ZSEoZiwgIk5PQ0FUIiksCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgTXNnRnVuY3Rpb246OkdzcExvY2tkb3duTm90aWNlID0+IHdyaXRlIShmLAo+
ICJMT0NLRE9XTl9OT1RJQ0UiKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNc2dGdW5jdGlv
bjo6VWNvZGVMaWJPc1ByaW50ID0+IHdyaXRlIShmLAo+ICJMSUJPU19QUklOVCIpLAo+IC3CoMKg
wqDCoMKgwqDCoCB9Cj4gLcKgwqDCoCB9Cj4gLX0KPiAtCj4gwqBpbXBsIFRyeUZyb208dTMyPiBm
b3IgTXNnRnVuY3Rpb24gewo+IMKgwqDCoMKgIHR5cGUgRXJyb3IgPSBrZXJuZWw6OmVycm9yOjpF
cnJvcjsKPiDCoAo+IEBAIC0zMzAsMjIgKzI5Miw2IEBAIHB1YihjcmF0ZSkgZW51bSBTZXFCdWZP
cGNvZGUgewo+IMKgwqDCoMKgIFJlZ1dyaXRlID0KPiBiaW5kaW5nczo6R1NQX1NFUV9CVUZfT1BD
T0RFX0dTUF9TRVFfQlVGX09QQ09ERV9SRUdfV1JJVEUsCj4gwqB9Cj4gwqAKPiAtaW1wbCBmbXQ6
OkRpc3BsYXkgZm9yIFNlcUJ1Zk9wY29kZSB7Cj4gLcKgwqDCoCBmbiBmbXQoJnNlbGYsIGY6ICZt
dXQgZm10OjpGb3JtYXR0ZXI8J18+KSAtPiBmbXQ6OlJlc3VsdCB7Cj4gLcKgwqDCoMKgwqDCoMKg
IG1hdGNoIHNlbGYgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNlcUJ1Zk9wY29kZTo6Q29y
ZVJlc2V0ID0+IHdyaXRlIShmLCAiQ09SRV9SRVNFVCIpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNlcUJ1Zk9wY29kZTo6Q29yZVJlc3VtZSA9PiB3cml0ZSEoZiwgIkNPUkVfUkVTVU1FIiks
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2VxQnVmT3Bjb2RlOjpDb3JlU3RhcnQgPT4gd3Jp
dGUhKGYsICJDT1JFX1NUQVJUIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2VxQnVmT3Bj
b2RlOjpDb3JlV2FpdEZvckhhbHQgPT4gd3JpdGUhKGYsCj4gIkNPUkVfV0FJVF9GT1JfSEFMVCIp
LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNlcUJ1Zk9wY29kZTo6RGVsYXlVcyA9PiB3cml0
ZSEoZiwgIkRFTEFZX1VTIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2VxQnVmT3Bjb2Rl
OjpSZWdNb2RpZnkgPT4gd3JpdGUhKGYsICJSRUdfTU9ESUZZIiksCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU2VxQnVmT3Bjb2RlOjpSZWdQb2xsID0+IHdyaXRlIShmLCAiUkVHX1BPTEwiKSwK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTZXFCdWZPcGNvZGU6OlJlZ1N0b3JlID0+IHdyaXRl
IShmLCAiUkVHX1NUT1JFIiksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2VxQnVmT3Bjb2Rl
OjpSZWdXcml0ZSA9PiB3cml0ZSEoZiwgIlJFR19XUklURSIpLAo+IC3CoMKgwqDCoMKgwqDCoCB9
Cj4gLcKgwqDCoCB9Cj4gLX0KPiAtCj4gwqBpbXBsIFRyeUZyb208dTMyPiBmb3IgU2VxQnVmT3Bj
b2RlIHsKPiDCoMKgwqDCoCB0eXBlIEVycm9yID0ga2VybmVsOjplcnJvcjo6RXJyb3I7Cj4gwqAK

