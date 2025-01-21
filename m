Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DD91F2C40;
	Tue, 21 Jan 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464807; cv=none; b=dT1jz/XvPdT7FyBgAqcVOzUz+aBKb/UM45FxFSNC/c+zfyaZKJ0cMFlDsITz6SutrC8dKZjhvqLl0x/Np9WU9LcJFk0C96qtqbhG1XATfiNIDw22OUFLcMVw1F1gOzSbPEEAyv5u6zmX+quh9CO6sqxFXHE0cXs+NZ0GSlGnQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464807; c=relaxed/simple;
	bh=977UXsXAwqSnrnxyAWpchRj0SphRFge5agyUtd5X9ac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hvkVvba938h/MuFmk+YOLsRMmGmGtb+t72G8od7YIzB/aX01AOrdNXxAqb+MZihsr8Cw+OAbCfhWbBqzd1mSnkYEzCLWzdjWF1D//DOwb2vW0I0wtvXNydNyt9/54dna6AFUKMK6ABoDv243W0JGhMGIL1oQLiRIgABRSTbzPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvVoc8FR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvVoc8FR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9598EC4CEDF;
	Tue, 21 Jan 2025 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737464807;
	bh=977UXsXAwqSnrnxyAWpchRj0SphRFge5agyUtd5X9ac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RvVoc8FRD4ahJUcT1Ovd9ZhZ+m5fgslIM9VRVV33x6tnhc1sDwOmy52D3QLQnafpJ
	 Q/0X4SEDS6fmwLtkUN3PRcvf2Do83xBh82lq++891zokHMnP7TGjA5a4eBy5mDEAKX
	 sUsLjfEKRHM5fpVwQnj/HPjVwESnODcu/BRUvVJG5pbWetS6v6iYDHnrx7H5NknH/g
	 vnyUk++TrLIn7taEhSUe2y51s5layO6INtgBipyWX3+JSv5nvCM9pF8wiUWsfVbjWJ
	 kUp99RqjTiJSvTfsu04WY8ksaG2Yir32FwO1oU+dsz4xgsmDwXwsMH12hpvW1SLrOD
	 E4P/svcVoHtvQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: list: extract common code for insertion
In-Reply-To: <20250121-cursor-between-v2-1-1b24cd377618@google.com> (Alice
	Ryhl's message of "Tue, 21 Jan 2025 10:14:23 +0000")
References: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
	<rZ6X9lnlkNmMjl6DpnD6abxyYO_LVDacw7AW84R7T5sbUtxGkyd4fvT5aBTcjCc5YZi0Uj405IEfs-SnI1MzMQ==@protonmail.internalid>
	<20250121-cursor-between-v2-1-1b24cd377618@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 21 Jan 2025 14:04:06 +0100
Message-ID: <87msfkb9o9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> To prepare for a new cursor API that has the ability to insert elements
> into the list, extract the common code needed for this operation into a
> new `insert_inner` method.
>
> Both `push_back` and `push_front` are updated to use the new function.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


