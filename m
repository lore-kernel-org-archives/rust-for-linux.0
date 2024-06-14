Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FF199247
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718369621; cv=none; b=eo3D2SoW7Yh6CiWy/FfKkIHtnbOM8ROgWG97qVrdKiyyKOMpSKsmqthvUmPoBrdz2iTUL03OSLnj9Jljyih3U+iT/WI39mBU8x67ryGSCA8Bge5iI30Si6FCimQslCdOvoGk3wUefUjqZ5oV8fnr3PFncP2XwNSLzVRDI4L8+Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718369621; c=relaxed/simple;
	bh=4XAyiCwNCkxhmabj6b8PpLn3L4deLCaxnSe9b7Kd3Eo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmdfsNk5bngYSx8GhpzZlzSZCLbIcFQ7zFLyrbAXa+65/zDp/A1a4i2tMCZtI/YmUh8ylVAeqikN3jPR/Bbii3fRTXA+2Hv45hI0brUCLNizcEILL6o2L2fTp2HHBRvuW9AJMiKwNx7v+nHgTaXNGhq4hZdojTiwN4q2s95OYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Q1ddlaTN; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Q1ddlaTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1718369617; x=1718628817;
	bh=YIKd80VR73bJEjwoYB7J6Xl/AM4wvcqBvxJAKMWKVEo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q1ddlaTNCVFmutNoM2andrkcPcwwh3Lx5e/FH3pP/AYOkVeTdVtjQIFU2cFx2n30p
	 7REqCQpjLCJITmVJ0egqS9/4y3nFxVnml5O5Ypi3FNsf20cb23bk7QO1WXydgAHKJD
	 rUO5RZkoIh3h0327nLF01JYQyOAqmdhNa702mrP59xIhm7k5+rXH1g3eL9DGMM05GV
	 Qy9EWclAyjBsSwrzZvfF6G6no32TSJvC0MaxJAXlcs4ug+rE+C/3pjvyLtepglFPuI
	 WdoMrQ7QFaxMfqRufGfJvqWUtUxnmPunog5mMFUqg6QTovuQlgy+o/rYf/jjtHtol6
	 3/kp79mvFj99w==
Date: Fri, 14 Jun 2024 12:53:33 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v4 0/2] net::phy add unified API for C22 and C45 registers
Message-ID: <7faa2f7c-32a6-4eb0-86e0-29f962fa47c7@proton.me>
In-Reply-To: <20240607052113.69026-1-fujita.tomonori@gmail.com>
References: <20240607052113.69026-1-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 802637b20b0d7c8ed348540e9db8d065abfabab5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07.06.24 07:21, FUJITA Tomonori wrote:
> add unified API for C22 and C45, reading/writing registers and
> genphy_read_status().
>=20
> We could add methods specifically C45 like read/write_c45 and
> genphy_c45_read_status. Instead, this implements the unified API for
> C22 and C45 with a new reg module.
>=20
> v4:
> - make reg module sealed
> - improve the comments
> - add examples
> - use error::to_result() to simplify some functions
> v3: https://lore.kernel.org/all/20240603.233954.1644803151268035787.fujit=
a.tomonori@gmail.com/T/
> - move reg module to a new file (with MAINTAINERS updated)
> - rewrite commit log and subjects
> - rename Access trait to Register
> - add build error message for build_assert!
> - define the complete MMD list
> - drop new func for Mmd
> - remove trait GenPhyOps
> v2: https://lore.kernel.org/all/20240601043535.53545-2-fujita.tomonori@gm=
ail.com/T/
> - add genphy helper support and split the patch
> - create a 'reg' module
> - define C22 according to the specs
> - handle C22 vendor specific registers
> - add const for C45 MMD
> v1: https://lore.kernel.org/all/20240530.145258.456915814420167538.fujita=
.tomonori@gmail.com/T/
>=20
> FUJITA Tomonori (2):
>   rust: net::phy unified read/write API for C22 and C45 registers
>   rust: net::phy unified genphy_read_status function for C22 and C45
>     registers
>=20
>  MAINTAINERS                      |   1 +
>  drivers/net/phy/ax88796b_rust.rs |   7 +-
>  rust/kernel/net/phy.rs           |  44 ++-----
>  rust/kernel/net/phy/reg.rs       | 219 +++++++++++++++++++++++++++++++
>  rust/uapi/uapi_helper.h          |   1 +
>  5 files changed, 234 insertions(+), 38 deletions(-)
>  create mode 100644 rust/kernel/net/phy/reg.rs
>=20
>=20
> base-commit: c790275b5edf5d8280ae520bda7c1f37da460c00
> --
> 2.34.1
>=20

Both patches:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

