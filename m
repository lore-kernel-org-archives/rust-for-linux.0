Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBB2BF00B;
	Thu, 31 Jul 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753969981; cv=none; b=lGEImCd1z8H9JDWPElyC4gfxK+iNpasHCwMnCvarSEQePRw4gLuFoVckT9YxUGDPmk2cBnddfQpcMvw+F8fqAM7Ec5TK7rdN8SGYoaZullETd1FzwmYKuvNvKv1hiBK8PneCsUwdQrikVVTeI8CC1rbAphgXcYgVAdqUWrPPYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753969981; c=relaxed/simple;
	bh=1uzHul501LXGLaBrQTZB57yDuyt6034qVPUjWFa0aXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umO/v16sSraduaiafDTCVRDv+GoCR6GbiWIkNPQAL0ECN/DcG1bA0EQtHQrmFEDthVrkhO+aYlIApws5O3nJ2cHgAc+42DytSp13zJxliGCG4Lt2f37J6SV4XEqlarRvKW2mZsPBxVeyvGYKaVIdo1uHuFVry8IN8EVam7MIay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVgHsPgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVgHsPgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C054CC4CEEF;
	Thu, 31 Jul 2025 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969981;
	bh=1uzHul501LXGLaBrQTZB57yDuyt6034qVPUjWFa0aXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SVgHsPgqY5PU6aMXsnQG/jSj4WoMv/XNf2BPDzSPMYtGrUIS7owi3yl+IusiQ4+ze
	 lHe/ChrYwGGEc5HXFRblM2FSDydL9EGoRM3B9ByQOhAALJK4gVfVMuJl1nQNhTjJ8/
	 n57d/LMFX3d3CM7/skKsmSUAzpadgw5nblJtLZWwc15O0ExIQ5fwhKQXNOGpAc7jAm
	 7zP87z+USqYY5+/dM9xAiSsX/9Xf2btLma5DYTyGRZCeiKIfYSGMt+mWwsd4cdv7MK
	 dlJ+Vyft7dSRJwB8JfcqTH5BLqBs9ZXj/GtT5mLob556KfwLe7U/TQJNf/2jfg7Cf3
	 nZP3g/S7sMEqw==
Message-ID: <f958ac81-c092-4958-a61a-d30c8389f431@kernel.org>
Date: Thu, 31 Jul 2025 15:52:56 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] rust: gpu: update ARef and AlwaysRefCounted imports
 from sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
References: <20250716090941.811418-1-shankari.ak0208@gmail.com>
 <CAPRMd3n-1nx6BnL=OtrrJqS1gCxYAw2wSaHUQ19174Y=ShqO6g@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAPRMd3n-1nx6BnL=OtrrJqS1gCxYAw2wSaHUQ19174Y=ShqO6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/25 3:37 PM, Shankari Anand wrote:
> Hello, can this patch be picked up for review?

Where is the rest of the series?
