Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F91F2380
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160474; cv=none; b=nQ6hmaaKLAF05RbTYN4s1LdS6COrYVo4U/Myg9Isyfm9mgUq8Ua2TdfZs5Xrz4lh5Y24lk27z1t/ReqEF8myh7luXqdjcV+q+/s+xmZo2Rz+B7cRzlaNbvuetIcR0VDIYAQ4OC+RiUp4NONsUmAAlD2jYtnGGDHVEsHh2KXZ/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160474; c=relaxed/simple;
	bh=wIvwpIIrexok3r97OcgWR9HBGAsfosGMdpphk4yN9bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RIYW0WmZQ/T86KHAVr/kfYJtNCHpbMQVw2kAFsg1QSY27YcXs1Zspo0kdTxa1FuntZDSwn7V+tBtlWGEL7mC4BeV2g6YPcEBBBjMjzuKt5JT59ER5vv16j/iWPBTQkdnO3yOimbKTjmNvKAAJIrdT38qZRAkfcny/0+4wz9GXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pyz7I1jy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pyz7I1jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446D2C4CEE8;
	Wed,  5 Mar 2025 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741160473;
	bh=wIvwpIIrexok3r97OcgWR9HBGAsfosGMdpphk4yN9bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pyz7I1jy3jWM9fV3MGgk8tzXRiP9Aan+AtybVP5JUH4nnnSObAuV/vzHdpZbWH1pp
	 odF7o9cpe+x3ejhprmo7A5x14hfq4SwG24npd9ioK3KZ5lGHX4NqJxgVAGCuRSDItb
	 ci/ZtOrzMbmTCozr4PhT7tHW693iBcLJvUkA80vDcQ8WnM4kVCFk6MPovWWIDewlDk
	 psdNPZBoXauHzDTAYgujf0Mv9BgTel+jQm4FWJWBzEW/2StdxmYdwjNWMrq+Jr6z62
	 M++KcmpTIxPMu0HPUv8pFOdCU0ZcDcHlf/uXXMFIsGS83Wsar8PzJHDurSc584KxRa
	 tz4z4qigu3E8g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 1/2] rust: types: `Opaque` doc: Add some intra doc
 linkage
In-Reply-To: <20250305053438.1532397-1-dirk.behme@de.bosch.com> (Dirk Behme's
	message of "Wed, 05 Mar 2025 06:34:37 +0100")
References: <Qag_hE1Uvj0nZB8Bf_MPl4UUT5v6CzPHCzseIqIvESgDKvayvNPlhVBSSS-HVW_ubhQh1GJrGH3eU-8Fy84YOQ==@protonmail.internalid>
	<20250305053438.1532397-1-dirk.behme@de.bosch.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 08:41:04 +0100
Message-ID: <877c53hqlr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Dirk Behme" <dirk.behme@de.bosch.com> writes:

> Add some missing intra doc linkage `[...]`.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


