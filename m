Received: from a11-77.smtp-out.amazonses.com (a11-77.smtp-out.amazonses.com [54.240.11.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C971B582
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Feb 2024 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707041461; cv=none; b=Qv6Fv2hpvyj1suvnnKbQt65qQmbpP47xYE6RnK16ysG8mWyu6c+gxvUUWwdZ4LMNlT5ydSOueNwW/oGqySFEL6xBRBPrH2tiguH41ftOvPDzLn3M3arasMn9ldVwDxfs6LX0hddAAoS8RXTuC4dzmI+YB05FF2zlPOZh/aMPwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707041461; c=relaxed/simple;
	bh=MhfgsyGnvcRFTUdioh+eyYpDf7NZ+xxkVL20XX0Afq4=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:In-Reply-To:
	 References:Message-ID; b=NGCzblZB+hSYsXCXRVkKEgixw7feIvBjAMFX2yCz9CBVCpYopb3aIoSndBTDYdxFaWf62ABBTs5aCyz19Us7A7ifkhJmmGAta5AAH/Wzg/h19N/J60CP0VLtlExB805IHAjq9Dx2Am5DMgLLvu7PuNmN/A1NAvggp3fKBsf92NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=bkHnnMdV; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=T5oGhOG8; arc=none smtp.client-ip=54.240.11.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="bkHnnMdV";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="T5oGhOG8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1707041458;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=MhfgsyGnvcRFTUdioh+eyYpDf7NZ+xxkVL20XX0Afq4=;
	b=bkHnnMdVl7j6r5RiOWlsqGdRyp/tCYRPp/k4eNlL8Q8cS3scuhK3MWmA4WKrlFNi
	37nJ+4HP7cpO6N0BRedGp+dwAORpqLskP1zq7awCS74FBA9IuMJOgLkV9mjBWWPrnYm
	LV6TNEzcf2q67Y1RH9rM4Jw2/8TGrPVvkmZ4obK3S7XWB6NK2S4vfswjer4htmomIAS
	2uqNbMxVm1BI6yo9F3LjwVCJ5WvepOcNjRvWuPyRVPWHvfrprKJDDthqq8jUdBpzEM5
	eYEXjbTTTsurVcejj4s3otViDlHhHmvT5GpuYxkPbJ52Bb7SGC0aXdKpggWQJMkX0QK
	stH3mQFm6w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1707041458;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=MhfgsyGnvcRFTUdioh+eyYpDf7NZ+xxkVL20XX0Afq4=;
	b=T5oGhOG87Jgp0WXMKm8aI03cTYdiQFFioRnv98wu8PRPUTIl7RY4Yu/Bj1/z4ePQ
	KyLpKHzSxPl5I3zqtV7njsj3o5oeKq8waq5lfQdBYY1r4ljpsUK2t2uQ3+pgBuJ3YMP
	IyBQ4BFFMCI6pQpLCLEKRz5stU5cjrgEiPZthyhM=
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
From: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
To: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
Cc: =?UTF-8?Q?a=2Ehindborg=40samsung=2Ecom?= <a.hindborg@samsung.com>, 
	=?UTF-8?Q?alex=2Egaynor=40gmail=2Ecom?= <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?aliceryhl=40google=2Ecom?= <aliceryhl@google.com>, 
	=?UTF-8?Q?benno=2Elossin=40proton=2Eme?= <benno.lossin@proton.me>, 
	=?UTF-8?Q?bjorn3=5Fgh=40protonmail=2Ecom?= <bjorn3_gh@protonmail.com>, 
	=?UTF-8?Q?boqun=2Efeng=40gmail=2Ecom?= <boqun.feng@gmail.com>, 
	=?UTF-8?Q?gary=40garyguo=2Enet?= <gary@garyguo.net>, 
	=?UTF-8?Q?ojeda=40kernel=2Eorg?= <ojeda@kernel.org>, 
	=?UTF-8?Q?rust-for-linux=40vger=2Ekernel=2Eorg?= <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?Q?wedsonaf=40gmail=2Ecom?= <wedsonaf@gmail.com>
Date: Sun, 4 Feb 2024 10:10:58 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: 
 <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
References: 
 <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com> 
 <20240204101049.41101-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaUn69oxRsr4DETbySDB5t5Fc8cgE07Sym
Thread-Topic: [PATCH v6] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1707041457
Message-ID: <0100018d7399881d-9945af06-7e0c-4f80-be5d-e4e7a614de28-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.02.04-54.240.11.77

It's version 6.
