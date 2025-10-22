Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF853101A9;
	Wed, 22 Oct 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123972; cv=none; b=MWSRxmmHi0xw8lKzK7Xh8FdeGTJB8Kk3fMqIVp3lC6XR7iG8ZEPEBjzf3lSgQy4W7bTVEcGC0oDJd1D7iKYsU2quiVepX9p9zcgVvh5d8xc8YZg2ikr44pFXVRHHH+as+zkLVSGfb6yGHYhCj+E/IiPBFiNvl3NahkYgnY3zEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123972; c=relaxed/simple;
	bh=y8yIEnHW6sZtmscM6i6JXM4eAO1TU0btvfSdCrr/kqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ER+7/r69IbI2anQB9m1TEZyNkyJEv0dR1akagTBYDs/xMKZfqbjHhcc3bqenHQUEe4idqGxTyUjn7CIM8fU2aDdXVcMUhDlQt/FDYOfU9s43hZK0ZsLZvmNkCzXNit33WKMeH9tJBeZTDtaIkhlikyX8DnifNjmYXcYm/POArag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRgIJyvl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRgIJyvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A784FC4CEF5;
	Wed, 22 Oct 2025 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761123968;
	bh=y8yIEnHW6sZtmscM6i6JXM4eAO1TU0btvfSdCrr/kqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fRgIJyvl3PN1AL5JpHNqJon049Ba4Pzrs0cXcjfUBG+zvYwmBVTB10Hy6h2+3K1sN
	 bcCSQjYVWBuUw0/aEZ8kneJ0gLPulqOJYo15tf7110L8pW7JPfe3ZKX6rTkCWxQFPf
	 VHO+HioYlyd7eoOx+xmFjv6rV4+RG3JXyDXvJIrujrLTIS7HLEOMO3w5q+7/uhm/E1
	 fMd64scOBfAeaOPZehi4C/IpvLBnexgWho9gyR7hrc/QwOeA/WesjcIFsDaM3s7yCY
	 2DtZnud+ikNzy/5cQarJhgmtOtTcu5gVDA4SiHkqNADAUUH1+Zw9fRveHl9yus6din
	 IQOhdvmzigBrw==
Message-ID: <6720f5de-f3e0-4ae9-8b8d-7ae2029799ce@kernel.org>
Date: Wed, 22 Oct 2025 11:06:03 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] rust: uaccess: add
 UserSliceWriter::write_slice_partial()
To: Alice Ryhl <aliceryhl@google.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251020222722.240473-1-dakr@kernel.org>
 <20251020222722.240473-4-dakr@kernel.org> <aPeSCuFNrV-_qvBf@google.com>
 <DDO29UN4UBVV.E90DEBURH63A@kernel.org> <aPeWOhycOIl_rlI-@google.com>
 <DDO2PI0D2L6Q.3OPXNQOV7Y0H6@kernel.org> <aPiUNmAfbefKW__4@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aPiUNmAfbefKW__4@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 10:22 AM, Alice Ryhl wrote:
> It's tricky. Perhaps if you make them standalone functions, then using
> the simple_read_from_buffer naming is less confusing? Then it's just
> kernel::uaccess::simple_read_from_buffer() and it takes a
> UserSliceWriter.

If we want to preserve the name, then that's probably the best option.

However, given that write_slice() and read_slice() represent
copy_{to,from}_user(), it also seems reasonable to give it a name that matches
the UserSlice{Writer,Reader} naming scheme. Also because the implementation
utilizes UserSlice{Writer,Reader} rather than doing the corresponding FFI call.
