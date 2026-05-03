Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9739DBF0
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 18:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777834336; cv=none; b=M/m/ki9qgvfEhCuH0ML2MyBSFLAVpCMLNodkzlBC7y92y5v2wSNR+2jk7a8RhlE170MCFiTgI4Ey6qV4TlIONOj7aAu/82n9mVTWJfkfGSUB/e8dkE7nDc8szILIyHdF+f8NAIVCWnT/KfcQzZ9sEelvfyfKMS3SkeECMUJ6gn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777834336; c=relaxed/simple;
	bh=M9/7/ZafHxMR5QIEP9KtzHlyBaKb9EDxJGXcJ8+MnTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQ/YOxRxx/rS/+Jvw399JjOXmHlm1QmWD8BeBROKMHIJ7kefvAsJaSCao5jkLh+qfkMRbN239WrYmZvgbne1VxEVkkTiaGNqFA9oeTuNdtYfQvO/HDyoHE+rD0p8LPhREAzEQzzZlAjPyNpHpSMwvmw/mSqJsj7ELqWyocwTYH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=sPw01oRD; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="sPw01oRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777834329; x=1778093529;
	bh=M9/7/ZafHxMR5QIEP9KtzHlyBaKb9EDxJGXcJ8+MnTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sPw01oRDIkR0xdekcA/UUd5ddGx5q1kRC2mQwCl6NO2SYyQN6wBmufiLSP2zhRMLz
	 NwSll0Ze90cWGdywXInP4t3/UjKh57m23KbEdUt+mNNhsuwyKV+c0pwZZXtS27hbAq
	 amvEMO040agrE1izYzs/lUvnm8z61midZg5HnBgYWNHZeJE0yRFiVTetGglKOKW4Ob
	 81wvhWX143wkRs0QWbzebWNkYk8yy/sPVO1UyezNB8rDOOJ0KI9AVYybm6SWlRROBT
	 povvBiD3tKJndJQMTMBltTLNRXBOUP+eGLiNwPo16LLmsdwS53PsVkL9bYq2usnNm6
	 VSY3Qwdf039XA==
X-Pm-Submission-Id: 4g7v5f5Rx1z1DDs3
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: x@2005.tr,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Robin Murphy <robin.murphy@arm.com>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH] rust: io: use newtype for PhysAddr
Date: Sun,  3 May 2026 21:52:03 +0300
Message-ID: <20260503185205.36577-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DI99JDNG0S39.20MM1O9MFDGQL@kernel.org>
References: <20260503103050.200526-1-x@2005.tr> <20260503182827.21492-1-work@onurozkan.dev> <DI99JDNG0S39.20MM1O9MFDGQL@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 03 May 2026 20:45:50 +0200=0D
Danilo Krummrich <dakr@kernel.org> wrote:=0D
=0D
> On Sun May 3, 2026 at 8:28 PM CEST, Onur =C3=96zkan wrote:=0D
> > Copy and Clone seem never used, please drop them (also see [1]).=0D
> =0D
> This is a transparent wrapper of a primitive, so passing by value is a ve=
ry=0D
> natural and idiomatic thing to do, so we should keep them.=0D
=0D
Right, my bad. I didn't pay attention to the type itself.=0D
=0D
> =0D
> What you are referring to is more meant for larger types where a copy mig=
ht=0D
> actually hurt performance.=0D
