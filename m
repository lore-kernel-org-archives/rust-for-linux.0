Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBFB1F2BAD;
	Mon, 22 Dec 2025 06:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384877; cv=none; b=N0hTtrXH5f4ZpTX1ot82BHze5ZqMO0bAPmtdzBASVkgvyPnACmvZD3GCnqfr08oVruiZJkEQgXiSwzhQgVdryrcQApIlOctpAw2BgvQioVTpH25hFsOqCLXWYmjBTAoTpmdM+c44bX69fPE0+UdXszgr1FX5GhdlSYKYO2fbWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384877; c=relaxed/simple;
	bh=KfRfBTPUlLxXsj818LCjbGA9fL2GJhifHE+XWuj9hCo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i5EfS1iW+A2dabmS3fvbLB6Woe9RFKqGNC+lyBagrB1h+25MudTmu+evRM8+fqncY65REP0PmpxBX2Ii9ZV2wYenQ3mQwbGV2EJJsdCjmRCytVRDqPUOI6HGATpTuNaIBM2iZSWOT+tFMjvUjb5AvgSRIz9wYElqLQX3kMRS3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVfBHGgf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVfBHGgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB7DC16AAE;
	Mon, 22 Dec 2025 06:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384877;
	bh=KfRfBTPUlLxXsj818LCjbGA9fL2GJhifHE+XWuj9hCo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IVfBHGgf16ZiTJ4DKM3iZ8nYlDq0m+ueKDvC71uJmnCpg5Du1IdPmpSjSu3SqK4FY
	 e2zoS6+C2Zgmi0WjXMlCX78RKQMLcQMe8HNIB+5VDmvk4H9h/ZVwQkXok/F6vSPMIU
	 oj6/kEfh+NbA0Pdw8eZlu5xW+1l59+y1oMIrRAeD4LCzTituVwWziV0rLA2koTMx/N
	 CxudQrJjf8S5zsnzWC3+Qmo/GRBTps4/KrDg1QqrOjvDj7wjcb4A7ENn+5KBOvUV3Z
	 lwKa7ROt/BmYzDIGxGiiePfRcMGS0gQ6UuAhjRxYmq8H8yU3nKZB3Eh2nu0o9lds5e
	 8GpUm4UKYtVDg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:27:51 +0100
Message-Id: <DF4J6FNW3S1A.293HZK6TO45S9@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v16 14/17] rust: sync: Expose lock::Backend
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-15-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-15-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:58 PM CET, Lyude Paul wrote:
> Due to the addition of sync::lock::Backend::Context, lock guards can be
> returned with a different Backend than their respective lock. Since we'll
> be adding a trait bound for Backend to GlobalGuard in order to support
> this, users will need to be able to directly refer to Backend so that the=
y
> can use it in trait bounds.
>
> So, let's make this easier for users and expose Backend in sync.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/kernel/sync.rs | 1 +
>  1 file changed, 1 insertion(+)
