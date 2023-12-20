Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85082137B
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Dec 2023 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KKM5+DuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1703072100; x=1703331300;
	bh=Nz7P7UcTSEPjlL43YYCoPloogZe2p3ycXHEV/NWjloM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KKM5+DuKGNA/c9JMmVMQqgMWR5gBS7ZU6vio4CyGkrWs8yuxb39WcExUu6rHgxfLo
	 cKA2FFTnuAraDlqD6/ABYdYOzSIiiKY/pXmwA0KtYoWggyDke1SaGW8f6MBoKNtd7u
	 ZVokA1ZiiQNWXMNEP3GBRG8hUE+mPOpha9lm8/Taq148qqzuuuXFz+R4T5nUbqVP8O
	 toTp7TyT5DWFQ1nbcocLDndpIvUq9N0abrO/Pr4qc12Br9SpF+puVGlaq4GK6/hz2R
	 hmoXA+Eh8KnGp5pnrx409YQk80Mus7uvCMShXheLhoKMibUNUii+I5efcVMRYIlrHO
	 WDRlk5XlYVQDw==
Date: Wed, 20 Dec 2023 11:34:14 +0000
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: David Gow <davidgow@google.com>
Subject: Re: [PATCH v4] docs: rust: Add rusttest info
Message-ID: <f0175c6b-8b43-4327-98f4-81ebfdb9d2cd@proton.me>
In-Reply-To: <20231212081313.226120-1-dirk.behme@de.bosch.com>
References: <20231212081313.226120-1-dirk.behme@de.bosch.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/12/23 09:13, Dirk Behme wrote:
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make commands.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make command is not explicitly
> documented, yet. Add a test section to document this.
>=20
> While at it, add some info about the more important KUnit testing
> too.
>=20
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

