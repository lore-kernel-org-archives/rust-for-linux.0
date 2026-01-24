Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E44192590;
	Sat, 24 Jan 2026 00:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215127; cv=none; b=YZ13M4yJmVOijKpAfEzj7iEyv1yq9lbz8dVVUrBqb9tdu9qHjU4pjIjd2YeUXgi3qEzxlhqLhp+Twghg4hg1ucZ0YERdjJfyWLdM6xRu5jKcDFiU6sLq6ySnn3ZPdmRkWL6mnre69qyNSN7B/html394s3jv3DByt3ag3s3m7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215127; c=relaxed/simple;
	bh=SKU1yfScL5Ypu0iWedIQIdD7r8yBxY0fWN6TWzp0MKI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=MTC0v8cu1Hmm+Xb4STSx9xR7Alc5vT0gdpAgvrbwcUxO2VyMKLO1ZLNNmLnVuCwoKCdLN8gVXQaKe+Rl0l/mKiU3tv26yR9PaC0eUCixQ4AZqaKNSyiQ0QQF93Pb8OM+s1MjyqBs+OyiijujxtDZ6NGS74nKnGCzRUs2CkQs94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuInJchS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuInJchS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E77C4CEF1;
	Sat, 24 Jan 2026 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769215126;
	bh=SKU1yfScL5Ypu0iWedIQIdD7r8yBxY0fWN6TWzp0MKI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=ZuInJchScUdgi+CZF70vGp7emvy4Ca9zaBwq26Px/LLIVItw2bbM4Fd/5tvZz0hrr
	 dpmroBixAfHSF6n3ml3O4jBL9PXx0hh9EcSP71gEc5yg6o/s7/Fruw7Yd37yMsNaq1
	 hGtV+AuSGVuSn6a0pVLvQYcKW1WJMLRUJGVL5I3TCjQ+rvq0Qbu7TeWSJ+qFzR4eo1
	 1Ix6kBeoqP1gbsy0FYjXojcZZ1GUs+1HGjWWR5CoJOhjxfyCeU8pF96suMnksmJzXj
	 0M5FyFg8k8wGOKnZUze8HQEQ61R3EdEouNRBXVXk/fXwO2h/doc8WXSUP4b7V0slMn
	 6zMykMVhyhIfw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 01:38:41 +0100
Message-Id: <DFWEF2HIFQ4O.WQQ693VNCB7C@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Ertman" <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>,
 "Leon Romanovsky" <leon@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/8] rust: samples: driver-core: remove redundant
 `.as_ref()` for `dev_*` print
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-3-gary@kernel.org>
In-Reply-To: <20260123175854.176735-3-gary@kernel.org>

On Fri Jan 23, 2026 at 6:58 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This is now handled by the macro itself.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to driver-core-testing, thanks!
