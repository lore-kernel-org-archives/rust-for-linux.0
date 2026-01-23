Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4442532C942
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 02:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134869; cv=none; b=ZMRQdK7RbDHzSN5KrMVvpYV5fokQ8g2R1N7w5qJ+m5v1Rp4dS0FSI0wvcgh4u/qQ5EEvfwHHrycNbVcJk2PZhfIkVtfAdplsCRQw4Vj1L2alKtWBHEAMDcjV/w8EO/8yRqHJ/u/YmADJEtIGoww2kZsjGbJ01j8axFatmO7Jmoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134869; c=relaxed/simple;
	bh=oRCEdqCX2f3Jq9pxbm6mKWKJVjy1p35OLYkNi635P+A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oFHpoW6McbK0bdYYEJI7c9Deurd/HL+Xqi6v3nAHC5IECUWLUra3vlxdBha7iS8oHIDiKf9MmeADEn7pExHQqgNoVsHw72VHmDaL9AodFGDLJNYJgLvOwpiDYj4LRjdibFxfzHXar7hN7rZAK+RvQEb8lxJAUN7D03yJOuUJpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gjo770/9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gjo770/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148A5C116C6;
	Fri, 23 Jan 2026 02:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769134864;
	bh=oRCEdqCX2f3Jq9pxbm6mKWKJVjy1p35OLYkNi635P+A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Gjo770/9lbqnghyapS8YV1yGPa4i2ewAv8Tl0kXdfbtMqxKBWc8qyZfsuJ0A7dG4R
	 Hd9T8qkDMnGtD0r2xArr9PeFONSksmQ7/tLCicM1Aml94EEM4/Mq8fDRRI5MqdRB0w
	 wj4uFUXN0V4bs/QCNK5AMTRvSYtabMwiqET0D+PA05K3Fp8GmO9cpW+OTQE+gqTu2E
	 MOXyM9ovkjjFA0gLjmQbxXGCPnYwse1cRpNCyHjbDUj3ZSn3BaldsXKHow5KkTN/mW
	 C290oRdBRru8vCyiFJgtC9ZgVR2c6XaFBjfizUn2Tu/hMnR6YT9oCbUfgqAmt2TJtU
	 Uf13Q6gn1aD8w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251130211233.367946-1-seimun018r@gmail.com>
References: <20251130211233.367946-1-seimun018r@gmail.com>
Subject: Re: [PATCH] rust: use consistent backtick formatting for NULL in docs
From: Stephen Boyd <sboyd@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Peter Novak <seimun018r@gmail.com>
To: Peter Novak <seimun018r@gmail.com>, alex.gaynor@gmail.com, ojeda@kernel.org
Date: Thu, 22 Jan 2026 19:21:02 -0700
Message-ID: <176913486227.4027.1391393067282475017@lazor>
User-Agent: alot/0.11

Quoting Peter Novak (2025-11-30 14:12:33)
> Some doc comments use `NULL` while others use plain NULL.
> This patch makes it consistent by adding backticks everywhere,
> matching the majority of existing usage.
>=20
> This is my first kernel patch - just getting familiar with
> the contribution process.
>=20
> Signed-off-by: Peter Novak <seimun018r@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
