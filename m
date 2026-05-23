Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAC2F872
	for <rust-for-linux@vger.kernel.org>; Sat, 23 May 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779519153; cv=none; b=K9HAOtHLWmmbyybd53aXwg/JXC3Szmc3tjr6Tk7DdF5r5szk/nkBR+YquacU0eTHxMSxtpKqKlg6iLaiB7Yy5nnTIeqbZLmnzpXlB5nbh8KHumUWbpqSvPRZFBIYcs0ezBNDosq3hxzHZvHQTj2Z6T471zEGWBuNNcU2hoTuyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779519153; c=relaxed/simple;
	bh=ac/wpCq1ZmUr+BKEHn1/PefiIR9BWM3rBG8cmM/IpbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E4Zs50KItBvii7EylQIjx/FSPLFwWOVJRf/+pLE5CTV0zn6oe0pKerIBccsCsXesk55tweLihrmlyEUQcHjZ4p8FbRC/HqQfAhDtQ65KGytHhrrhE53NpAmHWTiuSWz2cs2j22l8HmfyIJcwq3rUYkQFA2s1YUHfIzZjy2OldIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Mz+uBYlj; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Mz+uBYlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779519142; x=1779778342;
	bh=yIQhj3xMRa7Eg/cjdO9hK3M8JaIEiYbUDn2coKSqD2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Mz+uBYljQbwMvHLfPRFfwZEjUfRWbio0e1OagSmRkW1FMC3FjHMhrXbR03gUTi6Fd
	 7oEyAjnn1hkOaBkhY3GEvOOTf6YjcU2wGzQuoSOGILmyDfbkC7XN+zDvAT+TEAsIKC
	 wnWSVlmwgwfSQOUDClWrIfGEIUfMcH3wsf9eUtpALgeWUA6tq9G7t32tW5QP794DEL
	 UMzbFRZEwznbcSlIVoovEMDpvoacU0uSB48mTSF/h0yuPWf1uUv6N8iXMjTQoLCVrm
	 YGvxmrZMEAo6itBbKY1EOtWY4NWjoZPi3dXdsZggMU4A1ibKNdim9zVFpt1ojmIh5h
	 G0qie9/8ICTAA==
X-Pm-Submission-Id: 4gMt9s3jjnz2Scd5
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org
Subject: Re: [PATCH v1] rust: workqueue: add cancel_sync support
Date: Sat, 23 May 2026 09:52:12 +0300
Message-ID: <20260523065215.23709-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DIP8F1CLYQ27.11XC6BW3Y3WGP@kernel.org>
References: <20260510082211.207450-1-work@onurozkan.dev> <DIP8F1CLYQ27.11XC6BW3Y3WGP@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 22 May 2026 15:15:48 +0200=0D
Danilo Krummrich <dakr@kernel.org> wrote:=0D
=0D
> On Sun May 10, 2026 at 10:21 AM CEST, Onur =C3=96zkan wrote:=0D
> > Drivers can use this during teardown to cancel pending work and wait fo=
r=0D
> > running work to finish before dropping related resources.=0D
> =0D
> If you need this for driver teardown and the work uses device resources, =
you=0D
> should rather create a new type of work that internally synchronizes with=
 driver=0D
> unbind.=0D
> =0D
> This also allows you to provide a &Device<Bound> within the work function=
 itself=0D
> directly.=0D
> =0D
> Instead you now have to fall back to unsafe code in your work callback=0D
> implementation making it a driver responsibility to call cancel_sync() at=
 the=0D
> correct point of time:=0D
> =0D
> 	// SAFETY: `Controller` is part of driver-private data and only exists=0D
> 	// while the platform device is bound.=0D
> 	let pdev =3D unsafe { self.pdev.as_ref().as_bound() };=0D
> =0D
> I already mentioned this a couple of times in the past that we want "mana=
ged"=0D
> work for drivers for this exact reason.=0D
> =0D
> More in general, please don't use Device::as_bound() from driver code; if=
 it is=0D
> needed it implies a design issue or that we're missing a proper solution.=
=0D
=0D
That makes sense a lot of sense. I will try to figure out a design for this=
.=0D
=0D
- Onur=0D
