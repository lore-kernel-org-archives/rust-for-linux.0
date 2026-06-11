Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABF3C37B6;
	Thu, 11 Jun 2026 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216902; cv=none; b=b9eNBZVIKfb9aLenVRPyWEE2BgMSdQVifCV9Xba8Fz/V2zFO1vPXl1oTbQcyh6MT0317bLL+SgxbHAFNdjEzd1hVS9ugXemJ8oq2xtolqDuTUHxPGuaeG1H0g6eAiUh5I+263pEXeDUsFPDC2y7nXdwv3MBvtLSwQXX6mGeyk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216902; c=relaxed/simple;
	bh=fum5iuhZ4i//x9LUfrRKo8i6XMAr8xSQ4KNBAU0prs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukSfGTiaUTPODl6R7X3PRoSZWralz7Q26EAalyOskS6CKOasOCRWz2TID48SIkgiQd3s88ZDKFp8HrT32LPvfOHKC7hmOsmJ+cL+UGHxsYDDiosZJXLrnBa8RBaNxdQyOpV2FXToNCkAV27Tu3zFTf8PHDEtnpbFqKUaGD4Z1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7i6qmV9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7i6qmV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C1F1F00A3A;
	Thu, 11 Jun 2026 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781216897;
	bh=hN9oj7lktSr2osU8n/8aLsyUJ7Oaqx3mDPCrD4Fr5n8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P7i6qmV9OFTpqSJ+ahYx6GyZA/D0zxOotgnLZFLM+xPV+g/rn41cCAD3zj3WUZHtG
	 vi+0tB17DK6+93eOP4OWU7oNnfkZdZ5Scy6d0QMj30jNGdUHvqEhN9t3atbDRqQVyI
	 3+Lo3/l7XU7EuOsc84Ya2DRW4iQLyGQtBgxGpNxWOT1JtAQK+fQNrWmM+QJgfBXRqQ
	 mRs18nIA8VHMHGjWK/zc0rjmzg4v+y7un5QEsLAzOrD7MyXufsvDY/UDUhz/Y10x0p
	 JswJVAOK/XjscL4Ag7cOlEKdd8GiMpUbR7YvNju5gkirkV12gNcetp7u90LthDpqXY
	 MIuzj+kvjQlHA==
Message-ID: <7b6da471-9f9f-4c96-b0e3-ee89397a59a0@kernel.org>
Date: Fri, 12 Jun 2026 00:28:12 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: drm: gpuvm: update DriverGpuVm for DeviceContext
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 samitolvanen@google.com, laura.nao@collabora.com,
 boris.brezillon@collabora.com
References: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 2:01 AM, Deborah Brouwer wrote:
> Since the introduction of DeviceContext, there is no longer a single
> driver object type to equate with the GPUVM object type.
> 
> Instead of threading DeviceContext through GPUVM, remove the strict
> identity between DriverGpuVm::Object and drm::Driver::Object and
> instead tighten the requirement that the DriverGpuVm::Object be an
> allocatable GEM object associated with the same DRM driver.
> 
> Also, make GpuVm::new() generic over DeviceContext so it can accept a
> drm::Device<T::Driver, Ctx>.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Fixes: 0023a1e8d01a ("rust/drm/gem: Use DeviceContext with GEM objects")
