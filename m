Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075811723
	for <rust-for-linux@vger.kernel.org>; Thu, 23 May 2024 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479047; cv=pass; b=sM2LIFz2AFmT9YQnh84P3HjoxJbsO9DVnHzdLfiVsCtr5PPstWhExWdywMw2PtGtByHryZmzVRDnUqHKGtnaDE1SOMXTDF8fvBXozEo9ckIRD/pc9fh0bFDKWmF3+rk07Hwqh4dqy4B47WOnWTSMTmRmSchAxaiLDjSE7nhIswo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479047; c=relaxed/simple;
	bh=3ftcu0qYvTDnxxr9Q7rPjYf+wVzMP5MvKDtIp7jiLw8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RcBDQuRn9XQh98SnPXa9b+hnFRtCq094LQk6ZA4fvZWoLSOdfuH8B/BCRyVdX4nBqY+v+PXXGMKwsW8JDgLfJVsPFBy77TnR+knTTPAcuAtuJdFThoAdhCtWCngYsJmEc/cWWmZ0DG/l0h9x72RqY8piHoSEfnj2rU1Zi10pMQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=e3OQrqND; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="e3OQrqND"
Received: from localhost (91-154-92-47.elisa-laajakaista.fi [91.154.92.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VlXXJ67J0zyT0;
	Thu, 23 May 2024 18:44:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716479041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ftcu0qYvTDnxxr9Q7rPjYf+wVzMP5MvKDtIp7jiLw8=;
	b=e3OQrqNDXdmar884K42QTYUPQ+hPlvnL46XaxOJIVWlEzpxO2aeyzfxJCKkvCHE0GEWNAo
	5QPfNctsmAJX+LgAWBwO9KYGNlu4io33FUNNnk2DurUQceV/sXnJYDAMKrhiDBMdG9RLDl
	I+lzzMW5hVBBSUfgHKEL36KUkQfPR0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716479041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ftcu0qYvTDnxxr9Q7rPjYf+wVzMP5MvKDtIp7jiLw8=;
	b=ZvvXuo3HBVvWdjHE+BiXGaHrNN1akNuyV81IHL9MzqHbJDLeoYsoDp3BviSnJInMt7I7XV
	bo32MbFqVwoDU7NLi0mHh+i8X5szBTwXO6BjpPEX4Q3490kz0HouOUG4RTx8mY9Txf4bHK
	3VdhzUk/ul7+N50D4WlyYpl4t4G++MI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716479041; a=rsa-sha256; cv=none;
	b=KR0VJbDSCr/3bhv+FMmjtiH/lN5YFfQfpTPPUtkI/3LacXPZdsmDwWMtncTZAS+Q1oFVBc
	fRtG9xNFPnDez6UQTvVkFfH58wL9TLtu3y4C5bqP3CRZf0og30nqmkxAFAbP/dOSnenAD1
	LaC5MdHK4/NfOwVdbOrVQTj+nUIM57Q=
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 May 2024 18:44:00 +0300
Message-Id: <D1H51DDEJPIG.3232U7ZBKUU70@iki.fi>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
 <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
 <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
 <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>
 <D1G6UP4N7LP4.OUPA5JVLE1WO@kernel.org>
 <D1G7YTUR11EW.WIG4RQVBNCXU@kernel.org> <D1GTWC4OLYQ8.WIH9UMLI2LC2@iki.fi>
In-Reply-To: <D1GTWC4OLYQ8.WIH9UMLI2LC2@iki.fi>

On Thu May 23, 2024 at 10:00 AM EEST, Jarkko Sakkinen wrote:
> On Wed May 22, 2024 at 4:49 PM EEST, Jarkko Sakkinen wrote:
> Given this if we want to work on ASN1_RUST experimental feature, I
> can create a patch that open codes the call site in trusted_tpm2.c
> and thus ASN1_ENCODER can be droper entirely. It is not a priority
> but could be part of the patch set, or Git branch, which adds
> ASN1_RUST.

Not necessarily entirely, that was an overkill statement, but
mostly have only dynamic stuff in it and improve the C API to
be good match of whatever done in encoding side on Rust. I.e.
no regrets for picking it but it needs to mature, and I think
this rust opt-in would also do good for C implementation.

Just writing the notes so that I recall all this some weeks
from now ;-)

BR, Jarkko
