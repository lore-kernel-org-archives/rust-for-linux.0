Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F0363C6C
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840465; cv=none; b=G7CE/QTidOk6YaZAfb3ixlvD/RPjwN3FnyubAsE8irwZqg7BWK08nw+z/YmWSmaYruaCXhpb7MNVB8sfxfxzfb06T0SOKJaYnn2/Y2iICciK0G/2tesIoDBFDBEGFciA2ouVcWXVyzVVy3IDw2geqQn7RyPH8vyHpGBmYh2LFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840465; c=relaxed/simple;
	bh=n3q8C1Mv0IGLkinL4JNLuXIyrqejRcM+zdH6hqQuF9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJJdyAMgpqI4QvGnOeRj/17HNpLIaNCC6+jNAG//Fx/oVQx8MdRL56DzVSPnnpvAcyniPZVHkQfhEYTUY+m/0EiwngnmhVy3TDpXuRa8X2Cmx9RBCYClHx779OuZCx6Qp8UmaoHNlaJv9DVRTzDzqObNNNlFTnTnfpMlhdN8qDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=kJj+ctWg; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="kJj+ctWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1790840458; x=1791099658;
	bh=n3q8C1Mv0IGLkinL4JNLuXIyrqejRcM+zdH6hqQuF9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kJj+ctWgsCS1QALzMTdQ0wuUO84UHAS5bB0jF9mX0POvoDgXPhn3528/Al2RbBaMj
	 Q7aPI2q+QsXsDflm7Si3svAjsjC7hQ0qCXuDlPIWycbTULVAJ+lvSPsuVcN1SVJ7eb
	 3imMUnj1Gjt6Zrx8+JlalcJcKVEndp0g0RRvvcXaCkxm9ZbYXDDjiNve6qFNA/R7f2
	 PLCBbzCbm67tj2Kdw6vVGfWulLrwD5C/O/xjln0v0Ga/Na+FYZbh9olrabJF+0hhLI
	 Qs7mi0keBBuOm7e3UwJjo1dbLLFv2LqrZmY9q5TKx+uNAcrPSav8N/pyYnluv8h4hd
	 foY/7dyg/ry9A==
X-Pm-Submission-Id: 4hwP3T4zNgz1DF6h
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/7] rust: add ww_mutex support
Date: Thu,  1 Oct 2026 10:40:41 +0300
Message-ID: <20261001074052.4928-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <21B6451E-4344-41C1-B74B-1DFAD1AA3D7D@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev> <21B6451E-4344-41C1-B74B-1DFAD1AA3D7D@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sep 2026 19:13:19 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> Thanks for all your work on this!=0D
> =0D
> This is a few releases old by now. It needs a rebase.=0D
=0D
Yeah, it also needs to follow the vertical import style which I will do in =
the=0D
coming week.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> =E2=80=94 Daniel=0D
