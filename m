Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0691C36;
	Tue,  5 Dec 2023 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkbLnUHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97442C433C7;
	Tue,  5 Dec 2023 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701740114;
	bh=XwOBslD2mSW3iplReiRwGuzuL7D/rlMk176r3NWaOws=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=pkbLnUHY0sAj0fmuUdaFWIci5WNfz2Gv7FS8Vwa450iYbWzfOwbhbcc35sahF7RSg
	 Esk2OgjlpFkn3n7ZppDzokIdXWXFzrb8U69cXc4YK1LNj5JWCLneg+elkixw/Td932
	 5UORlj328kPiP9K3Ufqt/DPObqMzMn1u1naLp12h5UDiWoqDLSAU7rQiOsaO7fdAei
	 D9zYMw22XAr6FNrxizb2WGR4Yc5GwHs5ElDc3s8AGXoD4yX6nJU/4U7ty1yCoR5LHn
	 lgz0yqFfMcYYeex4pr4QmcbvM69gVN4rMZwDaC/Llkx7gtu+jaEI9pdhSlglPrjgXs
	 7zh8IP4/ofhjw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Dec 2023 03:35:10 +0200
Message-Id: <CXG0IU9934BK.XO99IFWA0J3D@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <netdev@vger.kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <andrew@lunn.ch>, <tmgross@umich.edu>,
 <miguel.ojeda.sandonis@gmail.com>, <benno.lossin@proton.me>,
 <wedsonaf@gmail.com>, <aliceryhl@google.com>, <boqun.feng@gmail.com>
Subject: Re: [PATCH net-next v9 0/4] Rust abstractions for network PHY
 drivers
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.16.0
References: <20231205011420.1246000-1-fujita.tomonori@gmail.com>
In-Reply-To: <20231205011420.1246000-1-fujita.tomonori@gmail.com>

On Tue Dec 5, 2023 at 3:14 AM EET, FUJITA Tomonori wrote:
> This patchset adds Rust abstractions for phylib. It doesn't fully
> cover the C APIs yet but I think that it's already useful. I implement
> two PHY drivers (Asix AX88772A PHYs and Realtek Generic FE-GE). Seems
> they work well with real hardware.

Does qemu virt platform emulate either?

BR, Jarkko
