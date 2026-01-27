Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAED29A312
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769548079; cv=none; b=AEpdPJY2DeCKGjlayo+qHKUGvlSLb/DZl7kKEJUtvhOxMZGTkOVorJu1RhLh5CR9ci+qgNVQkCGMnBKfNe8XETVvppwSTMKTIXfIx7f53fxibAfixNHtWNRT/oYv9s1zO0Nw0c8ga791gH9AN27N4KYijZ0pBUbAHLuEG/ImqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769548079; c=relaxed/simple;
	bh=o1VZiVEj5vNR7p7ziWtConODn0+BdXQSUjNYnZoUA6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=OQTZxfBBRlMsSL/WKShnAhz2PjsYu7v+gQFK8PFME0IwAf8pUcSpeSNqAVajjJmbmVPR+QjDfgUNHBTr4BTLzRXSk73yzK138jef9Mn9szsNozuOZOx03YILASlkDW6KXsaHthxlH2KbzSG2i4FkirMOv30TDV2jpPLCsqe8vLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCjDt6tH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCjDt6tH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE02C116C6;
	Tue, 27 Jan 2026 21:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769548079;
	bh=o1VZiVEj5vNR7p7ziWtConODn0+BdXQSUjNYnZoUA6Y=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=FCjDt6tHLXLA6uNE3VfQHGjMsdfkH9zENwDnB8Hy9uNgekGyTnyDfASVpMiZHPgQH
	 yg7AfWlgKB2k+qvs20qPy3wZ2C98jwV2eJZbeWYXPs5HWtUjYvmjlWdrRkckRbZO+G
	 YyWA0uFocZ6qXey7Ou0TAQzdoROVVMfchOFD5hJzVz9jrAJBjJMlSyinLF8vnLP2YQ
	 8wAGFseEYSHmTVQI48MYr5X7JYUxn+7uJIXoa7XYZ8aQ3hUCv3gVCkjgccrMMLFzIE
	 5qCxgI53qhTIvgYBvcMSQ+/Fq+RTYpYyuzk93KRePq7FBG16FNq53b0WAx3oSSQhRE
	 VdaMU0zfcALbg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 22:07:55 +0100
Message-Id: <DFZOFVL4LS08.2R2HWJXVP92BR@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 1/8] rust: pci: add device name method
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "mmaurer@google.com"
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-2-ttabi@nvidia.com>
 <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
 <04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com>
In-Reply-To: <04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com>

On Tue Jan 27, 2026 at 10:04 PM CET, Timur Tabi wrote:
> On Sat, 2026-01-17 at 12:09 +0100, Danilo Krummrich wrote:
>>=20
>
>> > @@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev,=
 void *data)
>> > =C2=A0{
>> > =C2=A0	dev_set_drvdata(dev, data);
>> > =C2=A0}
>> > +
>> > +const char *rust_helper_dev_name(const struct device *dev)
>>=20
>> Please add the __rust_helper annotation.
>
> Should I add it to all of the functions in this file?  None of the existi=
ng functions have
> "__rust_helper".

This is only because your base is from a different tree, within the
driver-core-next branch they should all have this annotation already. So, j=
ust
add it to the new one you introduce please.
