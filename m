Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795137969;
	b=DqOh50/vLvBMg1SSC5Ny2BX9sDGfYYL2NxM5yPU+pJvSWxB89nEjmMAE9IobkEPOrJu3
	 rC/Fx8kv7IL3aTrQF2UmN9cf3pw/1p/8TEnPDkAGzRvc91uiJyB2qSQprzPxtJTUMTzFI
	 x+U7o3YLxkXbG2qRyNbx17iaQ3SYmAGvgf2SVAg3nhoQr/XUbwwh3owrx/axG5aVcDjS8
	 WW4dW84GC36J48kQfwDDeYoU6i7+bseUec/pGc+Y1Cq+r4PQ65kkMWt3MdUbQVtiWPZmX
	 FbS1pXYSwlPksn//d3/udsEOtqHF1a8qDQu6beLVkuen9LmJmNAwgCYitCPFKmUerng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137969;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=wq05R21IH0m+it9Hfs9k2IMkuyKu8G3ZcY1Bd9cpZIkc02qpktflnQXirYz9S1SDDclK
	 /umfBs2U2OfQsJxViOgctbiTEMjw47Ik97oXv8Rcm29TlbNdgtlKzxh/PNHxnajj9eZ5T
	 zQKNRTXuCAVI6egpt6zgpwZyQPDGB7EQmkMv13mikkN+Co8PR6IuAks1uk6uJZgeDl998
	 2iraSM5swtGCzNpeeX27XFuK7dIkTjTZqkELt8UUP7i4vEKofD134WBWI2I2+6E59uF6P
	 bZhAkNmaj5ajNFOsmlzlmvXySDgVndQy1RVqDXjzl2VTRxg1PCo8h/VQVeBCQ/ynM/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=g8nP1E80;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBA606A320;
	Fri, 20 Nov 2026 01:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDBA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=g8nP1E80
ARC-Seal: i=1; a=rsa-sha256; t=1795137942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jQi/lqqZHqycRDxqDLXZ0wdrayC1AWhR4/BgtKrgRVnAd0oN6TxBl3rbFWXKTUhx4aB0+ed8xsi81AvPGfHxcnevNFmqlTZhKX9ySN1A1d+UVaeoC10xYvqa4AHeEZ7rz2L+s85m6kZ3rJ1Md+t5OtW9ZmYd5lxVVEFi8kS65AI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795137942; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=H352xFaYTGu4dsAC2JbfSR5U3A7ekFVQj7zoZN8zlij+a7LABnLayE7RLe40ONNqLi9MZ+kYa3bBHkKpHzOa3OVS+9Puq2gO/VKjYHM3utClWwI9ll8lzqZv7+PgOQ67h7Xzvp+NG0yXWOctHflvCsm6wnRtU8kTK+qb53aIKTg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=g8nP1E80Z/pgpgrjx3ahXA/XEHGvUcY+ld3Wl8RpTAntRXzecPOKcEMszMPEQCNdPgTSOdL/yOE4bX6Yiy/4BipOlpduz5O9ta16c/dbrSq66H1LPNrmM17nZSjc7BM5PTrOPQFCKtO0qTunF0GunPXo+lh2EmPMCi6gBKmq+pw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795137939387662.7486311832405;
	Thu, 19 Nov 2026 17:25:39 -0800 (PST)
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
Subject: Re: [PATCH] rust: drm: gpuvm: rename UniqueRefGpuVm data accessors
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
Date: Thu, 19 Nov 2026 22:25:19 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
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
 Sami Tolvanen <samitolvanen@google.com>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <37602247-89D5-47FD-B687-A5762AD5FE86@collabora.com>
References: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
