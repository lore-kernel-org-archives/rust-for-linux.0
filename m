Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.247.131.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578248;
	b=kb6kxKZGRF4a2TTWC43X6QkVxh83a7+9/bmdbjgLHOwYJw9go4cZ8mFOisJawCcqkNqt
	 K089AiQGOqMfR6q//S0+OAZfDWlftfaCekqoFPahEITpcSR0SEf3RFCh1MTaSf5SeG8/U
	 ybsXmWUqz+bUXAesJaM/d7lSMBaj2V1a13p+ZHy2aXT6vsibyh+J57Nd1JU2OYsERExSY
	 at0go5PYDfdRMHKM5w/Zj/q5i97R1CRSn83qP0BBLHOFV6QjHmfz/xYRY2v7sJUrm+xRg
	 uzrs9NWoFmXg7M0W9MRyElzBj64iZ9W9ET2W2pjO+kfXBiFWj8V9KKfK0MAt9ce9Gyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578248;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=eanCuq/f8vbvsTBiZWE8wP9g1in6E4Q4CJBUVXP3MSw=;
	b=DRxw8MGzLcEfAt3xGvvLa+qpTnDmBn81r/aRiw4PLVfFAjHvAx070izjCN+pF3t+7Joc
	 Jgp9IAdGxPHYDZgEN7AX8T6yftvHvlS9EC2lViX+H+oo9eqmjkBf6XudmIAPR5nR1TvTw
	 n97zqMuflKMtbwNxXNTjkXy0B9Woz5R7KoSHykNS+p28v8boWFtdiO429LZzgiYD5E2AI
	 h7W5B4ohe99kXX5doLzGsLt5tz2aUeFW2qITrJ33oYtYSMCoUarhIV3RnRK9OySBg6FL2
	 sqD28eVd3QVDO0IuN6bWOJIWX3aVDiSpZX+ffXKJ2mnq/nONU8lUTynCJOsY2mesa/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dakr.org;
	spf=pass smtp.mailfrom=dakr.org;
	dkim=pass header.d=dakr.org header.i=@dakr.org header.a=rsa-sha256 header.s=20250831r header.b=o6W3A05Z;
	arc=none smtp.remote-ip=84.247.131.55
Received: from hs01.dakr.org (hs01.dakr.org [84.247.131.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6348606A319;
	Wed, 21 Oct 2026 10:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6348606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dakr.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dakr.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dakr.org header.i=@dakr.org header.a=rsa-sha256 header.s=20250831r header.b=o6W3A05Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dakr.org;
	s=20250831r; t=1792578239;
	bh=eanCuq/f8vbvsTBiZWE8wP9g1in6E4Q4CJBUVXP3MSw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=o6W3A05ZjA8HLIzoqmsHAfjfwwrhTWj9JmaY0m+P1iOqErj621nNniEkOVbqjsABV
	 D7PoNhPZo2wQh6Eti3Sl7FJL7lnnJ4gz9NoRjM3eV1yqYYlNn5r5dFeB+6uAxDHaZm
	 lLFsVMWEmXNINBoQt3Buup/DCAKmooY5ewzZ2vpnZKJaLxvwcTFJAX91a44t/zJaT1
	 g0dN+gEudRoUdVPW+aRC31AN+C6y5O3uqGeqNMpmVWa1wlVe6QW7bVKzXQ00+cI688
	 EzuRDJTP7ouO9MhHoMCbY/5ggel0LVEnZ3AHcKtj3ES3OHmRFwRd4jHeIus4eglrmq
	 tzHnMH8l6bUOQ==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 12:23:57 +0200
From: Danilo Krummrich <kernel@dakr.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue
 <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
Message-ID: <471e91fb794f6a8dc57d4366d93d65b8@dakr.org>
X-Sender: kernel@dakr.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-20 01:34, Sami Tolvanen wrote:
> This series fixes a few CONFIG_CFI indirect call type mismatches

Acked-by: Danilo Krummrich <dakr@kernel.org>
