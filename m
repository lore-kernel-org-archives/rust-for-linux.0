Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F83242D6A;
	Mon, 14 Jul 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752490317; cv=none; b=WqzfQN3224iaRSsfAIpGK8qMkwuuSCXyAud4W5Nr611J2Xf54uOFOUhs1/9oxMvqD6wYB5XvOTrF84MpX5U/E9E+i8so3WlwOeutcJcRkiB+/shaHOBdIKHnHiPUM5NeFHQXhdFYLYEFXF3bwJ2YdFsjR2B9MxCM5K7pVXUURWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752490317; c=relaxed/simple;
	bh=NzSjl/05WZKp/TIPLA6jzybk7hA5tSKg1rNVsJpc5ek=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OiBrZ0ocK5iCBnVMazN7GeMVYXnat0mqV44GQq3rJ/4ub+/oEc5BYjxzHfBZ+hUxaWXu8oWelpSy9tN4Ft1V6HbH6QLND3xKHXc2UGQ8XZkxXKabmNou9X/frNrBTD4TYQXYH/DjHYQQHChrjwf675NtV2aRllBHcv/Qa3mo5KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayNdhBb6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayNdhBb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD5CC4CEED;
	Mon, 14 Jul 2025 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752490316;
	bh=NzSjl/05WZKp/TIPLA6jzybk7hA5tSKg1rNVsJpc5ek=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ayNdhBb6LyhPo3Ji0W92NfYmQ1myKEXwccEkSPhK/UvrRQXG4a0uoLsz1i2bwCP1Z
	 uj//FhekwOZHW8o7fCIKbfU9m/rWcaOgG+6+dOiaH/Ei+X9n2h/4uGGz8Jld7n1sli
	 kGMpM52lE6KIwUqY8Y5dWuzwauj+jnW2vQ+KQedJxHv/6aV/EIqACi72qlOWI5DCMc
	 k4W8CYiQOd4oNULFF/L3FiV40p8kZtjJMvMVSU8cBMg5XKK+fxBIfbNR6Tr1lknZHj
	 rMfN9M5X1Zz/LSRlHU9zkPQftdkdv1PFa1BLpBMO6fGjocTbrLEqn4OmQtwyBEeUVy
	 5TFRZ2FzQZZ2g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 12:51:52 +0200
Message-Id: <DBBPYV1YV97X.OT2SPH3R67RS@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
From: "Benno Lossin" <lossin@kernel.org>
To: "Rhys Lloyd" <krakow20@gmail.com>, <acourbot@nvidia.com>,
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250714104322.100511-1-krakow20@gmail.com>
In-Reply-To: <20250714104322.100511-1-krakow20@gmail.com>

On Mon Jul 14, 2025 at 12:43 PM CEST, Rhys Lloyd wrote:
> +
> +    /// Construct a u32 from `self.data`.
> +    fn get_data(&self) -> u32 {

Getters in Rust usually don't start with `get_`. Using `data(&self)`
here also looks better IMO.

---
Cheers,
Benno

> +        u32::from_le_bytes(self.data)
> +    }
>  }
