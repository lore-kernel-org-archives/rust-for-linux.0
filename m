Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3483B8D42;
	Tue,  3 Feb 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137219; cv=pass; b=Tsc9vVcK69eJEwrJX6cuQuEZCd0Ds3bBLIjhRGLKsT5m+Fuu/E+YMW3BGFGxykPyfBRpT61wP2L0cxha1/MRGp1P5CYOpsg69YRTRPtNZahpayXbpvOLCN1h/I36wXKbtv7B27UMoeZgBM3wruPrQFsc4fp+z42pECrR6OPeBl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137219; c=relaxed/simple;
	bh=sOO/NTikyFWHprUrN67XWhQBmm1w0at9aLr7VVmOVFA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AC8BBhI0bszvYyzJDTocpqrZzjcEMpzpq6NQojLzdKfR+sWC1XdO/FA2t8tV9eq7DvrxJV52mgRl0EMJMVqDf5oTINNuAOzQDeZcg/bXCVYtngTZbgjwe1K4MfeVqj2n+Mf6HRERn1xmXGht9D714LvVh6dgd7DaAEfDPM4xoUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eYY7BcjN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eYY7BcjN"
ARC-Seal: i=1; a=rsa-sha256; t=1770137201; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aIyt7CQn1G5YpGXLa9fUIsrue7M65891fPaH/ttL3/z1g7eElBkZOo1TgwoatRGNSUIcIb0Qjzvoc5Z5o8h08wFX+E3uaA4LUGwkFrCElBUtA/f8NvZPzkBjzXsRcamSi+TxtuXCNhyGC1HHXWufm/TVqzk2Wp1O7ils8MYYpE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770137201; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sOO/NTikyFWHprUrN67XWhQBmm1w0at9aLr7VVmOVFA=; 
	b=CdjYP7CILPQirEDp/1k7ROC9NO9N/oJ3W8RSQCZhY+g/IAtWVxqBCRA4dCI30c+Mkma+pCC0f0WiS4sPBKVN1DNgib4WlTZCFOPEdU0H7nxxWKhlvhrZGwlXn2sq3uymxN/GDdAbqtcfgJaOEM65MGi+ALAIhUZZQ0IkrRaarno=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770137201;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=sOO/NTikyFWHprUrN67XWhQBmm1w0at9aLr7VVmOVFA=;
	b=eYY7BcjN60OHr59xqh4Sj1X7vFzRkK/XxVc6s5lkzLYA36l+2twveR2hEcfxoLjc
	5LwBfpiljX6+BnLjw0FC6BqWnrf9FS0Wum4zcx9Zu+i7CfcW9hRMxgundSXFJDZvFue
	+R2XWoG5NrMkTetJVvPE+R6MgFMCgWrHusNu6oA4=
Received: by mx.zohomail.com with SMTPS id 1770137200372615.2678443427375;
	Tue, 3 Feb 2026 08:46:40 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC PATCH 0/4] Add dma_fence abstractions and DRM Jobqueue
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203081403.68733-2-phasta@kernel.org>
Date: Tue, 3 Feb 2026 13:46:23 -0300
Cc: David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <20310585-5124-4CFA-BFB0-4F07DA2CD300@collabora.com>
References: <20260203081403.68733-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Phillipp,

Fantastic, thanks a lot for this work! I will take some couple of weeks =
to test
that on the Tyr prototype and report back.

=E2=80=94 Daniel=
