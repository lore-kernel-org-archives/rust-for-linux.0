Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781721;
	b=fx/YlPGf7uZs8xU3UQ9CNdeq+1LZlubNNkgX0LQikLiiHnbaGr+cXCgDeoO8CNsnHPxb
	 MHOAY3ZbViyz9erHpijmmINC5ynQEK04K+4+g0CJPC4++as8+TJw+W8MGS2Sb6Ku4p5/f
	 oN7moNW1cFiEI8emeATvHJuhpmx0JuJmkSO3Lc4xB0tQVp+oyQFMIU2yseuFwRaCvEYaU
	 zNlQQBC/eiuhdf4+LxHbA1O1Gtpg1rQQwe6F1PItq2JI+CnSRJhNmfAQ5Ih27GdL8Ul7V
	 CrrPLqfO8tHmy3fsq+PI3N47zROtMUHGffZuPQkUBUwNks4R4UgxvZAFGsonuGdIM7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781721;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=6TALtB+99lw/ARPvnVNmv+T1dMrR3PeZsEge0aWRtII=;
	b=CTMPRXZEt0ywASRSH9zTUDoPsPDMyV4lymJsSceRq+umWgBOIpr+h3JcrfAIRFU1GHiJ
	 gaZdpEBZq4q9agUSsSPUMWlUkFbmODhbW5XPcx32KugNzH1HJoFOi7EI10E6NZdwtme5b
	 JwwVNUImprxdMSruAM6OvGVYs7nwELdB6qyc6JjJwHpLI1kyUCL8WyaWSz+3SpJGmQhht
	 NtpOX3cTprgexAWJlvplB/MeGglKtBcc0NjmwMl/OX+St6BDJwyohEWmEZruzHXiG2LBP
	 cVUgduWh0KcjDHk+R2Rr14u6Nt1SFgoT9fIwjHHqMa1fWjMzIF5FU1mW5HdbiQbEPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=tQv2OO4B;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DEC606A330;
	Wed,  4 Nov 2026 08:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DEC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=tQv2OO4B
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jKJp64C6Jz8vmm;
	Wed, 04 Nov 2026 09:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793781710; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6TALtB+99lw/ARPvnVNmv+T1dMrR3PeZsEge0aWRtII=;
	b=tQv2OO4BpsXbn/HRi+pbIvy7AgddDYrTzr+gyOXH8aSjGh6czmSN/H0JYZf9QcaWOJlf4r
	khOcpWP5XY8XgStDuLfTAxk+6e2FtYm9DBfdDQpUILbBjPQIV28PlRh2wFNMiM7ZfU6n7U
	H9Bt85dnzFeMLmPNH+WNAXL91iGIRbk8bccrxXGIb98r5Vo8WMcJuFcvJfLWc1i0TdaR6u
	WeqJSBfrvCP6gQkMhw8Jw75QY5haF6Aft4UGHQ66mqJWPXNLd/ZHJTFDia6jAkCBqIdAqQ
	CzT7RoX+Xyfbml1oOeJXfQp6ViMf8Wv9fa74nGhEuGVsiL7DtuJtZKyt1RSLGA==
Message-ID: <54d07bbd9e5dbadf4e63c81b88f8d0b41cbb5cf8.camel@mailbox.org>
Subject: Re: [RFC PATCH v7 8/8] samples: rust: Add JobQueue Tester
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Younes Akhouayri <git@younes.io>, Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl	 <aliceryhl@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng	 <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, David Airlie	
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin	
 <tvrtko.ursulin@igalia.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Date: Wed, 04 Nov 2026 09:41:47 +0100
In-Reply-To: <kw-1793744821.998563484-558346-1@younes.io>
References: <20261103153138.1087330-2-phasta@kernel.org>
	 <20261103153138.1087330-10-phasta@kernel.org>
	 <kw-1793744821.998563484-558346-1@younes.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 5e1c944c929fa6f27a5
X-MBO-RS-META: bh8krqkmfn87qwbdxw6c1k48d14wme86

T24gVHVlLCAyMDI2LTExLTAzIGF0IDIyOjI3ICswMDAwLCBZb3VuZXMgQWtob3VheXJpIHdyb3Rl
Ogo+IE9uIFR1ZSwgMyBOb3YgMjAyNiAxNjozMTozOCArMDEwMCwgUGhpbGlwcCBTdGFubmVyIHdy
b3RlOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJvcChqcSk7IC8vIFJlbGVhc2UgbG9j
ay4KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFQ6OnJ1bl9qb2Iod29yay5mY3R4LCBydW5u
YWJsZV9qb2IpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAganEgPSB3b3JrLmlubmVyLmxv
Y2soKTsgLy8gUmV0YWtlIGxvY2suCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
LyBydW5fam9iKCkgYWJvdmUgbmVlZHMgdG8gYmUgY2FsbGVkIHdpdGhvdXQgbG9jayBwcm90ZWN0
aW9uLiBUaHVzLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gaXQgaXMgcG9zc2libGUg
dGhhdCB0aGUgZHJpdmVyIGluc3RydWN0ZWQgY29tcGxldGlvbiByaWdodCBiZWZvcmUKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIHdlIGNvdWxkIHJlLXRha2UgdGhlIGxvY2suCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBqcS5sYXN0X2NvbXBsZXRlZCA+PSBzZXFubyB7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZlbmNlLnNpZ25hbChPaygoKSkpOwo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBEcm9wIGhlcmUgZGly
ZWN0bHkgaWYgcG9zc2libGUuIE90aGVyd2lzZSwgbGV0IHRoZSBEcm9wV29ya2VyCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIHRha2UgY2FyZSBvZiBpdC4KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgY29yZTo6bWVtOjpuZWVkc19kcm9wOjo8VDo6
Sm9iRGF0YVR5cGU+KCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGpxLmRyb3BfbGlzdC5wdXNoX2JhY2soam9iKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAganEucnVubmluZ19qb2JzLnB1c2hfYmFjayhq
b2IpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IAo+IEhpIFBoaWxpcCwKCkhlbGxv
LAoKPiAKPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGUgY3JlZGl0cyBhcmUgbWVhbnQgdG8gc3RheSBj
b25zdW1lZCBoZXJlLCBvciBzaG91bGQKPiB0aGlzIGJyYW5jaCBkbwo+IAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICpqcS5hc19tdXQoKS5wcm9qZWN0KCkuY2FwYWNpdHkgKz0gdTY0
Ojpmcm9tKGpvYi5jb3N0KTsKPiAKPiBhcyB3ZWxsPwoKTm9wZSwgdGhhdCdzIHNpbXBseSBhIGJ1
Zy4gV2VsbCBzZWVuLiBUaGlzIFJGQyBoYXMgb25seSBzZWVuIGJhc2ljCnRlc3Rpbmcgc28gZmFy
LCBiZWNhdXNlIHdlIHN0aWxsIGhhdmUgdG8gc29sdmUgc29tZSBxdWl0ZSBncm91bmQgbGF5aW5n
CmRlc2lnbiBxdWVzdGlvbnMgKHNlZSBjb3Zlci1sZXR0ZXIpLiBBbHNvIHRoZSBjcmVkaXQtY291
bnQgc3lzdGVtIHdhcwpyZS1hZGRlZCByZWxhdGl2ZWx5IHJlY2VudGx5LgoKTmV2ZXJ0aGVsZXNz
LCBmaXhlZCB0aGlzIG9uZSBsb2NhbGx5LCB0aGFua3MgZm9yIHBvaW50aW5nIGl0IG91dAoKPiAK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9jb21wbGV0ZWQ6IDAsCj4g
Cj4gRmVuY2VDb250ZXh0OjpuZXcoaW5pdGlhbF9zZXFubywgLi4uKSBoYW5kcyBvdXQgaW5pdGlh
bF9zZXFubyBhcyB0aGUgZmlyc3QKPiBmZW5jZSBzZXFubywgYW5kIGJvdGggdGhlIGRvYyBleGFt
cGxlIGFuZCB0aGUgdGVzdGVyIHBhc3MgMC4gRm9yIHRoYXQgZmlyc3QKPiBqb2IgdGhlIGNoZWNr
IGFib3ZlIGJlY29tZXMgYDAgPj0gMGAsIHNvIHRoZSB3b3JrZXIgc2lnbmFscyB0aGUgZmVuY2Ug
T2sKPiByaWdodCBhZnRlciBydW5fam9iKCkgcmV0dXJucywgd2hpbGUgdGhlIGhhcmR3YXJlIGlz
IHN0aWxsIHdvcmtpbmcgb24gaXQuCj4gCj4gU2hvdWxkIGxhc3RfY29tcGxldGVkIHN0YXJ0IGF0
IGluaXRpYWxfc2Vxbm8ud3JhcHBpbmdfc3ViKDEpLCBvciBpcwo+IGluaXRpYWxfc2Vxbm8gPj0g
MSBhbiBpbnRlbmRlZCByZXF1aXJlbWVudCB0aGF0IGp1c3QgbmVlZHMgZG9jdW1lbnRpbmc/CgpU
eXBpY2FsbHkgdGhlIGRyaXZlcnMgd2lsbCB3YW50IHRvIHBhc3MgMSBhcyBpbml0aWFsIHNlcXVl
bmNlIG51bWJlciwKYmVjYXVzZSB0aGV5IGhhdmUgdGhlIHNhbWUgcHJvYmxlbSB5b3UncmUgZGVz
Y3JpYmluZywganVzdCBvbiB0aGUKaGFyZHdhcmU6IGl0J3MgaW5pdGlhbGl6ZWQgdG8gMCwgc28g
dGhlIGZpcnN0IGpvYiB3b3VsZCBiZSBzdWNjZXNzZnVsCmltbWVkaWF0ZWx5LiBTbyB0aGV5IHdh
bm5hIHN0YXJ0IGF0IDEuCgpOb3Qgc3VyZSBob3cgd2Ugc2hvdWxkIGJlc3QgYWRkcmVzcyB0aGlz
LgoKQERhbmllbCwgbWF5YmUgd2UgY2FuIGp1c3QgcmVtb3ZlIGBpbml0aWFsX3NlcW5vYCBhbmQg
YWx3YXlzIHN0YXJ0IGF0CjE/IEknbSBub3Qgc3VyZS4KClRoeCBmb3IgdGhlIHJldmlldywKClAu
Cg==

