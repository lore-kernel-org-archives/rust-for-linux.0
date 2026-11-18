Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795004615;
	b=CiH1GpVkV8UIms5TO+oICIDa7LWIQHCMULLCFJ7qlXsJ5oOIdR650XgBJk9uovvWbg8A
	 auIylr1dzCRmvqbGIrOuUtu5mg85o33OSoed+T25caM8IJRIS565ppMNxolqHOr8DmGdi
	 L5s3BkZDK2kB1NVc6ce0DE0sISgmedRbfrZ8vb3IJuOBXrioPGR0pFJcUVx/Cohb6evT8
	 D6V+bN9Cby8WJxM+aQccMiesG8SvmRIsHBlLgVIFdULs/xDajbU9FGZKtAExH7clJzYZH
	 FhgF4YEOnIqHj0ZLJlaqzklQf1HhzjjAVHYIAglLj9f8yzBZuTB2v4PEDuqopNL1bPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004615;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=cjhT9lPBrmYqZSZOzIBzYhYI/I9rXhhiam5UCNwKdF8=;
	b=1J/9McEj9MvvGK1H1CkIliPLZYxLAE67ZcgQToiiBKIAT94c69cLe7WTkvpLRox3bSqb
	 Smnuy+ktSqjHvzBTGuSPk8tPWH6wqiZkyAlaVtwp16AiLSzeD5GCIRnI9s2X4onIw7hRy
	 YvVLt1RvqljYX+4yK9Qs5XBRnwo/3HSV/boax0SfponGYsCJu7gc0357XP8mMPMFKSwbo
	 aHKBjtGCHAEfc0ZKwon+gsjIDryidQ5lSzXIrQRwnDHk6DX3RtxaP1nqkTqoRAKrAu4rL
	 Dg5sIX0agz0yBfZQawgoxlOasydbysHfZYb9H87MKbc6vaRmDL9jU/WhT6lxhRe9fPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=J5DBBidH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCA606A320;
	Wed, 18 Nov 2026 12:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DCA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=J5DBBidH
ARC-Seal: i=1; a=rsa-sha256; t=1795004586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oGbns6684pX2WvPKftPvV4vlLiBQyCVkT4FCAuLiDDuGMCE949C3jUBopub8DxV4p2hTIs3zDPbHktFeFCpn39+WpfIuvKpArgFxTBSc1DuP2WZSfQb5G1VDDto8keTAhrVhrry/hkLmQnQBzwSHurx5haNTAH00j+0HtwoIqGQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795004586; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cjhT9lPBrmYqZSZOzIBzYhYI/I9rXhhiam5UCNwKdF8=; 
	b=eCYRGWHeG41YcUgNTA7IjsQUmOK1GIOCWlYiQ6BUqKXsRRMS5EDF72rAdGY9BhTqyQsO3XcxOOd2exTPldUKyTwOzTXaD55oHyVEFsvw9umodnae57sV7+vhxnoiqTDLPnEMu9WDbkZfdvzpz3+YXGzRfNiq5DG9pA6B9pvdZI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=J5DBBidHI4rrMJEWmOlpnBmuoVkNfyaktxykd+RnxCgVuXlsy4E6WKvch5WM+GEqWnJp6WqP5iv2lyQuTXpOadRSWIBBFGjK7zWkitoVzyy4rZbF+WH4HTygm7Nf1kArRPNipbRAH5NDw71kv+0NvGvimg5QjqW9YRwPtk7jWOM=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=cjhT9lPBrmYqZSZOzIBzYhYI/I9rXhhiam5UCNwKdF8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795004583498854.6891259147035;
	Wed, 18 Nov 2026 04:23:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2] rust: DamFence: Remove warning about unsignaled drop
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261118120813.1539288-2-phasta@kernel.org>
Date: Wed, 18 Nov 2026 09:22:46 -0300
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
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
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E66E5A69-4B91-4089-831E-8DB07308185D@collabora.com>
References: <20261118120813.1539288-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Philipp,

Just pointing out that the same typo from v1 remains, i.e.: DamFence

=E2=80=94 Daniel=
