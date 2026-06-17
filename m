Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5849551A;
	Wed, 17 Jun 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713118; cv=none; b=RNz2USI0XcOFiVqfqEItOTeXBrPACaEQyugFtr6BuI4nKuuM2drNbVMg3dndX74BVwCAdW3/kFSEQm2dvzqQZi4Kd0E3K/HQezDcV9J6r12YKKX0UYnqzCitzjwHrg8yVYEokMCYaRXwcpwGBQMYw1jOdALtLfXtilsj0dMY5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713118; c=relaxed/simple;
	bh=QeQcxUlIaJBghKc6UDV8wDSysQML8EQlyVs4P6UM5tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMXbHrodQMSgvir+4FtjBXv4fDTDlCFoAFjO2gGP5mReSQHBueJjRIrxksJyRP2nfTF5EbmAj4w0goYrOzAZ+nBwmWGaYa8lO+u4OK1Qkyrq+lwg3DjSm5Li4uwrCBMTP9tfgeKsmGWmHHjNc3qnM/XO/gbm2ChWRRUA5QN1oP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIcT0lQ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIcT0lQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD7E1F000E9;
	Wed, 17 Jun 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781713111;
	bh=MBN0+32VLks+dHE0x6u+LU+xl0KGfHu2XZRjiV3EUGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fIcT0lQ46LdhcupVk5nq3gUJ34gzplISYa23HsCE8TxD8lgj3biCmtiec8hOlWIkI
	 UF6Ply6OvBjoHOIRzEmXUG03j+bnjAvO9xkjwqbbiR7d6u4p+tnTxk2R2jg9TC9plA
	 8UNXap6zmTdc9D6JoyU4YH2K/uTCOHEFTUkVHwSkgttQc9zNkDNmz/5TKSo5Nfoptc
	 Zj/DhVp/VxT3kIZW5s7y1PV7vOCg5HdQdZJrcdP43vEtrKAYoVGbqKRfAS0ANLA2u9
	 V6NF4JMq2SJ7RxprstwZNnvqeesqOQhXOWUe80VVU1AmKmgzOF61IPOqNkAFhxYBjs
	 rWf0ZgizCUQ/A==
Date: Wed, 17 Jun 2026 16:18:29 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/7] drm/vino: add the clean-room HDCP 2.2 AKE/LC/SKE
Message-ID: <20260617161829.GC785086@google.com>
References: <20260617151249.2937-1-mike@fireburn.co.uk>
 <20260617151249.2937-3-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617151249.2937-3-mike@fireburn.co.uk>

On Wed, Jun 17, 2026 at 04:12:39PM +0100, Mike Lothian wrote:
> +/// `AES-CMAC-128(key, data)` (RFC 4493), built on the one-block ECB above.
> +/// This is DisplayLink's "Dl3Cmac" core -- the CP per-message integrity tag is
> +/// `AES_CMAC(ks, nonce8 || BE64(counter) || content)` (see `cp::dl3cmac_tag`);
> +/// verified byte-exact against live DLM data (canonical guide sec 8.6.7).
> +pub(super) fn aes_cmac(key: &[u8; 16], data: &[u8]) -> Result<[u8; 16]> {
> +    // dbl: left-shift the 128-bit value by 1, XOR 0x87 if the MSB was set.
> +    fn dbl(b: &[u8; 16]) -> [u8; 16] {
> +        let mut o = [0u8; 16];
> +        for i in 0..15 {
> +            o[i] = (b[i] << 1) | (b[i + 1] >> 7);
> +        }
> +        o[15] = b[15] << 1;
> +        if b[0] & 0x80 != 0 {
> +            o[15] ^= 0x87;
> +        }
> +        o
> +    }
> +    let l = aes128_ecb(key, &[0u8; 16])?;
> +    let k1 = dbl(&l);
> +    let k2 = dbl(&k1);
> +    let n = if data.is_empty() { 1 } else { data.len().div_ceil(16) };
> +    let complete = !data.is_empty() && data.len() % 16 == 0;
> +    let mut c = [0u8; 16];
> +    for i in 0..n {
> +        let mut blk = [0u8; 16];
> +        let start = i * 16;
> +        let end = core::cmp::min(start + 16, data.len());
> +        blk[..end - start].copy_from_slice(&data[start..end]);
> +        if i == n - 1 {
> +            if complete {
> +                for j in 0..16 {
> +                    blk[j] ^= k1[j];
> +                }
> +            } else {
> +                blk[end - start] = 0x80; // 10* padding
> +                for j in 0..16 {
> +                    blk[j] ^= k2[j];
> +                }
> +            }
> +        }
> +        for j in 0..16 {
> +            blk[j] ^= c[j];
> +        }
> +        c = aes128_ecb(key, &blk)?;
> +    }
> +    Ok(c)
> +}

There are AES-CMAC library functions that should be used.  See
include/crypto/aes-cbc-macs.h.  We don't want drivers rolling their own
modes on top of bare AES unless they have to, for a number of reasons.

- Eric
