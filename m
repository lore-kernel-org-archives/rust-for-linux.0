Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC71437454;
	Mon, 10 Aug 2026 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386634; cv=pass; b=JWjFb4jBz1CxOk0h4++PvksXBJk4GhmKa7NqJ6ZK1UxuBZEDC+NMgLY1jI/CpAaQy+327W1vPWlfK/A+pET83/8VLpRZ9acNCfGKxFP0rKNzrR0xykEDOq/FP163FLWyl94Wo2LuqpqADHTte+43m6413eC7LqsaxTaIpX65Ap4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386634; c=relaxed/simple;
	bh=FkIkVAjvC6RLYMPWelSalZxP/P5nyv45KjPDcH6gHlc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BMloXDZVWoVAIhjdV5SJk9l58rFTGS60PaNF57jdplndPlvHfD/BlH6Z+DcHUMIWMN97nOgIcfgfUmXC14XcmIZb8P+9vrFWbjbE3d68UjVCA8C3ssLEgMyujNZID6xTPG9JF09aLLPGEWQCmDBIqfwXYjgBOjAIAjpXRlCvRMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=RlEmCWaj; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="RlEmCWaj"
ARC-Seal: i=1; a=rsa-sha256; t=1786386613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LCa2EGcT6AH5Pokc7GXmfRpxWiiMixD7YmXYfR1ScrkszGBIy+E9vSTx9H6I9yo0tF9bYoPcOHZm7ZYLkCGM+/So0+thl1o7TKqHUfKxULqY867hL3rswMaIvOelDxsPTuvRRRLqo5tw0+0/7cSx7MUnK5ZqOec14Wtft5tsIBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786386613; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9lv7EIGQTIgyh2jROJHEpm/ipWw13Vo4NxTcy5EWfBk=; 
	b=OoUGz6PXuIOcS7TUY4sDLjJit82EDmEaFgns/Uco896hVR9ndJDL87Kn8/c4bK8LW+uYaoi4wSoS3M6cF8ZlajpTaPCgsWsYOn1c0xBBzoQoUuleMk4+3lDWnbwvd0763YIfyRdtZt4jYOXVZvGuCDZVXgEtON1bsxeQWorrCHE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786386612;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=9lv7EIGQTIgyh2jROJHEpm/ipWw13Vo4NxTcy5EWfBk=;
	b=RlEmCWajArNqtk8j3mpNN52ZaydfpNHHLf0Q3MVsHfk5xW+0gWXL5WjwfR/jg3GQ
	skcKFxXClUCQcA0ocSeqGFFnVNZcCimfMDv6+zZDwvZKUiOc/fJT/mcIM5tGiUvBVYN
	M2ENQz8p0mUWIfUoNUl5rToky02pCCB1by5mR2pc=
Received: by mx.zohomail.com with SMTPS id 1786386611735127.96021119097236;
	Mon, 10 Aug 2026 11:30:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: workqueue: impl Send and Sync for OwnedQueue
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260708114358.957305-2-work@onurozkan.dev>
Date: Mon, 10 Aug 2026 15:29:54 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
 aliceryhl@google.com,
 airlied@gmail.com,
 simona@ffwll.ch,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C1DEE21-9783-498F-8D29-8C94E89AF70E@collabora.com>
References: <20260708114358.957305-1-work@onurozkan.dev>
 <20260708114358.957305-2-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 8 Jul 2026, at 08:43, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Allows OwnedQueue to be used across thread boundaries which is needed
> from the tyr reset implementation.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> rust/kernel/workqueue/mod.rs | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/rust/kernel/workqueue/mod.rs =
b/rust/kernel/workqueue/mod.rs
> index 933032fc4a85..d766cd9b9175 100644
> --- a/rust/kernel/workqueue/mod.rs
> +++ b/rust/kernel/workqueue/mod.rs
> @@ -383,6 +383,14 @@ pub struct OwnedQueue {
>     queue: NonNull<Queue>,
> }
>=20
> +// SAFETY: `OwnedQueue` has exclusive ownership of the workqueue and =
accesses to workqueues
> +// are thread safe as documented by the `Send` implementation for =
`Queue`.
> +unsafe impl Send for OwnedQueue {}
> +
> +// SAFETY: Shared access to an `OwnedQueue` only provides shared =
access to its `Queue` which
> +// is thread safe as documented by the `Sync` implementation for =
`Queue`.
> +unsafe impl Sync for OwnedQueue {}
> +
> impl Deref for OwnedQueue {
>     type Target =3D Queue;
>     fn deref(&self) -> &Queue {
> --=20
> 2.51.2
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
