Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290FE1E515;
	Wed,  8 Jan 2025 19:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363445; cv=pass; b=h3cD66llexMkwMKhrE3+XzhoqfRqY2oSpAQEfTk/oWyz1XYk+bgE6sFXWo4fXUf8dQuHQhxMXdUhSvZbDrI+AdjJ7imrwdUvtK0WhOh4vyTRIIaJcUrfnV4S+Tw9Y8rJp3d/yHDfCo5xWch66wPUaeDENG5/tmLaZ9b8Z8DuYBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363445; c=relaxed/simple;
	bh=wbqbVis2eWu6cq7r8f6KHogGGQI3IGSblMeMeYro8FM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jqg9qO8bV4zG5IoufE96lHppZ7hJD3+TZuFgsI3hfV4ulsMknvWx0bWJeFJ49enS+oi3yX1Y3HQ6/qrJ54lFdLY5KBzRWSBjvwhAvT8gG9s6lE4lUDnYSVKtUmc2ZI+GcTx4GWfK63b+JSxfB7xkP+C14/dLJkZbDlP2DJoz8fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=I47uqplY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="I47uqplY"
ARC-Seal: i=1; a=rsa-sha256; t=1736363397; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NDK6pxdu6coREunOO8m5HOM2l8x2F14fzpuGHMb7f7ZDMtFv1l/8bQ79tv/59waPRem9+N04Kz+CI9T2Vx63DXumpAzNemA49CwSfytEBl6DFD4vti0LiUlFdut75ow5Qqz6z0QNHyijklm/lq7CdiAh8YgfQNeJ7pC6Ps0a9ys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736363397; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wbqbVis2eWu6cq7r8f6KHogGGQI3IGSblMeMeYro8FM=; 
	b=hw50OCkzv3cGcI1hfNRJZ2ItHVZ2pnoljXGZrEtQXVcQY3peUudLUW93r3Nb0KnwCMltUIDcUhKdePebpt6GDEvyxyjZSJF9MyqD8BtbHv1Vle/k2P095ZrmI4uM+be61cmZ/uuZsJ/O+nPpvkhMfmLPcaNSq6BYvXCU4uekCD0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736363397;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=wbqbVis2eWu6cq7r8f6KHogGGQI3IGSblMeMeYro8FM=;
	b=I47uqplYxuv+veIXXoG72kaKM4KJFsdZXXIRxR/UwY8319wv0ok5MS2qo6FPSTWa
	DwiDC7A/xAh4R7kizukXRRBV/fherrM7TPK40VDhluV1yEvIMi3oMpqfeEtb6Y+622N
	2aEc2X5t4zSDalcB6Gdib5ebxuZdwrl3sUjS+G/Q=
Received: by mx.zohomail.com with SMTPS id 1736363394512598.8890555593522;
	Wed, 8 Jan 2025 11:09:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <588af6c5-02cf-437a-a909-c22744a6df1c@sedlak.dev>
Date: Wed, 8 Jan 2025 16:09:36 -0300
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 aliceryhl@google.com,
 robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EFC67281-5CE1-44BC-92A5-7B0E4A7FB6AD@collabora.com>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <588af6c5-02cf-437a-a909-c22744a6df1c@sedlak.dev>
To: Daniel Sedlak <daniel@sedlak.dev>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Abdiel,

I was trying to test this again, but it apparently doesn=E2=80=99t =
compile for the reasons
Daniel Sedlak pointed out above.


Send a new version and I=E2=80=99ll test it for you.

=E2=80=94 Daniel=
