Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119914409
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718389931; cv=none; b=HVq2dyFBr+QXD/RiELPU8blgVmM0pf176IZjEAlP+3pUcfGx3hnxGm3/1DiVosVxxf1MUheM4OmkKPGiE10cxZ7i1aV4h5n5Uap6M2YDJ4W0Hb0pAzll1q9pNeuBRRTpmJH4vSEbST2v9IL/j5we+7IUrkAMvSX4gL3qmFaPQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718389931; c=relaxed/simple;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=RSx6QSJvffBXPvYMglC3WeAaZnLdKoMg+QeIcgh9zbFrKyrPBi2lQRl6JxeWiG5is3G5YoLp772p2BPoeYngvyo9c5bAtWvLwh4z0pQ8NSOYBzCRD4J0SUbBnFRhAkBY8yjfevJsEzJlWkmZsHeuJpixSPmwOftwfPYDFZI+N08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thefossguy.com; spf=pass smtp.mailfrom=thefossguy.com; dkim=pass (2048-bit key) header.d=thefossguy.com header.i=@thefossguy.com header.b=SCyD2vh/; arc=none smtp.client-ip=185.70.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thefossguy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thefossguy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thefossguy.com header.i=@thefossguy.com header.b="SCyD2vh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thefossguy.com;
	s=protonmail; t=1718389005; x=1718648205;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SCyD2vh/VSkb/NTW1Tf+1r4lNDt17/nuChDMJq8lCiaUWlnQYl8jdksx75vXikxui
	 Liqa/CsZ8WpziDctT2FR7Bt60f3nioVUKNlOZZIG9rw+fXEvXPTcZWY8rrbuoJRsyM
	 0g0WnSkWC9nIZFC2U2hOz7Qn5JLPIj86P7RqeMEuSCTXYBOu9ekw06OVjUCcPj0bWZ
	 A8kTpmAj2InqyG/DsiFyTpYWkn4UtLMPgdXtrqJf9wv2UHn6WH2jMdvdFW3D0jwePA
	 d0U4d2mpkHlYpzqz9otAyWFP2nqor/Usry0pXK8132D0hgt5Np74Tt/bP4OVEkdXa5
	 aDVzQ+gVDjFvQ==
Date: Fri, 14 Jun 2024 18:16:40 +0000
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
From: Pratham Patel <prathampatel@thefossguy.com>
Subject: (No Subject)
Message-ID: <28zqZncQWop5AVxCNmK09zLthLFVtwzgli7PTq6Lpnd5Vpbd8H_7WehTm4ozrinjlXWX42soaRgtmk5s-idSedcWsqXPZEXA-61lp81Cs6M=@thefossguy.com>
Feedback-ID: 104309535:user:proton
X-Pm-Message-ID: 12e112020ce983a0646afc18d758f804a3c264d0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

unsubscribe
