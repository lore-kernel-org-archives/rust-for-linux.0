Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152AB3009F6;
	Fri,  6 Feb 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373394; cv=none; b=SpZ7pJbWSnfBrqhUHGaQCJpchUVCaJW0A570m7cX1CfzbsDjiqfk9P5J3AZl003yQn5vuMu+QijZVPG34bM3umXlehJp0I08BJiDUHRmKMWZWIm4yjiX1Sa29El8tVquZMRa0Zm8FrfcEHYwvR27x/EXKozZEchAouynkwAFvWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373394; c=relaxed/simple;
	bh=MD0ltbolpcbX0ppzykUcn2VF7JjI7JiMlQpT3XJrlqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=IeoHz9FdTPexcb9FKh0KbxFHP4Yq/vMFztwN2JYIxD6eKb7RHDryAYfQERKmXWxTvJS+3d6ZgcsfUpNNR4excAj485C+rkQRsioH4CY/lLnib1Urh2mtmcmhwZaz0oT+QD2O4+7D4pAAp0wUbeVrPkM/ubo1kd+CGw1UyBPLjuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6T/KuWg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6T/KuWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FB7C116C6;
	Fri,  6 Feb 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770373393;
	bh=MD0ltbolpcbX0ppzykUcn2VF7JjI7JiMlQpT3XJrlqE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=b6T/KuWgLybFqrcg/AU2e1od//IjnCjYIsPMsNSzMc86IiHRoQlUKKDu2HAB/EgcQ
	 mH27jkRAJYsU9UKtTFpITp3oC0kdjk2l+H9ZdvFV+kmNRMOOmEKzSptBh3GWD0t/+I
	 IpJ692BmEsGCVGXUCCQGh6Pv1XrDqCS6C1NJEUEAOhOaftvau85dQZ7W6fW6z4C6Em
	 P3ox4uFwO4oFrnnESPUy/lySjsyR+YwMCybHuGh4nFUVUayrPclpEYixpP3rfpbOgK
	 zkWhPRlVj2l4WzT17/5ZUXEBRQ2rxJTExpJVQmkeaQg+tZMbwLg2x6talOcnGbWDAg
	 53v3W/8sQ5T4Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 11:23:09 +0100
Message-Id: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: "Philipp Stanner" <phasta@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
In-Reply-To: <20260205095727.4c3e2941@fedora>

On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:
> On Tue,  3 Feb 2026 09:14:01 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
> Unfortunately, I don't know how to translate that in rust, but we
> need a way to check if any path code path does a DmaFence.signal(),
> go back to the entry point (for a WorkItem, that would be
> WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> Not only that, but we need to know all the deps that make it so
> this path can be called (if I take the WorkItem example, that would
> be the path that leads to the WorkItem being scheduled).

I think we need a guard object for this that is not Send, just like for any
other lock.

Internally, those markers rely on lockdep, i.e. they just acquire and relea=
se a
"fake" lock.
