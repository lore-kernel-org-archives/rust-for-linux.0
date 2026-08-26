Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB947142D;
	Wed, 26 Aug 2026 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780614; cv=pass; b=eZ3vnPeQXb1CQmFObB4RvfnQu/W1yEGdGr62x1VKE1agwoof7c7nSfXNZlQvP1R3lcPFsnxCr5rceyAgRD3MZ3cTht18quNsOh7zzLr2KPEvtBJBeTwqAIgB7mm9KcguSciwBawqNJhI3C53b2dBpQglg9NZFWRzfA1w0A7rCuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780614; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HJYyPMa81G1R3j0qUPi3AQgk1oqjfUxDWnEszpGywZYh50bgeEFpD+N2V3U+B9qEGtl3l+whYObvbXE/0WgSQzVDPmg2zYs1F5BRENBlXLJFUbDX1JCJe+6VVjNO3U0Cof8VbD5iUqNn9OqKUt9bN/nDHjgP8lpB0ASvFZN7nsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TLIrC9qN; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TLIrC9qN"
ARC-Seal: i=1; a=rsa-sha256; t=1787780568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FNVd718H131dLQmwNYsgt3Kj1GXZpHMizVGMwUuAlEZPK9tMtEBASFejMOkY4SknwfAe0dJCxqdlO/qsceWKfqG8sciKvier/AfthmoBoUPyHrGnIfQ6k9JW1YQCAW7FKTJeCC1dbcvGsRvN+ed2s4N/6raLPXJBcfq7wMU4M+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787780568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=U6D5Udi58fpwJpCnVxaAEgPdrrAR5NRTshGe/SziK92GoILdh/GZl/PgsPalPMVUq8CsczCzEEd6JafZkaq2EQ/BjZu0zU68l21P75VEVp8swg2KnRYqnre0pdg3lz9yR5hLMpyrQK3nH0/cZzFTtYCKLDcdXJ4JhIE82MsSGTY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787780568;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=TLIrC9qNZ15On1ncutqU1nUvypenOamHL0MbURxjZNUZlNsJQTwm5BNdM0f1/oru
	CNJqqVRCI+EJ2jImt38la+g0FvtJ/jHY+pcdBCxbdm9jyLjs811RP1aoxsM3oJoYf1Q
	M0PQ0oyvIatFJnb3jMhE+JEjt9wDSgfj3h5zokUA=
Received: by mx.zohomail.com with SMTPS id 1787780566270342.6469272564714;
	Wed, 26 Aug 2026 14:42:46 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 01/11] rust: xarray: minor formatting fixes
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260604-xarray-entry-send-v4-1-965f6028790e@kernel.org>
Date: Wed, 26 Aug 2026 18:42:22 -0300
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
 Daniel Gomez <da.gomez@samsung.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <509646C4-8225-41C3-8A32-96CD105EA302@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-1-965f6028790e@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
