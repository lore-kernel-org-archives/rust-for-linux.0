Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7FA437447;
	Mon, 10 Aug 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386927; cv=pass; b=Y2e/6O3kPw0Za0/gMRIeNjn8KS9n7qB0eVBMuUdB47PKQ5/mvMoW/ZjTetfiCGoN7fdlYzCR8Q/X55vbkGLl+NTxxFxfUX5CpVBEjxy99P3VCpUGRYDgj8R4gJo4OtpzvEwriBfTvHr/5CSaY5SpUCJbNZbvlxZ32W94IKxIJkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386927; c=relaxed/simple;
	bh=/iaajojgPfw5aIwmlU7WpTDDLwtHbVMCj4QkpcHiby4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hvI1SH+mSTqtL3qW20E+KwIHfrUkFbyzKsLVQvdewvi+aKJOoHtcDlNyzN/2yBs7CfjMYUZYTY9TEFs2e+4Me7WBEesGh4BAYIM5mQ7zSlrODbRJy04COL1seCmKo0FnMZWvlBo7RBXvDuV8OmbaHf3k2Jx9YVAdcVixi9WrH8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=KSWjp/QX; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KSWjp/QX"
ARC-Seal: i=1; a=rsa-sha256; t=1786386905; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xdze7+6+lAmudxeU2EEGTDqnbwoExe7UW/F01OINVDIvnDUiYY3gEySUIzarfttHfz1StKBzcUXL8yX0SeKDldLpDEzT5tF4eN220EpvcNb23Ns4IW+wxs/27HOysZxVUHYpqCEJ1A78LyiaEYfH6mtXJ0KlyDNnmgqTsVGNGUg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786386905; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wuiGyY1XGfwjwsb2Pw2tUN8ltgrhxl1qHkj0d5/SIUg=; 
	b=P7I/Pjg7ddD1xXHvM9kD9h3DmnB3+97E1DYQ0mGefQOiJmxMT5rzYBmUZAK+iH/g2Z4gPvVq66C6diAmOhvsJqRlDU65yXhTS1mWt2hrfzR6ZIvySfiKcXSAVKCu7Q9EdQsDo7XygRWjBPMe1lDLXP7cT1sNykNSsMn9UKCoLdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786386905;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=wuiGyY1XGfwjwsb2Pw2tUN8ltgrhxl1qHkj0d5/SIUg=;
	b=KSWjp/QXN0ha6bqxfYdddC6eJ+y4VeXzWqltMZN0iW+AApN7asc+yHoS6cd7mhiJ
	SoAQUT+HLuf8TsxyD1Tmxu3TzVM0tggo+zurz6u+kGbzWZ66N/YrA03JtFVnnl/cp0b
	74opUQ6+cIfy/CMePZKuBFuWzI45Qr5ue90kFYUM=
Received: by mx.zohomail.com with SMTPS id 1786386903952369.9569936119061;
	Mon, 10 Aug 2026 11:35:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 2/3] drm/tyr: clear stale IRQ state before soft reset
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260708114358.957305-3-work@onurozkan.dev>
Date: Mon, 10 Aug 2026 15:34:45 -0300
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
Message-Id: <8E4EA286-887C-4B3D-8AE0-F83E2C838B0A@collabora.com>
References: <20260708114358.957305-1-work@onurozkan.dev>
 <20260708114358.957305-3-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 8 Jul 2026, at 08:43, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Previous reset may leave the reset completed IRQ set which can make =
the
> poll return too early.
>=20
> Clear the IRQ first so the driver waits for the current reset to
> complete.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> drivers/gpu/drm/tyr/driver.rs | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index c5063b2be94d..90d6cd988cd2 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -86,6 +86,9 @@ pub(crate) struct TyrDrmRegistrationData<'bound> {
> }
>=20
> fn issue_soft_reset(dev: &Device, iomem: &IoMem<'_>) -> Result {
> +    // Clear any stale reset IRQ state before issuing a new soft =
reset.
> +    =
iomem.write_reg(GPU_IRQ_CLEAR::zeroed().with_reset_completed(true));
> +
>     iomem.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
>=20
>     poll::read_poll_timeout(
> --=20
> 2.51.2
>=20

Little has changed from v1 IIUC, where Boris gave his r-b already. I =
think
you can carry over the tag.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

