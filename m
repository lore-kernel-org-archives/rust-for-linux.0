Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A6B330663
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306169; cv=none; b=iv2pCSTZ9zyiYSXnX3tsr/M1bbtF2SuulpukfGSVz86ONq4p7Fql8SoOAWgDy1v/zGVY7E1xU3ChYeV9T5y3+Lm4kDBAJsZeGNqVQqcAcFu1w9hG6udPzTCzlIv/HNlyNE0BMB4V2+DZa5UWGXOq4W6PxrCvckptMczU2WFQnnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306169; c=relaxed/simple;
	bh=zsNuXCFJO2V2MtufEcGYeX3x6yhW99zCMoXPEp3H52w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=q7PxX9PXdRB9FfwdbMSy+EPLtpLp7WBk2WHLDWYgGpv7nGN9rrYlNVFyzoRledI3TK5yzZZQYtQFEm7tyyibUalD7RJVXbGvHegY6s8GL4rtifL/HXdAnOy1JBy7rx3nqzNKsgc8IwpQyMZsz4/R0Ez+ac50DDmUZfHKtFaSr3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEhPdEux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEhPdEux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB058C16AAE;
	Tue, 13 Jan 2026 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768306169;
	bh=zsNuXCFJO2V2MtufEcGYeX3x6yhW99zCMoXPEp3H52w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tEhPdEuxRq+FhJzpmcnRq0sS9VNmXQg6weOR8q1lpd/erbw8C/i2SIH7gvtW3Du4n
	 eejMELsp+oBsKra65x7RRNfaKaBQDic8sQNcseuFBux98nm/gv+WSlg6PI7LGukA0V
	 xnKB8NGyk9FB2oFatsu5SuehKF13MFGYU4+6fQ9wYKn3GJSxeObQoVe4Ece0EFwd7k
	 5/B9Pb/0Fr0WLPZjeX4wDohn4oZ1fmE6Eg7ccjERhDHZqq/NlDJ89h+Pw7qGICT7+s
	 DtE46d5pJ8CyjviP/aXAHLnSbgJ29iHgdpNYXhK5UtFC7Pb2qb3FESPird+Gps3T5a
	 c6DIEzETy0K/g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:09:25 +0100
Message-Id: <DFNG7XOSQTF0.1QPLXHOI1Z08F@kernel.org>
Subject: Re: [PATCH] rust: auxiliary: fix remove_callback invariant comment
Cc: <tmgross@umich.edu>, <aliceryhl@google.com>, <a.hindborg@kernel.org>,
 <lossin@kernel.org>, <bjorn3_gh@protonmail.com>, <gary@garyguo.net>,
 <boqun.feng@gmail.com>, <ojeda@kernel.org>, <leon@kernel.org>,
 <ira.weiny@intel.com>, <david.m.ertman@intel.com>,
 <rust-for-linux@vger.kernel.org>, <gregkh@linuxfoundation.org>,
 <alok.a.tiwarilinux@gmail.com>
To: "Alok Tiwari" <alok.a.tiwari@oracle.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260110114817.2312828-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20260110114817.2312828-1-alok.a.tiwari@oracle.com>

On Sat Jan 10, 2026 at 12:48 PM CET, Alok Tiwari wrote:
> Correct copy-paste errors where remove_callback safety invariants
> incorrectly referenced probe_callback().
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Applied to driver-core-testing, thanks!
