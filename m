Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A13F6610
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960587; cv=none; b=TH/jeN6My24lraQCyGNl+iDTjA9p+AgqbWgKIfh9QIiK4vhXfgFrtxn9RqomOfG7bZSw7bIPkZmqAbHuksX+Zf1UhjQk1ZPJx0JdI+rF/To/R4Dohh6t+9cvLIbByoO1sY3QT0ffkQL7eYuplZntTr/Stn4ZjoL7Bw1GU8dxa+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960587; c=relaxed/simple;
	bh=dkkaqcGLvWSZfoZDxfduOF7qJwmV4RarFNiwFjreOAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LPtmDfNwiSpxxtgwSwuVlyyC0ml7/UY+HtFpa+jmS09HZUDdBUu9OlPY+mL0/O8rImKculPddQr0OyB39tF5Lyx6fJcRljYIqXxbOVWdKtO13N//3Un+hA3atL5EZgGbzUNIRIr7D7aEKa6LgWuH+SiSO/u7YKIqhlbI2zwLCdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=A7K23p4Y; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="A7K23p4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786960565; x=1787219765;
	bh=A8ktogQf7AtsPoaY6gPeApMYeVjGGWHj2BvB/oVYIYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A7K23p4YffWAvsZyqnCKng8z1fy6Kda58NwgqodzwSfMk+s+WrlfM8xUCVTNJxFMq
	 Z9XOTRwZMkJuPngVfC77gUhoqiWHL2FVgSiriu6W+64MS+3SJauBGq7OJv3wUeGlMj
	 Bt73QHKl609YzVYV09DcscFrVx9mDtdlrnJwA8G3N+qrP3UbIHiLuD7xV52wb3OrGS
	 /9OoFY1xHflUOe/Ir/OWFUydgZdQ1wdCNQlSOmYSJKPS9rTgZDc1Ni1GCaxIK0fTgw
	 vhi4E3CVREI+LADVY28qFxtXXu16TaoQ3d2RsseL3+sQZbmfyQlQq8NFov/seWjC8r
	 v9dFUfkM1KGbw==
X-Pm-Submission-Id: 4hNpBB2pGTz1DFFG
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v4 3/4] drm/tyr: add GPU reset infrastructure
Date: Mon, 17 Aug 2026 12:55:58 +0300
Message-ID: <20260817095600.71817-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DKPHGNOPN7PT.2HF3KUPO3VM79@kernel.org>
References: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev> <20260815-tyr-reset-impl-v4-3-578df9a5e576@onurozkan.dev> <DKPHGNOPN7PT.2HF3KUPO3VM79@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 15 Aug 2026 13:33:01 +0200=0D
Danilo Krummrich <dakr@kernel.org> wrote:=0D
=0D
> On Sat Aug 15, 2026 at 12:23 PM CEST, Onur =C3=96zkan wrote:=0D
> > +#[pin_data]=0D
> > +struct Controller<'bound> {=0D
> =0D
> Please only use the lifetime name 'bound for bus device private data (whi=
ch=0D
> defines the 'bound lifetime). Everything within is shorter lived and shou=
ld=0D
> carry a different name (see also [1]).=0D
> =0D
> I'd suggest 'ctrl or just 'a, once you have self-referencial fields 'ctrl=
 (or=0D
> similar) is preferred.=0D
> =0D
> [1] https://lore.kernel.org/all/DKAINVQDNE79.3JRKZDQJCSX9@kernel.org/=0D
> =0D
=0D
Noted, thanks.=0D
=0D
> > +    fn reset_work(self: &Arc<Self>) {=0D
> > +        if !self.try_transition(ResetState::Pending, ResetState::InPro=
gress) {=0D
> > +            return;=0D
> > +        }=0D
> > +=0D
> > +        dev_info!(self.pdev, "Starting GPU reset.\n");=0D
> =0D
> Please use dev_dbg!().=0D
> =0D
> > +        // Wait for current hardware accesses to finish before resetti=
ng.=0D
> > +        let reset_guard =3D self.hw.close();=0D
> > +        let reset_result =3D run_reset(self.pdev.as_ref(), &self.iomem=
);=0D
> > +        drop(reset_guard);=0D
> > +=0D
> > +        if let Err(e) =3D reset_result {=0D
> > +            dev_err!(self.pdev, "GPU reset failed: {:?}\n", e);=0D
> > +=0D
> > +            // TODO: Unplug the GPU.=0D
> > +            // There is no API for unplugging the GPU and this is unre=
achable=0D
> > +            // for now since there are no hardware users for reset API=
.=0D
> > +        } else {=0D
> > +            dev_info!(self.pdev, "GPU reset completed.\n");=0D
> =0D
> Same here.=0D
> =0D
> > +        }=0D
> > +=0D
> > +        let _ =3D self.try_transition(ResetState::InProgress, ResetSta=
te::Idle);=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +/// User-facing handle for scheduling resets.=0D
> > +///=0D
> > +/// Dropping the handle drains any queued or in-flight reset work befo=
re the=0D
> > +/// [`ScopedQueue`] and the clock and regulator resources are released=
.=0D
> > +pub(crate) struct ResetHandle<'bound> {=0D
> =0D
> Same as above 'reset or just 'a.=0D
> =0D
> > +    controller: Arc<Controller<'bound>>,=0D
> =0D
> This can just be ScopedWork<Controller<'a>>; no extra reference count and=
=0D
> allocation needed, as the constructor gives you an impl PinInit.=0D
> =0D
> It also gets you rid of the open-coded cancel_sync() call in the destruct=
or of=0D
> ResetHandle.=0D
=0D
Yeah I am aware that (you already said that couple times in weekly calls),=
=0D
I am just being a bit lazy on this, sorry :/. I will cover this in v6.=0D
=0D
> =0D
> Also note that [2] already has Send + Sync for OwnedQueue when OwnedQueue=
 is=0D
> introduced, so you can drop patch 1 of this series.=0D
=0D
Okay, I will pull your series and drop this patch along with ScopedQueue an=
d=0D
OwnedQueue as they are already included in your series.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Thanks,=0D
> Danilo=0D
> =0D
> [2] https://lore.kernel.org/all/20260807165252.3849875-1-dakr@kernel.org/=
=0D
