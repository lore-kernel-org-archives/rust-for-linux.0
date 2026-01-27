Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621CA1B87C9;
	Tue, 27 Jan 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513442; cv=none; b=coPWqZnQrT73ggTTOkGYGNlnYrtTTUHwtsF4jZANvrByBEOcCIQKCLv02NNSQhe7Eui2xO58Brsyo43xMW3b64Bo7qetal47kTuztzS0Wdh33vHM4i9H/WfrPnc4tVuDmxiV49toCmDcNdDlt8SZrXjUWrFXyH5TSsDCZ4wg2fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513442; c=relaxed/simple;
	bh=SEsermRd9Nzxatg84guRU6bLuZBocBrS5aEf9VTMpgY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TCLQ4v6Z4ih4JqCvk4uXeBIXiSwqc38zSDEDO0wrSTdqANIjMk+1pj8jiGBzcl0Kg6wXvRg/zy4j6Q/v/yaTCxyBDvYAHbGxL6lep7yJUXdlJTERQHhm1dFwZpGDOVP33HNnxf1bRiBAuyVF2a1QuixdMylzD8+a0wFyrg/fLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSTwDhJa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSTwDhJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6668C116C6;
	Tue, 27 Jan 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769513442;
	bh=SEsermRd9Nzxatg84guRU6bLuZBocBrS5aEf9VTMpgY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fSTwDhJa4RjeUe5bHhmQQIuupYlj6fEX0eDfwIcQntzAqcrzHzHhkMcxlORiie1qs
	 s+O8Vn9rCVgjMk75EFFPaTTKXr1Gb+rCEtN0n7W9KuTr1nC6i58nuk2YyJqZ7/jBBW
	 mE65KODMxKoIBXDfeOdCR4oeGYeDdwQDwP8VF948IdyoQtuCrdgPrDlQWGeZDiliiu
	 dXjFjuvtHYAFScu1Vlkwr5OccP4L/J7A7PgubW6geisn2C0TAXAESx+0Wf2lPM5PQD
	 tA9jq4CJr2D32EwedMWH+v8LBm081BhDROExL8yjRQWZII5tblCjLln9sMB5YMcfEW
	 h1WzEG9GTcTFw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 12:30:36 +0100
Message-Id: <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via
 prelude
Cc: "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Daniel del Castillo"
 <delcastillodelarosadaniel@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
 <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
In-Reply-To: <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>

On Sun Jan 25, 2026 at 10:17 PM CET, Danilo Krummrich wrote:
> I will pick this one up after -rc1 is out.

I just checked and there shouldn't be any conflicts, so if you want to pick=
 this
one up as well, please do. :)

Acked-by: Danilo Krummrich <dakr@kernel.org>

Given that klint can do quite some convinient extra checks, should we consi=
der
making it an optional part of the build? Similar to what we do with clippy?
