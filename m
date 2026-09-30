Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668454F797A;
	Wed, 30 Sep 2026 22:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806376; cv=pass; b=M5eIW3dpjaiDlrCKJuwxD2nDg/UpWzGqPDA/hDnz5smNwdNcqeC3UPrpRFRI6fl/hqdYZzelQTeHpXKihNhwRCJCSZyzZ/1Khl4gxf9TDewkUHto7yzqTJX/5pipVj6XhAqUNPQZ8wmKtpuJSM0qzm22BNIz1uYdEOgL4oDyNVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806376; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=I45mNjWNaiCbZ21kQY2biXYGpJ8wo3E3l0wV1CL8mNroGldCPVYqO5/wLH1XPFomdIVSS7UHyGOz5ktfSKQmy7KeSWaZt4l/AuYTtecWLkYvGYuVIZKAR5aPhpPkYLFURH30h4DROX6auAwdCFKpcm8EO6syD3TNH03im3pRKvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YYu3979z; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YYu3979z"
ARC-Seal: i=1; a=rsa-sha256; t=1790806323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KErDaakGo7PdxuaA+6SEU2YB4Ges+XvMKYlYM76rdWurhTIgloLMdzQ7Ra02gMzcExWtcNNZeSjOIDcO2ArkdZgEHb95kG0qCqnSBL24g1to45VEgafINZRcHq0fDxVboSIJSeSkU51Enp8knIZ6RX8UjWTxt/YdoCjgvXKVToc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790806323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=GFkYO5SMjLCJCoBlQxPzvxC3Vn4XEYNHmcF4u7h5ihP5AyQLs1VjPY50iVEBLWVQw1+3xnM3QF4ZwYpcIeV2qJAlUXEjQcs29egJFaqPpXSpksnaHTeAzytdmJC9UmuIxwUVzuPBSBkXhYfx61gBAQk0BPR/2vH0yz5/lcdte6s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790806323;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=YYu3979z4WoMHFLz3DYl8NudMSs3h000KfEaD2JEkVvr8h1AyPnu0HBiHaVnti5M
	T9gfwQ/UyGGNfcXGg813RUU7X9GmpkrYckQ2ghgYrdEvUiVrIUvdcxkitx2Ohf6ICic
	v+c2+LSS7Mu4xbVh3eokcNnrvJC7T/Ks0LhMmsT8=
Received: by smtp.zohomail.com with SMTPS id 1790806322074715.0295169293162;
	Wed, 30 Sep 2026 15:12:02 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: =?utf-8?Q?Re=3A_=5BPATCH_v10_7/7=5D_MAINTAINERS=3A_add_Onur_?=
 =?utf-8?Q?=C3=96zkan_as_WW_MUTEX_maintainer?=
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-8-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 19:11:46 -0300
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
Message-Id: <BD4424CF-681E-4BF7-9AEB-7B921363B423@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-8-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
