Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25337C11D;
	Tue, 13 Jan 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292253; cv=none; b=pAIRWCUpeo7tzN/2ZlshD7tz/WeUiCNfnt28cOJIjJV/DPLLCuFX9NjlUZURlZrS6Jf5sPjMJekjGaXSDkcRysER0/o2qitZKCaNjhbzzgcksQj/OsAT7QBnFEVhNP2lTS6gccP1hzOWIWHvBEp36/e4h6NWybg2i6rRJ8XvRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292253; c=relaxed/simple;
	bh=PUcTmLMcU3yQjSO8SMwJ6QCocPxGD6dHEE1O9zRqlPE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pnWDdnjFvEXinDBqu7CU2QXeCW7KGQVgYvc5S1HB4qxx24e7JK64lMkrNmoFK2wil5mPdBbjPVFr/9FS0LwY87Oh5IG4GJb6FVkt3lliynEPw0X6n05UD/imhsxwBXZIDOSnuCoIKwCZWe3lJ4YHAyb7/3TSoEcxwr623NsUTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7Y0sMIF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7Y0sMIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EEEC116C6;
	Tue, 13 Jan 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292252;
	bh=PUcTmLMcU3yQjSO8SMwJ6QCocPxGD6dHEE1O9zRqlPE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=i7Y0sMIF+fqLsGZVr5TlHomrYalza6nMwMAbnP+BJ270mUVxyb/iLh91r8DPdEo8h
	 z8WTGOntn8a5lMAW4j4oGzj47SseJSh51wGcI4tNmSQyBmJIUY5n5nICgOBrWgVZwQ
	 AiuzqK3UD59RPj4e5GYWeYNfc/3Mzz6kUqacp+JA54+jsmzfCWU8DB2T1yzN5mKXz9
	 k6mPhjb25wlMrVhvRWCOZnDuIcXTKbgSgO8lHI86zcjU4UgvEl6miLYBAfw02+M+ZS
	 5cznzD8WAjkvq5b4g4/gmRXIm/9dpUGpuwx+UjJ1ZnlKEl1/1NOHQBRBctWl9+MIEL
	 VVO6XHnn/ntMQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 09:17:28 +0100
Message-Id: <DFNBACI7ZZNM.3210V7RMAT01U@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/15] rust: pin-init: internal: add utility API for
 syn error handling
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>
X-Mailer: aerc 0.21.0
References: <20260111122554.2662175-1-lossin@kernel.org>
 <20260111122554.2662175-5-lossin@kernel.org>
 <DFMQSS27GS7G.1QA2Q44B7UAT0@garyguo.net>
In-Reply-To: <DFMQSS27GS7G.1QA2Q44B7UAT0@garyguo.net>

On Mon Jan 12, 2026 at 5:14 PM CET, Gary Guo wrote:
> I don't think it's a good idea to call a type `Error` when it could just =
be no
> error.
>
> I think what I propose in https://lore.kernel.org/all/DFK7ITVQ97RL.2SZ2AN=
DIQ39H3@garyguo.net
> is better than what's implemented here.

I don't use the fatal error, so I opted to make `emit` return unit:

    https://github.com/Rust-for-Linux/pin-init/pull/89/changes/b0a242334802=
695342f2095657dbe62c8841eb0c

What do you think?

Cheers,
Benno
