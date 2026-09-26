Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB71E32D6;
	Sat, 26 Sep 2026 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440006; cv=none; b=pncTNcoKNz6RXvRh1wCCxyYvgipeVOiYsBVX5fx3w9HAgjvGqJ6q48uRt88TajJfAK/qBeP1luE3Kp/fVKgC6ayr4qsQbVt+wSm/pXGkfy0yEXa2XSoGgPvhk7+xlNcNRK9pIHkCNILhAIhalXnbdR3PGA6xPbCbxNvNREqZ878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440006; c=relaxed/simple;
	bh=B+BHuayP222EPyvbxwJWaWJVYXj799sorjMVrbea+gM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=F+vd98U/yHldbkZFYoYNXFo39kA7/i2yQC9Ev+ALdZdsGgwr1gVvnxcr9VEtHj40d4Q58mizcupqESmIzOXwbp4dpVi4KbRS0UuIGqadC093OVaMRzpuqSQRxHBr2+2Kqmd1lPH59D5O43+4yHON+EATkoCueEq0FaS6aJKel3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flAwOjtS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flAwOjtS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03F91F000FF;
	Sat, 26 Sep 2026 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790440005;
	bh=q8p/wCUk8cWVpUL/3mdSIEThA8tm+/7jX39lkkQ8EEE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=flAwOjtSPoX6dbTjcTGiG9G5mEsSqXKigcjPcsTE95yFQlnCWcbdG9LDZBanvyjJO
	 vz2617T24PmV5j1L4jxsdVqWrs3opwO6mHh65azECEac23cph7jU9WHm8RYo8EviTt
	 nxLTeDznZ35PU2yaNzIqrMaupFe99QfjFHT1KIQObGpaoI8LVFfmpko9PLLQMf5XvI
	 82XYV1a3o+fCrj5grGpHxgw8E59xs+ckJKvMHDeDNVS/XTu2lgjm70H//j6d7KFJn+
	 CjN8MdCoVHgUcRfnOI8bEgt2bFpw7uLeB7ImdlBGdFXF5D5CgSfzWv/KSGl3Pf0fA9
	 gO03tOMkT5hug==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 18:26:40 +0200
Message-Id: <DLPE0D8F96DE.91C7E0MAERDS@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: uapi: add zerocopy/zerocopy_derive
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-1-e19bcb71980d@collabora.com>
 <DLPD8RQKM8VU.3QWOV9RFLA8S6@garyguo.net>
In-Reply-To: <DLPD8RQKM8VU.3QWOV9RFLA8S6@garyguo.net>

On Sat Sep 26, 2026 at 5:50 PM CEST, Gary Guo wrote:
> On Sat Sep 26, 2026 at 1:26 AM BST, Deborah Brouwer wrote:
>> @@ -71,3 +71,6 @@
>>  # Structs should implement `Zeroable` when all of their fields do.
>>  --with-derive-custom-struct .*=3DMaybeZeroable
>>  --with-derive-custom-union .*=3DMaybeZeroable
>> +
>> +# `drm_panthor_gpu_info` is copied byte-for-byte to userspace.
>> +--with-derive-custom-struct '^drm_panthor_gpu_info$'=3Dzerocopy_derive:=
:most_traits
>
> This is Tyr specific change and should be in patch 2.

Why list all of them separately? Can't we apply this to all uAPI structs?
