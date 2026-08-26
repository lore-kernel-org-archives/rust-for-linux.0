Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57048165C;
	Wed, 26 Aug 2026 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780645; cv=pass; b=JC7aoRhXqFrP1jyrSZryur0Awuc4PnmMOX7aBUIxYxRO47/HD1ai3gKIEDb3A9w4g6MhaefLAx1Aen0BJp4TmysMx/GbunPz3vcpzYIhvp9kEgzx0bozbrEl6SEkXXZJlpgiuw7961THkgO65yK+M2o+/IthLKfTZvYSoE66SbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780645; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZeU97FK8GKZd1/cDAic9ULS6s7bxJQTDdSchIT8ftS17XKkB0FrRaqIj9TVdW9nT/O9pOmyZjRs62egDP24n7I8XRm1MXqV8lDi7wQNXMN/4l7+AzJi/+e9lzoJHbRP31PthnJjdwQ1nM27VBnp/DecVu/+zMhrnmeKUBQCXTFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=S4k+Uqxq; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="S4k+Uqxq"
ARC-Seal: i=1; a=rsa-sha256; t=1787780612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ImLF6WJxhHCEKi6DC3cgYoFwZ3htXW2z8+AwftB0gi9uyvy3jN5JjCjSv0DOnNa2G1BHgzkGlqoYuLkh+TjSVNcK3bJl5Kh2ojx3Hc54RzUoFNDEsblpqYJj1MTLGNCNghETp1NOFx/bCv4grh7eC8Ba2hhlcbziXBhizTICeCQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787780612; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=Wg7yr/Uc8G2+qqaZlduUCSdiXFNCiBUi+bC68K/qmPOHo8zh1EEne9PYdiAcIOUUTCY+xUmk34QeHp1XDb9oScfZBGvTgsBb8pg5XAMXRTVha9hHTTEd2EZgq4P4sNjK2OAOKwq1VdsFq+P7TsFfJSH7Iq/068Ek4FRL2rBLjDw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787780612;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=S4k+UqxqIE38lJBWtOe3BkHacuLzdAD4MGUvl9SOtl986XKi+he8Iodm2japEnEQ
	uvL7wSFSqGhdPPvTLWxKCtRdMvzkzjFFwa8lC5fbQ7j+F6huKI+B3/YpqQewHLakbl9
	8knYZO0mPliW9VllLQHYD7J5nT3zy2Ho8gnTiCwA=
Received: by mx.zohomail.com with SMTPS id 1787780610742503.2520550080949;
	Wed, 26 Aug 2026 14:43:30 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 02/11] rust: xarray: add debug format for `StoreError`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260604-xarray-entry-send-v4-2-965f6028790e@kernel.org>
Date: Wed, 26 Aug 2026 18:43:07 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tamir Duberstein <tamird@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>,
 Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 Daniel Gomez <da.gomez@samsung.com>
Content-Transfer-Encoding: 7bit
Message-Id: <FC83565E-5574-43F9-AB5A-BA1C34191DEB@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-2-965f6028790e@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
