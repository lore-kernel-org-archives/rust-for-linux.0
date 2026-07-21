Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616E40244D;
	Tue, 21 Jul 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654786; cv=none; b=V4/AyzqNDzJGtfyFc5MouuSUKE5F5v9ufEB1NeaMzbqx5N+8Gs+UiNnvRcCwEukBMGglAWECh7Su9C+4i6DIoWZwATYF2llv5IGJpZcsa4vOzt+QesPAAGVUn+8A3a+6uYo+ShAW42wl6Jt53FjvBk71Wo3D+KpNXPpBKFg9peQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654786; c=relaxed/simple;
	bh=notyrlJcyYA1hPUVnZc4/O0Y/j/UNKyO5LqxWYXUgG4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=JW4GM+DZ17Qa0Qjny1n6XTMz43DD9t/LFGZD5Y882nIXQDgv5mCJudm9IHLmlk/0tdG0l8VEtgblWlhNfDLs9V+MecXjFNwt/nT/kGpacAkVdxrXZbxDLrrGijhu40AFHypuCuyjikSDs6qhp6yKIF68T1oTq9hienJezkI1xcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3Ehe/jr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3Ehe/jr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7511F00A3A;
	Tue, 21 Jul 2026 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654783;
	bh=uMCkyxUD7fC802ZhNEo4EcyXWZfZYO4sDV6g+t3KpUE=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=A3Ehe/jrBithDcdtU8AAsJ7cFI7ba4ho+qx7PWvaIuweL8HXhChRxKMUGsFs/cFx7
	 uElLUbfwJ2ivHH+9U87m9UefxXUG3xDrJam8IGGQck2SKHH891bH6BOzqJg/C3lHck
	 81W6PBn3/kFhFJZ3ko6hIETEiWrabEyVfSLop9+fB2aVuZ9xYeN+5XlN8g7JLG9r8i
	 CrQkOweUpVdGQl9TejcidwdeM7AJwDv/4+Twyo+funjD80JnNLCOgZM4JJFjGppb2T
	 vWH3KcfN6dEfRcd1xnRxrsHJagZ/UOZ+rH/eshqU+SxkGvvY3TFDSzkpM/4aK5e7Yd
	 1LeLrUTNyTc4A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 19:26:18 +0200
Message-Id: <DK4FBIWI47PQ.1J3WZDTDGL42X@kernel.org>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <boris.brezillon@collabora.com>, <samitolvanen@google.com>,
 <work@onurozkan.dev>, <acourbot@nvidia.com>, <lyude@redhat.com>,
 <laura.nao@collabora.com>, <beata.michalska@arm.com>,
 <alvin.sun@linux.dev>, <steven.price@arm.com>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 4/7] drm/tyr: add GPU virtual memory (VM) support
References: <20260713-fw-boot-b4-v7-0-afd8dc1494dd@collabora.com>
 <20260713-fw-boot-b4-v7-4-afd8dc1494dd@collabora.com>
In-Reply-To: <20260713-fw-boot-b4-v7-4-afd8dc1494dd@collabora.com>

On Tue Jul 14, 2026 at 5:18 AM CEST, Deborah Brouwer wrote:
> +        // dummy_obj is used to initialize the GPUVM tree.
> +        let dummy_obj =3D gem::new_dummy_object(ddev).inspect_err(|e| {
> +            pr_err!("Failed to create dummy GEM object: {:?}\n", e);
> +        })?;

In quite a lot of places in this patch and the other patches, please don't =
use
pr_* primitives in drivers, please use dev_* instead.
