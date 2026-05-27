Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE338C42D
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924677; cv=none; b=ldGg3OYHYMKpsJHqq8T7hoJ546IbQvbOpMmc4L5agomiffvM+ySweFsEDbJqodNtULp6rChWDgfrO1GIPN2vpeeLQuyvOmWdUCc5CS1HlBreiOEwVxRNc5nrHJaMe5oWYParxS/faYYefHrd3YbpAt3Q1nZJV2DWokaZlnt/4sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924677; c=relaxed/simple;
	bh=xz1FlSOocdyDXLIjfUR32CIvtPoh5kNi8+k8C04n7CM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=g1Sa5IP17fFlkQSrIjlnsqBj8MZhxzqNJYPfu7RZodV3OSFaPcPuCXi/pOhvt3+PXhVL9l8v9WpXDUbtMmNVHMGL1Jl2Cv9gXFQ+es71bBc1h+bbZjB7W5dQECguzPKgk4bpcrwRPJgN9gm/rJdqShzQUts2HNC2GmyTMni1o9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3wumaGx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3wumaGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FD31F000E9;
	Wed, 27 May 2026 23:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779924675;
	bh=dSZZq7uPVfBoy5o3jAkbQrEgiZOO9X8eE+ojA0svfFk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=W3wumaGxANEj8FilKar/dxxHvEahPStKlSD4HI/03xH7HONvEw6vMYVwJ1EnTXY6U
	 V9oBCZXiHKlZskm6pr7acWAuzz+F+RUM3idvM8YSImjswjuo4cuzh+138FplWZLVwi
	 8DKXiwmK1rOkjPRwAA5JPbA7ZFfIdYSIg3x00k2FQZid3V+A+zkdtXOtCb28E/z3tv
	 acOf0X+fxJX/fL/5e62arSRiDIFydfbkcfoLubf+0nAOmAr8fqrN87vWc1qhNncJvS
	 rsz5tqvV3YbdqfCVX/Rhv+cQ6C67JvnqGQf/XdX5aa/G3oQfXnWLrZjgGvS+MVaeW9
	 bri2B5pjMkPzQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 01:31:12 +0200
Message-Id: <DITUMY6K2IQX.17R1VUFJGBDAW@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] gpu: drm: tyr: use IoMem directly instead of Devres
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boris.brezillon@collabora.com>,
 <gary@garyguo.net>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
References: <20260525230152.277820-1-dakr@kernel.org>
 <20260525230152.277820-3-dakr@kernel.org>
 <DIS9H75POYGW.EBC1MLW466RG@nvidia.com> <ahd4UoKVT4cM-pgA@um790>
In-Reply-To: <ahd4UoKVT4cM-pgA@um790>

On Thu May 28, 2026 at 1:03 AM CEST, Deborah Brouwer wrote:
> On Tue, May 26, 2026 at 11:43:38AM +0900, Eliot Courtney wrote:
>> On Tue May 26, 2026 at 8:01 AM JST, Danilo Krummrich wrote:
>> > @@ -40,9 +39,7 @@
>> >  pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
>> > =20
>> >  impl GpuInfo {
>> > -    pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> =
Result<Self> {
>> > -        let io =3D (*iomem).access(dev)?;
>> > -
>> > +    pub(crate) fn new(io: &IoMem<'_>) -> Result<Self> {
>>=20
>> Perhaps a future patch can remove this now unnecessary looking Result in
>> the return type.
>
> Oh that's right now that we don't have: let io =3D (*iomem).access(dev)?
> we don't need the Result anymore.
>
> Danilo, I can add this fix to our fw-boot series which I'm preparing to s=
it
> on top of these changes.

I can send a v2, fix it up on apply when I get an ACK, have Alice fix it up=
 on
apply, or have it done in a follow-up as you offer -- just let me know. :)

>>=20
>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>=20

