Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C89F312821;
	Mon, 16 Feb 2026 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258852; cv=pass; b=KNQCqksP/lqzKXjP1+02gPOb7aLBzKJx7MNaX+WPsJiLOjfkPKxc/UwCWB4ui9Y8w7qr5suBymTIUb6HsXhfZTWB6kM8DDCIUCWEboqD+XrndHl32Tk3NsCnFvQi+ynFmrV75rH268+VLq3lk1VtHPQ0lX0WAmxnBRTXHqtwwzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258852; c=relaxed/simple;
	bh=2cHw/k0r/xNMVAT8zTV7gtWw4/U2TkeYTxqPFQ2vmco=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VBDZof8VHIX1wnmMdpMB+UKLPIFa8ZsBD81YozWnIBlsALY6WOkSXNmvpHFgM625GXUpRFMs3rYeviPbw4eRYYev23HmIp4HaGrMrUm5uDwh7dVnnWEuBRCGjCaoGaYxx4ubIxf+odkVK4tPcArVxHWvL1D6nraqrwTlVDhGTFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=B4yPlamJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="B4yPlamJ"
ARC-Seal: i=1; a=rsa-sha256; t=1771258836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EoEA20ToSh90rrByLbaVgbOnKe+vEJ0RThTX6JqduT5AO3hy2JyBGr9D6w/xVcPJ7URpBTGYGuMIxhTikLXQMb3qszqWh7udW9kaXxh0zX8tf7GS8LtU13Lpbi8tJbn24zTYJnJemgN/SqPCmoZuX6HgupgypR3i2h9ByvYINFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771258836; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P2xroIIh/DM8tp91K7Cib803UTQjy6CguhTIfspWUfA=; 
	b=D1XD9NtKD25rF9gPU4Wr/fHjv8QyUAH8qxy6Puu4DcnZktp47eDgNuIbsl8noQIcf8EOWYfMFWbfbvmllcjdMTBk/+xy/rRVD0k5zQGp9tdKohLiLTQJlRbiUOsmrNXo9P2ARIPCU+srr+bckTLOIXn3PYXHXXFVOPmzhTenhgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771258836;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=P2xroIIh/DM8tp91K7Cib803UTQjy6CguhTIfspWUfA=;
	b=B4yPlamJ5+1HyYDPaa6uwLf2neNGAu6aFaS9rDnfCGuisxQNe2fhTxKqZ9Ld5jK3
	15eze8M7E5OHl5OvhInW0Gkwm+St8sO54VkBCSdQ1qdvpz3qEC9Elr7Mcq8FARtiNQF
	V19QgC2spoFTng33AlWrFCRbaLNKz9di+KaFKRhI=
Received: by mx.zohomail.com with SMTPS id 1771258835129346.09214209574554;
	Mon, 16 Feb 2026 08:20:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Date: Mon, 16 Feb 2026 13:20:15 -0300
Cc: rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 4 Feb 2026, at 17:40, Daniel Almeida <daniel.almeida@collabora.com> =
wrote:
>=20
> This series adds ARef<T> support for both regular and delayed work =
items.=20
>=20
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device =
that
>  dispatches the calls to the underlying T::Data.
>=20
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler =
OOM
> (out of memory) events. The current series sets the stage so that the =
above
> is possible in the future.
>=20
> This is currently based on v6.19-rc8. I hope we can land all four =
commits
> on a single tree, but otherwise let me know whether I should split the
> workqueue.rs changes from the drm::Device ones and rebase accordingly.
>=20
> ---
> Changes in v2:
> - Rebased on v6.19-rc8
> - Cc workqueue maintainers
> - Patch 2 kept the old import style, since drm/device.rs is not yet
>  converted.
> - Link to v1: =
https://lore.kernel.org/r/20260115-aref-workitem-v1-0-9883e00f0509@collabo=
ra.com
>=20
> ---
> Daniel Almeida (4):
>      rust: workqueue: add support for ARef<T>
>      rust: drm: dispatch work items to the private data
>      rust: workqueue: add delayed work support for ARef<T>
>      rust: drm: dispatch delayed work items to the private data
>=20
> rust/kernel/drm/device.rs | 66 ++++++++++++++++++++++++++++++--
> rust/kernel/workqueue.rs  | 96 =
++++++++++++++++++++++++++++++++++++++++++++---
> 2 files changed, 152 insertions(+), 10 deletions(-)
> ---
> base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
> change-id: 20260115-aref-workitem-0f57e4fb81ca
>=20
> Best regards,
> --=20
> Daniel Almeida <daniel.almeida@collabora.com>
>=20

Friendly ping for the workqueue maintainers here: any comments?=20

=E2=80=94 Daniel

