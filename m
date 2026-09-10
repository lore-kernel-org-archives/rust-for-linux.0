Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA085947FB
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066821; cv=none; b=dD378XAJYAHw/5BjFpOdvbX7//NFBBbotPR6k3k9aZqHsAm2yZ5e0hpr4w5bhgWLxHKPZ8Bj8fBAQ7CoDYZfENK9885I7wriDiGAGlSdWgCiPINvQR1VDFPaezkA2Obx0Tc+87ggNb45rgVnBvXNaL7Vf4dpj+xW4o3ETn4vfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066821; c=relaxed/simple;
	bh=0vvZwREGhVLOGIz6V7/e3vYEdb98WjrdXPg4bmpdzmM=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=BoTo2R/Jh+TMGhnrN27aPdNHH4ZDrcH0x+j7CxR2DiX0FZGyFBaIl6o7gQc8Ec/fAXpzKECfzww25N18sAlCK0AdroUzsVv7q70s+0B8bMJ9DNtnA8s/EXO2d63nE+o/Vqmvc0m1wLsSGWfHASds6fwofm88TydaEMWc2KX404I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KfUXvnD1; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KfUXvnD1"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5306d609317so1228241cf.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789066817; x=1789671617; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy7q6C+WBEDRAlNlGjV9EVm7qH12BqCcTHIyf0ThSEU=;
        b=KfUXvnD16lizCzF9wvGLcS2je7B/yEqIi9sboIHbA1cMJ+emGPxk+sSiCucig8SpXK
         hYv3/m8+oYneYZlQicJmBZfZBqM6aID/qplSJtPJL/Q5U3GHW6Jat3VX4ypsnLkafnxg
         jkelDKYNQTbL2awAL4/xmSnPGgySwJ9KjipDv/S581d4aW0sNobZQVJuOSw6jvrFwAL8
         5o7orzIu8kaSOUEw3aBSuMIfjcrorTOYzxAO8BmXf1XitD4t4xG8M/O8K6PF+fK4AMWj
         Xsu1ZTknwnfunmzbay0cAuhsVOV4vuGJHIH7F7IH+8otWPTFga7D9poq/fsUmz+gcKrl
         USLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066817; x=1789671617;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uy7q6C+WBEDRAlNlGjV9EVm7qH12BqCcTHIyf0ThSEU=;
        b=Veq3xQJQ5uEvMFbTxnzIuSgrs70c5jF8OeFhkQzNPmSmjkUk1D9s8eRu6AtO6y5DQC
         EDiP1fs3n07z4FGVBI+uUERCymVyLFm+MU91cCHVJndu3YSXVfFH2AICBTIEMmaIHp0d
         MiVOIkDBEFW+5xZ1lKAMM+ZfuKbQqgPpv4khG4NKH4X3QHFklLycz8KgvWl8bOConIY4
         nYg2oqWLTys6G3djgh3un3zdsqL5hnb7pCxrIfsLPo3GUxQa1+MN76UxWfaromCS5Lt3
         BVXvkiOMaGvZbgAPcqYD8pVMsQzmT2ot2SzGQ3ar7vNCifRBBoUMkTuCYsy1qjwyRP1g
         NLsA==
X-Forwarded-Encrypted: i=1; AKwUvBzsX5lmxafactDhejTBINs33Jm0kxCjj7xDxuhaETjsdVzqtPJ+HVk+V72aTjxq/w5yNXl/qCKGNe0dqx6gmA==@vger.kernel.org
X-Gm-Message-State: AFuF++nx1QJ+E27YFyzHRGyAqANMER5Cr8WFGvBgqyM+6ZHw/5L8OeGz
	4H9822GJG67MCfrk9L19kMV8ah3ZYxWfIojJ+59kaYOsew/jg2httuj2Vmag1Auwvg==
X-Gm-Gg: AYBFou1anuoUaM9DXBKFfGpg1gbgYnSkdyUAhMctcZjFfNkGvDUSnkggqrJOntq6HVm
	U1wPx98oUVhv1W1w8YPxp3cJaCK0rPmFmkc/ZnbUi3vDSGtpV9Nu+y+HrGxZEP7aIS3C8tlm5nW
	XN3CAI+0Dyou4tvHdnzMY6IvQJqP6LYyV1DMXogXu/Xp/zQxjwMNXCbs3bAAXSfIPau7T8+lUje
	DHzHBWhXmyO/RaT7i3wrTZaCtvplzGtdeGRjjd5wZ97PhOEJcHm6DTiKjZ94L8W94EgXfs+nBy2
	nbhHGEoRVJEIJInk5fR/7f6Oixu9siwFnArPa8ebfTc99UkYwwIs0S3SlvKiVxVIfhuvp4DLP8s
	NCI0BPOBqy3WiGgrejcORTAUQ1nQp8myoF8Hn9jtps4sXKygFSSr+ZsE/ioDO8Bu3KMIRDiGfyM
	ZiL8pQvyR+p3iBbG6NG/arjQfffA1b+ds1SJBTeVr1iBVSKwP8R6TcUCTp7POvUJpOn3/9w11Xb
	TL+x8KhyQso9QsVM0fvFUNMtCNZZfqe9ryFhWlhj1EAcecBXa36SEowXSHbPFyW6bLJX+ogtywv
	hg==
X-Received: by 2002:a05:622a:514:b0:530:b2e4:91bc with SMTP id d75a77b69052e-530c878ffdamr12092271cf.53.1789066816931;
        Thu, 10 Sep 2026 12:00:16 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca50cd05sm270221cf.29.2026.09.10.12.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:00:16 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:00:15 -0400
Message-ID: <f7363063f6457ebe9eed74f878ec579a@paul-moore.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260909_1743/pstg-lib:20260909_1550/pstg-pwork:20260909_1743
From: Paul Moore <paul@paul-moore.com>
To: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Nils Lehnen <nils.lehnen@proton.me>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with  `pin_init::zeroed`
References: <20260828024335.946-1-nils.lehnen@proton.me>
In-Reply-To: <20260828024335.946-1-nils.lehnen@proton.me>

On Aug 27, 2026 Nils Lehnen <nils.lehnen@proton.me> wrote:
> 
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
> 
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
> 
> Link: https://lore.kernel.org/r/20250814093046.2071971-8-lossin@kernel.org
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Nils Lehnen <nils.lehnen@proton.me>
> Link: https://patch.msgid.link/...
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> ---
> Resend of Benno's patch from the Zeroable series [1]: only patches 1, 2
> and 11 of that series were applied, and the issue [2] asks for the rest
> to be re-sent. Rebased onto rust-next; it applied cleanly, and a
> defconfig build with CONFIG_RUST=y and CONFIG_SECURITY=y passes.
> 
> Two equivalent one-off patches were posted earlier [3][4]; Miguel asked
> in [5] for a resend that keeps Benno's authorship, which this is.
> Cc'ing the LSM list per Paul's request on the original thread.
> 
> [1] https://lore.kernel.org/r/20250814093046.2071971-1-lossin@kernel.org
> [2] https://github.com/Rust-for-Linux/linux/issues/1189
> [3] https://lore.kernel.org/r/20251129135657.36144-1-atharvd440@gmail.com
> [4] https://lore.kernel.org/r/20260120083824.477339-8-sunke@kylinos.cn
> [5] https://lore.kernel.org/r/CANiq72nJqFOR9vhPBfZUNrxU+M1HMV6wN9bN6i8e9rf_oOD2qw@mail.gmail.com
> 
>  rust/kernel/security.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Merged into lsm/dev, thanks everyone!

--
paul-moore.com
