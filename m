Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366740;
	b=0sIUz4BXImO9xyzPcBjkKQnmiKe4I0YpJwSXwkt8nhBDidIeaNy1q7GksmKaBAEm9vJq
	 C07BEXtLgs4otVCXuSTN7iCbkvTFsyBYDdaP5BcYTOsnoye9iuZ95zuHnar8+rGvYQgVf
	 DtjNzKYZoF70LPFq1YdN8KmH+NtPb6XHTx1hTLPBcVH7fV2q3YB7nx4eYwEyFqqLc882s
	 59/hMZW+CqEjBvvLfW8y3hNoIAg5AxT/ryfVNpSqLsIVgkehh7StPSEOmmqkT2j1TvXZn
	 wkN7rkUqrTMz61G4wzI7iJaI+NvS/kEMZGCJ0QCdf4pkn7gWcQL1TIE6OHh/4GWyQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366740;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5KT/akQqJfPobK/Gnh5/Clx5Z1xrij4GwAcSxJvS7Gg=;
	b=5VPPrwbNU8cJVN3cKyuqonfsQI0v8LeJ7h9wfmckUzuMhUVe1Z3BE7RWQLd4FcJPE3kQ
	 fMxAPlBKew5kIacwGvoU8a+3DGedhw2EuPMa34z4OBFSCwcOgFyrJgBllJkUwlLYN/sJF
	 eoGaKQ5P8K8Fr3yBtZlOa6JGVfdiblzA0YrvlyMSfUXfKUqEFdbhQGhmtt3tqUj2jp0Vi
	 pyHq7KNuDO9frg3obmiYbk+0iRSeE4WrTWbkQqjJawMvZBVTMZtmDMc6HjKZCbn9gOxCz
	 /5VKZOb+VprNgWIRDPgNlMqvnQOdKtlQplA4cnWikMogIaAR5hHiFbbfelCEG0LZK+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXHnsUQz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE3606A320;
	Sun, 22 Nov 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXHnsUQz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC811F000CA;
	Sun, 22 Nov 2026 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366739;
	bh=5KT/akQqJfPobK/Gnh5/Clx5Z1xrij4GwAcSxJvS7Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXHnsUQz4t7cbWldltOLuYKWx2ib4DEnDlS0X1/37hYfx67vp4xhRzJ4D///TI44H
	 IoITN0O0k81L9PzfpD1mHulb/0ZdkWyAHIj0zb/UUSFmwiBvL/K7NZZr1KGk911T4T
	 +rcJsMkmweKZULlb4Tpu7u8clHRH1mUk29bZvQkat/3xJ671m6Br76/+Hl4XjugTli
	 4G1tsk3tVoSqtFwN/+5cxVaqf+qhz0ROZ532Rt0jtQSBRUyRxlvTML9rPEOBM+/AjD
	 x/hCivPUnUzK6IRZ1CChBXzeUdJojejhtY9W641lkeEMl7fFzA9XrZ7s8GevVL7Hfp
	 fK2l+w1y/3QMQ==
Date: Sun, 22 Nov 2026 17:58:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, 
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gary.yang@cixtech.com, fugang.duan@cixtech.com, daniel.almeida@collabora.com, 
	aliceryhl@google.com, p.zabel@pengutronix.de, daniel@fooishbar.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Subject: Re: [PATCH v3 3/7] dt-bindings: gpu: arm,mali-valhall-csf: Add
 system-cache policies
Message-ID: <20261122-greedy-cuddly-hog-06c4ac@quoll>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
 <20261119123850.2994625-4-cunyuan.liu@cixtech.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119123850.2994625-4-cunyuan.liu@cixtech.com>

On Thu, Nov 19, 2026 at 08:38:46PM +0800, Cunyuan Liu wrote:
> Describe system-cache allocation policies for Mali GPUs with SYSC_ALLOC
> registers. The policy depends on how the GPU is integrated with the rest
> of the system and belongs in DT rather than a platform table in the driver.

Explain why.


> 
> Use entries containing a source ID and separate read and write policies.
> When the property is present, omitted sources use L2 allocation. Without
> the property, the driver leaves the register settings unchanged.
> 
> Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 8eccd4338a2b..4d50427edd87 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -97,6 +97,30 @@ properties:
>  
>    dma-coherent: true
>  
> +  arm,sysc-alloc:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      items:
> +        - description: GPU internal source ID
> +          minimum: 0
> +          maximum: 31
> +        - description: Read allocation policy
> +          enum: [0, 2, 3, 4, 5]
> +        - description: Write allocation policy
> +          enum: [0, 2, 3, 4, 5]
> +    description:
> +      System-cache allocation policies for GPU architecture 11.0.3 and later.
> +      Each entry contains a source ID, a read policy and a write policy.
> +      Source IDs must be unique. Reserved source IDs and access directions
> +      not supported by the GPU must use zero policies. Policy values are
> +      0 for L2 allocation, 2 for never allocate, 3 for always allocate,
> +      4 for partial allocation and 5 for L2 partial allocation. When present,
> +      all source policies start at zero and the listed entries override them.
> +      Omitted sources therefore use L2 allocation. If absent, the register
> +      defaults are preserved.

Looks like integration specific, so implied by the compatible.

Best regards,
Krzysztof

