Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD677257854;
	Sat, 15 Aug 2026 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793587; cv=none; b=FOeWd4qwHx+xgEL4lbL0KPy8KGyygmEkomM2R+149M4omua9WdXAN/Y5DVqVn7iPMRaDsnGikwJNE7nGWszPSYBcz2O+Bq7LgCYajHPP6s9cOdQPfTNzGVC8It+TF+IWHaIvifCvnU432e9opH43GutCAmezeBuk11ebhHKujjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793587; c=relaxed/simple;
	bh=qvfHDrcAcFpDcy1Kung/C6oABicCTJf7A9TiT8WTMOE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dDVw7B1DVKNzqwGpsQafpdVFETfMa9L/yJMJB/vM4zFcXM/7nJt5gLFb7uILUnHoyAPzVz8/L3wzV0J8QwlpWBiD62ADUrr3USOyNFM30uYgnYafDJwMYudIkP6Z9C/fZNqf3ow6NH1bt15GdgTb25hHzV5ADvQa/O/vqmwy81A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mL9BWLcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mL9BWLcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8E31F000E9;
	Sat, 15 Aug 2026 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786793586;
	bh=Uatdy+zH9EboeEXWcuokGMv/6bFcMMJ3Su9Y3rxZ7tU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=mL9BWLclHTwq66p36QQFF88JHzZX07fwnyueNWTPSTd+kJmLwEGSIbJbMcv6v8pEn
	 NLHNE8Dhi03Jf1k7rmy6SmKS5OoFMrKEd2g60Fr3U44Q/2HPXFEOWJTqIaO7M/06eM
	 FbGCtcucjNWTctcx7N9REpyuvYp8Se850f9ZHRN/eEEhJsyCKy6KyzhFRDkoYdpdvT
	 UxkHf/ExGmmRksVA7WrH09KO8xf5DJOC1noBzPtc+MgqlDbh3NBGTj1hNbzcP328cD
	 aTc4hDiKAo3MmZ7DmuiJxXeE5XrczntGga4UvPbdFUZn7I5itlqjXfmHjjWA38lA0m
	 umBNMzU2+Nakg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 13:33:01 +0200
Message-Id: <DKPHGNOPN7PT.2HF3KUPO3VM79@kernel.org>
Subject: Re: [PATCH v4 3/4] drm/tyr: add GPU reset infrastructure
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev>
 <20260815-tyr-reset-impl-v4-3-578df9a5e576@onurozkan.dev>
In-Reply-To: <20260815-tyr-reset-impl-v4-3-578df9a5e576@onurozkan.dev>

On Sat Aug 15, 2026 at 12:23 PM CEST, Onur =C3=96zkan wrote:
> +#[pin_data]
> +struct Controller<'bound> {

Please only use the lifetime name 'bound for bus device private data (which
defines the 'bound lifetime). Everything within is shorter lived and should
carry a different name (see also [1]).

I'd suggest 'ctrl or just 'a, once you have self-referencial fields 'ctrl (=
or
similar) is preferred.

[1] https://lore.kernel.org/all/DKAINVQDNE79.3JRKZDQJCSX9@kernel.org/

> +    fn reset_work(self: &Arc<Self>) {
> +        if !self.try_transition(ResetState::Pending, ResetState::InProgr=
ess) {
> +            return;
> +        }
> +
> +        dev_info!(self.pdev, "Starting GPU reset.\n");

Please use dev_dbg!().

> +        // Wait for current hardware accesses to finish before resetting=
.
> +        let reset_guard =3D self.hw.close();
> +        let reset_result =3D run_reset(self.pdev.as_ref(), &self.iomem);
> +        drop(reset_guard);
> +
> +        if let Err(e) =3D reset_result {
> +            dev_err!(self.pdev, "GPU reset failed: {:?}\n", e);
> +
> +            // TODO: Unplug the GPU.
> +            // There is no API for unplugging the GPU and this is unreac=
hable
> +            // for now since there are no hardware users for reset API.
> +        } else {
> +            dev_info!(self.pdev, "GPU reset completed.\n");

Same here.

> +        }
> +
> +        let _ =3D self.try_transition(ResetState::InProgress, ResetState=
::Idle);
> +    }
> +}
> +
> +/// User-facing handle for scheduling resets.
> +///
> +/// Dropping the handle drains any queued or in-flight reset work before=
 the
> +/// [`ScopedQueue`] and the clock and regulator resources are released.
> +pub(crate) struct ResetHandle<'bound> {

Same as above 'reset or just 'a.

> +    controller: Arc<Controller<'bound>>,

This can just be ScopedWork<Controller<'a>>; no extra reference count and
allocation needed, as the constructor gives you an impl PinInit.

It also gets you rid of the open-coded cancel_sync() call in the destructor=
 of
ResetHandle.

Also note that [2] already has Send + Sync for OwnedQueue when OwnedQueue i=
s
introduced, so you can drop patch 1 of this series.

Thanks,
Danilo

[2] https://lore.kernel.org/all/20260807165252.3849875-1-dakr@kernel.org/
