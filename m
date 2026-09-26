Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBDB282F18;
	Sat, 26 Sep 2026 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441335; cv=none; b=rX8TnP3K9tRlW0fS9WlIugh/mrdhQRXCbJfLzkpgAcFRcYjc1MTO2InkWVstpj20Eptke25N4x92Tw9/ZK131YgY/lMKJhIssONSo9P7/SqBUeThO+dqMtSHnE9Gapsr5307pQhi4O5B7+5rcxHMf+wlkHyPJzVcQkgMfEXlvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441335; c=relaxed/simple;
	bh=p8RFG0EQrNLCa1ZQXR+pGWXX32yDPCGgD0MVP7PW2ws=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fLkzaeifle/DB7V4caeHFCfbsfTUYcCtpnwYNi/N5d4odS5jcgRA64YXHuQy8q59hbMAzQPgFfuuUxb6m9/MVt7DeZLT8B/TVU0lZQFhFAyxdcJJf0ufVeosSKxVya2Z9tcNCzXgfyC0zXlM27Mnr600Blqv09rD/AK9O01i6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoOcC+73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoOcC+73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05FB1F000FF;
	Sat, 26 Sep 2026 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790441334;
	bh=RcZ+pSBf1OxNGAAu5cwpwDBrRg3O+gIK2LnrVbUiwNc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CoOcC+730dBIoTCfVxQ6bMr+mBu3k3sbI8jngJBlPjbG60U/21vj+9turXUV5YYej
	 qihsx52Gi7GeP1/Oy2pEIvH7GRyBaNll7ICHO9SCqYIYLaNkdzpkUkWgBWLGE5rfXH
	 wGOs90Yhp7acFSNpl7VZvVZqbu0PgARE0b/3DDwieUJ6rdrYNv9yRJ0uFL3ZFA2JmG
	 EptHQXcyEbs4kMOzobYACLnhSuiESF45FOWgiOaHzJyEtsMl8EWW9AfZq8EV9wV7/Y
	 7XJqKi+hpEf7wH9xCQgRJV4whKYjMa/BVHxp0HPMREnFzB8x85E8STaupKUz9Y9y1V
	 Pn9JlHioRSHkA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 18:48:49 +0200
Message-Id: <DLPEHBOTZCCU.1DFPII93RC6LA@kernel.org>
Subject: Re: [PATCH v3 2/2] drm/tyr: safely write GpuInfo to userspace
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-2-e19bcb71980d@collabora.com>
In-Reply-To: <20260925-b4-gpu_info_intobytes-v3-2-e19bcb71980d@collabora.com>

On Sat Sep 26, 2026 at 2:26 AM CEST, Deborah Brouwer wrote:
> @@ -54,7 +54,7 @@ pub(crate) fn dev_query(
>                      )
>                      .writer();
> =20
> -                    writer.write(&reg_data.gpu_info)?;
> +                    writer.write_slice(reg_data.gpu_info.as_bytes())?;

I think we eventually want write() to require T: IntoBytes + Immutable, so =
I'm
not sure there is much value going back and forth with this.
