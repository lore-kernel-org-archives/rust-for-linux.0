Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB309473
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Aug 2024 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723930463; cv=none; b=W+JTzoZLY1w+P2gv7zYH4LXdguVBWwKOm06yY0KzQ9rwAP4Zn1hdWlcMGRzyLgcCibC6tOf/9BFxUCawPWgwRk2EsifpUsOhu08MzBfbMfXml1HzzpZ3Xpy5TSYAjUm+1W0O3TRDuMBFZvQSmpX36/+RKxBmwUchuWqsTivs7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723930463; c=relaxed/simple;
	bh=0UYgIPm2YXVY01BcojqkZIv0c3YHg8Js7c0MB1UcgIQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCe4D91ID/UBEmIsBcMqldvijzoB3Y7sN4Y+lsiESW6HPYj44GyVAgoGSgMbUHk61cvy3Rtb2WOIBH5sX7HdlCNXZ3TFtK88HRGvqwjgvhBg0+qtPGV1ffE+STjt0E9rXkzQX6/A6I2+G89z9LPppXaa94q09j3VYRI/HlEEJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ErzlH8JN; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ErzlH8JN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723930459; x=1724189659;
	bh=CPb7iY9MnNS1T2jgFqtK+We04HUrsHfv3IFGJARoxa8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ErzlH8JNwNrb3rCAhJW98h+6UU56u+6FdNoMFoH5oyDJ0+BcEkED5sMh9AAZvcjxa
	 DH8283jKz3J0tdExzpuehIWkY0ryPtJUnvzjUbok6vJEjggF+xZHV/JHeFxV909LHC
	 053jd1rQqH30eDh7hHFFc5Lf85nddXxA5CzRr8QYur4gYFrC9wkPmG0b0h/WGrvaXS
	 2XPK+3eC0pgOiYka7CgOQjUDRs+xpbLOY8gvMuv5LCjV6hS2OumOrEemc69BHeu1DD
	 VPjZisbg5aofycqsEfIb24MuD2rhqkvMAC785OKPyXV1sX7vSsiwuL6AUASEA+lU4t
	 Vfm+vAnQJPJyg==
Date: Sat, 17 Aug 2024 21:34:13 +0000
To: Andrew Lunn <andrew@lunn.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v4 6/6] net: phy: add Applied Micro QT2025 PHY driver
Message-ID: <7f835fe8-e641-4b84-a080-13f4841fb64a@proton.me>
In-Reply-To: <9a7c687a-29a9-4a1a-ad69-39ce7edad371@lunn.ch>
References: <20240817051939.77735-1-fujita.tomonori@gmail.com> <20240817051939.77735-7-fujita.tomonori@gmail.com> <9a7c687a-29a9-4a1a-ad69-39ce7edad371@lunn.ch>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ef0d4e94ed0f65950868f1a1ae0caf34d6ea5def
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.08.24 20:51, Andrew Lunn wrote:
>> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
>> +        dev.genphy_read_status::<C45>()
>> +    }
>=20
> Probably a dumb Rust question. Shouldn't this have a ? at the end? It
> can return a negative error code.

`read_status` returns a `Result<u16>` and `Device::genphy_read_status`
also returns a `Result<u16>`. In the function body we just delegate to
the latter, so no `?` is needed. We just return the entire result.

Here is the equivalent pseudo-C code:

    int genphy_read_status(struct phy_device *dev);
   =20
    int read_status(struct phy_device *dev)
    {
        return genphy_read_status(dev);
    }

There you also don't need an if for the negative error code, since it's
just propagated.

Hope this helps!

---
Cheers,
Benno

