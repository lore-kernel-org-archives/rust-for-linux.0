Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFED347FCC;
	Thu, 22 Jan 2026 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769113808; cv=none; b=CQNaUgydenlyysFe3ZihnEkOTFIzBMBYR/3REPxC5uY53FkNJgY8E6b1h6Sorkp/0HLZCfivn7S3xUHCWrEEL/pv4sp1EzcOPtNDAJgdbWAprv3maA+PIAz3gi9Qp1sTktwTbZZwxuVCgZxjcBC/N6plHvdVVCNP3dvRdN7zFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769113808; c=relaxed/simple;
	bh=gzS6iQgov38ZJ8XoyOJsF6W+Bvs+y3mTNHdcQZBPXRo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=o5nlx/0EzV8xSGkmodpzxHtH4NhTd+N+KAPyqya2KuDvxFnHrNt7blNic4Up4qIuzjex2CtYN8j4fq+nr1yJsYdogG/VvCVJe/37KwstivK3PTWAmTsYmfPY2c+Ke70gh6PVgstbjjSo37sevoPwxU5ZRFweXrJfXQY3Mr46qrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZQPdYmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZQPdYmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29E8C19423;
	Thu, 22 Jan 2026 20:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769113805;
	bh=gzS6iQgov38ZJ8XoyOJsF6W+Bvs+y3mTNHdcQZBPXRo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=JZQPdYmGEpup8JhzdVrPjQFNV7RfWVzApFyBA1C27aIlZ8dcpBQDl9OJIdejUjX4V
	 gTuvvM+Ft4kr5v0UEbOumfxC2hLfxHrFR1F34+mdglXWqJM1Y3ykA5oP4juDo5UZVT
	 RJ8Lw7XhgetOlrPgMGNP/8e/koNQP7dISE8ONMf2xmA9PxaqyXIWAL550SEZXuPURQ
	 cOPvtpeAKfvPWUHWDWBzVzRXR1xjckEKci2Wr+ec9DOlqI+afTOOQtQhFH87hfaQv4
	 OxMmMMGSvDwn9cnojq9Ns+CxqCRMwdzvzyDFIuGkOReuKp5h/cEeTCg/aZjcou02Cf
	 /mO0Z2uxDOniw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 21:30:01 +0100
Message-Id: <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust/drm: Fixup import styles
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>,
 "Shankari Anand" <shankari.ak0208@gmail.com>, "David Airlie"
 <airlied@gmail.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Atharv
 Dubey" <atharvd440@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
To: "Lyude Paul" <lyude@redhat.com>
References: <20260122202804.3209265-1-lyude@redhat.com>
In-Reply-To: <20260122202804.3209265-1-lyude@redhat.com>

On Thu Jan 22, 2026 at 9:28 PM CET, Lyude Paul wrote:
> This is to match
>   https://docs.kernel.org/rust/coding-guidelines.html#imports
>
> There should be no functional changes in this patch.

Thanks! While at it, can you please drop imports that are in prelude and us=
e
prelude instead?
