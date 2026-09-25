Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585484E431F;
	Fri, 25 Sep 2026 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364623; cv=pass; b=A9Jv6eEn7XksXW57bXTflfiy6Rfy8P1DGNib+Ad5DWkIkQEiXaBXMVoeBYPPL9tKvWBtRgYylhFHvKnFbqjWiHkPf2/rG9BfEydK9PxVQl5nrD/T8xX0mAtN0XHZpcpKYRbqXnjMkXX5IG7AhJS4VlcsugVyDKwyGIe/zARkht0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364623; c=relaxed/simple;
	bh=Fl8MMa0wunW49KVsDpPNJOMA7OoJz4FEmIKxTOvvKpE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UPhZBZgaXNNoZBnqkmL4MgGinudIdrEWV6Sa0V+hUih4sodBAxLaRDbHOGJ/Yy88rdIadejpBhYYxMmMb+F6cdbu/jsjQ1lnmwwikj/CQXkwgXzcV8lY9TTHUxOTWzcsX7joCMgXB+JVeTAHA266dHQvrkSk45rBzL6a3qRuGp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=NTK0p4uo; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NTK0p4uo"
ARC-Seal: i=1; a=rsa-sha256; t=1790364588; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SbbHqGT0S7wXi307gC/LcnQ+XTJCyDoKua/rYGbTbnpysFYFhnjszdQ1B94XB67w7MDoWiejy/Gd+jLj8bC+gpN73LNg8z7mxq9x71AtyGUobZZELwDf9fsOlFnorPccauzBRTI9zHrWFeHA9Er2rbmZ+uwqa+FdnVWe9qIMjag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790364588; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Fl8MMa0wunW49KVsDpPNJOMA7OoJz4FEmIKxTOvvKpE=; 
	b=Kkr89YkUX4kSTqxDFZ3LUhk9m7yYa6L/em3QGZ+NbkhKLeadXEgBnFVHUuR5eewfM7pNAVC2NUnn7V8utnWCQ0t8nXG8Pp6EEURjnNyE7dqZWK5JhrxJQJhlycLchNo3pulRPYVVIAMdi7UI3tOj80h+CSgxbyzm3RlkmWwVHxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790364588;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=Fl8MMa0wunW49KVsDpPNJOMA7OoJz4FEmIKxTOvvKpE=;
	b=NTK0p4uo9POcg19eXN1XAUywWBQBt/BJaMeCeQats13bSmc+69mRlsb7giKlc24p
	e2u4Nkyl2/U3/lAFWpFDbFJuJTTmzgYlmDK1NQKJQAWkfcfhO/uhHI/6pUJfa8UjqjW
	BRaoyV0o6ivSrbr1uWVDxopVuFQ2p+yPELaU43+Y=
Received: by smtp.zohomail.com with SMTPS id 1790364585866185.57766798937166;
	Fri, 25 Sep 2026 12:29:45 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v6 0/2] drm/tyr: add Job IRQ handling
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260728-tyr-irq-v2-v6-0-15c90baed949@collabora.com>
Date: Fri, 25 Sep 2026 16:29:27 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 kernel@collabora.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <987240A7-9626-4520-8143-B283B431A2AC@collabora.com>
References: <20260728-tyr-irq-v2-v6-0-15c90baed949@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Laura,

It makes more sense to have Onur's reset v7 land first, so the Job IRQ =
series
needs a rebase on top of it:

=
https://lore.kernel.org/r/20260912-tyr-reset-impl-v7-0-077ce72084eb@onuroz=
kan.dev

After his 3/3, the registers are only reachable through HwGate, whose
access() takes a mutex. I added try_access_atomic() for the hard handler
on top of v7 [0]. Can you rebase onto that and carry the patch at the
front of your series? Then:

a) hard handler: try_access_atomic(), return ThreadedIrqReturn::None on =
None
b) threaded handler: access()
c) drop the #[expect(dead_code)]

=E2=80=94 Daniel

[0] =
https://gitlab.collabora.com/dwlsalmeida/for-upstream/-/tree/tyr-hwgate-tr=
y-atomic?ref_type=3Dheads=
