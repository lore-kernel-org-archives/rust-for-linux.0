Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2B3A7853;
	Fri, 10 Apr 2026 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827226; cv=none; b=LVtEAzItBWJKYXKXTnv9WMWUeeXjETeuIG2zdSoOzkQUfHU/gHXZYmRl3w9r6mDBZnCsu6dvXgSUF0+DQ8dJa022NFwfXSxEGOAxWw1yDwfYaLb3J0qDSCA4px9BmJazorQLmdqWJ5jthnVYLdhuW+d4/sSNiS2POAGKogEoFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827226; c=relaxed/simple;
	bh=fCEWOE3XOjevu0MNXXpGYVlZfcY9asqaaMJGL5LfMO0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5wt71pYM2Wb5qldjje5Jr3ntxQZzaC4L2XDwzfKEvFU/uGj8HRunMk0qvW5Hs6ymcQ+y4J1JLeM0Y5dCpmtvrxq1Uz0A1vHOGFZ71bcBDriqb0Ep4EGIyKfbSjqUWpngdlDTtjBGjAcZSstWkj39xvOC+0A6ObTBGJXvkCagLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dIq8U5H3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dIq8U5H3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775827221;
	bh=fCEWOE3XOjevu0MNXXpGYVlZfcY9asqaaMJGL5LfMO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dIq8U5H3nPVa7mhyeur4OILB5iPPHKepKklQTmDHuutRwIDlN+9ymNYBJtxa+Gmih
	 QQA+zqtFpKZLUKT+vnxqaZz+1jOyYuhSQcZEw/tk8uMSkkQ2iwVUB++vJe9QFU7yJi
	 dqlXSqrw9zqiEdGi0vTnUFXXlRwOEs7omNJ2BE1//KC4aAzWHsG9uzuXuhozXMB1Jk
	 pB8qqA6tTzuLLXWEPUJQcAObdmkZcDYXQ2+Ph7flmDr4f5ekckcPwE4hfZbKeXIQSB
	 c1JtbvrToZZ2bDo/Ej28NzqiwEeUPMEWwSyTpOj47N3ENMK7lzjNT4QmPX3UfL6k3j
	 pkKKbzqsmVBmg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1875017E09AC;
	Fri, 10 Apr 2026 15:20:21 +0200 (CEST)
Date: Fri, 10 Apr 2026 15:20:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Onur =?UTF-8?B?w5Z6a2Fu?=
 <work@onurozkan.dev>, linux-kernel@vger.kernel.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Deborah Brouwer
 <deborah.brouwer@collabora.com>
Subject: Re: [PATCH v1 RESEND 4/4] drm/tyr: add GPU reset handling
Message-ID: <20260410152017.62644c9d@fedora>
In-Reply-To: <8AB77A5D-54F7-4AC5-A2C0-33498D532E32@collabora.com>
References: <20260313091646.16938-1-work@onurozkan.dev>
	<20260313091646.16938-5-work@onurozkan.dev>
	<20260319120828.52736966@fedora>
	<9876893D-F3B4-4CA4-8858-473B6FB8E7EB@collabora.com>
	<20260409114133.43134-1-work@onurozkan.dev>
	<395ED15F-3BC1-48C0-BE36-AF3A951E464D@collabora.com>
	<aditNn-iQc3QXRfK@google.com>
	<8AB77A5D-54F7-4AC5-A2C0-33498D532E32@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Apr 2026 10:00:56 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> >=20
> > When you begin using the hardware, you start an srcu critical region and
> > read the counter. If the counter has the sentinel value, you know the
> > hardware is resetting and you fail. Otherwise you record the couter and
> > proceed.
> >=20
> > If at any point you release the srcu critical region and want to
> > re-acquire it to continue the same ongoing work, then you must ensure
> > that the counter still has the same value. This ensures that if the GPU
> > is reset, then even if the reset has finished by the time you come back,
> > you still fail because the counter has changed. =20
>=20
> We don't want to "come back=E2=80=9D, anything that is in-flight must com=
plete, i.e.:
> the reset logic must wait for in-flight jobs, because the work has alread=
y been
> dispatched to the hardware.

I assume you meant s/in-flight jobs/in-flight works/, because the whole
point of a reset is to recover for in-flight GPU jobs that hanged the
GPU, so if you have to wait for them to land, you're screwed :P.
