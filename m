Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10300296BAF;
	Fri, 23 Jan 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164852; cv=none; b=Rpb3WdmJU2NAX8elZds1f1SNt+IuFBzeJJUPp0yS6wI2KfrLBkY1/E65Z9qLUQSvBah3DfTP4O/OGIePVjJqoNQM3pMfaofclj4Sa0IxEFwpQ0rEIGz6KJPFu3qHjoAUJqGTWPjC/dyd8H7g+oVjNxOCzqjhL6t5hGSlGu/h+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164852; c=relaxed/simple;
	bh=c5/JcexVLk2FUA368ZQKgpZMQgdkS40S+eWlA1lDMqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=FxlIOUlI66AQ4VbDA3bLOrqMJW6Apr6vf4e4ctDfv9Y+rj86DtV6dBAzuWaTLn9o4xhr4EElafFwiy7A0yMI2jH3Z/SNiUIzbSHFCnifywWgYE4Ei33zsdOeFvNfyv4q/plBAsdUKUF/wFaOCdOJqNHbzCb9jO9G1T6dw4sYGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg7g4Oe0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg7g4Oe0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA45C19423;
	Fri, 23 Jan 2026 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769164851;
	bh=c5/JcexVLk2FUA368ZQKgpZMQgdkS40S+eWlA1lDMqI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Tg7g4Oe0alTNwi6p7SO+dFlXVQrNYz/FVBRA8/Rg+ShwjKG+FWjwrcq/64OOmd+9k
	 BgsAj6uk5R+NfRsTuzCJwEBmbf8u09s4Ab5CDwGrFJuWbu5QBexJilzvQN3hbPLTPK
	 Nwts4bj4meWQdcD3YSJJ/68He5CkuR7EHOneZocRzWyxKluGR5xZuRQb9WTIxZKRWf
	 36HgQTGnVtBq7cl3hHhrsxcBHd/tRvWDTLgZsh1xpa8s2tZX7Frrr0gNwrKmrCobBG
	 +wZN6ox+DTuiaSeeYiCfE+pxgxNJeYWtABUiyplaJ1QqM7J+PejvgIp0wZ2/JQT1k3
	 AlJCtBZPZIuEw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 11:40:47 +0100
Message-Id: <DFVWLIUK193C.EAXZYN4JKZVH@kernel.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: dma: allow drivers to tune max segment size
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <aliceryhl@google.com>, <robin.murphy@arm.com>, <a.hindborg@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
References: <20260123101832.3136897-1-beata.michalska@arm.com>
In-Reply-To: <20260123101832.3136897-1-beata.michalska@arm.com>

On Fri Jan 23, 2026 at 11:18 AM CET, Beata Michalska wrote:
> +    /// Set the maximum size of a single DMA segment the device may requ=
est.
> +    ///
> +    /// This method is usually called once from `probe()` as soon as the=
 device capabilities are
> +    /// known.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This method must not be called if there are any in-flight DMA al=
location
> +    /// or mapping operations.

Yes, unfortunately it has the same requirements as the DMA mask setters.

For consistency, can you please use the exact same safety requirement text =
as
the other methods?

> +    unsafe fn dma_set_max_seg_size(&self, size: u32) {
> +        // SAFETY:
> +        // - By the type invariant of `device::Device`, `self.as_ref().a=
s_raw()` is valid.
> +        // - The safety requirement of this function guarantees that the=
re are no concurrent calls
> +        //   to DMA allocation and mapping operations relying on this pa=
rameter.
> +        unsafe { bindings::dma_set_max_seg_size(self.as_ref().as_raw(), =
size) }
> +    }
>  }
> =20
>  /// A DMA mask that holds a bitmask with the lowest `n` bits set.
> --=20
> 2.25.1

