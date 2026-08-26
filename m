Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AA73998A6;
	Wed, 26 Aug 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753193; cv=pass; b=l5hbFtK09p6Z5egmQyqvygqjPK2d2fPD87bCqxe/2ux7ohxUZlwd7YrQFEZKKPH16YtnHPfceG0/WHKw+nQ4Zj9DXZQK3rS5RKu1D6tp6GRJKbUDzpyvHYzgVOGgb7ExIfT7ONqNYctnZZHV3ssncVygVjMPLSMZgTj3sokbJtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753193; c=relaxed/simple;
	bh=lcsqwwXhWVmoSbPbE7DPyh9awywoWMTp35RFoFX1es0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PFunjfZeaV4oBFcho+fsL4+LwQmq1rqr7KclIfBDWnKSMo4XD/Cwb8PVs0xgjQqnJd5HwW64YhbtjXNmxPISmh7re0lnvYFg2h9Le4qnBhcYjKmrLXkb7rtnRCedI5F/bxW0A/Vy4tcgRQqQS1UTRwxiGGSKzD3uEtJ0sRivQ7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ALrcouVf; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ALrcouVf"
ARC-Seal: i=1; a=rsa-sha256; t=1787753161; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B2fi+Xa182dFXeCL1l7EKIx8ojZfN6k/hsq5NrN5JKcE6djMXGHMVfLNtu0qvR3cHH+taNBOoFHwwzjXCxQ7klyFYOWz8BLoy4k/b12KZNnG/hzY9DUsJnkPommXuVsj51NFjLy3MYE8FEtZAJU2i4saAvVD5KKlD2BN1a28x2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787753161; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lcsqwwXhWVmoSbPbE7DPyh9awywoWMTp35RFoFX1es0=; 
	b=mhUfz2ezI5sNwXlxo+/AYr58YZQHEgv+TGohOl09iF2i7NvsN405H6ESn533GFQhQzm8fzsBxaUr+J7mbm3wTswE1+Tpsl3v36VUAntWOos1V3YyqKMRGAiMcdzsyAFXj5QyCxMu5lFHqsYKgEdS4VX2cjYI4PeDvFWLneXUCQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787753161;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=lcsqwwXhWVmoSbPbE7DPyh9awywoWMTp35RFoFX1es0=;
	b=ALrcouVfprpB4OgpWdWQIbBm+ZVKR4WrMeaZTaE2o1dvrXt6tKjgMBsJaV81iM4k
	/FnpsVW46+xiuY/FbP3dMOQ/Gx8mV9WqR1FK6OTbTDZXyu66Fa7sFDmyXJXr8cZyCvw
	koOeA401LAjzNvzgn2H2sB9YZFl6wLdbzQmsoXdQ=
Received: by mx.zohomail.com with SMTPS id 1787753158261687.4971270678526;
	Wed, 26 Aug 2026 07:05:58 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 2/2] drm/tyr: unplug the GPU when reset fails
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
Date: Wed, 26 Aug 2026 11:05:39 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
 aliceryhl@google.com,
 airlied@gmail.com,
 simona@ffwll.ch,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <62D24E3D-0956-402E-8451-24FADC8D357D@collabora.com>
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev>
 <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

I have nothing against this patch, but as with anything touching =
Revocable, I'd
rather get Danilo's opinion here regarding revoke() and the Arc in the =
registration.

Otherwise LGTM.

-- Daniel=
