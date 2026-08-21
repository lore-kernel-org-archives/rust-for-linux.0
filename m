Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90836B908;
	Fri, 21 Aug 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328749; cv=none; b=calUu4N5tNRQOWzkmVqpV1A2FC0tRQMrbgbuFPMPSePrCnWr2mM6e7bqpQBif/pj/GR+EVYoTR5qBMDtHAQm2EEzzsMlpk1XPWoX6yoTd4wEcN0OmHb5NdfZvcI9yFlkVoENoh/plVwGA0kWnyVg0ds1Ue36Q40xpie/Hbji1lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328749; c=relaxed/simple;
	bh=o0Yr3816jwben7xnbf0tSDUvuveQ1VWwqzJLEkc9Wxw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uAL1+Vqpu4sA8NUtPl0G1ZWO4W+p26fDoxFKeYQkPLNeS11qojPfNBsPLSziuii2jc0jL+rjDA+zsC2mP56e8Q7+6dF6shv5aV/os5QfaAPeBcJX69bkTrD/P3DfjGDqDFOwmKYg7bqwMTLIeyh8XCaHvKJ/pCeQCh74xHLPDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCSOi94q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCSOi94q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81B41F000E9;
	Fri, 21 Aug 2026 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787328747;
	bh=o0Yr3816jwben7xnbf0tSDUvuveQ1VWwqzJLEkc9Wxw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=lCSOi94qi0H4mV+QAJvYZ6Xa2SGjUvdZpsfuU/Z9v/fDHcSdGLCUhE6PdiHtBYdY7
	 xILfCZH+vEseCUGgu1lGo5943E1lTEcSuHXe/jp1pG+4tJrGNRtj94zRIhT7rpF3Wv
	 9Ie824XNy9cC2UZULqN717trNz5MKc4/8ch+uCq7KCUe6NFwQIHJVs+1gkZYAUjuiv
	 SM391nl16lFefv2ea98ebkzlkcCxD6+eKRpUxTqMXrGSsdiSu4F78JSM2+QDJJU7GY
	 u/xpp01tUca0TvGUn8pfn/n0d6mYla36LkhP01asewQSfHW4H4IvLTGcApD28e2YuW
	 G2Ev6AlNdvClA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 18:12:23 +0200
Message-Id: <DKUR5TGKTJT1.3VR0LSG4WWXJJ@kernel.org>
Subject: Re: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
 <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev>
 <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com>
 <20260821155814.980146-1-work@onurozkan.dev>
In-Reply-To: <20260821155814.980146-1-work@onurozkan.dev>

On Fri Aug 21, 2026 at 5:58 PM CEST, Onur =C3=96zkan wrote:
> On Fri, 21 Aug 2026 12:31:03 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>> I=E2=80=99d use dev_info instead, I don=E2=80=99t think a reset belongs =
in dev_dbg.
>
> It was dev_dbg initially, Danillo said otherwise and I changed it. I have=
 no
> strong feeling on both.

Why do you think it is useful to print "Starting GPU reset." and "GPU reset
completed." with dev_info()? How does this help users or help with debuggin=
g?

In general, if drivers work properly they should remain silent. A successfu=
l
reset means it worked properly. What you rather want to print, likely with
dev_warn() or dev_err(), is what caused the GPU reset to be performed in th=
e
first place.
