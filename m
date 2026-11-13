Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794550216;
	b=ERY35HjZHjcGuHVLXCRQy4tVaPTCtHdGC4+NX8qAqa7F2MW/6PIkLiN5+N7pa+VnGFPc
	 V7OjXijEgxhJ8mVLYAa9nXjKTJIfR2r+myYB9fiutFc/7LGq2KTIM0XMNTm+viJZWiV6+
	 Uo0ojbAvMVSyhRrTyOvr0h3xg0dU4qRqNyFZhsqrg7AmQKuVhe5/KIKFQOKyjAqBZ3Sri
	 0emixq8//81wFzq0qxuHhxn+aytbs/LH65vQeHtFfvd2A7n31Yw8wmvxlPZDtycaNbNkF
	 4ZpwUnIknHVbK3tZl0VPSfR0YydTx2H84diHTSK2MQngfHTC13Fw9ohR4G0gSb6pzEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
	b=0BrNMy5eUqNaUw+v7SEUD3ejMIV2pfo0bheMbZxS9eUglTE03TDGmOXbolF4pNK35ztX
	 bUHnxGSNW2IWaIjseo0lZXPKJN/kvt5a5CoD3XuV85KjzVvWcbz5nTk+rfPLdB5Aovane
	 rX8EVfOhszFXvso41GsPvPDS+9FE/BcTUfykQe9ngi5jo/GygtMX1FEZEsJJd9MEC44/r
	 y5Ezf3oT/9Gsppw1PfFg0iUyNOCsQKtKNtYeZTO5LCa2rjstVsVNRCo/uoNKsTOCLmzai
	 cLvjRFJHc5h8fLF6KR5V6hEqjvj72F9yf2hJ579dQuTSnlBcpJp/T+naWTpO4IJsrWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WA6G/ruV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8A606A327
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 06:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F8A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA6G/ruV
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6deb848ddd7so776997eaf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 22:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550215; cv=none;
        d=google.com; s=arc-20260327;
        b=XhXyHd+B53SlkNARHVnzNBPGo70gCRQDOLhuvVNH3aVPL9ZCUaghJ3XjYA9r2gfIma
         lLc0x4eIL+VnsWuHeNwO+RLBhTdKxgIacAhQuI8d3tBjsbgrojCa51U1Rsqq61W+DSUW
         yWQ662ltXHMnk9+Q2E3tTBL7aQRkvm0qGpLKUD9lvD2T6pxM3l0YbObEopcMDwS3f8rR
         dJ4YTKlZUq8Sbcd4rXfLPPHv0Hd98JyiotYXD9FTIwOt9nEQ5fm8nDA0OxeD3T2Iq5tF
         qlfU4yUWEay2COuoFQRsiWylYSdZF7vJbr3I0wECZv3/2hyxhS1pHQpcw1iZ9XumIraq
         0Z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
        fh=wromvxSmWrcvauJJeoMbiJdclZJ0m4fJrwd1i01GMCk=;
        b=Q+tygn7g3koGWvolYAy3TW7xqjRBOhznicLooi0pYYsZZ+Qn50oc05tcOOtWn1/q4m
         HiN/xC4Xg7rbkRralZnLKtou3DE3y3bN0WwlqU8xp+N9uvvi4k++ZU9MvFnqNmq/dWgC
         azi2bg0oaHvYei4bXHh+maMICwIdJ5CJv7MikpkCEH9gnzqDvA1djwKLGObcvTfdhnPE
         UnUkGabO5GJG3pPiJYdVmPBLPYSj0mcHJaTsTsjv11JatP9W9WaWPPmnc+1vit/p2GjN
         rEMlN4cDB6Sh3cQil5CTAACUCqIdaPf3Q2L+eplbVcbCy0pj+RWlacJw7F9HropA0sfP
         KY4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794550215; x=1795155015; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
        b=WA6G/ruVj33Xcc8MAVixoMTzolifZQDlrHnLE0EvgGR+xSkc9Y8YbDgO0rKh1Fqh/a
         nQ26saUTpi3TU2Y+uu5kYKO6kqdni7y2mwPZQeCm68OzvoE3xZz4iJeHgyJMaUUnJtId
         mB6udLTCkyP9lpyoR+jXswiXRXEd9xptiTLbuIAKfrj0oFwcOoqbq2VsO6fNDnUOpid5
         jc8UAxFazsIf0JfbbGXGv+uvt67C3FoOZDsmnsPDBM8rUfaI+ju3pyweh39gzMt81fA5
         q01req8w+i/UdPTWOC9iqP/lhDcj+9Pn9ESfbzsb4tgq+m92A9qiv62eSd3TH1aj1+UC
         aOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550215; x=1795155015;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
        b=egNX2POkGWbqyLRWKOGH9r7YT952yNSmJhvGWttBXwfmzvOX9GI20aAthki+H84vrc
         HmkTy2SEnmP4Z0krywv7HsoJ6nYhkGaGJLg7d6+lFUKnPYWhy4s+cGZJOhzqiHjf7Jpx
         vT6j9U3ffqcllNGQt/tdFpud1WSOCZQydUBU8YYLWcQgVslZxqkCWXnKBUx5MSpzkYzF
         zVLljlu09s8WPZin6p5oiazjgKNowsklfZ2jr3ZW/MVBv0zMgV2f8GzU0PtLgg0b6qL6
         mo0HhzrVP77XLCLZ88rXN6TFIMJC4mG220/nqU8gH19dj5HnYNnUnn6O+hZ4RwnO+w9T
         l8ng==
X-Forwarded-Encrypted: i=1; AL+hErHgELqSifWOLjG65fIGsPIVTon0yxau2SDSF/JPyefymr04P9sbUeQnT/J74i3qCoCQ6WmMBgt8XSt0Af5ORw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rPgfjUH2Yx8cCTjB1+5iedYgjllt1C+rZNkLAnxdqRRw3DBOA
	lMTLlUUpOu8NeAwuF9K9iQumfdLcsqbUO+HOYllZvKSFh7Z81CTdH04n2Owby5jKsIikenQH1So
	uqugibI/t659bcXxSuMj7E9Ozc1L8VOQQv4z9
X-Gm-Gg: AYBFou1K/UGdDax3rgYsMM2ZLZbBOmi5wBgLYKRU9k9NheQvH1ATgS451RKmtLz8gn3
	uAvf1BIUHb0j5HDXGuvLLI6dVbPESccXB4SaK38P04CB3XQb8TsL4fNoKDeIG7apqm4yfGI31b4
	JTjx8vDauVO/IjMCJzrgLJJuif8ukhBJeD6jOm2uC2ZYWewxZzbMBmRNA0fWxmtZD91cFO81K6a
	vPjlGODXyLV6UmElaa4DfxhTOpv/jFpKd7D0p4cG1gHi+SGmoYiNykUvsxxg7ieFe1bMRqAuJuw
	mtkHxdQqL86xZZF7Dg/1W02KB4j3Dpb3F4S5cesw18lnpMxYqXDi9ZcNhMd/YltOZ6AZ7eO9jix
	/bre4OMxT/SKXCvnvUKQM82BPrlWs1rleB3gM0yM8CrFYiFianDOVFHzZjZYwdDEVfKa/wRrowJ
	5uUmkHjTKsZXBVsGwudniMXiYk61FqiRlrKXOIs2tYLps7l7Wdkk8xJBGP0W9lOCNVN4g3dCr+x
	ObuPA==
X-Received: by 2002:a05:6820:c0cf:20b0:6f6:1e3a:6fc with SMTP id
 006d021491bc7-71ab51a2d59mr713841eaf.79.1794550214796; Thu, 12 Nov 2026
 22:10:14 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-exp-phy-rs-maybelocked-v1-2-3023cc9055e9@gmail.com> <179454612500.2199510.688554972467066283@kernel.org>
In-Reply-To: <179454612500.2199510.688554972467066283@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Fri, 13 Nov 2026 15:10:03 +0900
X-Gm-Features: AclHuK8K7LUv1bQRf5-U0TPkDoWKhawhWDsTrvclohqGU442XIPQ2sC58L1Zn6c
Message-ID: <CAGAB665d+tpGT34GPD6TAjc_Pn225afYw2ebLb12ZFnUXZoW6Q@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] rust: net: phy: pass a MaybeLocked device to
 soft_reset and match_phy_device
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 2:02 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: High]
> Is this conversion complete? read_mmd_callback() and write_mmd_callback()
> in rust/kernel/net/phy.rs still say "This callback is called only in
> contexts where we hold phy_device->lock", and they still build a Locked
> device:

No. This series does not touch read_mmd_callback() and
write_mmd_callback(); their SAFETY claim predates it and is wrong in the
same way, since they run under the MDIO bus lock instead.

> No in-tree Rust PHY driver implements read_mmd or write_mmd today, so
> nothing triggers this yet.

Since nothing uses them and the abstraction cannot express the MDIO bus
lock yet, I would drop them from the Driver trait in v2.

> [Severity: High]
> Can safe code in a Rust match_phy_device dereference a NULL phydev->drv
> here? Device::read_paged() is now a &self method for every context, so a
> match_phy_device implementation can call it on &Device<MaybeLocked>:

> So for an unbound PHY, this would oops with the MDIO bus mdio_lock held.
> Every other PHY on that bus would then hang.
>
> This wasn't reachable before the series: read_paged() took &mut self, and
> match_phy_device only got &Device. The previous patch, "rust: net: phy:
> make Device generic over a lock context", made read_paged() a &self method
> for all contexts, and this patch makes MaybeLocked the match_phy_device
> context.

> Should read_paged() be limited to contexts where phydev->drv is known to
> be set, or should match_phy_device get a narrower context?

Neither. match_phy_device should not get the register accessors at all,
as before this series. The patch 1 findings about genphy_soft_reset() and
register writes from match_phy_device have the same root cause. Patch 1 makes
the register accessors &self, which hands them to match_phy_device even though
it can run on an unbound device or one bound to another driver. That was not
possible before, since they took &mut self.

For v2 I plan to keep &mut self on the moved methods, so match_phy_device
stays as it is, and give only soft_reset a &mut Device<MaybeLocked>.


match_phy_device is more about binding than locking. I think it belongs
with moving phy::Device onto device::DeviceContext, as pci::Device does,
rather than in this series.


Fujita, does that split make sense? And is this worth doing now, given
that no in-tree driver is affected, or would you rather wait for a real
user?

pw-bot: cr
