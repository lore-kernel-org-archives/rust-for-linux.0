Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632808;
	b=efux8Qz0l+cmqe5338Xu2XcGtiYxX/ZLjURdJj4zAKQD5Q1MedDyQyaKjJ+PuqB7pHAr
	 FhJQztIV4eisd3Eqpr90q/4VF2JZoOsUOVD9GRxelWl3GiaOCSHQSVFDGe6Nja8lSeFS6
	 MpZD7Gmkn/717DFQ+bK9a5WG3rJg1AQzaU3idydhW/pjXqk2RHaJ2GPgmjPYiIWv5056p
	 C62vZpXvjfLu7+A+KnqPejipukw2qCd8iKNXeANd6jySztaXqoVagmtykiF1wvdN+NGnW
	 gFHCrhxLv/8nyPTG/I0UJs5izG/ofOUh1X57sJwi0uC6+cm/T4Rzz8Sl8j0DEs0JiGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632808;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=IXZFFHiD7hMGHynA6Ccfv1BaoyD6t884soHnOdyljU2Z5/u+AwIBSMdVtN9ngVAN5y1U
	 UhZaFSwnDVuQWEJIAGPKajB3JQOXlgnQj9lwXpcTSiG5t6IOBErIiBvCGixNvXbVA9dC+
	 f129fcaRg1nZbbuwW+0vjSFnuGuZqwOtIZEeSiYV1+SmVaRwA+faoIHaQDQTxvaV/JY5p
	 TEEhnsj1VROVa+6C0nzs5ojvGnKuodi3Vt6C4Nq8Uyp3YFBYVbE7S4W9QjUyIwkrQqz9E
	 xccX8jA1G/j4o3f09Wunh7G8J1T7xIFc8px3E3GY0ftYcxVB4e/t+1OW80ER+7XsdVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MnJh7yec;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943C9606A31E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 18:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MnJh7yec
ARC-Seal: i=1; a=rsa-sha256; t=1795632747; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=alzVgPqw3eyocbsHvDDCQLv4Q3A9mR0J6QQ0Z5rKUGzZH64moKjaZUDpzWmLyGtzEJtHibTlR8LUTmBgYuVUapXBHKtwIfY+uPsORFOwqGbktGXujaR4y8OcKQqH1KwI6TxFk1rgAt50pggHV6DbsrNqHutq/FYo/tbKJrh4B3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795632747; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=ORs8YV9paKzK1Nc4mbHX4K22nYS106KQcn0Fqmwxh1Z0axMPeiZYRJGT4WZZSyEwKrWQwhZ8Zasra98Agr2XFOi8zWMtKx2YSVgybXPjkRNhNkEWC4YxQZ9aesMuzI/HlM08GqmoEO5LC+b9DmnNEy+1hSrPkW1EuN0o4CLPhyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=MnJh7yecbugOwAyFX1HFA8JALraXKM46wSxfnry5NWqfpITaD4mMqoEGD5VfV3A8JHjNL4IaYQrEp42DLQ+rlZkPsT2VL58bI5P9BE1SPKzCnbwW6FeZ0fQWbZXXNqJQzYrC1bRxhWyHktqTTV9hGVZdx0tVMH2MVsttw+o7cyA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795632746112307.22570697106903;
	Wed, 25 Nov 2026 10:52:26 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 08/10] rust: device: expose the device DMA attribute
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-8-3a2af624b992@linux.dev>
Date: Wed, 25 Nov 2026 15:52:07 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Ke Sun <sunke@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <53EA90E4-BA47-413A-B8CA-7788F7AE9DD9@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
 <20261122-tyr-ioctls-v7-8-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
