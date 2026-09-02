Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717B47FB1E
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351063; cv=none; b=OUEqhPoTjW5sv0vEi1Mtjj6RsC0W0zsjsAnUI911QK47AUwOYS4kzkccIkyk4xQiJeX0h/lYywkLV7LgfvhmCiZnFzh4ryYTDo/ua3SSKtBjktv0ABv+pEWwlNCv3JjYkJDlUcL/t0opbeUpF6V1CN/mRoVswaMTnIzv7tSwcJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351063; c=relaxed/simple;
	bh=cFkaYHvzZfGJCxuVYAzo9tNbAvi+si/C/bw8jJJOF7M=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RHLcvMchZ3qZPAKcG5e4uuFelEtYvZLiqoCKpiwHazMBUBCGFDWk0b6gruvjcqdLNyOFsVVRC3f7voJzlYSxlpx5Gcpf/xqx2/ZFVMYqpkA0A22mVlTCK+byUik7AEdxQGqLXUgr8FdT+RNaDJUQQIgWyS7bmPVwzPGSHbvVXWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io; spf=pass smtp.mailfrom=younes.io; dkim=pass (2048-bit key) header.d=younes.io header.i=@younes.io header.b=o8QLMDDv; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=younes.io header.i=@younes.io header.b="o8QLMDDv"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 59C5E17C66C29
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 14:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788351051;
	s=s1; d=younes.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=cFkaYHvzZfGJCxuVYAzo9tNbAvi+si/C/bw8jJJOF7M=;
	b=o8QLMDDv+70YOB5NxUSCpyi+Fod/Q4zQzHsQhu2liDlz89jH9VOgnml67rw6YIOe
	+pvQiiyik3XOBoo8Q9tT3oX+ZkJMvd9nYdjAouimBVQZ2Iv5wQLHzAwu9fDgNHRTBWr
	UrU3Zh4I2Mbt1K9JlzR2s4EmN33Lh5AZplq9SsX4VkZ6cj5849+J/aDt3DS0GEO3Sya
	VkkpwoJjFQMoOMdUNQU5/LrwNC8eL30xYKk7v0E+rwZ8J07aHT8/lJilqaSvn+T846s
	b+0PzsO+udxVAafLTipGQSo70aGfzeTNHHyKHaOPHJ+FNt+AlyfLZcosdt0jnAWClX9
	wskFsUDbAQ==
Date: Wed, 2 Sep 2026 14:10:51 +0200 (CEST)
From: Younes Akhouayri <git@younes.io>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Rust For Linux <rust-for-linux@vger.kernel.org>
Message-ID: <P0X0ndY--c-9@younes.io>
In-Reply-To: <DKXA39O66KKG.2PPLT14FCZNRS@nvidia.com>
References: <20260822-fix-rust-bounded-from-bool-submit-v4-1-aa780bfe7f30@younes.io> <CANiq72mOfR33s4y+Ueivd5NrC5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com> <DKXA39O66KKG.2PPLT14FCZNRS@nvidia.com>
Subject: Re: [PATCH v4] rust: num: restrict bool conversion to unsigned
 Bounded
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 017a4576e383ca5e4eccfa1f2259bb19c2dec03584c01d38b9d90ddf5151b20911e3d9ef144c55bbe3dc4f7ace3695f8c3:TurnOnPrivacy!:tutamail

Hi Alexandre,

Are you still planning to send the patch sealing `Integer`?
If not, I would be happy to take it.

Thanks,
Younes
