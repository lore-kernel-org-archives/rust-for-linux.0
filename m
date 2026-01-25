Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47213AA2D;
	Sun, 25 Jan 2026 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769375868; cv=none; b=bwnsreKsldiB2cRNO++AJyBb+mXX8xtyd2e0vfY8RV2HXShAbyMsU4Z5SccTZ8BZrd0nC4Pe1nlLxHNDoyBVjI8ti+1ogYloCupjRk05Vts0fYJ0LS6zWxWeF1Inq7sWAKiCMKIKM0qQEtW3JT7x1wYpDIPz5pF5AjsqoiZzPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769375868; c=relaxed/simple;
	bh=E5bGuq8vQqL2TyBew6nTFute2Qogel59zfkCGrdvhxg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=rbTHTFas45E9sx7W3L+RoWPGYGIeUpOOdkUWnSwuDMUfXfe5F3ETI6kC+ZvgnQ+MP24O3TaCzKfW2KdZMCHx46NwVPEtq1U57h68CjmQa26Ca5seb+JKccuRblxERBB8aMH0SU4o8jw5M2e01qSdULuKN2QHEUxRG/w+R2zUXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9BnnyJW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9BnnyJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF688C4CEF1;
	Sun, 25 Jan 2026 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769375867;
	bh=E5bGuq8vQqL2TyBew6nTFute2Qogel59zfkCGrdvhxg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=b9BnnyJWrQjM/4kMQVuD4OuCGaDiBPrSR6z3DWHDiN3TNZrYdLt4N4dPjGZtIv+uH
	 a56DreiYFS5VGrLgFUu+21txjWFsp2Z6Fg+ILDiMkSakn/yalGkx6X6oEIhpXKpcgz
	 n5qL7eQfgtv/406UhD+4I/GmfjG1ZJrIONckIgwJE1lvfNcTyx26i4kdqdZnEOUNdR
	 UZc6rHlZFX6dlJkD6oQNzuBLCnMLwyWrQYpOLAdkq1DVzhpdpTzcfjloPKqj1gxas5
	 7IITU7rIbnbd78Jm1iGi43ZaBgJ0VtZHr6Eqt0RY8fS6azUmnHnIMvu51HvSAVUH9z
	 +euTWUqvIuOLQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 22:17:42 +0100
Message-Id: <DFXZE9OPNS97.1XIYOCKJLAKRE@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dave Ertman" <david.m.ertman@intel.com>, "Ira Weiny"
 <ira.weiny@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-4-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-4-gary@garyguo.net>

On Fri Jan 23, 2026 at 6:19 PM CET, Gary Guo wrote:
>  samples/rust/rust_driver_auxiliary.rs | 1 -

Acked-by: Danilo Krummrich <dakr@kernel.org>
