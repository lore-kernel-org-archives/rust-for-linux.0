Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A500A41C63
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 06:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716273362; cv=none; b=KbgRRP+YRWwod22r96mK/VhCsQBkJ8hl00o764nwsCjWsBF+oVSeTvLSJTY00Vw/n5Y7mu13+gDaORfEfmqtJVlCx0hc/vXjXybrpo75ENyjrdvtsJHKv5VnsTtJHa9jqnfRSvq6HJJedkMkxruYUv0BG7kPD2VuWbjhFXLD5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716273362; c=relaxed/simple;
	bh=c7qyTtt793BDIP4o0FyzeUdAhEuYJMa1loS4Y96AUrg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=h9z7/uQtJOQ7JbgM8jmkJocs1pf9jeEWYJZkxyb5gkmWTcWKRdkyqj7QLsnXn9vaFPfeuiwCGRx1v7SRfe1MyIBy8qhoe82cJO3FeVGPTWe0hi2+TolaBmdH2qeKiAu7ppFu2VyWA3eOobc5q6MvwhbPBMwpZce9qTsJV6tsZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALEXhwuK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALEXhwuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D60C2BD11
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 06:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716273362;
	bh=c7qyTtt793BDIP4o0FyzeUdAhEuYJMa1loS4Y96AUrg=;
	h=Date:Subject:From:To:From;
	b=ALEXhwuKd47J9ZJCpajk2XE2msY0n565IlVzHbxpLVqMEx98z8DJs9xpdoIPGTTnQ
	 ojp6j+bqnB4Yka34N6WZRmiN4YphrMekj4J+eOMk0zoO361FlR5gXZp9B3oQXU1MqW
	 TNE2h8bRXvB3bjmwEjgsiORcQe668+qtgQYq1FOOi2f0yzg/G+4qRpNxXbF9Cg3rwy
	 YvhGFJhjwyG6tD+Vo3KiUOQoDkQdTEGARz202sixWGpPkEHvetYWQ2zXuLbxBgrUUB
	 ao96rwtIUrHFq611wO9c0bxzU7QzxBrPBUKBML0y8cDMpxQbvo8fBPMLDb89Amkpcw
	 OuicVOyOcr0YA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 May 2024 09:36:00 +0300
Message-Id: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
Subject: ASN.1
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.17.0

Hi,

There's one application where it would make a lot of sense to have the
core implementation in Rust, and make it callable from C. It is encoding
and decoding of ASN.1 (DER).

It is essentially hierarchical binary parsing, i.e. exactly kind of
stuff where it is too easy to shoot yourself into foot with C.

So question is how to approach this? How the holding data structure for
holding the deserialized data should represented so that is is also
directly accessible from C?

Maybe not the sexiest application ever, but it is an actual applications
where Rust might weight a lot, also for the C code base ;-)

I'm interested to help with this too as I consume a lot of DER type of
input data... so I know what it should look like to work at all for the
C code. Or do not know at this poinnt, but can verify the sensibility
at minimum :-)

BR, Jarkko
