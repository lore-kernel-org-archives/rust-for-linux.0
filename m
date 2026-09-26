Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37691632E7;
	Sat, 26 Sep 2026 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790390728; cv=pass; b=dDS85irPQ9OrDd4XFhmmBvt3Yc1l8ZEg0Jy+w4Px5H6YZP6SrBKW2Dkt8er4gtYDWBvbHEw7hj4TBZaG+7uEM6ZiNab3mkIfIL7rf6fe1aA5zhorldRQs8mibjzFv/0vPsirr5TEFEpQ+cvaeoJNhGn1KY8SEepbuaCQ/JiAjYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790390728; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JJokTWdvM9Nl7laKNxer0Ub2f5NE4991Qp76cV1vvpuXfsGhR8eOhe3mXy035ZbvJ1v5xJV0bgBcx3oAqM5rXnlERj+b2PwM7Zd/ph/i4fzhtqHh2OzqO5AaeKexsMFJMw4GLDhp37R9RKM4UX1s2m/Vj9uFuP8l9uuqMJYKhbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=D0kFkN2H; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="D0kFkN2H"
ARC-Seal: i=1; a=rsa-sha256; t=1790390697; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kZ/avIoaWPHy8OoF9IcRpPcr+dqlSw2hpkLovlengxgzh6le9OGMeNaPvSzkrDeGPYWgt9nA2T2QkpUaykLZ9h6R/IAQTiBYnvI/4EHjySFBoXwHBhw58H+f5KubM3U3rBhoh9g06rzBrZfbaFIthCT873JFjTMaLHwwlOivS8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790390697; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=ffxpmLi12Yk7RVgAyqN214iiqKIKY9v2yXNaCnczWR3/lD32Hd6daCRMQ2H8U8dFOeDoPqahI17StO6igi7t8yk4ZhsoGnASVkyL704tSLNovJyPPRBB1fzlGToiiV5SE3UGQqA7ghq/AtUoH80fmkgbz2hQ5phtKdm2iTVhCac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790390697;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=D0kFkN2H//ZpbVgEHnCU4mb+feyLHQ6FRG3uW0nwLaVtfDOIl/arbKFh8bgM+sIq
	7t/MV57vWJO4PGl6d2jeneUhjTHStucTv2hzcJJ/eql0AkgHLuQmPI3KUZTFYoumI7h
	1OzP4Kex5WweerZcBXqO08Gc4UYpAfj7slNblQ/I=
Received: by smtp.zohomail.com with SMTPS id 1790390696617100.96788790495134;
	Fri, 25 Sep 2026 19:44:56 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v3 2/2] drm/tyr: safely write GpuInfo to userspace
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260925-b4-gpu_info_intobytes-v3-2-e19bcb71980d@collabora.com>
Date: Fri, 25 Sep 2026 23:44:39 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
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
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <08520F3C-9FFC-4EB3-9DFE-4FFEBF14B041@collabora.com>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-2-e19bcb71980d@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
