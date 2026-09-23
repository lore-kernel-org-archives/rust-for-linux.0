Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5853DAACF;
	Wed, 23 Sep 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197789; cv=pass; b=lcelw0od9W4w+/Puc2cQMdVcDnJysBlSD+e7/pRn1cl7WhPwFNwgAIhgJMDgK8V9iRPv/hC4LBxLIrHfr5JvzPgbCYLS6yrkg/Ez5yracFH3Qp9aZmq9Xqy4xG+OiDyicc3lMsGxQe0c6Nip3IJqhEL/R9jaMJiSxB7bbphiwmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197789; c=relaxed/simple;
	bh=g50aYELf9uWnrvAqzcCXLgHvwbHmH1ulJxKPBlt0jas=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=S76Lio9JBC3gBCLQK8BS9EVWxfvO54rFSfITdsGIZaSSuB9S4rahr9VYUpNIL85q/YKW2vbUhOO888miz8A0yAZwrL16pp50OHgtOJrAXPxWjOTvb4d0Cbrn/czRLK6vyRdNQc7KGBecZzi8Vv1Eb/f/Tz3L3pKvbqppsfZijQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=a5J1r/7z; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="a5J1r/7z"
ARC-Seal: i=1; a=rsa-sha256; t=1790197729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b0zvJPcj/0BVLCBlfvZu5Fg7a18GyQNX6dVM7n+Gk2jTuPixASIushoBWnrbUMMP7Sm88l5KkC0C7ISJNxyyk7/N2X1Gecf6TcaJ68rbs2QM6FYS08GHR6dxYk7f3j/5GltyL/Lm2RbnuhMz9bTBaaaIp5Uj1Ncxgx/KD6JXkqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790197729; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g50aYELf9uWnrvAqzcCXLgHvwbHmH1ulJxKPBlt0jas=; 
	b=JZ/Tbvr47dO5wU0dOv2mWLNRll73nOCBxKjIZcShRL0FaxKqA0rtJiIABwpPcWGKvBSnRVSAP6KG2rxCaIE+l2BqBjBnbozUTPJbSFZZe8NMv9N7znOFFJiQfLcn/7jtw4S/P9pi+uaRkh4pxAJaQNHZORyCZqt+iE0nusj9EhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790197729;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=g50aYELf9uWnrvAqzcCXLgHvwbHmH1ulJxKPBlt0jas=;
	b=a5J1r/7zyRsa8T776CNUEtJuYlyE+19nM7cbTpuasSz5TR5uDU+0ImUdfV8AlaqI
	VytZU9FFKuoJD5Z6XfajJzu9oKnW+/YLBgSj6AVqtVDP9318Y5zV/ViRC4WtvOPWUu+
	vpCDNDEJuYlWInjLBrK4UWIsKXvjmPtgtKX3p7c4=
Received: by smtp.zohomail.com with SMTPS id 1790197728390344.91512158913406;
	Wed, 23 Sep 2026 14:08:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 0/3] Rust XArray
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
Date: Wed, 23 Sep 2026 18:08:29 -0300
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Corinn Tiffany <corinn.tiffany@inria.fr>,
 "Liam R. Howlett" <liam@infradead.org>,
 Philipp Stanner <pstanner@redhat.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Samsung GOST <gost.dev@samsung.com>,
 Daniel Gomez <da.gomez@samsung.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BDFF5973-A521-4A0B-84DB-82C6A595F6BC@collabora.com>
References: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
To: Daniel Gomez <da.gomez@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External


Daniel,


> On 23 Sep 2026, at 18:00, Daniel Gomez <da.gomez@kernel.org> wrote:
>=20
> We are evaluating Rust for the XArray to test if Rust delivers what it
> promises for a core kernel data structure, as a consequence of a page
> cache bug that was dormant for years, left users with a corrupted FS,
> was difficult to reproduce, and almost prevented the LBS work [1] from
> being merged. After looking at other XArray-related bugs, I think this
> particular one represents well the root cause of most XArray bugs:
> misuse of the API by its callers.
>=20
> The XArray's main user is the page cache, but it has many other users
> and features, such as multi-index, RCU, etc. This initial support does
> not cover all these features and so, the initial evaluation targets
> are the ones that use the data structure in the simplest form. For =
this
> reason, I would like this series to be considered as a reference Rust
> implementation (experimental) [2] that we can merge in-tree to let =
users
> experiment and evaluate both implementations starting first from Rust
> users: null block driver and potentially drm gpu drivers such as tyr.

Thanks a lot for working on this! This will be very helpful for Tyr.

Give me some time to go over the code.


=E2=80=94 Daniel=
