Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A621C9ED
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508126; cv=none; b=OWlnEAMj8Wbkruj97mAdQGsSpLby/EXbbb6rbIBsPeT/GksWFBR8PF+w1EyrW6dkknxynzGa+LAjybEraeZk1m6ENfm2DSQu2Mjvu9NkYhS6vHpHUNJatWax+wh9TXx29CiwDha2njhgxdfKHuUzjf0S9VnYhHQpthr14NZKkKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508126; c=relaxed/simple;
	bh=vQEUHahmE0RxJxd8mlAyGEQmkYgLlkG5wCTawhk/mTw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObGaZAsPZ7yVUAL7tWLklRLfc7jj1v3QdFWXtXZ4uchh3EQYr0IVG+oC/G5MoU+Kdl9HPY4uXsL9zUpp7Yxb5bzcxDMe3+tVi9eILTkDbPW6A5/7KcC5HloxOTRogSMPR9OCfK+cM33dusoUkTvzDdF25+bsQEKWiSWvQsWlvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=URG6vgEZ; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="URG6vgEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742508115; x=1742767315;
	bh=xpd6RshpBAJVZpyxgIcYL8YR6vfst5k2rURA4gA6WZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=URG6vgEZFLa8bXIuVYXU+FMShpx8r/iylIz2qTOMJoaNTM2kF7kbGlkhKh3ZTR9Yx
	 CAn1UbozCaY6ximNkCdnilb2Xm8KxzP+VHVa/K0TFttnc8BJV7uIVfTWnbDr/P0JJ4
	 2DEIpa3J5uySuALLLM6zBmQ3Hki8Y5BeOQiE3FDzy0yhL/nmcxdI62BkkCyNZHZVgV
	 8L7rW7fOSbyKlyoUIBNL1BFeqAYX0bFJD0BXztf6BUW1OMfacoQa6fhA+nPetIhMP/
	 QIUVBq4F3+kn2VbpO0hmoDBjs78dP/U36hMv24aKHZLfVZHibZZCvr7ie81xGmHQGi
	 EXJpLsOudW0Lg==
Date: Thu, 20 Mar 2025 22:01:50 +0000
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] rust: alloc: add Vec::clear
Message-ID: <D8LFKL7HM8YI.1U8GEUV34YMP6@proton.me>
In-Reply-To: <20250320-vec-methods-v1-1-7dff5cf25fe8@google.com>
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com> <20250320-vec-methods-v1-1-7dff5cf25fe8@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 88b65252f2b1a6763b2f590f63fd6c46dc4b9eb8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 20, 2025 at 2:52 PM CET, Alice Ryhl wrote:
> Our custom Vec type is missing the stdlib method `clear`, thus add it.
> It will be used in the miscdevice sample.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index eb6d40a1bf8ba45126bd47f1dd4a7b7ef86112c4..95e752ed27395fce72d372976=
b74fb1b0e957194 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -395,6 +395,26 @@ pub fn into_raw_parts(self) -> (*mut T, usize, usize=
) {
>          (ptr, len, capacity)
>      }
> =20
> +    /// Clears the vector, removing all values.
> +    ///
> +    /// Note that this method has no effect on the allocated capacity
> +    /// of the vector.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v =3D kernel::kvec![1, 2, 3]?;
> +    ///
> +    /// v.clear();
> +    ///
> +    /// assert!(v.is_empty());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn clear(&mut self) {
> +        self.truncate(0);
> +    }
> +
>      /// Ensures that the capacity exceeds the length by at least `additi=
onal` elements.
>      ///
>      /// # Examples


