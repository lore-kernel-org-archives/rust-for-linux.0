Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390DB2E7F03;
	Mon, 15 Dec 2025 21:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765835400; cv=none; b=ED7FxBBTD5YSKkHWtDiDYo5J2riJrjXp602jcfFJoNRXXkJvQGuH9SBjYTeQg1ixvro5j3eBYO800UOnEwPkEBSXdye3pPIVfHleyn/kMRiNi2bMd/N0slAxEJck/eF0K+EqWXR6RDBITtqZuWfht9R0PIu44RFPu+gpR/40P/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765835400; c=relaxed/simple;
	bh=gPh5ZRlXJkW4hmnzygUisye9V3MGpUDOaKonn5mRXUI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=pym4mhRhUe1hx8v5dz6ah3KO20BSyGGjvRnEpBZjZszoPGKZeeYlMu7NVKreBTurE/epLSKDm40HgEMW4P52qVRQhZ59CjOZQ9PpH6jiNeJ5NnTKvrFHj/6q8kMGNvP9Jz8bPGJvar57o7qcXbzgm7IO1ouYG+5OQZPLYU2SSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXGv3hIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXGv3hIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69DDC4CEF5;
	Mon, 15 Dec 2025 21:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765835399;
	bh=gPh5ZRlXJkW4hmnzygUisye9V3MGpUDOaKonn5mRXUI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=GXGv3hIPObwvgGkEwKEEMS/uIJdA4i/sTpho6eKPEmLfjPQEF7mkFvCruMyNlEeUh
	 3rT0Qaze1JZlgNVg1KMFVm3n1drFWZy6A0Ygdrb8JmUh4nL9jTJRMuX+Dku8SpSO5r
	 8CPgQLwWXQpEitacwYnYLglLqNhHoOBh0d4NEfoWcRSKq0MmgPHZ7A8HUjdNGRTYCP
	 UHDb2oqZp+h8+kOxxpsY3kBusK+ny6qM2W8BOmKx4YZ2XgGUf/ficTYVKdz3PQzcm0
	 4nZ4+sE2wlyDoF19DdfYfWiK6ige7UfUawsEEbNBldlAeKdSAg8p1ujyjXUN7e5Vp7
	 IodXKMQWI75gQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 22:49:57 +0100
Message-Id: <DEZ4EMH327TL.2J7LO84SFIA79@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 16/46] rust: drm: add __rust_helper to helpers
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-16-a2e13cbc17a6@google.com>
In-Reply-To: <20251202-define-rust-helper-v1-16-a2e13cbc17a6@google.com>

On Tue Dec 2, 2025 at 8:37 PM CET, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-rust-next, thanks!
