Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65E3B71A0
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706464; cv=none; b=aoAu2dyrwpefRMHbBUfuTsLHfVJDtxz+JWb/MqTewu7GmtpMP4EdBP8yeGQ5FYQklMajl7VAhzPtkUJ/Pr9BfLsmmnEHE/fl+9lztwN5Nx6K7WpK0wd7+QzQ8XcAOJVHtu1I8f0SLTivDbSA0kMu9ak5r0UJSsw7TSyFX9eRzXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706464; c=relaxed/simple;
	bh=2DkG2Gs65Mg8lCl+FvaDdG2zeJ3pZ4fCTYIVPzzv+Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHQXOlS9DJP5ZrnUbiYVHfVH0sGdLqZ1a/XpmEOzKnFkb3fsYXgoRfVUzk6T55ZUim5IXlvEpUQD20zdh7hR3+ywluDnnYEKRUtKNU0jC4dPTDLliA+qxIqHQ2Sc0lmIEP2ya+PJAe8l2KW1Sizk3a0byFNb0Dl73L3SCQOA8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=RM6wIpCJ; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="RM6wIpCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786706450; x=1786965650;
	bh=gZ/xY1sbSmHJCkms60/TkZPkt1U/i9ryG+oCm5UgYgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RM6wIpCJhmVGinbIi5+H+Iv8TmFW5a0Cu5+6zMVwUJwOuDQLX5I/uc3ATyUgU0JU/
	 k3fsvmLc+g+XY6JdGGNomq7AaqoO18kiVQ2EFwLUe6sS4+FaVzwudutV4zRT2YjYOs
	 yoYB46EaIptWOKxrpVf/IXEhAYnaBS5oPTNxbLTDOyMwWZhTb1oP4+a8mRkDfyjBel
	 jx+xcI8kla47FWQmR2sROKEgGaMBUuA0ONMJZ5Dsp7IGOG6IVmPOX4pzawM5ggYayX
	 82Zhmm0zBpPyNrTd53qfA8G7JzFBsxXLSArwYbZJprW8pQ/35smnbyKQhGSQBSwiKd
	 NnLZOrvNc/p4Q==
X-Pm-Submission-Id: 4hM0CM0VVkz2Sd4C
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
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
Subject: Re: [PATCH v4 3/3] drm/tyr: add GPU reset infrastructure
Date: Fri, 14 Aug 2026 14:20:39 +0300
Message-ID: <20260814112045.72877-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <D4F91EDE-5FD1-41F8-B5AE-D8C2EA25545D@collabora.com>
References: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev> <20260813-tyr-reset-impl-v4-3-b36fcd0805b2@onurozkan.dev> <D4F91EDE-5FD1-41F8-B5AE-D8C2EA25545D@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Aug 2026 20:25:15 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> Can we move the iomem to the HwGate and get rid of its Arc?  This way we=
=0D
> ensure that all hardware access must consider the possibility of an ongoi=
ng=0D
> reset by having each component that needs hardware access hold an Arc<HwG=
ate>=0D
> instead. Perhaps we can even broaden this to "hardware must be powered on=
" at=0D
> some point in the future.=0D
=0D
Sounds good to me, will do that in v5.=0D
=0D
Regards,=0D
Onur=0D
=0D
> =0D
> Otherwise, this looks good to me. Let's wait for Alice too.=0D
