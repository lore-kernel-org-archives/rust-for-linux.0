Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414523CB548
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Sep 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302244; cv=none; b=MHmoQPUp0BJEWx0GoLbQv/tIyO9rf1uwrwrvXF6GjTYRILFIS3qHIp5Nm+2qQJG6KEtEcZCafx+8tUfdiZB3Zv970ANPatluQeboQ+yRL8S4ES5WslxfkbjoBcN+qns4I1a6QHFw6Ofhv6wfNR/VR6jfpC/pvsURicCzgcekTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302244; c=relaxed/simple;
	bh=sEkeSZyT1b92t4did9aLrVflRNi2rCzD7o+75wH8zs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NVOGXt3jwHxIFZNDspswG8qTNVgmMXF/otP3isvssf32KCzLUjA37Yvg47KwAx/sZx5EF/i8Ep/fXJD94XEej57978Txa2g/IRhX//6dsDZUSgVhK/nzOXl1+GlFPT0IM6CH6VL4gayLhzqTmQjFeVrYjH2GKsBai8r1U2WrPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIZiX7Nh; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIZiX7Nh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so407257f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Sep 2026 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789302241; x=1789907041; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sEkeSZyT1b92t4did9aLrVflRNi2rCzD7o+75wH8zs0=;
        b=hIZiX7Nhg3Q1wDWXn2ZBBspll3KnESb1QZ5oAHTFFbdMtK+a4ZtzXJ24/9Dk8AawnW
         8FKb85mpS5F9D7ZVj/Gx1SSZTOQA+fXSAYMONqBnbB3GNvX2vfXFMyHScpIc2u9Dxrfh
         3oL60qDl3xLMEnqsrtVIyZlCupju9s5GyfFuXpnV2DNnWBqVJydsgSn2iok3+ZB1Smn1
         bpeSNG4C+9fw1nS/Xoe28C09NqEKtSmFkANwWwrJfQhsesmxWWClptlGL0+dGTWVYG1S
         DfFf9Cy/0ikdmA439cOyeT7qj7LvgEVsAJzgyvTsNmX7ettUiADCb1RzMygVnKFef951
         ddMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302241; x=1789907041;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEkeSZyT1b92t4did9aLrVflRNi2rCzD7o+75wH8zs0=;
        b=c6a6sl9ZsnmsV1sqlBREAaepJBsj6oKmh4HxpnlAkcfRvxCccg8LzYccuoRV4fsFwF
         GZAEHNB4Y+UnLzRmOdk1WxGrmFqNNaz9shi2vKoWYwGvX8vJ2zZdFO9nDpDl1AsYu9Qe
         59+T9Y2nXDfSfwCGrLSURT3u8i7pHrnWL0ehhcHvw9OrazPnOzrIAswLfumGlGB57aBV
         c0xl4M/DD50S6vnsCNUBr5Ut/Bhg6CaiMG3XQ1mGvLwB+5n5B0L04apITeUN2ykSmwEW
         da2INKeuq8478eqsISvTeRJ1CCGa+pXuMstxegGjkVkBRZtdPUws3DTjSJmD8fE3wl15
         +XYA==
X-Forwarded-Encrypted: i=1; AKwUvBxh3urjmjIib1xLA3+kkKxHYDvwV0LH0DhAAdMJqx4G8usi/mWjFersRukoKifCWrH6aFZbOOri1y6+spo45w==@vger.kernel.org
X-Gm-Message-State: AFuF++lialgi62CBJDA1Qo+GvRHMwpvyNBArHe2uMsyOvUqgArNW3p8f
	dq4OEopM5OX3CjO3pzvdLc4aiF/6K6whpzEF4SySCVUHxWSCP25rNzVZ
X-Gm-Gg: AYBFou0SqmIvZoxMQoWfN0uYvye+reJC3lSger8ha0xaxklPwbPlBxH8mBVDHROQYM5
	ipIOZvFoA7OmKQp5UQbTEr401VFMQRJP/rFziRlwj1Hd2UNVosG7PQmVqCoXGxuvtO2fro3gJ6h
	IhZVvaisL4Ie3BNK1qZwH3p9LeSkp8018MM0d5u5c0EMZg7JC1B+r24v4CGgpSabbHitcw56qBS
	7z7PR0iA5PvdAprrJafNTv9CJuz0AY3DXOlID6/SplbaM4vtZfFQmqCtsYsh4Q4mTbezZtJk7xQ
	QbSeflO+dFQSrG0Lp9e46ofSCvRefYMz3QiGridGBp5V1F6uPf2PujaTwgEKM3h4ypU+dWUrIhN
	WfNehaxogg3+ncLjlmv+SouCMHgK0loDXwqOUeDoOlN1Qkwjr2MOWP04QcGmGEHrAurrKxgkzx0
	+0uUDaHJ9AYNOVZTbsmZzCyV8tmewDYY1LWDc1MH5u3S4deLKC9B+Wmm0Oz7iShFn0syKcT0x4X
	ch/ZbMYBpLMTSVdyNhx0LHUT7xsEd2SzCZtYYYhisqF+0fiUOwPUfR5G6H2aGwO1zZHjMUAV+xa
	+iRrB1g4YU4SD9KUgLqvPCOFFmL8110Ca36VOVaxXAqW24I=
X-Received: by 2002:a05:600c:83ce:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49e6cc2748amr57258525e9.32.1789302241246;
        Sun, 13 Sep 2026 05:24:01 -0700 (PDT)
Received: from p200300c587296833b1b3ac6b56381a47.dip0.t-ipconnect.de (p200300c587296833b1b3ac6b56381a47.dip0.t-ipconnect.de. [2003:c5:8729:6833:b1b3:ac6b:5638:1a47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm20255885f8f.37.2026.09.13.05.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:24:00 -0700 (PDT)
Message-ID: <182679ae5437916095a4b04187e350c80235c088.camel@gmail.com>
Subject: Re: [PATCH RFC] drivers/rufs: add Rust UFS host controller driver
From: Bean Huo <huobean@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>, Greg KH
	 <gregkh@linuxfoundation.org>, jaemyung.lee@samsung.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org,  linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Date: Sun, 13 Sep 2026 14:23:59 +0200
In-Reply-To: <87mrtmvioe.fsf@kernel.org>
References: <20260912-rufs-private-v1-1-716db733e655@samsung.com>
	 <YKq4TcQM0v2dXF4wTHEvZKwASII6PDd_R7_UiHWe3NRnR4JsrC_ZS-x6jA_Kl7P6ONehU0REHYk7WaLz8Xv5gA==@protonmail.internalid>
	 <2026091124-treason-trickily-bc52@gregkh> <87mrtmvioe.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-09-12 at 13:00 +0200, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
>=20
> > On Sat, Sep 12, 2026 at 12:52:55AM +0900, Jaemyung Lee via B4 Relay wro=
te:
> > > Comments on the decision to bypass the SCSI midlayer, the blk-mq mode=
l
> > > used
> > > in its place, and the proposed prerequisite API boundaries would be
> > > especially welcome.
> >=20
> > Many many years ago, the USB subsystem tried to bypass the SCSI midlaye=
r
> > for its storage driver, and while it was a "quick solution" at the time=
,
> > in the end, it didn't work out and we dropped the driver as it just mad=
e
> > no sense to keep duplicating all of the logic all the time.
> >=20
> > So I wouldn't recommend it, as long as UFS builds on top of the SCSI
> > commands and the like, you should not attempt to duplicate it in a
> > separate driver, no matter how much "simpler" it initially seems to be.
>=20
> The scsi related code in this driver is less than 300 lines and is
> mostly struct packing/unpacking. I guess we could lift the struct
> definitions from the scsi layer via bindgen. But at 280 lines I am not
> sure it is worth it, and it hardly counts as duplication.

I agree the SCSI code in this RFC is small today. But I think it is small
because the hard parts are not ready in your RFC yet, not because UFS does =
not
need them.

The SCSI logic is also not only in protocol/scsi.rs. upiu.rs decodes SAM st=
atus,
and queue.rs parses sense data and decides retries. And some things are alr=
eady
missing because the driver does not use sd and the SCSI error handling:

1, VPD block limits are not read, and a discard of 4 GiB or more fails with
EOVERFLOW
2, the cache mode page is not read, so FLUSH/FUA are likely never sent
3, the residual count is ignored, so a short transfer completes as success
4, UNIT ATTENTION and BUSY are requeued without a limit
5, LUs are found by 0..bNumberLU, not REPORT LUNS, so sparse LUs are missed
6, no START STOP UNIT at shutdown

Each of these needs more SCSI code in your RUFS. For comparison, sd.c,
scsi_error.c, scsi_lib.c and scsi_scan.c are about 15000+ lines today, and
ufshcd uses all of them. Once RUFS has error handling, power management, RP=
MB
and SG_IO, I expect the SCSI part will be large, and it will be a second co=
py of
code we already have and maintain.

I suggest you samsung first works in JEDEC, together with the other UFS ven=
dors
and host controller vendors, to remove scsi from the UFS spec as the applic=
ation
layer. As long as scsi is the UFS application layer, every UFS device must =
still
uses scsi, decode scsi in FW, and RUFS must still send SCSI commands and ha=
ndle
SCSI status and sense data, as it does today. Moving this SCSI work out of =
the
SCSI midlayer and into a new driver does not make the whole ecosystem simpl=
er.
It only means the same SCSI work is done in two places, and it can even mak=
e
things worse.

If the spec changes, then a new driver built on native UFS commands would m=
ake
much more sense. That is the first thing to do, not just post an RFC patch.=
 I
could send a Rust based UFS driver as well with AI assist, but that does no=
t
make it sensible to change the base of our current UFS ecosystem.


Kind regards,
Bean
