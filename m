Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055D1885A5
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767380500; cv=pass; b=r+zu3Rpi4nvi2OstiOWCTbeb4+bCVUyTuQdiFhwBl2CinPTmP7dTySTv9FDUiqlYzZDs0gJ+Pftef/3toSn47rsYonDDLkSVwvv4PKnR4TR/aWZGEbeZMxUW4CNnk9cNoLLox3BkwFUPjAEbroyzisxkkig8BCjdEPt7S0/vP54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767380500; c=relaxed/simple;
	bh=7+yNjLtYvu0r8IhyHVVmmvN70S0piHBa9J+BF5I3h+A=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=c2rI7tqvyj92WPQk+4vp5MrRKfVqMH2KNa0AB/m7oLRY3ZIq66P43x9Qf8HSVhNhp4hz91wZxmH5/KNZKueCKafZcYzt9imV+7W5KPncXpiHUYO7VCA1gcIRmM3on3ReKomR4R0OFEF1j3xB7DPoo90/4TWiEkIiQKr3yKfJ6uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jIgdvB47; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jIgdvB47"
ARC-Seal: i=1; a=rsa-sha256; t=1767380485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hSxA2XpMooX/44lxpcIeUdguCzYZoaHQNXi9n0pISkcTsJ5Qfb6yKEDiNtlfOJuRMuIiZWjwQsuQnRI68EFXI7ZJWHD/wZKyG0RKc8PQnVJSjJxAovVFEPaB8M+VeH/o54y4PsvW/fy0DwGLcpc3ZQCR27F3vylzPHDSojHjmv0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767380485; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LPxqSwTuY4yokDTiKDufI7d8NHVAOgsI3ijI4PKWqPI=; 
	b=VQOr37lETPVLFxKfUr4rWRETmhOQVK8OhA3WDZ1hG7yRTUBZ2alkBf+QI1W/UXS5BEKfOV5MMj4mmpUSU50WA0zKkffVg7x/vcJQg5BOjqBXz0ACOGptxXmIAvPWoMNZ1f6f4ZZas7X/6iaA1PfIVJW0W2I7PHovjdOWfN2uEMA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767380484;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=LPxqSwTuY4yokDTiKDufI7d8NHVAOgsI3ijI4PKWqPI=;
	b=jIgdvB47ljzWB+ri4VKfINbvM659Dt97k4WQfr96J30Ui2J8xFnV9nxaeWlmanxX
	nOgbecaBnWDsXsE4y4PktAODsBrl668hC4ZSxj6LXdniQmgm/Sku0nbK1RXlyYjcM3q
	VWSmlvSy11KTWi7vefskYmF8g+0AdPmHfEtu9IRg=
Received: by mx.zohomail.com with SMTPS id 1767380483258410.49842308488564;
	Fri, 2 Jan 2026 11:01:23 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: fmt: Fix grammer in Adapter description
Date: Fri, 2 Jan 2026 16:01:07 -0300
Message-Id: <2EAAD797-C15F-41BC-B76A-85163DA35A88@collabora.com>
References: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, tamird@gmail.com, ojeda@kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org,
 aliceryhl@google.com, dakr@kernel.org, dirk.behme@de.bosch.com
In-Reply-To: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
X-Mailer: iPhone Mail (23C55)
X-ZohoMailClient: External

Hi Dirk, 

nit: typo: grammer -> grammar


