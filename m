Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E615377A94;
	Thu, 13 Aug 2026 23:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786663563; cv=pass; b=IYpYUyeM4BChDI/ytz+VwIwz1QorO3g52J737H9preGv9cOE1lTDRo+nRBAtogziGIRK7K+hYI+y9J6gFnQVMyXqwCDGqnTeU0W8BFy1fiXXlPPEJiCcLI2LN2L1TI667yQ+acri3L1V2gvi7i04n7WnzJZXV7K7NipLXy+AW2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786663563; c=relaxed/simple;
	bh=t3KgZ8eLlEb3w5QD85w261EWzlG5kQER29H4dLSYltM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FAoutVU18+0ovv0YMSW+Sv8tGAJ+yDwtuUJDmv7b0tFq7fEAGzlSE5e8lHhhzT7qwh/Mu2TldD6dbmKvMcWm87X2kCsAj2FgsSzPvpuvAXwEAcOaEvk4XkiMR4JD48uy+FQ6dVI+MVWmhJVmt+853Tqi46Kgxd9Ac3DcljiVvxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MbzqtOJA; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MbzqtOJA"
ARC-Seal: i=1; a=rsa-sha256; t=1786663540; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n924rh9G98KwzaxcmihjUEm5ctJ2uJH8ndv8UV9LBOvlBLQZ95uVm6kJpVWGKZISUELecHt5D8vMuMdI9ElMC4hMhzNKrtV3XDOepbTGFyX7+8mNE9Zj+xdN8ot8nu6CjI7B6spkvVE9Z/vI5IQg9300+ujjW0Uxe+ZoBw2QXiY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786663540; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bsAB9n9iPVgQL5LczCdPJzrFKhSNH+7LoT6n3lUlk2k=; 
	b=a8HpQSfnfBoBo0SJUDyum7ETgLFhc0mbdFTpTsJrvbRRskFhpeihSrOAdglknN7amfMQKMWGhTixAs4fol62NyET29fFwnUTLNZDbVUUk4/rUslXbcSD1sj5vbiPEVXOePFdbWrLK8W2VYlU03rqGS+EsWcJKXUV43/HfjbTaU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786663540;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=bsAB9n9iPVgQL5LczCdPJzrFKhSNH+7LoT6n3lUlk2k=;
	b=MbzqtOJA1AqiLU9rMIzJAsZBycVDkKrzjRwarWtTrbjl1TZ43kOffww5xn2JeeUY
	DpQVjjU/CQt9M9EdZ3IRY89JZ01qBETwlH30uAyIj+cUi9VG6p9oPk/yYunF0EvEacw
	gqQQt4x9SbdFBFLPNqr+LLTblk8gev7ir6qMVt9s=
Received: by mx.zohomail.com with SMTPS id 1786663538023257.92994501579153;
	Thu, 13 Aug 2026 16:25:38 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 3/3] drm/tyr: add GPU reset infrastructure
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260813-tyr-reset-impl-v4-3-b36fcd0805b2@onurozkan.dev>
Date: Thu, 13 Aug 2026 20:25:15 -0300
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
Content-Transfer-Encoding: 7bit
Message-Id: <D4F91EDE-5FD1-41F8-B5AE-D8C2EA25545D@collabora.com>
References: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev>
 <20260813-tyr-reset-impl-v4-3-b36fcd0805b2@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

Can we move the iomem to the HwGate and get rid of its Arc?  This way we
ensure that all hardware access must consider the possibility of an ongoing
reset by having each component that needs hardware access hold an Arc<HwGate>
instead. Perhaps we can even broaden this to "hardware must be powered on" at
some point in the future.

Otherwise, this looks good to me. Let's wait for Alice too.
