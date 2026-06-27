Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240662701B6
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562235; cv=none; b=WGx/f8uFavLBXj1XJuK02tZaDvsiVKQVxSW5Y8+lrAFF3vKBsOGNRdnVOkcyJeaiRh1Rg1kjtNlwoMkNu4VHkYon30WsENz1DeIaF3wiqLn6sLUrsell2WMZbwMtrgW5o7xq/tw0vmExAEjMt62aMKvloOu0F3b4SZKxPL8XFqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562235; c=relaxed/simple;
	bh=5crsUmDaCmZkydMP6yQuUOmiEbNDQy/Qc83jiLa+icA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dt410HhOnKYcpEHXum2Ecv40l/2pH8Cn8GDsLptJDQOL083clYEbo0WVrs3jbGQKdwHhu19WMZ7g9dPNgenILqvz/0pcaJVaiV2eIqSXjbkJDpSZ7II9Djawlgc1SwZeBAu/eUh8GmxJftgFKwAIV5H1CaJZvl9XYZN+GpiPWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I+hGTZTn; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="I+hGTZTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1782562222; x=1782821422;
	bh=5crsUmDaCmZkydMP6yQuUOmiEbNDQy/Qc83jiLa+icA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I+hGTZTn+VQzrufL+LnRFkm3FL39UKSQFBHYlrcwbsqDa7aWJ//ltpEL8ExezQ0nJ
	 7UVqIOM2YtX6kuc9jh7cSStpTi3fDuKj0Dut7t1S4L44ceOwEgVXa2wNmg+zwtAz4l
	 8RvxxNZBLWxb27MqTTlGqSUA/XzArMZoWudr+2CG5yd4N80mJhuCIzci5olVEvaTXf
	 Byc3tueoa6kpaDIRVZqTiZtZ3w686jLoyesDTWQ8at/R4ujIrwhfzFVZaG3l9YsTDv
	 PjFRxfHH0CDyktd/CFZ9DnwLK/QUxCmFd2JIGiVw4XcMaTxmhTZMQWmfDh/oyR+lgG
	 JhOzcFjm8DI0w==
Date: Sat, 27 Jun 2026 12:10:17 +0000
To: Trevor Chan <trev@trevrosa.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: aref: make `AlwaysRefCounted::inc_ref` an associated function
Message-ID: <20260627121014.796896-1-lnsdev@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 3c2de57e73ee1b038714c00440723087f90935af
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Trevor,

Are you still planning a v4 of this? It went quiet after the v3 review, and
the patch no longer applies to current rust-next: the aref.rs imports were
reorganized, AlwaysRefCounted moved from crate::types to sync::aref, and
several new implementors have landed that the conversion needs to cover
(i2c, usb, pwm, drm/gpuvm).

If you'd rather not carry it further, I'm glad to take it over: rebase onto
rust-next, convert the new implementors, fold in the v3 feedback (the doc
note, with "accidentally" rather than "lightly"), and re-confirm the Acks.
I'd keep you as the author via From:, with myself as Co-developed-by.

Either way is fine. Just let me know if you'd prefer to send v4 yourself.

Thanks,
Lorenzo

