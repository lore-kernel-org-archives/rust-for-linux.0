Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E779535C1B1;
	Wed, 30 Sep 2026 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800046; cv=pass; b=D2NUJSuBEonIEaHz0uFMH/bDuok+3eEy/bsru8jH7u1F0RXPeM5OgwMjpgCk5uNK6AqTnUMeoIC+oQF1PsA5QHrmpHi3oWf0Pcm21syxamzfvQ9LqNzpb0/oQ+z3VMKYpHP7ApDaaJ9ur6r7I6Vys0fJkURqrAgslezXod85k1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800046; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qH7AIEVTKQj4wLcvIkC9ry8Je8E0MvAFWGnflq9uiYRkhVvD1D+p4CWhJiALA+ScbFrTxI/gkOufFHAlZUljN1bco9iNaTQcJXYLFCLBYhNbSTXN3GwSKNGREDdWWeWfnQQnD6mfroSn/A+/oZZaSw3eSkSf/B1uuYoqK2X7+fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=BlrxSRHF; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BlrxSRHF"
ARC-Seal: i=1; a=rsa-sha256; t=1790800019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AQmO8cYLUNRYaxqI5gMVSBLWYdHU4vB1g4Cpv8xOtv7ylJjDpFGulH64vVQB2ZYWBmoNaCJmbKLW/hSizZZbjtsw9Oqe/quPu1kbGO1wbCVNMtiOjQNweekX8Aykr0EEV2zZli1wZSlBqGWt/G2mvEFnpQDjmzPawb7gR496kBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790800019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=dhycs/pxXPSoldxzqpHd0W4PDYuvz4ZJauSYrxSaX05bq9PBaIqAhs1QpzkHEOMABZvJ36KoWCyBM2AU05Aru9s6r74mcqYCoYnko2nEPNYMJvcT8SR9ce+f0eUdvM/TgiJ+IByq9+gQMe4Dn3DbGocRhnT+UNPLeL8mM3gCMh4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790800019;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=BlrxSRHF5hUP60N+YEcMt7LoOw/09bT5Jjgzh2EPiLwUO5lskYuto0izDGSdFP5s
	OSk4ZeHahoDCe7IDCXQ3RGWL7K+Yoy9cAu3dbBy8IKwhZp8TlNlP5I3aCqARy8z4mN7
	8RPFY+V5tqbwZq8eEvTG1v+dvhE6Od9aXvaLj3C4=
Received: by smtp.zohomail.com with SMTPS id 1790800019468651.4906506479856;
	Wed, 30 Sep 2026 13:26:59 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 3/7] rust: error: add EDEADLK
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-4-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 17:26:45 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <9464F4C8-40BF-4F35-8983-E37C39084D5F@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-4-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

