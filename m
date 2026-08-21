Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB03BFE40;
	Fri, 21 Aug 2026 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330434; cv=pass; b=OPYWQzGVxTb2S6lH6eXjM31XGqUEZlJQKAcEhXdAIA8HyI5JItdzMCgKxBulLMz1qHAKJNpXHVxeQ5AjCZw0splSegFeMufpmcdIt/h2+8m9G0ExNr9Y7y1mqxmihUrPYhrPhBk1wYGw4uqYNXCu6HM3LwIY0Q0K8NzTGfUD/U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330434; c=relaxed/simple;
	bh=dR96hHw6hQinUkJ/ZIAEEyz3/CZ3FTrnbd27l/YIuFk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Cx81OuZZFD3zBSVyIrEaTIoxoUbn2QYlbQ+bLGp46z4WPUmZJtMiFydvEeJtnDniqP6aleZaMBYJqqZ0NF7ad5FSCt/zXXD9kNedMs5DgcUe70yvBnRQJRJ7r14ykUKbVvPV97h8SGcu+galSD6a6BwdV655wYhM7OQ97s9MVGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=DAgAMdvu; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DAgAMdvu"
ARC-Seal: i=1; a=rsa-sha256; t=1787330415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TmNZk33grmU1e6ZJjqH0tkmrQ37PYDcYIOoN+tFxxKVIHB2nkPu2+zVmihBvMbxqROoDGSr9BJJYA11qB9Z6BaLFgP5h+pnqqokc7i8pvrqXR/tQaCu1crppn79dnNnlFOGHZXbd1KkTMVMr0qqEk/sSfb5ytAxxRwXL4kNeY7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787330415; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dR96hHw6hQinUkJ/ZIAEEyz3/CZ3FTrnbd27l/YIuFk=; 
	b=OcYz8cL/4XLTNMRJo+SdH4sAplrZ10qQzRecovVd+hrXbLJjOHalNc4n2sFxdMFGRMZdPgLfpMEDds5h1YTzhARlRuAXUDRkR/ejJDCr9Cth7zZbQGRKsgUg3AC6tESA7z5hvK6Q4duxKZeB6wqklGqz/ItUHNnn1yjDYOjCfiI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787330415;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=dR96hHw6hQinUkJ/ZIAEEyz3/CZ3FTrnbd27l/YIuFk=;
	b=DAgAMdvuUMY0rvDZal+RWTphbBnY3wRptdjnuphymi97eAo6NpxkHhuWt6vAEo9P
	A+29x6BwzcqAV/hKG/M1jA257Qc2Z28ol/6nnFYlqHBB9SR1qW1iyp9/12nflFgrbes
	U6VUf2fnPPq0uxYPMY+O1QilykA1lhGsgD1FcZVw=
Received: by mx.zohomail.com with SMTPS id 1787330403695608.4617870321086;
	Fri, 21 Aug 2026 09:40:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260821155814.980146-1-work@onurozkan.dev>
Date: Fri, 21 Aug 2026 13:39:45 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
 aliceryhl@google.com,
 airlied@gmail.com,
 simona@ffwll.ch,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <2AD43D0D-2B01-47E3-AACB-32032B3358C9@collabora.com>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
 <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev>
 <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com>
 <20260821155814.980146-1-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 21 Aug 2026, at 12:58, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> On Fri, 21 Aug 2026 12:31:03 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>> Hi Onur,
>>=20
>>> On 19 Aug 2026, at 15:45, Onur =C3=96zkan <work@onurozkan.dev> =
wrote:
>>>=20
>>> Add support for scheduling GPU resets on a dedicated workqueue. =
Track
>>> the reset state to avoid queueing another reset while one is already
>>> pending or in progress.
>>>=20
>>> Use an SRCU based gate with mutex-protected reader admission to =
block
>>> hardware accesses while reset work runs and wait for current users
>>> before resetting.
>>>=20
>>> Stop new reset requests during teardown and drain any queued or =
running
>>> reset work before releasing the device resources.
>>>=20
>>> This is the initial reset infrastructure only. It is not wired to a =
reset
>>> source yet as those will follow in separate work.
>>>=20
>>> Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/28
>>> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
>>=20
>> I=E2=80=99d use dev_info instead, I don=E2=80=99t think a reset =
belongs in dev_dbg.
>=20
> It was dev_dbg initially, Danillo said otherwise and I changed it. I =
have no
> strong feeling on both.
>=20

You mean it was dev_info initially?

> Does it deserve a new version to switch back into dev_dbg again? I =
think we can
> easily switch that when pulling this series.

My point is that resetting the GPU should not be a =E2=80=9Cdebug=E2=80=9D=
 trace, but rather something
that should hit dmesg unconditionally. Of all things that are printed on =
a driver, a=20
=E2=80=9Chey the GPU is being reset because something crashed=E2=80=9D =
is something that should
always show up IMHO.

I don=E2=80=99t think you need to send a new version though, let=E2=80=99s=
 wait for more feedback
as well.


=E2=80=94 Daniel

