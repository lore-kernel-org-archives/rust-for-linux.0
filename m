Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7649322C88
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098719; cv=none; b=siAgbccOpSTzpzMeIvyFWuBbxyVSaqj320jR100rUy8aKLoTOun5fKhYE/i461KGXF6h9ZxoU6+JEq46q2tdR05h/wVtwo9dxaZhniZK6YUHXPs5j1ban/oEBIYudSpra7NjKHmlUN4drb1Z/ANdA5h6gbQOVCHngqPPXAapUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098719; c=relaxed/simple;
	bh=i2aIZ6HHoh9emV6oe4Zqm6Z2If07cFKM2HT1GSWRds8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uwGsLhjrpTkTZQHTNP6/4uKL653Eu9QROkfUTP7UzlYFdXRY9onKTMtn1D/FjiVCKQ03HA70i5XrDgUPxXQAN35FEcvwhoOdUMFhje3T5L6jxngGIllRbKmdbyU+IHixNn+oF/Kgzl0cD1lx+SoMCq+/FnAI0qH7PX2nuh63L/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLdcAfyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLdcAfyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD3A1F000E9;
	Wed, 15 Jul 2026 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784098718;
	bh=i2aIZ6HHoh9emV6oe4Zqm6Z2If07cFKM2HT1GSWRds8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MLdcAfyKnAE3SAi5wmIEiWP7Sp7i1zlvnKGoK1/Bi5sGCXhFdUMIzdqzAaoomapnU
	 ip1niHM7kw40JpbtObBWJNxHbXAa2tIBbCN5/pz2VERAeymrGYaa3PS+Dwp8y2aAVH
	 RJyJLEogwZVPgZ/rvmsxKogHLPT+OBp4oHUzYV9R5sh4LYDmy8vtRx2bdVoHo7TVRK
	 EY2xgfmLlwFZGjNIOD03B+3RHwBHt7a7/BDFa+xSnI48EAEAszeusvUYashsE+t3sV
	 Fb+q+D68/ICjzr//e0iaQuzaV9kZLkMuhPcqJSO6xGgehirgGb6vTOMdUq1cwslYPe
	 /EHZVVjTfc2aQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 4/4] rust: time: remove unused Jiffies/Msecs helpers
In-Reply-To: <20260712235246.3069713-5-tomo@flapping.org>
References: <20260712235246.3069713-1-tomo@flapping.org>
 <zL4MkF_kH3qTGLKUQn6XlIaUVqm4Hacn2nRrY_O3NuL-Wg0NO2xhQ_y6yycYrvR28LA974IQ5fPyDOOJgRKBGg==@protonmail.internalid>
 <20260712235246.3069713-5-tomo@flapping.org>
Date: Wed, 15 Jul 2026 08:58:17 +0200
Message-ID: <87fr1khh86.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> CondVar's wait_interruptible_timeout() and workqueue's
> enqueue_delayed() have both moved from raw jiffies counts to Delta, so
> nothing in the tree calls msecs_to_jiffies() or uses the Jiffies and
> Msecs aliases anymore.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



